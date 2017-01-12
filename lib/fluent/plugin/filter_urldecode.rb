# encoding: utf-8
require 'cgi'

require 'fluent/plugin/filter'

module Fluent
  class URLDecodeFilter < Filter
    Plugin.register_filter('urldecode', self)

    def initialize
      super
    end

    config_param :fields, :array, value_type: :string

    def configure(conf)
      super
    end

    def filter(tag, time, record)
      @fields.each { |key|
        record[key] = CGI.unescape(record[key]) if record.has_key? key
      }
      record
    end

  end if defined?(Filter) # Support only >= v0.12
end
