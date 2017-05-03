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
    
    // MARK:- Core Telephony
    public var voip: Bool? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.allowsVOIP }
    public var carrier: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName }
    public var network: String? { return networkType(code: CTTelephonyNetworkInfo().currentRadioAccessTechnology) }
    public var country: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode?.localizedUppercase }
    public var mobileCode: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileCountryCode }
    public var networkCode: String? { return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileNetworkCode }
    
    // MARK:- UIDevice
    
    public var batteryLevel: Float { return UIDevice.current.batteryLevel }
    public var batteryState: String { return battery(state: UIDevice.current.batteryState) }
    public let deviceName = UIDevice.current.name
    public let model = UIDevice.current.model
    public var orientation: String { return orientation(orit: UIDevice.current.orientation) }
    public let osVersion = UIDevice.current.systemVersion
    public var gui: String { return userInterface(idiom: UIDevice.current.userInterfaceIdiom) }

    public func logTelephony() {
        print("DTCore - Telephony   - Carrier:          \(carrier ?? "No Carrier Available")")
        print("DTCore - Telephony   - VoIP:             \(voip ?? false)")
        print("DTCore - Telephony   - Current Country:  \(country ?? "Unknown Location")")
        print("DTCore - Telephony   - Mobile Code:      \(mobileCode ?? "Unknown Mobile Code")")
        print("DTCore - Telephony   - Network Code:     \(networkCode ?? "Unknown Network Code")")
        print("DTCore - Telephony   - Network Type:     \(network ?? "No Network Connection Found")")
    }
    
    public func logDevice() {
        print("DTCore - Device      - Battery Level:    \(batteryLevel)")
        print("DTCore - Device      - Battery State:    \(batteryState)")
        print("DTCore - Device      - Device Name:      \(deviceName)")
        print("DTCore - Device      - Model:            \(model)")
        print("DTCore - Device      - Orientation:      \(orientation)")
        print("DTCore - Device      - OS Version:       \(osVersion)")
        print("DTCore - Device      - GUI Interface:    \(gui)")
    }
    
    // MARK:- Helper Functions
    
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
        default:
            return "Unknown User Interface"
        }
    }
    
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
        default:
            return "Unknown Device Orientation"
        }
    }
    
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
        default:
            return "Unknown Battery State"
        }
    }

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
    
    internal static func log<message>(_ message: message) {
        print(message)
    }
    
    internal static func logWarning<warning>(_ warning: warning) {
        print(":: WARNING :: \(warning)")
    }
    
    internal static func logError<error>(_ error: error) {
        let name = Bundle.main.infoDictionary![kCFBundleNameKey as String]!
        print(":: \(name) CONSOLE ERROR :: \(error)")
    }
    
    internal static func logDiag<message>(_ diag: message) {
        print(":: DIAGNOSTIC :: \(diag)")
    }
}
