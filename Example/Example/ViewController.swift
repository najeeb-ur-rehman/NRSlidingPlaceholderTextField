//
//  ViewController.swift
//  Example
//
//  Created by Mian Najeeb on 5/2/20.
//  Copyright © 2020 Mian Najeeb. All rights reserved.
//

import UIKit
import NRSlidingPlaceholderTextField

class ViewController: UIViewController {
    
    
    // MARK: - Instance properties
    
    let attributes: [NSAttributedString.Key: Any] = [
        .font : UIFont.systemFont(ofSize: 12, weight: .medium),
        .foregroundColor : UIColor.white
    ]
    
    lazy var plainPlaceholderField: NRSlidingPlaceholderTextField = {
        let field = NRSlidingPlaceholderTextField()
        field.placeholder = "Plain"
        field.tintColor = .black
        field.borderStyle = .roundedRect
        field.backgroundColor = UIColor(red: 20/255, green: 100/255, blue: 100/255, alpha: 1)
        field.textColor = .white
        return field
    }()
    
    lazy var attributedPlaceholderField: NRSlidingPlaceholderTextField = {
        let field = NRSlidingPlaceholderTextField()
        field.font = UIFont.systemFont(ofSize: 20)
        field.tintColor = .black
        field.borderStyle = .roundedRect
        field.backgroundColor = UIColor(red: 20/255, green: 100/255, blue: 100/255, alpha: 1)
        field.textColor = .white
        let attributedPlaceholder = NSAttributedString(string: "Attributed",
                                                       attributes: attributes)
        field.attributedPlaceholder = attributedPlaceholder
        return field
    }()
    
    lazy var attributedPlaceholderField2: NRSlidingPlaceholderTextField = {
        let field = NRSlidingPlaceholderTextField()
        field.font = UIFont.systemFont(ofSize: 20)
        field.tintColor = .black
        field.borderStyle = .roundedRect
        field.backgroundColor = UIColor(red: 20/255, green: 100/255, blue: 100/255, alpha: 1)
        field.textColor = UIColor(red: 42/255, green: 183/255, blue: 203/255, alpha: 1)
        let attributedPlaceholder = NSAttributedString(string: "Attributed",
                                                       attributes: attributes)
        field.attributedPlaceholder = attributedPlaceholder
        return field
    }()

    
    // MARK: - Outlets
    
    @IBOutlet weak var containerStackView: UIStackView!
    
    
    // MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapToDismiss()
        
        containerStackView.addArrangedSubview(plainPlaceholderField)
        containerStackView.addArrangedSubview(attributedPlaceholderField)
        containerStackView.addArrangedSubview(attributedPlaceholderField2)
        
    }

}


//  MARK: - Private Methods

private extension ViewController {
    
    // MARK: Helpers
    
    private func addTapToDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: Actions
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
