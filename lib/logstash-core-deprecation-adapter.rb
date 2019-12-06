require 'rubygems/requirement'
require 'rubygems/version'
require "logstash/plugin"

if Gem::Requirement.new('< 7.6').satisfied_by?(Gem::Version.new(LOGSTASH_VERSION))
  module DeprecationLoggerAdapter

    class DeprecationLoggerShim
      def initialize(base_logger)
        @base_logger = base_logger
      end

      def deprecated(message, *args)
        @base_logger.warn("DEPRECATED: #{message}", *args)
      end
    end
  end

  $old_initialize = LogStash::Plugin.instance_method(:initialize)

  # redined the constructor to add post new injection
  class LogStash::Plugin
    def initialize(*args)
      binded = $old_initialize.bind(self)
      binded.call(*args)
      @deprecation_logger ||= DeprecationLoggerAdapter::DeprecationLoggerShim.new(self.logger)
    end
  end
end
