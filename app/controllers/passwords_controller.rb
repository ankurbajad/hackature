class PasswordsController < ApplicationController
  def verify
    if current_step.verify(password_param)
      redirect_to current_step.next.url
    else
      redirect_to current_step.url, failed: true
    end
  end

  private
  def current_step
    @step ||= Step.for(params[:step])
  end

  def password_param
    params[:p4ssw0rd] ||
    params[:password] ||
    params[:passw0rd]
  end
end
