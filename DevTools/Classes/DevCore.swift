/*
 * Core
 *
 * Created by Erik Bean on 4/24/17
 * Copyright © 2018 Erik Bean
 */

import UIKit
import CoreTelephony

public final class DevCore {
    
    // MARK:- Other
    
    /// Are we on the simulator?
    public var isSimulator: Bool { return simualtor() }
    /// App Version Number
    @available(OSX 10.0, iOS 2.0, tvOS 9.0, watchOS 2.0, *)
    public var releaseVersionNumber: String? { return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String }
    /// App Build Number
    @available(OSX 10.0, iOS 2.0, tvOS 9.0, watchOS 2.0, *)
    public var buildVersionNumber: String? { return Bundle.main.infoDictionary?["CFBundleVersion"] as? String }
    /// Is the Status Bar Hidden?
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var isStatusBarHidden: Bool { return UIApplication.shared.isStatusBarHidden }
    /// Status Bar Height
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var statusBarHeight: CGFloat { return UIApplication.shared.statusBarFrame.height }
    
    // MARK:- Core Telephony
    /// Is VoIP Enabled?
    /// -note: Will always return false on Simulator
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var voip: Bool? {
        if isSimulator {
            return false
        } else {
            return CTTelephonyNetworkInfo().subscriberCellularProvider?.allowsVOIP
        }
    }
    /// Users Carrier
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var carrier: String? {
        if isSimulator {
            return "Simulator :: No Cellular Network"
        } else {
            return CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName
        }
    }
    /// Users Current Network Type
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var network: String? {
        if isSimulator {
            return "Simulator :: No Cellular Network"
        } else {
            return networkType(code: CTTelephonyNetworkInfo().currentRadioAccessTechnology)
        }
    }
    /// Country user is in
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var country: String? {
        if isSimulator {
            return "Simulator :: No Cellular Network"
        } else {
            if #available(iOS 9.0, *) {
                return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode?.localizedUppercase
            } else {
                return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode?.uppercased()
            }
        }
    }
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var mobileCode: String? {
        if isSimulator {
            return "Simulator :: No Cellular Network"
        } else {
            return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileCountryCode
        }
    }
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var networkCode: String? {
        if isSimulator {
            return "Simulator :: No Cellular Network"
        } else {
            return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileNetworkCode
        }
    }
    
    // MARK:- UIDevice
    
    /// Current Battery Level
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var batteryLevel: Float { return UIDevice.current.batteryLevel }
    /// Current Battery State
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var batteryState: String { return battery(state: UIDevice.current.batteryState) }
    /// Current Device Name
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var deviceName: String { return UIDevice.current.name }
    /// Device Model
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    public var model: String { return UIDevice.current.model }
    /// Orientation of the deivce
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var orientation: String { return orientation(orit: UIDevice.current.orientation) }
    /// OS Version
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    public var osVersion: String { return UIDevice.current.systemVersion }
    /// User Interface Type
    @available(OSX, unavailable)
    @available(watchOS, unavailable)
    public var gui: String { return userInterface(idiom: UIDevice.current.userInterfaceIdiom) }
    
    // MARK:- Log Functions

    /// Print carrier based stats such as the carrier, voip, and network codes
    public func logTelephony() {
        print("DTCore - Telephony   - Carrier:          \(carrier ?? "No Carrier Available")")
        print("DTCore - Telephony   - VoIP:             \(voip ?? false)")
        print("DTCore - Telephony   - Current Country:  \(country ?? "Unknown Location")")
        print("DTCore - Telephony   - Mobile Code:      \(mobileCode ?? "Unknown Mobile Code")")
        print("DTCore - Telephony   - Network Code:     \(networkCode ?? "Unknown Network Code")")
        print("DTCore - Telephony   - Network Type:     \(network ?? "No Network Connection Found")")
    }
    
    /// Print standard device stats, such as battery and model information
    public func logDevice() {
        print("DTCore - Device      - Is Sim?:          \(isSimulator)")
        print("DTCore - Device      - Battery Level:    \(batteryLevel)")
        print("DTCore - Device      - Battery State:    \(batteryState)")
        print("DTCore - Device      - Device Name:      \(deviceName)")
        print("DTCore - Device      - Model:            \(model)")
        print("DTCore - Device      - Orientation:      \(orientation)")
        print("DTCore - Device      - OS Version:       \(osVersion)")
        print("DTCore - Device      - GUI Interface:    \(gui)")
    }
    
    // MARK:- Helper Functions
    
    /// Start a new Core object
    public init() { }
    
    // GUI Check, returns a readable state
    private func userInterface(idiom: UIUserInterfaceIdiom) -> String {
        switch idiom {
        case UIUserInterfaceIdiom.carPlay:
            return "CarPlay"
        case UIUserInterfaceIdiom.pad:
            return "iPad"
        case UIUserInterfaceIdiom.phone:
            return "iPhone"
        case UIUserInterfaceIdiom.tv:
            return "AppleTV"
        case UIUserInterfaceIdiom.unspecified:
            return "Unspecifified"
        }
    }
    
    // Orientation Check, returns a readable state
    private func orientation(orit: UIDeviceOrientation) -> String {
        switch orit {
        case UIDeviceOrientation.faceUp:
            return "Face Up"
        case UIDeviceOrientation.faceDown:
            return "Face Down"
        case UIDeviceOrientation.portrait:
            return "Portrait"
        case UIDeviceOrientation.portraitUpsideDown:
            return "Portrait"
        case UIDeviceOrientation.landscapeLeft:
            return "Landscape"
        case UIDeviceOrientation.landscapeRight:
            return "Landscape"
        case UIDeviceOrientation.unknown:
            return "Unknown"
        }
    }
    
    // Battery State Check, returns a readable state
    private func battery(state: UIDeviceBatteryState) -> String {
        switch state {
        case UIDeviceBatteryState.charging:
            return "Charging"
        case UIDeviceBatteryState.full:
            return "Full"
        case UIDeviceBatteryState.unplugged:
            return "Unplugged"
        case UIDeviceBatteryState.unknown:
            return "Unknown"
        }
    }
    
    // Network Type Check, returns a readable state
    private func networkType(code: String?) -> String? {
        guard let code = code else { return nil }
        switch code {
        case CTRadioAccessTechnologyLTE:
            return "LTE"
        case CTRadioAccessTechnologyEdge:
            return "Edge"
        case CTRadioAccessTechnologyGPRS:
            return "GRPS"
        case CTRadioAccessTechnologyeHRPD:
            return "eHRPD"
        case CTRadioAccessTechnologyHSDPA:
            return "HSDPA"
        case CTRadioAccessTechnologyHSUPA:
            return "HSUPA"
        case CTRadioAccessTechnologyWCDMA:
            return "WCDMA"
        case CTRadioAccessTechnologyCDMA1x:
            return "CDMA1x"
        case CTRadioAccessTechnologyCDMAEVDORev0:
            return "CDMAEVDORev0"
        case CTRadioAccessTechnologyCDMAEVDORevA:
            return "CDMAEVDORevA"
        case CTRadioAccessTechnologyCDMAEVDORevB:
            return "CDMAEVDORevB"
        default:
            return code
        }
    }
    
    // Simulator Check, returns a bool
    private func simualtor() -> Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    /// Print a standard message
    public static func log<message>(_ message: message) {
        print(message)
    }
    
    /// Print a warning message
    public static func logWarning<warning>(_ warning: warning) {
        print(":: WARNING :: \(warning)")
    }
    
    /// Print an error message
    @available(OSX 10.0, iOS 2.0, tvOS 9.0, watchOS 2.0, *)
    public static func logError<error>(_ error: error) {
        let name = Bundle.main.infoDictionary![kCFBundleNameKey as String]!
        print(":: \(name) ERROR :: \(error)")
    }
    
    @available(OSX 10.0, iOS 2.0, tvOS 9.0, watchOS 2.0, *)
    internal static func logConsoleError<error>(_ error: error) {
        let name = Bundle.main.infoDictionary![kCFBundleNameKey as String]!
        print(":: \(name) CONSOLE ERROR :: \(error)")
    }
    
    /// Print a diagnostic message
    public static func logDiag<message>(_ diag: message) {
        print(":: DIAGNOSTIC :: \(diag)")
    }
    
    /// Check if you can use our many methods and functions
    public static func isAvailable() -> Bool {
        if #available(OSX 10.0, iOS 2.0, tvOS 9.0, watchOS 2.0, *) {
            return true
        } else {
            return false
        }
    }
    
    /// Exit your app with a failure
    public static func saftey() {
        exit(EXIT_FAILURE)
    }
    
    /// Exit yoru app with a failure
    public static func saftey(_ failure: Int32) {
        exit(failure)
    }
}
