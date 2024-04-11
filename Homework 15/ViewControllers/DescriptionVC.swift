//
//  DescriptionVC.swift
//  Homework 15
//
//  Created by vako on 10.04.24.
//

import UIKit


class DescriptionVC: UIViewController {
    
    var selectedZodiac: Zodiac?
    var backgroundImageView: UIImageView!
    
    let zodiacImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sagittarius")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let zodiacName: UILabel = {
        let label = UILabel()
        label.text = "მშვილდოსანი"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let zodiacText: UITextView = {
        let textView = UITextView()
        textView.text = "პლანეტა მერკურის გავლენის ქვეშ დაბადებული ქალწულები, მოწესრიგებულობით, უზადო პასუხისმგებლობის გრძნობით და წვრილმანების მიმართ გასაოცარი ყურადღებიანობით გამოირჩევიან."
        textView.textColor = .gray
        textView.font = UIFont.systemFont(ofSize: 14, weight: .light)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = .gray
        return textView
        
    }()
    
    let polarButton: UIButton = {
        let button = UIButton()
        button.setTitle("პოლარული ნიშანი", for: .normal)
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
        
        if let zodiac = selectedZodiac {
            zodiacImage.image = UIImage(named: zodiac.iconName)
            zodiacName.text = zodiac.name
            zodiacText.text = zodiac.description
        }
        
        polarButton.addAction(UIAction(handler: { [weak self] _ in
            guard let selectedZodiac = self?.selectedZodiac else {
                return
            }
            
            let polarVC = PolarVC()
            polarVC.selectedPolarZodiac = Zodiac(name: selectedZodiac.polarSignName, description: "", iconName: selectedZodiac.polarSign, polarSign: "", polarSignName: "")
            self?.navigationController?.pushViewController(polarVC, animated: true)
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
    
    func addAttributes() {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.spacing = 1
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(zodiacImage)
        verticalStackView.addArrangedSubview(zodiacName)
        
        NSLayoutConstraint.activate([
            
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            
            zodiacImage.widthAnchor.constraint(equalToConstant: 156),
            zodiacImage.heightAnchor.constraint(equalToConstant: 156),
        ])
        
        view.addSubview(zodiacText)
        
        NSLayoutConstraint.activate([
            zodiacText.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 30),
            zodiacText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            zodiacText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
        
        view.addSubview(polarButton)
        
        NSLayoutConstraint.activate([
            polarButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -42),
            polarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            polarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            polarButton.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    
}
