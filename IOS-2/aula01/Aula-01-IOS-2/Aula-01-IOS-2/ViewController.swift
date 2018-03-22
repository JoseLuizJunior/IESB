//
//  ViewController.swift
//  Aula-01-IOS-2
//
//  Created by HC2MAC017 on 21/03/18.
//  Copyright © 2018 JJC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!

    @IBOutlet weak var imageView: UIImageView!
    
    let enderecoDaImagem = "https://usercontent2.hubstatic.com/7881737.jpg"

    
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
        
        //        baixarImagem(doEndereco: enderecoDaImagem)
        
        indicator.startAnimating()
        let concurrentQueue = DispatchQueue(label: "novaThread", attributes: .concurrent)
        concurrentQueue.async(execute: baixarImagemClosure)
        
        
    }
    
    var imagem : UIImage?{
        didSet{
            DispatchQueue.main.async(execute: exibirImagem)
        }
    }

    private func baixarImagemClosure(){
        
        if let url = URL(string: enderecoDaImagem){
            do{
                let data = try Data(contentsOf: url)
                //colocar a imagem na tela
                imagem = UIImage(data: data)
                
            }catch{
                debugPrint(error)
            }
        }
    }
    
    private func exibirImagem(){
        guard let img = self.imagem else{return}
        imageView.image = img
        indicator.stopAnimating()
    }
    
    private func baixarImagem(doEndereco enderecoDaImagem: String){
        let concurrentQueue = DispatchQueue(label: "novaThread", attributes: .concurrent)

        concurrentQueue.async { [unowned self] in
            
            if let url = URL(string: enderecoDaImagem){
                do{
                    let data = try Data(contentsOf: url)
                    //colocar a imagem na tela
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }catch{
                    debugPrint(error)
                }
            }
        }
    }
    
}

