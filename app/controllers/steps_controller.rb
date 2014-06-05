class StepsController < ApplicationController
  def step1
    @password = Step.for(1).password
  end

  def step2
    @password = Step.for(2).password
  end

  def step3
    @password = Step.for(3).password
    headers['X-S3cr3t-P4ssw0rd'] = @password
  end

  def step4
    @password = Step.for(4).password
  end

  def step5
    @step = Step.for(5)
    if @step.verify(params[:passw0rd])
      redirect_to @step.next.url
    end

    @password = Step.for(5).password
    headers['X-Hint'] = "http://xkcd.com/327"
  end

  def step6
    @step = Step.for(6)
    @password = @step.password

    if @step.verify(request.headers['X-Password'])
      redirect_to @step.next.url
    elsif params[:passw0rd] == @password
      flash[:error] = "Expected X-Password header to equal password"
    end
  end
end
