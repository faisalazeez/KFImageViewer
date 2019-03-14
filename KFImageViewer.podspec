#
# Be sure to run `pod lib lint KFImageViewer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KFImageViewer'
  s.version          = '1.0.0'
  s.summary          = 'KFImageViewer written in Swift with download progress, circular scrolling, timer and full screen viewer'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
   KFImageViewer is a Kingfisher supported Swift library providing customizable image viewer with download progress, circular scrolling, timer and full screen viewer and extendable image source.
    DESC
    
  s.homepage         = 'https://github.com/faisalazeez/KFImageViewer'
  s.swift_version    = '4.0'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'faisalazeez' => 'faisalazeez7@gmail.com' }
  s.source           = { :git => 'https://github.com/faisalazeez/KFImageViewer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  
  s.requires_arc = true
  
  s.subspec 'Core' do |core|
      core.source_files = 'Core/**/*'
      core.resources = 'Core/Resources/*.png'
  end
  
  s.subspec 'Kingfisher' do |subspec|
      subspec.dependency 'KFImageViewer/Core'
      subspec.dependency 'Kingfisher', '> 5.2'
      subspec.source_files = 'Kingfisher/KingfisherSource.swift'
  end
  
  s.default_subspec = 'Core'
end
