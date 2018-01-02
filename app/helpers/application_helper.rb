module ApplicationHelper
  def avatar_for(user, options = {})
    if user.facebook_picture_url
      image_tag user.facebook_picture_url, options
    elsif user.avatar.present?
      cl_image_tag user.avatar.path, options
    else
      image_tag 'avatar_general.png', options
    end
  end

  def public_for(bool)
    bool ? "Yes" : "No"
  end

  def presence_for(presence)
    if presence
      "#{icon('check-square')} Oui".html_safe
    else
      "#{icon('times-circle')} Non".html_safe
    end
  end
end
