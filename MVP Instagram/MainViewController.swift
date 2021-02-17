//
//  MainViewController.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 16.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    lazy var logoButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.logo, for: .normal)
        return button
    }()
    
    lazy var likesButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.like, for: .normal)
        return button
    }()
    
    lazy var directButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.direct, for: .normal)
        return button
    }()
    
    lazy var separatorViewForNavBar: UIView = {
        let view = UIView()
        return view
    }()
    
    var posts = [Posts(user: Stories(name: "Koko", image: "avatar1"), postString: "avatar1", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "1"), postString: "p1", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "2"), postString: "p2", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "3"), postString: "p3", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "4"), postString: "p4", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "5"), postString: "p5", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "6"), postString: "p1", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "7"), postString: "p2", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")]
    
    var likes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationBar()
        setupViews()
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: "stories")
        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: "posts")
        likes = [String](repeating: "heart", count: self.posts.count)
        if !Post.sharedInstance.arr.isEmpty{
            addNew()
        }
        tableView.reloadData()
    }
    private func setNavigationBar(){
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: directButton), UIBarButtonItem(customView: separatorViewForNavBar),UIBarButtonItem(customView: likesButton)]
    }
    private func setupViews(){
        [logoButton, directButton, likesButton, separatorViewForNavBar, tableView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        logoButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        directButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        directButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        likesButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        likesButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        separatorViewForNavBar.widthAnchor.constraint(equalToConstant: 7).isActive = true
        separatorViewForNavBar.heightAnchor.constraint(equalToConstant: 7).isActive = true
    }
    func addNew(){
        for newPosts in Post.sharedInstance.arr{
            posts.append(newPosts)
            likes.append("heart")
        }
        tableView.reloadData()
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "stories", for: indexPath) as!
                StoriesTableViewCell
            cell.contentView.isUserInteractionEnabled = false
            return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "posts", for: indexPath) as!
                PostsTableViewCell
            cell.likeButton.tag = posts.count - indexPath.row
            let post = posts[posts.count - indexPath.row]
            cell.postImageView.image = post.postImage
            cell.postLabel.text = post.postText
            cell.avaImageView.image = UIImage(named: post.user.image)
            cell.avaLabel.text = post.user.name
            cell.likeLabel.font = .boldSystemFont(ofSize: 18)
            cell.contentView.isUserInteractionEnabled = false
            
            cell.likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
            cell.likeButton.setImage(UIImage(named: likes[posts.count - indexPath.row]), for: .normal)
            
            cell.likeLabel.text = "Нравится: \(post.likes)"
            
            
            return cell
        }
    }
    @objc func likeButtonPressed(sender: UIButton){
        if likes[sender.tag] == "heart"{
            likes[sender.tag] = "pink_heart"
            posts[sender.tag].likes += 1
        }else{
            likes[sender.tag] = "heart"
            posts[sender.tag].likes -= 1
        }
        tableView.reloadData()
    }
}
