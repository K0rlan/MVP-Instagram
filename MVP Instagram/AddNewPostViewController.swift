//
//  AddNewPostViewController.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import UIKit

class AddNewPostViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый пост"
        label.font = .systemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    lazy var postImage: UIButton = {
        let button = UIButton()
        button.setImage(Constants.imgButton, for: .normal)
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(postImagePressed), for: .touchUpInside)
        return button
    }()
    
    lazy var postText: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Текст..."
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let pickerController = UIImagePickerController()
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        setupViews()
    }
    
    @objc func postImagePressed(_ sender: UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        let actPhoto = UIAlertAction(title: "Сделать фото", style: .default, handler: { _ in self.takePhotoWithCamera() })
        alert.addAction(actPhoto)
        let actLibrary = UIAlertAction(title: "Загрузить из галереи", style: .default, handler: { _ in self.choosePhotoFromLibrary() })
        alert.addAction(actLibrary)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed(_ sender: UIButton){
        guard let img = self.image else { return }
        guard let text = postText.text else { return }
        let post = Posts(user: Stories(name: "Koko", image: "1"), postImage: img, postText: text)
        
        Post.sharedInstance.arr.append(post)
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func choosePhotoFromLibrary() {
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            pickerController.sourceType = .camera
            pickerController.delegate = self
            pickerController.allowsEditing = true
            present(pickerController, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Ошибка", message: "Нету камеры", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
                                [UIImagePickerController.InfoKey : Any]) {
        image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        if let theImage = image {
            show(image: theImage)
        }
        dismiss(animated: true, completion: nil)
    }
    func show(image: UIImage) {
       
        postImage.setImage(image, for: .normal)
        self.image = image
        
    }
    
    private func setupViews(){
        [textLabel, postImage, postText, saveButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        postImage.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 342).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 342).isActive = true
        postImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 30).isActive = true
        postText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        postText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 36).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 45).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 73).isActive = true
       
    }

    

}
