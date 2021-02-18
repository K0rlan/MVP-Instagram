//
//  RegistrationView.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import UIKit

class RegistrationView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.setTitleColor(ConstantsForAuth.buttonTitleColor, for: .normal)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setParamaters(buttonName: String, title: String){
        self.titleLabel.text = title
        self.rightButton.setTitle(buttonName, for: .normal)
    }
    
    
    private func setupViews(){
        [rightButton, titleLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        
        rightButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8).isActive = true
        rightButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor ).isActive = true
    }

}
