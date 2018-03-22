//
//  ViewController.swift
//  Aula-01-IOS-2-Teclado
//
//  Created by HC2MAC017 on 21/03/18.
//  Copyright © 2018 JJC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoExibicaoInferior: UITextField!{
        didSet{
            textoExibicaoInferior.delegate = self
        }
    }
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!{
        didSet{
            initialHeightConstraint = bottomConstraint.constant
        }
    }
    
    private var initialHeightConstraint: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(oTecladoApareceu(_:)), name: Notification.Name.UIKeyboardDidShow, object: view.window)
        
        NotificationCenter.default.addObserver(self, selector: #selector(oTecladoDesapareceu(_:)), name: Notification.Name.UIKeyboardDidHide, object: view.window)


        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func oTecladoApareceu(_ sender: Notification){
        if let frame = sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            bottomConstraint.constant = bottomConstraint.constant + frame.size.height
        }
        
    }
    @objc private func oTecladoDesapareceu(_ sender: Notification){
        bottomConstraint.constant =  initialHeightConstraint
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
