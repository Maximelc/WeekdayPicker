#
# Be sure to run `pod lib lint WeekdayPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WeekdayPicker'
  s.version          = '0.1.0'
  s.swift_version    = '4.0'
  s.summary          = 'WeekdayPicker is a custom UIDatePicker with weekdays.'
  s.homepage         = 'https://github.com/Maximelc/WeekdayPicker'
  s.screenshots	     = 'https://raw.githubusercontent.com/Maximelc/WeekdayPicker/master/Assets/DemoExample.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maximelc' => 'maxime.le-coat@epitech.eu' }
  s.source           = { :git => 'https://github.com/Maximelc/WeekdayPicker.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Maximelc'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*.{h,swift}'
end
