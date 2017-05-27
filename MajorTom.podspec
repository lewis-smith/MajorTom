#
# Be sure to run `pod lib lint MajorTom.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MajorTom'
  s.version          = '0.1.0'
  s.summary          = 'Easily pull remote config from your server'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
If you want to be able to remotely change certain settings, this pod is for you. Inspired by Ground Control, but with zero dependencies.
                       DESC

  s.homepage         = 'https://github.com/lewis-smith/MajorTom'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lewis Smith' => 'lewisthesmith@gmail.com' }
  s.source           = { :git => 'https://github.com/lewis-smith/MajorTom.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/itinerantDev'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MajorTom/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MajorTom' => ['MajorTom/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
end
