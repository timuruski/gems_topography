require 'open-uri'
require 'pp'
pp Marshal.load(open("https://rubygems.org/api/v1/dependencies?gems=rails"))
