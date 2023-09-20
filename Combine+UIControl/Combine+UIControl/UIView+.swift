//
//  UIView+.swift
//  Combine+UIControl
//
//  Created by 현수빈 on 2023/09/20.
//

import Foundation
import Combine
import UIKit

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        controlPublisher(for: .editingChanged)
            .map { $0 as! UITextField }
            .map { $0.text! }
            .eraseToAnyPublisher()
    }
}

extension UIButton {
    var tapPublisher: AnyPublisher<Void, Never> {
        controlPublisher(for: .touchUpInside)
            .map { _ in }
            .eraseToAnyPublisher()
    }
}

extension UISwitch {
    var statePublisher: AnyPublisher<Bool, Never> {
        controlPublisher(for: .valueChanged)
            .map { $0 as! UISwitch }
            .map { $0.isOn }
            .eraseToAnyPublisher()
    }
}

extension UIStepper {
    var valuePublisher: AnyPublisher<Double, Never> {
        controlPublisher(for: .valueChanged)
            .map { $0 as! UIStepper }
            .map { $0.value }
            .eraseToAnyPublisher()
    }
}

extension UISegmentedControl {
    var selectionPublisher: AnyPublisher<Int, Never> {
        controlPublisher(for: .valueChanged)
            .map { $0 as! UISegmentedControl }
            .map { $0.selectedSegmentIndex }
            .eraseToAnyPublisher()
    }
}

extension UISlider {
    var valuePublisher: AnyPublisher<Float, Never> {
        controlPublisher(for: .valueChanged)
            .map { $0 as! UISlider }
            .map { $0.value }
            .eraseToAnyPublisher()
    }
}
