#  Installation & Update

To install or update the pod, simply ensure you have "pod `DevTools`" in your PodFile, and use `pod update` to update or install the pod.

# What's Changed in 2.2?

## General & Sample Project

* No updates this time (I know... sample projects needs to reflect the new working code... blah blah blah)

## CoreDev

* n/a

## Extentions

* UITheme Extentions are now handled in UITheme, pleaes see UITheme for those updates, fixes, and changes. (2.1, still important though)

## UITheme

* UIThemeElement is now STABLE. Turned out UIView was being bad. Don't worry, it's been punished and promises it won't do it again.
* Your element pool can now be validated! No more guessing and failing! Simply do the following
```
let validate = UITheme.manager.validatePool()
if validate.error != nil {
print("Validation Failed")
print("Element: \(describing: validation.element?.debugDescription)")
print("Error: \(validation.error!.localizedDescription)")
}
```
* `UITheme.manager.enableTheme` and `.disableTheme` have been updated to no longer throw an error. This is because the old throwing method did not handle failed objects, and could leave the user (you) in a loop of bad objects. Here are your options now:
    > `UITheme` still auto forces the theme to change if it comes across a bad object. Disabling this will REVERT any changes made up to the failed object.
    > You can disable this by setting `UITheme.manager.forceFailedChange` to `false`
    > This force change can be animated by setting `UITheme.manager.animateForceChange` to `true`
* `UIThemeElement` can now be validated! No more guessing if your element will work. Just call `[your_element].validate()`


# Known Bugs

* Toast is having some problems wanting to be on top. We are working to teach it to not fear being on top.

# Other Notes and Notices

* DevConsole has been closed off. It's still in development, but will hopefully I can devote the time to move the private working version into DevTools.
* DevLogger is currently seporated into DevCore and DevConsole. It will be appropriately centrilized when DevConsole is running. I know this really means nothing since you don't know what more then what the name says.
* DevNotification's Notification Info has been made internal as well. This is to limit how much unfinished code is provided to you. I don't want you to access anything until it is ready.
