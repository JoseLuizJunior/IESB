//
//  PostTableViewController.swift
//  ExemploTableView
//
//  Created by Pedro Henrique on 28/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    var posts: [CodablePost]? {
        didSet {
            DispatchQueue.main.async(execute: tableView.reloadData)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PostLoader.loadPosts { [unowned self]  (posts, error) in
            self.posts = posts
            
            AppDelegate.persistentContainer.performBackgroundTask(){ context in
                for post in posts {
                    if let post =
                    Post.insertOrUpdate(<#T##post: CodablePost##CodablePost#>, intContext: <#T##NSManagedObjectContext#>)

                }
                
                
                
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaPost", for: indexPath)
        
        guard let post = posts?[indexPath.row] else { return cell }
//        guard let celula = cell as? PostViewCell else { return cell }
        
//        celula.configurar(comPost: post)
        
        //Jeito Marreta
        (cell as? PostViewCell)?.configurar(comPost: post)
        
        return cell
    }

    

}
