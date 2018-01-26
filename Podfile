platform :ios, '9.0'

target 'BitPrice' do
    use_frameworks!
    
    # Crashlytics (crash reporting solution)
    # https://fabric.io/kits/ios/crashlytics/install
    pod 'Fabric', '~> 1.7.2'
    pod 'Crashlytics', '~> 3.9.3'
    
    # Firebase (push notifications, performance report and remote config)
    # https://firebase.google.com/docs/ios/setup?hl=pt-br
    pod 'Firebase/Core'
    pod 'Firebase/Performance'
    pod 'Firebase/RemoteConfig'
    
    target 'BitPriceTests' do
        inherit! :search_paths
    end
    
    target 'BitPriceUITests' do
        inherit! :search_paths
    end
    
end
