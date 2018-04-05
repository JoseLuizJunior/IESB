//
//  Post.swift
//  ExemploTableView
//
//  Created by HC2MAC017 on 04/04/18.
//  Copyright © 2018 IESB. All rights reserved.
//

import CoreData

class Post: NSManagedObject {
    
    static func insertOrUpdate(_ post: CodablePost, intContext context: NSManagedObjectContext) -> Post{
        let postContext = Post(context: context)
        postContext.title = post.title
        postContext.body = post.body
        postContext.id = post.id

        return postContext
    }
    

}
