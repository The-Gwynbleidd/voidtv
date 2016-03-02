module ApplicationHelper

  # Page titles #
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "VoidTV").join(" - ")
      end
    end
  end

  # Check admin status #
  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

end
