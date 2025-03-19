import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "000" asset catalog image resource.
    static let _000 = ImageResource(name: "000", bundle: resourceBundle)

    /// The "001" asset catalog image resource.
    static let _001 = ImageResource(name: "001", bundle: resourceBundle)

    /// The "002" asset catalog image resource.
    static let _002 = ImageResource(name: "002", bundle: resourceBundle)

    /// The "003" asset catalog image resource.
    static let _003 = ImageResource(name: "003", bundle: resourceBundle)

    /// The "004" asset catalog image resource.
    static let _004 = ImageResource(name: "004", bundle: resourceBundle)

    /// The "005" asset catalog image resource.
    static let _005 = ImageResource(name: "005", bundle: resourceBundle)

    /// The "006" asset catalog image resource.
    static let _006 = ImageResource(name: "006", bundle: resourceBundle)

    /// The "007" asset catalog image resource.
    static let _007 = ImageResource(name: "007", bundle: resourceBundle)

    /// The "008" asset catalog image resource.
    static let _008 = ImageResource(name: "008", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "000" asset catalog image.
    static var _000: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._000)
#else
        .init()
#endif
    }

    /// The "001" asset catalog image.
    static var _001: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._001)
#else
        .init()
#endif
    }

    /// The "002" asset catalog image.
    static var _002: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._002)
#else
        .init()
#endif
    }

    /// The "003" asset catalog image.
    static var _003: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._003)
#else
        .init()
#endif
    }

    /// The "004" asset catalog image.
    static var _004: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._004)
#else
        .init()
#endif
    }

    /// The "005" asset catalog image.
    static var _005: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._005)
#else
        .init()
#endif
    }

    /// The "006" asset catalog image.
    static var _006: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._006)
#else
        .init()
#endif
    }

    /// The "007" asset catalog image.
    static var _007: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._007)
#else
        .init()
#endif
    }

    /// The "008" asset catalog image.
    static var _008: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._008)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "000" asset catalog image.
    static var _000: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._000)
#else
        .init()
#endif
    }

    /// The "001" asset catalog image.
    static var _001: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._001)
#else
        .init()
#endif
    }

    /// The "002" asset catalog image.
    static var _002: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._002)
#else
        .init()
#endif
    }

    /// The "003" asset catalog image.
    static var _003: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._003)
#else
        .init()
#endif
    }

    /// The "004" asset catalog image.
    static var _004: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._004)
#else
        .init()
#endif
    }

    /// The "005" asset catalog image.
    static var _005: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._005)
#else
        .init()
#endif
    }

    /// The "006" asset catalog image.
    static var _006: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._006)
#else
        .init()
#endif
    }

    /// The "007" asset catalog image.
    static var _007: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._007)
#else
        .init()
#endif
    }

    /// The "008" asset catalog image.
    static var _008: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._008)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif