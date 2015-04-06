class UserMailer < ActionMailer::Base
  default from: "customercare@donaciones.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to AMT")
  end

  def confirm_donation(donation)
  	@user = donation.petition.creator
  	@donation = donation
    mail(to: @user.email, subject: "Confirm Donation")
  end

end