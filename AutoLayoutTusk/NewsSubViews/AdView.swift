//
//  HeaderView.swift
//  AutoLayoutTusk
//
//  Created by user on 07.07.2021.
//

import UIKit

class AdView : UIView {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Johan, we love that you would like to read this channel"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Subscribe now and get more relevant content for your farm success"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let subscribeButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Subscribe", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.backgroundColor = .black
        setupTitleLabel()
        setupDescriptionLabel()
        setupSubscribeButton()
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupDescriptionLabel() {
        self.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupSubscribeButton() {
        self.addSubview(subscribeButton)
        NSLayoutConstraint.activate([
            subscribeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            subscribeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            subscribeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            subscribeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
