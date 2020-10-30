#
# Be sure to run `pod lib lint Modify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Modify'
  s.version          = '1.0.0'
  s.summary          = 'A delightful framework to make your codes chainable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A delightful framework to make your codes chainable
                         DESC

  s.homepage         = 'https://github.com/iAllenC/Modify'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iAllenC' => '373381941@qq.com' }
  s.source           = { :git => 'https://github.com/iAllenC/Modify.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_versions = '5.0'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/Modify/**/*'

end
