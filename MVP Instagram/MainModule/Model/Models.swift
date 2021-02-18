//
//  Models.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 16.02.2021.
//

import UIKit

struct Stories{
    var name: String
    var image: String
    var storyImage: String?
    var storyVideo: String?
    
}

struct Posts {
    var user: Stories
    var postImage: UIImage
    var postText: String
    var likes: Int
    
    init(user: Stories, postString: String, postText: String) {
        self.user = user
        self.postImage = UIImage(imageLiteralResourceName: postString)
        self.postText = postText
        self.likes = Int.random(in: 1..<1000)
    }
    
    init(user: Stories, postImage: UIImage, postText: String) {
        self.user = user
        self.postImage = postImage
        self.postText = postText
        self.likes = 0
    }
    
}
class Post {
    static let sharedInstance = Post()
    var arr = [Posts]()
}

