//
//  SuggestionsView.swift
//  AutoLayoutTusk
//
//  Created by user on 07.07.2021.
//

import UIKit

class SuggestionsView: UIView {
    
    let lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let avatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "autorIcon")
        return imageView
    }()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "sfdsfs"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "dsfsfsd"
        label.numberOfLines = 2
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    let followButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
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
        self.backgroundColor = .white
        setupLineView()
        setupAvatarImageView()
        setupFollowButton()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    private func setupLineView() {
        self.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                        ])
    }
    
    private func setupAvatarImageView() {
        self.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50)
            
        ])

    }
    private func setupFollowButton() {
        self.addSubview(followButton)
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            followButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            followButton.widthAnchor.constraint(equalToConstant: 80),
            followButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -20),
            
        ])
    }
    
    private func setupDescriptionLabel() {
        self.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -20),
            
        ])
    }
    
    func isFollowing (status: Bool) {
        if status {
            followButton.setTitle("Following", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .orange
            followButton.layer.borderColor = UIColor.white.cgColor

        }
        else {
            followButton.setTitle("Follow", for: .normal)
            followButton.setTitleColor(.orange, for: .normal)
            followButton.backgroundColor = .white
            followButton.layer.borderColor = UIColor.orange.cgColor
        }
    }
    
  
}
