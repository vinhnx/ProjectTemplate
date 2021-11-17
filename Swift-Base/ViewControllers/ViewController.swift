//
//  ViewController.swift
//  Swift-Base
//

import UIKit

class ViewController: BaseViewController {

    // MARK: - Instance Properties

    @IBOutlet private weak var label: UILabel!

    // MARK: - Instance Methods

    @IBAction private func tapShowAlert(_ sender: AnyObject) {
        let alertController = UIAlertController(
            title: nil,
            message: R.string.localizable.press_ok(),
            preferredStyle: .alert
        )

        alertController.addAction(UIAlertAction(title: R.string.localizable.alert_ok(), style: .cancel))

        _ = UILabel().then {
            $0.text = "s"
        }

        self.present(alertController, animated: true)
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}
