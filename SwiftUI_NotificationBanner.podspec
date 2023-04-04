

#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftUI_NotificationBanner'
  s.version          = '0.2'
  s.summary          = 'With SwiftUI Notification Banner it is super-easy to display in-app notifications.'
  s.swift_version = '5.1'


  s.description      = <<-DESC
          Finally a native SwiftUI notification banner package! With SwiftUI Notification Banner it is super-easy to display in-app notifications.
                       DESC

  s.homepage    = 'https://github.com/DominikButz/SwiftUI_NotificationBanner'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dominikbutz' => 'dominikbutz@gmail.com' }
  s.source           = { :git => 'https://github.com/DominikButz/SwiftUI_NotificationBanner.git', :tag => s.version.to_s }

 s.platform           = :ios
 s.ios.deployment_target = '14.0'


  s.source_files = 'Sources/**/*'
  #s.exclude_files = 'MinimizableView /**/*.plist'


  # s.public_header_files = 'SwiftUI_NotificationBanner/**/*.h'

end
