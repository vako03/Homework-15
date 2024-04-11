//
//  PolarVC.swift
//  Homework 15
//
//  Created by vako on 10.04.24.
//
import UIKit

class PolarVC: UIViewController {
    
    var backgroundImageView: UIImageView!
    var selectedPolarZodiac: Zodiac?
    
    let polarZodiacImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let zodiacName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let redButton: UIButton = {
        let button = UIButton()
        button.setTitle("წითელი", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("ლურჯი", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        setupBackgroundImageView()
        addAttributes()
        
        if let zodiac = selectedPolarZodiac {
            polarZodiacImage.image = UIImage(named: zodiac.iconName)
            zodiacName.text = zodiac.name
        }
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
    
    func addAttributes(){
        
        polarZodiacImage.widthAnchor.constraint(equalToConstant: 156).isActive = true
        polarZodiacImage.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        let verticalStackView = UIStackView(arrangedSubviews: [polarZodiacImage, zodiacName])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 1
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.alignment = .center
        
        let buttonsStackView = UIStackView(arrangedSubviews: [blueButton, redButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 32
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        blueButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        redButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        let mainStackView = UIStackView(arrangedSubviews: [verticalStackView, buttonsStackView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 135
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14)
        ])
    }
    
    
}
