
Pod::Spec.new do |s|


  s.name         = "HJPaymentModule"
  s.version      = "0.0.3"
  s.summary      = "对Alipay、微信支付、银联支付三方支付进行聚合"

  s.description  = <<-DESC
        1、集成alipay 、 微信支付、 银联支付三种支付方式，并暴露统一API进行管理
                   DESC

  s.homepage     = "https://github.com/Hjayth/HJPaymentModule"


  s.license      = "MIT"


  s.author             = { "hjayth" => "18622995206@163.com" }

  s.requires_arc = true

  s.platform     = :ios, "8.0"

  s.ios.deployment_target = "8.0"


  s.source       = { :git => "https://github.com/Hjayth/HJPaymentModule.git", :tag => "#{s.version}" }

  s.source_files  = "HJPaymentModule/HJPaymentModule.h"


#subspec
s.subspec 'PayChannels' do |ss|
    ss.source_files ='HJPaymentModule/PayChannels/*.{h,m}'
end

s.subspec 'AliPay' do |ss|
  ss.source_files = 'HJPaymentModule/PayChannels/AliPay/*.{h,m}'
  ss.resource = 'HJPaymentModule/PayChannels/AliPay/**/AlipaySDK.bundle'
  ss.frameworks = 'CoreTelephony', 'SystemConfiguration', 'CoreMotion'
  ss.vendored_frameworks = 'HJPaymentModule/PayChannels/AliPay/**/AlipaySDK.framework'
  ss.libraries = 'c++', 'sqlite3', 'z'
  ss.dependency 'HJPaymentModule/PayChannels'
end

s.subspec 'WXPay' do |ss|
  ss.source_files = 'HJPaymentModule/PayChannels/WXPay/*.{h,m}'
  ss.dependency 'WechatOpenSDK'
  ss.dependency 'HJPaymentModule/PayChannels'
end

s.subspec 'Unpay' do |ss|
  ss.source_files = 'HJPaymentModule/PayChannels/Unpay/**/*.{h,m}'
  ss.vendored_libraries = 'HJPaymentModule/PayChannels/Unpay/**/*.a'
  ss.libraries = 'c++', 'sqlite3', 'z'
  ss.dependency 'HJPaymentModule/PayChannels'
end

s.subspec 'HJPaymentService' do |ss|
  ss.source_files = 'HJPaymentModule/HJPaymentService/*.{h,m}'
  ss.frameworks = 'SystemConfiguration','CFNetwork'
  ss.dependency 'HJPaymentModule/PayChannels'
  ss.dependency  'HJPaymentModule/AliPay'
  ss.dependency 'HJPaymentModule/WXPay'
  ss.dependency 'HJPaymentModule/Unpay'
end
  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.



  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
