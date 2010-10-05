require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Freebase do
  it "should be able to query Freebase for /food/cuisine information" do
    Freebase.run({
      :type => "/food/cuisine",
      :name => nil,
      :limit => 10
    }).map(&:name).should_not include(nil)
  end
end
