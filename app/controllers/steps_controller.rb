class StepsController < ApplicationController
  def step1
    @step = Step.for(1)
    @password = @step.password
  end

  def step2
    @step = Step.for(2)
    @password = @step.password
  end

  def step3
    @step = Step.for(3)
    @password = @step.password
    headers['X-S3cr3t-P4ssw0rd'] = @password
  end

  def step4
    @step = Step.for(4)
    @password = @step.password
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

  def step7
    @step = Step.for(7)
  end

  def step8
    @step = Step.for(8)
  end

  def finish
    @step = Step.finish
  end
end
