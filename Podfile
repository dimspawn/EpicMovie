# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

source 'https://github.com/dimspawn/Epic-Movie-CorePodSpecs'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

workspace 'NewEpicMovie'

target 'EpicMovie' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire', '~> 5.5'
  pod 'RealmSwift', '~> 10.20'
  pod 'SDWebImageSwiftUI', '~> 2.0'
  pod 'Core'

  # Pods for EpicMovie

  target 'EpicMovieTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'EpicMovieUITests' do
    # Pods for testing
  end

end

target 'Common' do
project './Module/Common/Common'
pod 'RealmSwift', '~> 10.20'
end

target 'MovieDomain' do
project './Module/MovieDomain/MovieDomain'
end

target 'NowPlaying' do
project './Module/NowPlaying/NowPlaying'
pod 'Alamofire', '~> 5.5'
pod 'RealmSwift', '~> 10.20'
pod 'SDWebImageSwiftUI', '~> 2.0'
pod 'Core'
end

target 'Detail' do
project './Module/Detail/Detail'
pod 'Alamofire', '~> 5.5'
pod 'RealmSwift', '~> 10.20'
pod 'SDWebImageSwiftUI', '~> 2.0'
pod 'Core'
end

target 'Favorite' do
project './Module/Favorite/Favorite'
pod 'RealmSwift', '~> 10.20'
pod 'SDWebImageSwiftUI', '~> 2.0'
pod 'Core'
end