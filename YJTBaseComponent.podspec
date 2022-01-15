# podspec 中文注释,注释掉的字段为可选,未注释掉的为必填

Pod::Spec.new do |spec|

  # ―――Spec基本信息――――――――――――――――――――――――――――――――――――――――――――――#
  
  # SDK名字
  spec.name         = "YJTBaseComponent"
  # SDK版本
  spec.version      = "0.0.1"
  # SDK说明,在搜索SDK时会显示
  spec.summary      = "YJTBaseComponent."

  # SDK的描述,DESC是分隔符,写在DESC之间
  spec.description  = <<-DESC
    YJTBaseComponent.
                   DESC

  # SDK主页,必须是一个能通过网络访问的页面,可以放作者个人页面,公司页面,哪怕放个www.baidu.com也行,只要能访问就可以.
  spec.homepage     = "https://github.com/tan5460/YJTBaseComponent"
  #SDK截图,可以放gif
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――License信息―――――――――――――――――――――――――――――――――――――――――――――― #
  #license说明
  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ―――作者信息――――――――――――――――――――――――――――――――――――――――――――――#
  # 作者信息,作者名字与邮箱
  spec.author             = { "TYJ" => "313037101@qq.com" }
  # Or just: spec.author    = ""
  # 有多个作者的话写这里
  # spec.authors            = { "" => "" }
  # 社交链接地址
  # spec.social_media_url   = "http://twitter.com/"

  # ――― 支持iOS版本信息 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # 平台,可以写ios, osx
  # spec.platform     = :ios
  # 支持最低版本
  spec.platform     = :ios, "10.0"
  spec.swift_version = "5.0"
  #  支持混合平台
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― 代码仓库支持 git, hg, bzr, svn and HTTP ――――――――――――――――――――――――――――――――――――――――――――――― #
  # 代码仓库路径,SDK是根据tag号来取代码的,通常会把tag号设成和版本一样
  spec.source = { :git => "https://github.com/tan5460/YJTBaseComponent.git", :tag => "#{spec.version}" }


  # ――― 代码文件 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # 代码文件匹配,**指匹配任意文件夹,*.{h,m}指匹配任意.h和.m文件
  spec.source_files  = "Classes/**/*"
  # spec.exclude_files = "Classes/Exclude"
  # SDK需要暴露的.h文件,默认暴露所有
  # spec.public_header_files = "Classes/**/*.h"


  # ――― 资源路径 ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # 指定资源,比如xib,图片等资源都是
  # spec.resource_bundles = { 'XXXKit' => ['XXXKit/Classes/**/*.{storyboard,xib,cer,json,plist}','XXXKit/Assets/*.{bundle,xcassets,imageset,png}'] }
  
  # ――― 系统库依赖以及静态库――――――――――――――――――――――――――――――――――――――――― #
  # spec.framework  = "UIKit"
  # spec.frameworks = "UIKit", "AnotherFramework"
  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"
  
  
  # ――― 其他三方库依赖 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # 比如你的SDK依赖AFNetworking,注意这里和podfile中的语法不同在于,这里无法指定其他依赖的具体路径
  # 比如这种写法就不支持 s.dependency 'XMPPFramework', :git => "https://github.com/robbiehanson/XMPPFramework.git", :branch => 'master'
  # spec.dependency "AFNetworking", "~> 3.0"
  
  
end
