module ApplicationHelper
  def title(*parts)
    parts.delete(nil)
    (parts << "Ticketee").join(" - ")
  end

  def admins_only(&block)
    block.call(nil) if current_user.try(:admin?)
  end

  def authorized?(permission, thing, &block)
    block.call(nil) if current_user.try(:admin) || can?(permission.to_sym, thing)
  end

  def link_to_with_authorization(text, path, authorization, *link_options)
    authorized? authorization[:permission].to_sym, authorization[:thing] do
      link_to text, path, *link_options
    end
  end
end
