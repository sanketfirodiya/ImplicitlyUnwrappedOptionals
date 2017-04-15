//: Playground - noun: a place where people can play

import UIKit

protocol TapHandlerDelegate: class {
    func handleTap()
}

class TapHandler {
    weak var delegate: TapHandlerDelegate!

    init(delegate: TapHandlerDelegate, view: UIView) {
        self.delegate = delegate
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapReceived))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    init() {}

    @objc func tapReceived() {
        delegate.handleTap()
    }
}

class ViewController: UIViewController {
    lazy var tapHandler: TapHandler = TapHandler(delegate: self, view: self.view)
}

extension ViewController: TapHandlerDelegate {
    func handleTap() {
    }
}

var tapHandler = TapHandler()
autoreleasepool {
    let viewController = ViewController()
    tapHandler = viewController.tapHandler
    print(tapHandler.delegate) //prints the viewController
}

// viewController is released by now and referencing it here by unwrapping through the delegate property causes a runtime crash
print(tapHandler.delegate)
