//
//  UsersTableViewController.swift
//  aula07-ConexaoHTTP
//
//  Created by HC2MAC017 on 02/05/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    let urlRequest = "https://jsonplaceholder.typicode.com/users"

    var usuarios: [Usuario]? {
        didSet {
            DispatchQueue.main.async(execute: self.tableView.reloadData)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: configurarSession(), delegate: self, delegateQueue: nil)
        
        if let url = URL(string: urlRequest){
            var request = URLRequest(url: url)
            request.timeoutInterval = 10
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            session.dataTask(with: request).resume()
        }

    }
    
    func configurarSession() -> URLSessionConfiguration {
        let cfg = URLSessionConfiguration.default
        cfg.isDiscretionary = true
        cfg.networkServiceType = .default
        
        return cfg
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaUsuario", for: indexPath) as! UsersTableViewCell
        
        cell.nomeUsuario.text = usuarios?[indexPath.row].name
        cell.usernameUsuario.text = usuarios?[indexPath.row].username
        return cell
    }

    
}

extension UsersTableViewController : URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        do{
            usuarios = try JSONDecoder().decode([Usuario].self, from: data)
        }catch{
            print(error)
        }
        
    }
    
}
