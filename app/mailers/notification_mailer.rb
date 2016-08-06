class NotificationMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  def comment_added
    mail(to: "brenton.hughes@gmail.com", subject: "A comment has been added to your place.")
  end
end
