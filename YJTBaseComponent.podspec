Pod::Spec.new do |s|
  s.name             = 'YJTBaseComponent'
  s.version          = '0.0.2'
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
  #s.subspec 'Category' do |c|
      #c.source_files = 'LNBaseComponent/Classes/Category(系统类扩展)/**/*'
  #end
  
  s.frameworks = 'UIKit'
end
