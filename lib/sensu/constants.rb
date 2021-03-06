module Sensu
  unless defined?(Sensu::VERSION)
    VERSION = '0.13.0'

    SEVERITIES = %w[ok warning critical unknown]

    STOP_SIGNALS = %w[INT TERM]
  end
end
