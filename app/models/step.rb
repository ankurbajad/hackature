class Step
  include Rails.application.routes.url_helpers

  Steps = [
    {
      password: 'WeGaanGemakkelijkVanStart',
      url:      -> { step1_path }
    },
    {
      password: 'HetWordtWatMoeilijker',
      url:      -> { step2_path }
    },
    {
      password: 'IkSnapHoeHeadersWerken',
      url:      -> { step3_path }
    },
    {
      password: 'Oei, En Nu?',
      url:      -> { step4_path }
    },
    {
      password: 'SQL Injecting like a Boss',
      url:      -> { step5_path }
    },
    {
      password: 'X-I-Am-A-Teapot',
      url:      -> { step6_path }
    },
    {
      password: 'WebSocketsAreCool',
      url:      -> { step7_path }
    }
  ]

  class << self
    def for(step)
      idx = step.to_i - 1
      new(Steps[idx], step.to_i)
    end
  end

  def initialize(attrs, idx)
    @attrs = attrs
    @idx = idx
  end

  def next
    self.class.for(@idx + 1)
  end

  def url
    proc = @attrs[:url]
    self.instance_exec &proc
  end

  def password
    @attrs[:password]
  end

  def verify(password)
    password == self.password
  end
end