//
//  ViewController.swift
//  aula06_animation
//
//  Created by HC2MAC017 on 25/04/2018.
//  Copyright © 2018 JJC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewQuadrada: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5,
                       delay: 1,
                       options: [.curveEaseInOut, .autoreverse, .repeat],
                       animations: { [weak self] in
                        self?.viewQuadrada.center = CGPoint(x: 30, y: 30)
            }, completion: nil)
    }

    
}

