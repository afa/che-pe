class UserNotification < ActionMailer::Base
  default :from => "dealer@che-pe.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notification.sell.subject
  #
  def sell(possible_to, pchse)
    possible = possible_to.match(/([a-zA-Z0-9\-_+]+)+@([a-zA-Z0-9_\-.]+\.[a-zA-Z]+)/).to_s
    if possible.blank?
     possible = "dealer@che-pe.ru"
    end
    @purchase = pchse
    puts "to: #{possible}"
    p @purchase
    mail :to => possible, :bcc => ["dealer@che-pe.ru", "afanas1984@mail.ru", "drvo@drvo.ru", "afa.alone@gmail.com"], :subject => "Есть товар"
  end
end
