#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wv_user_agent.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'wv_user_agent'
  s.version          = '1.0.0'
  s.summary          = 'A simple Flutter plugin for retrieving **the actual user agent** of a device using the native WebView.'
  s.description      = <<-DESC
A simple Flutter plugin for retrieving **the actual user agent** of a device using the native WebView.
                       DESC
  s.homepage         = 'https://github.com/jakkimcfly/wv_user_agent'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Aleksandr Zakharov' => 'hello@jakkimcfly.com' }
  s.documentation_url = 'https://github.com/jakkimcfly/wv_user_agent'
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
