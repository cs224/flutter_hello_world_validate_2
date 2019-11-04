#!/usr/bin/env ruby

require 'xcodeproj'
require 'yaml'

project_path = './ios/Runner.xcodeproj.orig'
# project_path =  '/home/cs/tmp/project.pbxproj/2'
project = Xcodeproj::Project.open(project_path)

target = project.targets.first

# target.build_configurations.delete(2)

puts target.build_configurations.class

# puts target.build_configurations('Debug').class

# target.build_configurations.pop

target.build_configurations.each do |config|
  puts config.name
  config.build_settings['CODE_SIGN_IDENTITY']             = 'iPhone Developer'
  config.build_settings['CODE_SIGN_STYLE']                = 'Manual'
  config.build_settings['DEVELOPMENT_TEAM']               = '8467KY9FLZ'
  config.build_settings['PRODUCT_BUNDLE_IDENTIFIER']      = 'dev.weisser-zwerg.flutterHelloWorldValidate2'
  config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = 'dev weisser zwerg flutterHelloWorldValidate2 devel'
end

puts project.pretty_print

project.save('./ios/Runner.xcodeproj')

# https://stackoverflow.com/questions/49234751/how-to-read-ruby-object-in-yaml
#File.open("test.yml", File::RDWR|File::CREAT, 0644) {|f|
#  f.seek(0)
#  f.write YAML.dump(target)
#}

# File.open "test.yml", "w" do |f|
#   f.seek(0)
#   f.write YAML.dump(target)
# end
