#  Installation & Update

To install or update the pod, simply ensure you have "pod `DevTools`" in your PodFile, and use `pod update` to update or install the pod

# What's Changed in 2.1?

## General & Sample Project

* We have a changelog! Yep, this shiny thing your reading is what is new!
* Sample Project "Change Theme" button now works as expected, no more "why isn't this working?" moments!

## CoreDev

* I might have accidently jumped the gun with Swift 4.1 code for simulator checks! It now checks which version of swift you are on, and no nasty warnings or errors in either beta or release version of swift when checking if your in the simulator.

## Extentions

* No major extention updates (but you might find the comments are a little different if you like reading that stuff!)
* UITheme Extentions are now handled in UITheme, pleaes see UITheme for those updates, fixes, and changes.

## UITheme

* UIThemeElement is now available, use this to set and save elements that need to be themed
* UIThemeProfile are the profiles you will use to set the theme information. Use them as `UIThemeProfile.[object]`. For example `UIThemeProfile.view`
* UITheme is now up and running. Call it using `UITheme.manager` to access and save objects to it. Use the object pool to save multiple objects, and turn themes on and off for large amounts of objects at once.
* Theme Extentions have been enabled for many UIKit elements, from UIView, UITableView, to TextView and Label. A full list can be found using `UIThemeProfile` or in the `UIThemeProfile` code at the top.
* Want to suggest we theme YOUR project? Or maybe we missed an item? Head over to our issues page and please let me know.


# Known Bugs

* UIThemeElement Is having some issues with parts of UIKit, it's beleived to be an extremely long switch. You can avoid this by not using the it and just calling `[your_object].enableTheme(profile: UIThemeProfile)` instead. This workaround is a temporary manual switch, bypassing UITheme.manager/UIThemeElement
* UITheme.manager.enableTheme() is having is stable. It may or may not work in all situations. This is again related to UIThemeElement, and an extremly large switch. The UIThemeElement workaround above applies here as well.
