//
//  InputAccessoryView.swift
//  InputAccessory
//
//  Created by Jay Andrae on 29/6/19.
//  Copyright © 2019 PlaySport. All rights reserved.
//

import UIKit

class InputAccessoryView: UIView, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var accessoryButtonViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var accessoryButtonView: UIView!
    // MARK: - Init

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        self.setup()
    }

    override init(frame: CGRect) {

        super.init(frame: frame)

        self.setup()
    }

    private func setup() {

        let view = self.viewFromNibForClass()

        view?.frame = self.bounds

        view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.accessoryButtonViewHeightConstraint.constant = 0

        if let view = view {

            self.addSubview(view)

            self.textView.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    override func didMoveToWindow() {

        super.didMoveToWindow()

        if let window = self.window {

            self.bottomAnchor.constraint(lessThanOrEqualTo: window.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
    }

    private func viewFromNibForClass() -> UIView? {

        let bundle = Bundle(for: type(of: self))

        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)

        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView

        return view
    }

    func textViewDidChange(_ textView: UITextView) {

        self.accessoryButtonViewHeightConstraint.constant = 40

        self.accessoryButtonView.alpha = 1

        self.updateHeight(textView.contentSize.height + 20 + self.accessoryButtonViewHeightConstraint.constant)
    }

    private func updateHeight(_ height: CGFloat) {

        for constraint in self.constraints where constraint.firstAttribute == .height {

            constraint.constant = height
        }
    }

    @IBAction func accessoryButtonTouchUpInside(_ sender: Any) {

        let height = self.frame.size.height - 40

        self.updateHeight(height)

        self.accessoryButtonViewHeightConstraint.constant = 0
    }
}
