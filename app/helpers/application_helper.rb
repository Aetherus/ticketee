module ApplicationHelper
  def title(*parts)
    parts.delete(nil)
    (parts << "Ticketee").join(" - ")
  end

  def admins_only(&block)
    block.call(nil) if current_user.try(:admin?)
  end
end
