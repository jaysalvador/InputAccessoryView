//
//  ViewController.swift
//  InputAccessory
//
//  Created by Jay Andrae on 29/6/19.
//  Copyright © 2019 PlaySport. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    lazy var inputAccessory: InputAccessoryView = {

        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)

        let inputAccessory = InputAccessoryView(frame: rect)

        return inputAccessory
    }()

    override var inputAccessoryView: UIView? {

        return self.inputAccessory
    }

    override var canBecomeFirstResponder: Bool {

        return true
    }

}

