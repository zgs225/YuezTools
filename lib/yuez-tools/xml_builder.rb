#!/usr/bin/env ruby
# encoding: utf-8

module YuezTools
  class XMLBuilder < BasicObject
    def __puts_at_indent__(string)
      ::Kernel.puts ' '*@indent + string
    end

    def method_missing(name, *args, &block)
      @indent ||= 0
      __puts_at_indent__ "<#{ name }>"
      @indent += 2
      __puts_at_indent__(args.join) unless args.empty?
      yield if ::Kernel.block_given?
      @indent -= 2
      __puts_at_indent__ "</#{ name }>"
    end
  end
end
