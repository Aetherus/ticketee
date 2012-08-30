module ApplicationHelper
  def title(*parts)
    (parts << "Ticketee").join(" - ")
  end
end
