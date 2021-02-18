//
//  LineSeparatorView.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import UIKit

class LineSeparatorView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "или"
        return label
    }()
    
    let leftHorizontalLine = UIView()
    let rightHorizontalLine = UIView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews(){
        [titleLabel, leftHorizontalLine, rightHorizontalLine].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        leftHorizontalLine.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftHorizontalLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftHorizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        leftHorizontalLine.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -30).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        rightHorizontalLine.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightHorizontalLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        rightHorizontalLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rightHorizontalLine.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 30).isActive = true
        
    }
    
    private func setStyle(){
        leftHorizontalLine.layer.borderWidth = 1.0
        leftHorizontalLine.layer.borderColor = ConstantsForAuth.gray
        
        rightHorizontalLine.layer.borderWidth = 1.0
        rightHorizontalLine.layer.borderColor = ConstantsForAuth.gray
    }

}
