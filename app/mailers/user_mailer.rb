class UserMailer < ActionMailer::Base

  default from: "Cohome <hey@cohome.in>"

  def welcome(user)
    @user = user
    mail from: "Michael <hey@cohome.in>", to: @user.email, subject: "Bienvenue sur Cohome!"
  end

end
