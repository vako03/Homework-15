//
//  ViewController.swift
//  Homework 15
//
//  Created by vako on 10.04.24.
//

import UIKit

class FirstVC: UIViewController {
    
    var zodiacs: [Zodiac] = []
    var backgroundImageView: UIImageView!
    
    let mainText: UILabel = {
        let label = UILabel()
        label.text = "მიშა ცაგარელის ჰაბი"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionText: UITextView = {
        let textView = UITextView()
        textView.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        textView.textColor = .gray
        textView.font = UIFont.systemFont(ofSize: 16, weight: .light)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.clear
        return textView
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
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: მაშვილდოსანი", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
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
        zodiacs = Zodiac.setupZodiacData()
        
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            if let zodiacName = self?.zodiacTextField.text {
                if let selectedZodiac = self?.zodiacs.first(where: { $0.name == zodiacName }) {
                    self?.navigateToDescriptionVC(zodiac: selectedZodiac)
                } else {
                    let alert = UIAlertController(title: "ოღონდაცარააა", message: "შეიყვანე სწორი ზოდიაქო.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }
            }
        }), for: .touchUpInside)
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
    
    func navigateToDescriptionVC(zodiac: Zodiac) {
        let descriptionVC = DescriptionVC()
        descriptionVC.selectedZodiac = zodiac
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    func setupMainText() {
        view.addSubview(mainText)
        view.addSubview(descriptionText)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(zodiacName)
        stackView.addArrangedSubview(zodiacTextField)
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            mainText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 71),
            mainText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            mainText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 20),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 91),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            
            nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    
}
