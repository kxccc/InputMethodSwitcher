//
//  PopoverVC.swift
//  InputMethodSwitcher
//
//  Created by 陈治成 on 2022/9/5.
//

import AppKit
import Foundation
class PopoverVC: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    static func freshController() -> PopoverVC {
        // 获取对Main.storyboard的引用
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        // 为PopoverVC创建一个标识符
        let identifier = NSStoryboard.SceneIdentifier("PopoverVC")
        // 实例化PopoverVC并返回
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? PopoverVC else {
            fatalError("Something Wrong with Main.storyboard")
        }
        return viewController
    }
}
