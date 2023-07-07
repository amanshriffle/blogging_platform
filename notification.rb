module Notification
  def notifications(user_to_notify, notification)
      find_user_to_notify = users.find {|user| user.username == user_to_notify}
      find_user_to_notify.notifications << notification
  end
end
