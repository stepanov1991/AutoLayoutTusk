//
//  TuskCell.swift
//  AutoLayoutTusk
//
//  Created by user on 05.07.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    
    let cellView : UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let taskLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let statusButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureUI(){
        setupCellView()
        setupStatusButton()
        setupTaskLabel()
    }
    
    private func setupCellView() {
        contentView.addSubview(cellView)

        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
        
        ])
        
     
    }
    
    private func setupStatusButton() {
        cellView.addSubview(statusButton)

        NSLayoutConstraint.activate([
            statusButton.widthAnchor.constraint(equalToConstant: 24),
            statusButton.heightAnchor.constraint(equalToConstant: 24),
            statusButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            statusButton.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 17)
            
        ])
        statusButton.setImage(UIImage(systemName: "circle"), for: .normal)
    }
    
    private func setupTaskLabel() {
        cellView.addSubview(taskLabel)

        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 21),
            taskLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -21),
            taskLabel.leadingAnchor.constraint(equalTo: statusButton.trailingAnchor, constant: 16),
            taskLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16)
            
        ])
        
        
        
    }
    

}
