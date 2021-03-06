//
//  HeaderView.swift
//  AutoLayoutTusk
//
//  Created by user on 07.07.2021.
//

import UIKit

class HeaderView: UIView {
    
    let sourceIconImageView : UIImageView = {
     let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "flowerIcon")
        return image
    }()
    
    let sourceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "N.U. Agrar GmbH - Grunes Info"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    override init(frame: CGRect) {
     super.init(frame: frame)
     configureUI()
    }

    required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setupSourceIconImageView()
        setupSourceLabel()
        setupLineView()
    }
    
    private func setupSourceIconImageView() {
        self.addSubview(sourceIconImageView)
        NSLayoutConstraint.activate([
            sourceIconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            sourceIconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            sourceIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            sourceIconImageView.widthAnchor.constraint(equalToConstant: 50),
            sourceIconImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSourceLabel() {
        self.addSubview(sourceLabel)
        NSLayoutConstraint.activate([
            sourceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            sourceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            sourceLabel.leadingAnchor.constraint(equalTo: sourceIconImageView.trailingAnchor, constant: 20)
        ])
    }
    
    private func setupLineView() {
        self.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
                        ])
    }
 
}
