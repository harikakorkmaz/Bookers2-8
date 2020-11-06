class ThanksMailer < ApplicationMailer
    default from: 'from@example.com'
    
    def thanks_mailer
        @user = params[:user]
        mail to: @user.email, subject: 'Thanks!'
    end
end
