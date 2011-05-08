class Notifier < ActionMailer::Base
  def activation_instructions(user)
    setup_email(user)

    subject       "Activation Instructions"
    body          :account_activation_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    setup_email(user)

    subject       "Activation Complete"
    body          :root_url => root_url
  end

  def password_reset_instructions(user)
    setup_email(user)

    subject       "Password Reset Instructions"
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def alert(listener)
    setup_email(listener.client)

    subject       "monik - listener alert"
    body          :listener => listener
  end

  private

  def setup_email(client)
    recipients    client.email
    from          "Monik Notifier <noreply@monik.heroku.com>"
    sent_on       Time.now
  end
end

