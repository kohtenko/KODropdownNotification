#
#  Be sure to run `pod spec lint KODropdownNotification.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "KODropdownNotification"
  s.version      = "1.1.2"
  s.summary      = "KODropdownNotification is simply customizable dropdown notifications"

  s.description  = "KODropdownNotification is simply customizable dropdown notifications. Just create subclass of KODropdownNotification and load your own custom view. Checkout the example project to clarifications."

  s.homepage     = "https://github.com/kohtenko/KODropdownNotification"
  s.screenshots  = "https://raw.github.com/kohtenko/KODropdownNotification/master/anamitionExample.gif"

  s.license          = "MIT"

   s.author             = { "okohtenko" => "kohtenko@gmail.com" }

   s.platform     = :ios
   s.platform     = :ios, "7.0"


  s.source       = { :git => "https://github.com/kohtenko/KODropdownNotification.git", :tag => "1.1.2" }


  s.source_files  = "KODropdownNotification/KODropdownNotification/*.{h,m}"

  s.requires_arc = true


end
