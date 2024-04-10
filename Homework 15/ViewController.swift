//
//  ViewController.swift
//  Homework 15
//
//  Created by vako on 10.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundImageView: UIImageView!
    
    let mainText: UILabel = {
        let label = UILabel()
        label.text = "მიშა ცაგარელის ჰაბი"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionText: UILabel = {
        let label = UILabel()
        label.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let zodiacName: UILabel = {
        let label = UILabel()
        label.text = "ზოდიაქოს სახელი"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let zodiacTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: მაშვილდოსანი", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField

    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("შემდეგ", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupBackgroundImageView()
        setupMainText()
    }
    

    func setupBackgroundImageView() {
        view.backgroundColor = UIColor(red: 30/255, green: 31/255, blue: 36/255, alpha: 1.0)

        backgroundImageView = UIImageView(image: UIImage(named: "background img"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.sendSubviewToBack(backgroundImageView)

    }
    
    func setupMainText() {
        view.addSubview(mainText)
        view.addSubview(descriptionText)
        view.addSubview(zodiacName)
        view.addSubview(zodiacTextField)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            mainText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 71),
            mainText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            mainText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 20),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            zodiacName.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 91),
            zodiacName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            zodiacName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
           
            zodiacTextField.topAnchor.constraint(equalTo: zodiacName.bottomAnchor, constant: 4),
            zodiacTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            zodiacTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            zodiacTextField.heightAnchor.constraint(equalToConstant: 44),
            
            nextButton.topAnchor.constraint(equalTo: zodiacTextField.bottomAnchor, constant: 25),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 46),

            
        ])
    }
    
    
}

