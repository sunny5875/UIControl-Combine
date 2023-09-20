//
//  ViewController.swift
//  Combine+UIControl
//
//  Created by 현수빈 on 2023/09/20.
//

import UIKit
import Combine

class ViewController: UIViewController {

    
    @Published var strings = ""
    
    private var cancellables = Set<AnyCancellable>()
    private lazy var button: UIButton = {
        let button =  UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        return button
    }()
    
    
    private lazy var textfield: UITextField = {
        let textfield =  UITextField(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "First"
        
        view.addSubview(button)
        view.addSubview(textfield)
        
        button.center = view.center
        button.backgroundColor = .systemGreen
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        textfield.center = button.center.applying(CGAffineTransform(translationX: 0.0, y: 64.0))
        textfield.backgroundColor = .systemGray
        textfield.placeholder = "input"
        
        $strings.sink {
            print("바뀌었다묭 \($0)")
        }.store(in: &cancellables)
        button
            .tapPublisher.sink {
                print($0)
            }.store(in: &cancellables)
        
        textfield.textPublisher.sink {
            print($0)
            self.strings = $0
        }.store(in: &cancellables)
    }
    


}

