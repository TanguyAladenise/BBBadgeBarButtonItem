Pod::Spec.new do |s|
  s.name         = "BBBadgeBarButtonItem"
  s.version      = "1.0.1"
  s.summary      = "Create a BarButtonItem with a badge on top"
  s.description  = <<-DESC
Easily customizable. Your BarButtonItem can be any custom view you wish for. The badge on top can display any number or string of any size or length.
                   DESC
  s.homepage     = "https://github.com/TanguyAladenise/BBBadgeBarButtonItem"
  s.screenshots  = "https://github.com/TanguyAladenise/BBBadgeBarButtonItem/blob/master/screenshot.png?raw=true"
  s.license      = 'MIT'
  s.author       = { "Tanguy Aladenise" => "tanguy.aladenise@gmail.com" }
  s.source       = { :git => "https://github.com/GoodWorkApps/BBBadgeBarButtonItem.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true

  s.source_files = 'BBBadgeBarButtonItem.*'

  s.public_header_files = 'BBBadgeBarButtonItem.h'
end
