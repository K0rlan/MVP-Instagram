//
//  StoryUIViewController.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import UIKit

class StoryUIViewController: UIViewController {
    
    lazy var storyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var avaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var avaLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.moreWhite, for: .normal)
        return button
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.directWhite, for: .normal)
        return button
    }()
    
    lazy var storyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Отправить сообщение"
        textField.attributedPlaceholder = NSAttributedString(string: "Отправить сообщение", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 20
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 40))
        textField.leftViewMode = .always
        textField.leftView = separatorView
        return textField
    }()
    
    weak var shapeLayer: CAShapeLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        animationLine()
        view.sendSubviewToBack(storyImage)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyViewController = MainViewController()
            self.navigationController?.pushViewController(storyViewController, animated: true)
        }
    }
    
    private func animationLine(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 50))
        path.addLine(to: CGPoint(x: self.view.frame.width - 10, y: 50))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.path = path.cgPath
        
        view.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 3
        shapeLayer.add(animation, forKey: "koko")
        
        self.shapeLayer = shapeLayer
    }
    
    public func setImage(image: UIImage){
        storyImage.image = image
    }
    
    public func setData(image: String, ava: String, name: String){
        storyImage.image =  UIImage(named: image)
        avaLabel.text = name
        avaImageView.image = UIImage(named: ava)
    }
    
    private func setupViews() {
        [avaImageView, avaLabel, storyImage, moreButton, sendButton, storyTextField].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        storyImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        storyImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        storyImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        
        avaImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avaImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avaImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        avaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        avaLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        avaLabel.leadingAnchor.constraint(equalTo: avaImageView.trailingAnchor, constant: 20).isActive = true
        
        moreButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        moreButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        sendButton.widthAnchor.constraint(equalToConstant: 38).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        storyTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        storyTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        storyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        storyTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -40).isActive = true
        
    }
    
}
