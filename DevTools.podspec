#
# Be sure to run `pod lib lint DevTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DevTools'
  s.version          = '1.0'
  s.summary          = 'Developer tools to simplify iOS development'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A comprehensive list of tools and simplified access points for developers to access and display information in their apps for testing or public usage'

  s.homepage         = 'https://github.com/eebean2/DevTools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eebean2' => 'eebean2@me.com' }
  s.source           = { :git => 'https://github.com/eebean2/DevTools.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DevTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DevTools' => ['DevTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
