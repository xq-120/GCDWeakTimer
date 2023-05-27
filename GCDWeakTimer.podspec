Pod::Spec.new do |s|
  s.name             = 'GCDWeakTimer'
  s.version          = '1.2.0'
  s.summary          = '基于GCD的定时器'

  s.homepage         = 'https://github.com/xq-120/GCDWeakTimer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xq-120' => '1204556447@qq.com' }
  s.source           = { :git => 'https://github.com/xq-120/GCDWeakTimer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_versions = '5.0'
  
  s.source_files = 'GCDWeakTimer/Classes/**/*'
end
