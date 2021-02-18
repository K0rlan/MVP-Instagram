//
//  StoriesTableViewCell.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 16.02.2021.
//

import UIKit

protocol StoriesTableViewCellDelegate{
    func didButtonTapped(image: String, ava: String, name: String)
}

class StoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var stories = [Stories(name: "Koko", image: "1", storyImage: "p1"), Stories(name: "Aru", image: "2", storyImage: "p2"), Stories(name: "China", image: "3", storyImage: "p3"), Stories(name: "Samat", image: "4", storyImage: "p4!"), Stories(name: "Bola", image: "5", storyImage: "p5"), Stories(name: "Danik", image: "6", storyImage: "p1"), Stories(name: "Yuri", image: "7", storyImage: "p2")]
    
    var actionDelegate: StoriesTableViewCellDelegate?
    var index: Int?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesCollectionViewCell
        let story = stories[indexPath.row]
        cell.imageView.image = UIImage(named: story.image)
        cell.textLabel.text = story.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = stories[indexPath.row]
        if stories[indexPath.row].storyImage != nil{
            if let delegate = self.actionDelegate{
                delegate.didButtonTapped(image: story.storyImage!, ava: story.image, name: story.name)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 99, height: 113)
    }
    
    func setupViews() {
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 113).isActive = true
    
    }

}
