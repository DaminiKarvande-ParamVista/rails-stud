class CrudNotificationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.create_notification.subject
  #
  # def create_notification
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  def create_notification(object) #this object will display what record is created also displays the data attributes of tha records
    @object = object #this  
    @object_count = @object.class.count # this will display how many record are created in thae database after creating this object
    mail to: 'admin@example.com', subject: "A new entry for #{object.class} has been created"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.update_notification.subject
  #
  def update_notification(object)
    @object = object #this  
    @object_count = @object.class.count # this will display how many record are created in thae database after creating this object
    mail to: 'admin@example.com', subject: " #{object.class} has been Updated"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.delete_notification.subject
  #
  def delete_notification(object)
    @object = object #this  
    @object_count = @object.class.count # this will display how many record are created in thae database after creating this object
    mail to: 'admin@example.com', subject: " #{object.class} has been Deleted"
  end
end
