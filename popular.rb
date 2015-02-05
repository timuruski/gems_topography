require 'open-uri'
require 'nokogiri'
require 'yaml'

RUBYGEMS = URI.parse('https://rubygems.org')

stats = Nokogiri::HTML open(RUBYGEMS + '/stats')
popular = stats.css('.stats__graph__gem__name').map(&:text)

deps_url = RUBYGEMS + '/api/v1/dependencies' + "?gems=#{popular.join(',')}"
deps = Marshal.load open(deps_url)

puts YAML.dump deps
