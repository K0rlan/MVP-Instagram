//
//  MainPresenter.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import Foundation

protocol MainViewProtocol {
//    send data to view
    func updateData(posts: [Posts], likes: [String])
}

protocol MainPresenterProtocol {
//    get data to presenter
    init(view: MainViewProtocol, posts: [Posts],likes: [String])
    func getLikeTags(tag: Int)
    func addNewPost()
}

class MainPresenter: MainPresenterProtocol {
    
    let view: MainViewProtocol
    var posts: [Posts]
    var likes: [String]
    
    required init(view: MainViewProtocol, posts: [Posts], likes: [String]) {
        self.view = view
        self.posts = posts
        self.likes = likes
    }
    
    func getLikeTags(tag: Int) {
        print(tag)
        if likes[tag] == "heart"{
            likes[tag] = "pink_heart"
            posts[tag].likes += 1
        }else{
            likes[tag] = "heart"
            posts[tag].likes -= 1
        }
        self.view.updateData(posts: posts, likes: likes)
    }
    func addNewPost(){
        if !Post.sharedInstance.arr.isEmpty{
            for newPosts in Post.sharedInstance.arr{
                posts.append(newPosts)
                likes.append("heart")
                self.view.updateData(posts: posts, likes: likes)
            }
        }
    }
    
}
