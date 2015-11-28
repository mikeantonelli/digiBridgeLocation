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
                      'UIKit'

  s.public_header_files = 'digiBridgeLocation/*.h'
  s.source_files = 'digiBridgeLocation/*.{h,m}'
end