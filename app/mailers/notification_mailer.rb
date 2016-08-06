class NotificationMailer < ActionMailer::Base
  default from: "bmhughes@gmail.com"

  def comment_added(comment)
    @place = comment.place
    @place_owner = @place.user
    mail(to: @place_owner.email, subject: "A review of #{@place.name} has been posted on Nomster.")
  end
end
