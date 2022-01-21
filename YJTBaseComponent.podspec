Pod::Spec.new do |s|
  s.name             = 'YJTBaseComponent'
  s.version          = '0.0.2.1'
  s.summary          = 'YJT基础组件库'

  s.description      = <<-DESC
    添加弹窗控件
  DESC

  s.homepage         = 'https://github.com/tan5460/YJTBaseComponent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YJT' => '782026467@qq.com' }
  s.source           = { :git => 'https://github.com/tan5460/YJTBaseComponent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'Classes/*'
  s.frameworks = 'UIKit'
  
  s.subspec 'Universal' do |ss|
      ss.source_files = 'Classes/YJTAppUniversal/*'
  end
  
  s.subspec 'BaseClass' do |ss|
      ss.source_files = 'Classes/YJTBaseClass/*'
  end
  
  s.subspec 'YJTCover' do |ss|
      ss.source_files = 'Classes/YJTCover/*'
  end
  
end
