Pod::Spec.new do |spec|
spec.name         = 'BBBadgeBarButtonItem'
spec.version      = '1.0'
spec.license      = { :type => 'MIT' }
spec.homepage     = 'https://github.com/TanguyAladenise/BBBadgeBarButtonItem'
spec.authors      = { 'Tanguy Aladenise' => 'tanguy.aladenise@gmail.com' }
spec.summary      = 'Badge value on top of BarButtonItem'
spec.source       = { :git => 'https://github.com/TanguyAladenise/BBBadgeBarButtonItem.git', :tag => '1.0' }
spec.source_files = 'BBBadgeBarButtonItem/BBBadgeBarButtonItem.{h,m}'
spec.description      = <<-DESC
Create a BarButtonItem with a badge on top. Easily customizable. Your BarButtonItem can be any custom view you wish for. The badge on top can display any number or string of any size or length. Reproducing the behavior of a badge value on a tabBarItem in a Navigation Bar.
DESC
spec.requires_arc = true
spec.screenshots      = "https://github.com/TanguyAladenise/BBBadgeBarButtonItem/blob/master/screenshot.png"
end