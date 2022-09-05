//
//  Switcher.swift
//  InputMethodSwitcher
//
//  Created by 陈治成 on 2022/9/5.
//

import AppKit
import Carbon
import Foundation

class Switcher {
    static let shared = Switcher()
    var status = 0
    private init() {
        AXIsProcessTrustedWithOptions(
            [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary)
    }

    func start() {
        NSEvent.addGlobalMonitorForEvents(matching: [.flagsChanged, .keyDown]) { [weak self] event in
            guard let self = self else { return }
            if event.type == .flagsChanged, event.modifierFlags.rawValue == 0x40101 {
                if self.status == 0 {
                    self.status = 1
                }
            } else if event.type == .keyDown, event.keyCode == 8 {
                if self.status == 1 {
                    let temp = TISCopyInputSourceForLanguage("en" as CFString).takeRetainedValue()
                    TISSelectInputSource(temp)

                    self.status = 0
                }
            } else {
                self.status = 0
            }
        }
    }
}
