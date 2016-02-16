module ApplicationHelper
  # Page titles #
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "VoidTV").join(" - ")
      end
    end
  end
end
