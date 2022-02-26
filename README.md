# SkinChangeDemo
* 通过扩展系统UI元素属性实现动态换肤，已在实际项目中使用
* UIView+ThemeManager为了自动移除NSNotificationCenter换肤通知采用hook dealloc的方式，从 iOS 9 NSNotificationCenter 无需手动移除观察者，可以把这部分代码移除，如果要支持iOS9之前的版本需要保留。
