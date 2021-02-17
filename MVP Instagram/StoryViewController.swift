//
//  StoryViewController.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import UIKit

class StoryViewController: UIViewController {
    lazy var storyImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
      
    }
    
    public func setupImage(image: UIImage){
        storyImage.image = image
    }
    
    private func setupViews(){
        [storyImage].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        storyImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storyImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        storyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        storyImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       
    }
    

    
}
