# 🖼 KFImageViewer

**Customizable Kingfisher dependent Swift image slideshow with download progress, circular scrolling, timer and full screen viewer**

![](https://raw.githubusercontent.com/faisalazeez/KFImageViewer/master/Example/KFImageViewer/KFImageViewer_02.gif)
![](https://raw.githubusercontent.com/faisalazeez/KFImageViewer/master/Example/KFImageViewer/KFImageViewer.gif)

## 📱 Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 🔧 Installation

### CocoaPods
KFImageViewer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KFImageViewer', '~> 1.0.0'
```

### Manually

Alternatively can also grab the whole `KFImageViewer` directory and copy it to your project.

## 🔨 How to use

Add KFImageViewer view to your view hiearchy either in Interface Builder or in code.

### Loading images

Set images by using ```setImageInputs``` method on ```KFImageViewer``` instance with an array of *InputSource*s. You can also create your own input source by implementing ```InputSource``` protocol.

| Library                                                       | InputSource name | Pod                               |
| ------------------------------------------------------------- |:----------------:| ---------------------------------:|
| [Kingfisher](https://github.com/onevcat/Kingfisher)           | KingfisherSource | `pod "KFImageViewer/Kingfisher"` |


```swift
slideshow.setImageInputs([
  KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080"),
])
```

### Configuration

Behaviour is configurable by those properties:

- ```slideshowInterval``` - slideshow interval in seconds (default `0` – disabled)
- ```zoomEnabled``` - enables zooming (default `false`)
- ```circular``` - enables circular scrolling (default `true`)
- ```activityIndicator``` – allows to set custom activity indicator, see *Activity indicator* section
- ```pageIndicator``` – allows to set custom page indicator, see *Page indicator* section; assign `nil` to hide page indicator
- ```pageIndicatorPosition``` - configures position of the page indicator
- ```contentScaleMode``` - configures the scaling (default `ScaleAspectFit`)
- ```draggingEnabled``` - enables dragging (default `true`)
- ```currentPageChanged``` - closure called on page change
- ```willBeginDragging``` - closure called on scrollViewWillBeginDragging
- ```didEndDecelerating``` - closure called on scrollViewDidEndDecelerating
- ```preload``` - image preloading configuration (default `all` preloading, also `fixed`)

### Page Indicator

Page indicator can be customized using the `pageIndicator` property on KFImageViewer. By defualt, a plain UIPageControl is used. If needed, page control can be customized:

```swift
let pageIndicator = UIPageControl()
pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
pageIndicator.pageIndicatorTintColor = UIColor.black
slideshow.pageIndicator = pageIndicator
```

Also, a simple label page indicator that shows pages in style "5/21" (fifth page from twenty one) is provided:

```swift
slideshow.pageIndicator = LabelPageIndicator()
```

You can also use your own page indicator by adopting the `PageIndicatorView` protocol.

Position of the page indicator can be configured by assigning a `PageIndicatorPosition` value to the `pageIndicatorPosition` property on KFImageViewer. You may specify the horizontal and vertical positioning separately.

**Horizontal** positioning options are: `.left(padding: Int)`, `.center`, `.right(padding: Int)`

**Vertical** positioning options are: `.top`, `.bottom`, `.under`, `customTop(padding: Int)`, `customBottom(padding: Int)`, `customUnder(padding: Int)`

Example:
```swift
slideshow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .left(padding: 20), vertical: .bottom)
```


### Activity Indicator

By default activity indicator is not shown, but you can enable it by setting `DefaultActivityIndicator` instance to KFImageViewer :

```swift
slideshow.activityIndicator = DefaultActivityIndicator()
```

You can customize style and color of the indicator:

```swift
slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
```

There's also an option to use your own activity indicator. You just need to implement `ActivityIndicatorView` and `ActivityIndicatorFactory` protocols. See `ActivityIndicator.swift` for more information.

### Full Screen view

There is also a possibility to open full-screen image view using attached `FullScreenSlideshowViewController`. The simplest way is to call:

```swift
override func viewDidLoad() {
  let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
  slideshow.addGestureRecognizer(gestureRecognizer)
}

func didTap() {
  slideshow.presentFullScreenController(from: self)
}
```

`FullScreenSlideshowViewController` can also be instantiated and configured manually if more advanced behavior is needed.

## 👤 Author

Faisal Azeez faisalazeez7@gmail.com

## 📄 License

KFImageViewer is available under the MIT license. See the LICENSE file for more info.
