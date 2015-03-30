source 'https://github.com/CocoaPods/Specs.git'

workspace 'KTAppFrameDemo'

platform :ios, '6.0'
inhibit_all_warnings!

xcodeproj 'KTAppFrame'
target 'KTAppFrame', :exclusive => true do
  pod 'Masonry'
end

target 'KTAppFrameTest', :exclusive => true do
xcodeproj 'KTAppFrameTest/KTAppFrameTest'
  pod 'Masonry'
  pod 'KTAppFrame', :path => './'
end

