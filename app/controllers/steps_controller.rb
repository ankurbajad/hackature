class StepsController < ApplicationController
  before_filter :set_current_step
  # Disabled because it's possible to solve this problems in different browsers
  # before_filter :ensure_step_order
  after_filter :save_current_step

  def step1
    @password = @step.password
  end

  def step2
    @password = @step.password
  end

  def step3
    @password = @step.password
    headers['X-S3cr3t-P4ssw0rd'] = @password
  end

  def step4
    @password = @step.password
  end

  def step5
    if @step.verify(params[:passw0rd])
      redirect_to @step.next.url
    end

    @password = @step.password
    headers['X-Hint'] = "http://xkcd.com/327"
  end

  def step6
    @password = @step.password

    if @step.verify(request.headers['X-Password'])
      redirect_to @step.next.url
    elsif params[:passw0rd] == @password
      flash[:error] = "Expected X-Password header to equal password"
    end
  end

  def step7
  end

  def step8
  end

  def finish
  end
  
  private
  def ensure_step_order
    unless @step.first?
      visited_steps = cookies.encrypted[:steps]

      if !visited_steps || visited_steps.blank? # No cookie? Go to step 1
        redirect_to(Step.for(1).url)
      elsif visited_steps.last < @step.idx - 1
        redirect_to(Step.for(visited_steps.last).url)
      end
    end
  end

  def save_current_step
    return if @stop

    steps = cookies.encrypted[:steps] || []
    steps << @step.idx
    cookies.encrypted[:steps] = steps
  end

  def set_current_step
    step_idx = params[:action].to_s[/step(\d+)/, 1]
    @step = step_idx ? Step.for(step_idx) : Step.finish
  end
end
