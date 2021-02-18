//
//  SpinnerViewController.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
