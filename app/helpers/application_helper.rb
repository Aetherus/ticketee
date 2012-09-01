module ApplicationHelper
  def title(*parts)
    parts.delete(nil)
    (parts << "Ticketee").join(" - ")
  end
end
