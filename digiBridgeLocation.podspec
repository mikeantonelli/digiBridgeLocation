Pod::Spec.new do |s|
  s.name     = 'digiBridgeLocation'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Location iOS components for any app.'
  s.homepage = 'https://github.com/mikeantonelli/digiBridgeLocation'
  s.authors  = { 'Mike Antonelli' => 'mike.antonelli@me.com' }
  s.source   = { 
    git: 'https://github.com/mikeantonelli/digiBridgeLocation.git', 
    branch: 'master'
    #tag: s.version
  }

  s.requires_arc = true

  s.ios.deployment_target = '8.0'
  
  s.ios.frameworks  = 'CoreLocation', 
                      'Foundation', 
                      'MapKit', 
                      'UIKit'

  s.public_header_files = 'digiBridgeLocation/*.h'
  s.source_files = 'digiBridgeLocation/*.{h,m}'

  # Quick tool to explain the right place to enable your privacy settings
  # ==> MIT
  # https://github.com/danielebogo/DBPrivacyHelper
  
  s.dependency 'DBPrivacyHelper', '~> 0.4'

  # A fast & simple, yet powerful & flexible logging framework for Mac and iOS
  # ==> BSD
  # https://github.com/CocoaLumberjack/CocoaLumberjack

  s.dependency 'CocoaLumberjack', '~> 1.9'

  # KVNProgress is a fully customizable progress HUD that can be full screen or not.
  # ==> MIT
  # https://github.com/kevin-hirsch/KVNProgress
  
  s.dependency 'KVNProgress', '~> 2.1'

  # Remote configuration for iOS
  # ==> MIT
  # https://github.com/mattt/GroundControl
  
  s.dependency 'GroundControl', '~> 2.1' 

end