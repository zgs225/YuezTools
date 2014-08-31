require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "yuez-tools/turtle"

describe YuezTools::Turtle do
  it "should paint 3 square" do
    turtle = YuezTools::Turtle.new
    turtle.walk do
      3.times do
        forward 8
        pen_down

        4.times do
          forward 4
          left
        end
        pen_up
      end
    end
    turtle.draw
  end
end
