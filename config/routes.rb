Rails.application.routes.draw do
  get "/start" => 'steps#step1', as: :step1
  post "/start" => 'passwords#verify', defaults: {step: 1}

  get "/congratulations" => 'steps#step2', as: :step2
  post "/congratulations" => 'passwords#verify', defaults: {step: 2}

  get "/step3" => 'steps#step3', as: :step3
  post "/step3" => 'passwords#verify', defaults: {step: 3}

  get "/step4" => 'steps#fake_step4', as: :fake_step4

  get "/step_delta" => 'steps#step4', as: :step4
  post "/step_delta" => 'passwords#verify', defaults: {step: 4}

  get "/step_42" => 'steps#step5', as: :step5
  post "/step_42" => 'steps#step5'

  get "/there-will-be-cake" => 'steps#step6', as: :step6
  post "/there-will-be-cake" => 'steps#step6'

  get "/there-is-no-cake" => 'steps#step7', as: :step7
  post "/there-is-no-cake" => 'password#verify', defaults: {step: 7}

  get "/here-is-your-cake" => 'steps#finish', as: :finish

  root to: redirect('/start')
end
