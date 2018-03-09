/*
 * DevNotification
 *
 * Created by Erik Bean on 7/25/17
 * Copyright © 2018 Erik Bean
 */

import Foundation

/*
 *  This class is still in development
 */

/// A class designed to present notifications inside your app
internal class DevNotification {
    
    private var presentView: NotificationPresentView!
    
    public static let shared = DevNotification()
    
    // TODO: Change Notification Type
    public func setNotification(_ notificaion: NotificationInfo) {
        
    }
}

internal struct NotificationInfo {
    public let title: String
    public var subTitle: String?
    public var message: String?
    public var image: UIImage?
}

private class NotificationPresentView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
