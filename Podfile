platform :ios, '9.0'

target 'BitPrice' do
    use_frameworks!
    
    # Alamofire (HTTP networking)
    # https://github.com/Alamofire/Alamofire
    pod 'Alamofire', '~> 4.6.0'
    
    # Charts (Beautiful charts for iOS/tvOS/OSX)
    # https://github.com/danielgindi/Charts
    pod 'Charts', '~> 3.0.5'
    
    # Crashlytics (crash reporting solution)
    # https://fabric.io/kits/ios/crashlytics/install
    pod 'Fabric', '~> 1.7.2'
    pod 'Crashlytics', '~> 3.9.3'
    
    # Firebase (push notifications, performance report and remote config)
    # https://firebase.google.com/docs/ios/setup?hl=pt-br
    pod 'Firebase/Core', '~> 4.8.2'
    pod 'Firebase/Performance', '~> 4.8.2'
    pod 'Firebase/RemoteConfig', '~> 4.8.2'
    
    # NotificationBanner (highly customizable in app notification banners)
    # https://github.com/Daltron/NotificationBanner
    pod 'NotificationBannerSwift', '~> 1.6.1'
    
    target 'BitPriceTests' do
        inherit! :search_paths
    end
    
    target 'BitPriceUITests' do
        inherit! :search_paths
    end
    
end

post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-BitPrice/Pods-BitPrice-acknowledgements.plist',
                   'BitPrice/Resources/Settings.bundle/Acknowledgements.plist',
                   :remove_destination => true)
end
