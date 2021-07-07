//
//  AutorView.swift
//  AutoLayoutTusk
//
//  Created by user on 07.07.2021.
//

import UIKit

class AutorView: UIView {
    
    let autorImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "autorIcon")
        return imageView
    }()
    
    let autorNameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Raimund Kunze"
        return label
    }()
    
    let publicatonTimeLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.text = "June 6 2019"
        return label
    }()
    
    override init(frame: CGRect) {
     super.init(frame: frame)
     configureUI()
    }

    required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setupAutorImageView()
        setupAutorNameLabel()
        setupPublicatonTimeLabel()
    }
    
    private func setupAutorImageView() {
        self.addSubview(autorImageView)
        NSLayoutConstraint.activate([
            autorImageView.topAnchor.constraint(equalTo: self.topAnchor),
            autorImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            autorImageView.widthAnchor.constraint(equalToConstant: 50),
            autorImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        autorImageView.layer.masksToBounds = false
        autorImageView.layer.cornerRadius = 25
        autorImageView.clipsToBounds = true
    }
    
    private func setupAutorNameLabel() {
        self.addSubview(autorNameLabel)
        NSLayoutConstraint.activate([
            autorNameLabel.bottomAnchor.constraint(equalTo: autorImageView.centerYAnchor, constant: -5),
            autorNameLabel.leadingAnchor.constraint(equalTo: autorImageView.trailingAnchor, constant: 10),
            autorNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    private func setupPublicatonTimeLabel() {
        self.addSubview(publicatonTimeLabel)
        NSLayoutConstraint.activate([
            publicatonTimeLabel.topAnchor.constraint(equalTo: autorImageView.centerYAnchor, constant: 5),
            publicatonTimeLabel.leadingAnchor.constraint(equalTo: autorImageView.trailingAnchor, constant: 10),
            publicatonTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
}
