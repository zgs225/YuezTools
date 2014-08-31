require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "yuez-tools/trace_calls"

class Example
  include TraceCalls

  def one(arg)
    puts "One called with #{ arg.inspect }"
  end
end

describe TraceCalls do
  before { @ex = Example.new }

  it "should trace call" do
    @ex.one 'world'
  end
end
