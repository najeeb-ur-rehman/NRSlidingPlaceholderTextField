//
//  NRSlidingPlaceholderTextField.swift
//  NRSlidingPlaceholderTextField
//
//  Created by Mian Najeeb on 4/25/20.
//  Copyright © 2020 Mian Najeeb. All rights reserved.
//

import UIKit

open class NRSlidingPlaceholderTextField: UITextField {
    
    
    // MARK: - Inspectable properties
    
    @IBInspectable public var sidePadding: CGFloat = 7.0
    
    
    // MARK: - Instance Properties
    
    private var placeholderAtStart = true
    private let minimumSidePadding: CGFloat = 7
    private var isAttributedPlaceholder = false
    
    private var placeholderSidePadding: CGFloat {
        max(minimumSidePadding, sidePadding)
    }
    
    private var isEmpty: Bool {
        self.text?.count ?? 0 == 0
    }
    
    private lazy var placeholderLabel: UILabel =  {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = self.font
        label.text = self.placeholder
        label.textColor = self.textColor
        return label
    }()
    
    
    // MARK: - UITextField Properties
    
    override public var placeholder: String? {
        didSet {
            isAttributedPlaceholder = false
            placeholderLabel.text = placeholder
        }
    }
    
    override public var attributedPlaceholder: NSAttributedString? {
        didSet {
            isAttributedPlaceholder = true
            placeholderLabel.attributedText = attributedPlaceholder
        }
    }
    
    override public var text: String? {
        didSet {
            placeholderAtStart =  isEmpty ? true : false
        }
    }
    
    override public var font: UIFont? {
        didSet {
            placeholderLabel.font = font
        }
    }
    
    override public var textColor: UIColor? {
        didSet {
            if !isAttributedPlaceholder {
                placeholderLabel.textColor = textColor
            }
        }
    }
    
    
    // MARK: - Initializers
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        initialViewSettings()
    }

    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialViewSettings()
    }
    
    
    // MARK: - View Layout Methods
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.placeholderLabel.textAlignment = .center
    }
    
    
    // MARK: - UITextField Methods
    
    override final public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        .zero
    }
    
    override final public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return rectForPlaceholderView()
    }

}


// MARK: - Private Methods

extension NRSlidingPlaceholderTextField {
    
    // MARK: Helpers
    
    private func rectForPlaceholderView() -> CGRect {
        let placholderWidth = placeholderLabel.intrinsicContentSize.width + (placeholderSidePadding * 2)
        let placeholderHeight = placeholderLabel.intrinsicContentSize.height
        let placholderSize = CGSize(width: placholderWidth, height: placeholderHeight)
        
        let originX = placeholderAtStart ? 0 : self.bounds.size.width - placholderSize.width
        let originY: CGFloat = (self.bounds.size.height - placholderSize.height) / 2
        
        return CGRect(origin: CGPoint(x: originX, y: originY), size: placholderSize)
    }
    
    private func initialViewSettings() {
        self.placeholderAtStart =  isEmpty ? true : false
        
        self.rightView = self.placeholderLabel
        self.rightViewMode = .always
        
        self.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        self.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
    }
    
    private func updateLayoutWithAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: [.curveEaseOut],
                       animations: {
                            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: Actions
    
    @objc
    private func textFieldDidEndEditing(textField: UITextField) {
        text = textField.text
        if isEmpty {
            updateLayoutWithAnimation()
        }
    }
    
    @objc
    private func textFieldDidBeginEditing(textField: UITextField) {
        placeholderAtStart = false
        updateLayoutWithAnimation()
    }
    
}
