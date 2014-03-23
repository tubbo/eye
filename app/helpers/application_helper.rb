module ApplicationHelper
  def user_meta_tag
    tag :meta, content: current_user.id, name: 'current-user'
  end
end
