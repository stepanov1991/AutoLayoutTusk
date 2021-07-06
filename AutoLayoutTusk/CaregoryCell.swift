//
//  ToDoTableViewCell.swift
//  AutoLayoutTusk
//
//  Created by user on 05.07.2021.
//

import UIKit

class CaregoryCell: UITableViewCell {
    
    let cellView : UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    let titleLabel : UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let messageCountLabel : UILabel = {
    let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.cornerRadius = 10
        return label
        }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        setupCellView()
        setupMessageCountLabel()
        setupTitleLabel()


    }
    private func setupCellView() {
        contentView.addSubview(cellView)

               
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        
        ])
        
       
    }
    
    func set(category: Category)  {
        titleLabel.text = category.title
        messageCountLabel.text = category.count
        cellView.backgroundColor = category.color
        messageCountLabel.textColor = category.color
    }
    
    private func setupTitleLabel() {
        cellView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
       
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 18),
            titleLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -18),
            titleLabel.trailingAnchor.constraint(equalTo: messageCountLabel.leadingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 26)
            
        ])
    }
    
    private func setupMessageCountLabel() {
        cellView.addSubview(messageCountLabel)

        NSLayoutConstraint.activate([
            
            messageCountLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            messageCountLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -19),
            messageCountLabel.widthAnchor.constraint(equalToConstant: 30),
            messageCountLabel.heightAnchor.constraint(equalToConstant: 24)
            
        ])

    }
}
