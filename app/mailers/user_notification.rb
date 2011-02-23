class UserNotification < ActionMailer::Base
  default :from => "dealer@che-pe.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notification.sell.subject
  #
  def sell
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
