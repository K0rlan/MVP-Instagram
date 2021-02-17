//
//  AddNewPostPresenter.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import UIKit

protocol  AddNewPostViewProtocol {
   
}

protocol AddNewPostPresenterProtocol {
    init(view: AddNewPostViewProtocol)
    func addNewPost(image: UIImage?, postText: UITextField?)
}

class AddNewPostPresenter: AddNewPostPresenterProtocol {
    
    let view: AddNewPostViewProtocol
    let pickerController = UIImagePickerController()
    var image: UIImage?
    
    required init(view: AddNewPostViewProtocol) {
        self.view = view
    }
    
    func addNewPost(image: UIImage?, postText: UITextField?) {
        guard let img = image else { return }
        guard let textField = postText, let text = textField.text else { return }
        let post = Posts(user: Stories(name: "Koko", image: "1"), postImage: img, postText: text)
        Post.sharedInstance.arr.append(post)
    }
   
}
