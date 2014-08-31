#!/usr/bin/env ruby
# encoding: utf-8

module TraceCalls
  def self.included(klass)
    klass.instance_methods(false).each do |exsiting_method|
      wrap(klass, existing_method)
    end

    def klass.method_added(method)
      unless @trace_calls_internal
        @trace_calls_internal = true
        TraceCalls.wrap(self, method)
        @trace_calls_internal = false
      end
    end

    def self.wrap(klass, method)
      klass.instance_eval do
        method_object = instance_method method

        define_method method do |*args, &block|
          puts "==> calling #{ method } with #{ args.inspect }"
          result = method_object.bind(self).call(*args, &block)
          puts "<== #{ method } returned #{ result.inspect }"
          result
        end
      end
    end
  end
end
