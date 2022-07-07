Pod::Spec.new do |s|
  s.name             = 'LiveKit-Swift'
  s.version          = '1.0.1'
  s.summary          = 'LiveKit-Swift with support for Cocoapods'

  s.homepage         = 'https://livekit.io/'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 'LiveKit' => 'https://livekit.io/' }
  s.source           = { :git => 'https://github.com/jaumo/client-sdk-swift-cocoapods', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'LiveKit/**/*'

  s.dependency 'WebRTC-SDK', '97.4692.05'
  s.dependency 'SwiftProtobuf', '~> 1.18'
  s.dependency 'PromisesSwift', '~> 2.0'
  s.dependency 'Logging'
end
