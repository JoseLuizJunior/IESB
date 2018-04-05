//
//  Posts.swift
//  ExemploTableView
//
//  Created by Pedro Henrique on 28/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import Foundation

struct CodablePost: Codable {
    
    var id: Int32
    var userId: Int
    var title: String
    var body: String
    
}

struct LoadError: Error {
    var response: URLResponse?
}


struct PostLoader {
    
    
    static func loadPosts(withCompletion completion: @escaping ([CodablePost]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/posts")!) { (data, response, error) in
            guard error == nil else { completion(nil, error); return }
            guard data != nil else { completion(nil, LoadError(response: response)); return }
            guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else { completion(nil, LoadError(response: response)); return }
            
            do {
                let posts = try JSONDecoder().decode([CodablePost].self, from: data!)
                completion(posts, nil)
            }catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
