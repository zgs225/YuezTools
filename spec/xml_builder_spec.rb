require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "yuez-tools/xml_builder"

describe YuezTools::XMLBuilder do
  before { @builder = YuezTools::XMLBuilder.new }

  it "should generate simple xml string" do
    @builder.person do
      @builder.name "Dave"
      @builder.age 21
      @builder.job "ios developer"
      @builder.address do
        @builder.city "BJ"
        @builder.country "China"
      end
    end
  end
end
