/*
 *  DevTools
 *
 *  Core.swift
 *
 *  Created by Erik Bean on 4.24.17
 *  Copyright © 2017 Erik Bean
 */

import UIKit
import CoreTelephony

public class Core {
    
    // MARK:- Other
    
    /// Are we on the simulator?
    public var isSimulator: Bool { return simualtor() }
    /// App Version Number
    public var releaseVersionNumber: String? { return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String }
    /// App Build Number
    public var buildVersionNumber: String? { return Bundle.main.infoDictionary?["CFBundleVersion"] as? String }
    
    // MARK:- Core Telephony
    /// Is VoIP Enabled?
    public var voip: Bool? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.allowsVOIP }
    /// Users Carrier
    public var carrier: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName }
    /// Users Current Network Type
    public var network: String? { return networkType(code: CTTelephonyNetworkInfo().currentRadioAccessTechnology) }
    /// Country user is in
    public var country: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode?.localizedUppercase }
    public var mobileCode: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileCountryCode }
    public var networkCode: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileNetworkCode }
    
    // MARK:- UIDevice
    
    /// Current Battery Level
    public var batteryLevel: Float { return UIDevice.current.batteryLevel }
    /// Current Battery State
    public var batteryState: String { return battery(state: UIDevice.current.batteryState) }
    /// Current Device Name
    public let deviceName = UIDevice.current.name
    /// Device Model
    public let model = UIDevice.current.model
    /// Orientation of the deivce
    public var orientation: String { return orientation(orit: UIDevice.current.orientation) }
    /// OS Version
    public let osVersion = UIDevice.current.systemVersion
    /// User Interface Type
    public var gui: String { return userInterface(idiom: UIDevice.current.userInterfaceIdiom) }

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
        print("DTCore -             - Is Sim?:          \(isSimulator)")
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
            return "Pad"
        case UIUserInterfaceIdiom.phone:
            return "Phone"
        case UIUserInterfaceIdiom.tv:
            return "TV"
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
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
            return true
        #else
            return false
        #endif
    }
    
    /// Print a standard message
    internal static func log<message>(_ message: message) {
        print(message)
    }
    
    /// Print a warning message
    internal static func logWarning<warning>(_ warning: warning) {
        print(":: WARNING :: \(warning)")
    }
    
    /// Print an error message
    internal static func logError<error>(_ error: error) {
        let name = Bundle.main.infoDictionary![kCFBundleNameKey as String]!
        print(":: \(name) CONSOLE ERROR :: \(error)")
    }
    
    /// Print a diagnostic message
    internal static func logDiag<message>(_ diag: message) {
        print(":: DIAGNOSTIC :: \(diag)")
    }
}
