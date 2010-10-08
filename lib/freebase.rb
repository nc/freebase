require "rubygems"
require "bundler/setup"

Bundler.send(:require, :default)

require "cgi"
require "ostruct"
%w(base response result).each { |filename| require "#{File.dirname(__FILE__)}/freebase/#{filename}.rb" }

def Freebase.run(query)
  Freebase::Base.run(query)
end