class Step
  include Rails.application.routes.url_helpers

  Steps = [
    {
      password: 'WeGaanGemakkelijkVanStart',
      url:      -> { step1_path }
    },
    {
      password: 'HetWordtWatMoeilijker',
      exit_code: 'stap1',
      url:      -> { step2_path }
    },
    {
      password: 'mabl bl khm19 xgvkrimbhg pahh',
      exit_code: 'stap2',
      url:      -> { step3_path }
    },
    {
      password: 'IkSnapHoeHeadersWerken',
      exit_code: 'stap-twee',
      url:      -> { step4_path }
    },
    {
      password: 'Oei, En Nu?',
      exit_code: 'nummer-drie',
      url:      -> { step5_path }
    },
    {
      password: 'SQL Injecting like a Boss',
      exit_code: 'step-delta-survivor',
      url:      -> { step6_path }
    },
    {
      password: 'X-I-Am-A-Teapot',
      exit_code: 'sql-injector',
      url:      -> { step7_path }
    },
    {
      password: 'WebSocketsAreCool',
      exit_code: 'api-king',
      url:      -> { step8_path }
    },
    {
      password: -> (password) { password.split().join =~ %r{2Tk0Erl5riWB5B2IEJpBssGDYRBRDDdB/QjRcNyaaMyq5F4h7QMXff0Iun9AH8i5} },
      exit_code: 'websocket-master',
      url:      -> { step9_url(protocol: 'https', host: 'hackature.nl') }
    },
    {
      exit_code: 'pr0-h4x0r',
      url:      -> { finish_path }
    }
  ]

  class << self
    def for(step)
      idx = step.to_i - 1
      new(Steps[idx], step.to_i)
    end

    def finish
      new(Steps.last, Steps.count)
    end
  end

  attr_accessor :idx

  def initialize(attrs, idx)
    @attrs = attrs
    @idx = idx
  end

  def first?
    @idx == 1
  end

  def last?
    @idx == Steps.size
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

  def exit_code
    @attrs[:exit_code]
  end

  def verify(password)
    if self.password.respond_to?(:call)
      self.password.call(password)
    else
      password == self.password
    end
  end
end

## ROT 19 Encryption Algo
class String
  def rot(num = 19)
    return self.split("").collect { |ch|
      if /^[a-z]$/ === ch
        ((ch.ord + num - 'a'.ord) % 26 + 'a'.ord).chr
      elsif /^[A-Z]$/ === ch
        ((ch.ord + num - 'A'.ord) % 26 + 'A'.ord).chr
      else
        ch
      end
    }.join("")
  end
  alias rot19 rot
end
