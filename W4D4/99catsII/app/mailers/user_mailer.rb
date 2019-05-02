class UserMailer < ApplicationMailer
    default from: 'from@example.com'

    def welcome_email(user)
        @user = user
        @url  = 'http://gmail.com/login'
        mail(to: 'guptabhanu90@gmail.com', subject: 'Welcome to My Awesome Site')
    end
end
