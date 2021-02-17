//
//  PostsTableViewCell.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    lazy var avaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var avaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.more, for: .normal)
        return button
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.like, for: .normal)
        button.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.direct, for: .normal)
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.comments, for: .normal)
        return button
    }()
    
    lazy var likeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
       
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func likeButtonPressed(){
        print("like")
    }
    
    private func setupViews() {
        [avaImageView, avaLabel, moreButton, postImageView, likeButton, sendButton, commentButton, likeLabel, postLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        avaImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avaImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avaImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        avaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        avaLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        avaLabel.leadingAnchor.constraint(equalTo: avaImageView.trailingAnchor, constant: 20).isActive = true
        
        moreButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        moreButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        postImageView.widthAnchor.constraint(equalToConstant: 414).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 448).isActive = true
        postImageView.topAnchor.constraint(equalTo: avaImageView.bottomAnchor, constant: 10).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        likeButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
       
        commentButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        commentButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10).isActive = true
       
        sendButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sendButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10).isActive = true
        sendButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10).isActive = true
       
        likeLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 13).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        postLabel.widthAnchor.constraint(equalToConstant: 374).isActive = true
        postLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 13).isActive = true
        postLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        postLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        postLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }

}
