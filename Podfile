inhibit_all_warnings!
use_frameworks!

def includeCommonPods
  # Libraries
  pod 'SwiftLint'
  pod 'R.swift'
  pod 'Kingfisher', '~> 5.0'
  pod 'IQKeyboardManagerSwift'
  
  # Helpers
  pod 'SwiftDate'
end

target 'Swift-Base' do
  platform :ios, '11.0'

  includeCommonPods

  target 'Swift-BaseTests' do
    inherit! :search_paths
  end
end
