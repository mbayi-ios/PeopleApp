//
//  HapticManager.swift
//  People
//
//  Created by Amby on 22/09/2022.
//

import Foundation
import UIKit

fileprivate final class HapticsManager {
    static let shared = HapticsManager()

    private let feedback = UINotificationFeedbackGenerator()

    private init() {}

    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
    if UserDefaults.standard.bool(forKey: UserDefaultKeys.hapticEnabled) {
        HapticsManager.shared.trigger(notification)
    }
}
