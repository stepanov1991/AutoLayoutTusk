//
//  CategoryViewController.swift
//  AutoLayoutTusk
//
//  Created by user on 05.07.2021.
//

import UIKit

class TaskViewController: UIViewController {
    
    var color :  UIColor?
    var category = ""
    
    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let addButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let settingsButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let taskTableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let taskList = ["Tusk 1", "Tusk 2", "Tusk 3", "Tusk 4", "Tusk 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        setupHeaderView()
        setupTaskTableView()
        setupAddButton()
        setupBackButton()
        setupSettingsButton()
        setupCategoryLabel()
        view.backgroundColor = .white
    }
    
    private func setupHeaderView() {
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 56)
            
        ])
    }
    
    private func setupBackButton() {
        headerView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 14),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 14)
        ])
        backButton.tintColor = color
    }
    
    private func setupCategoryLabel() {
        headerView.addSubview(categoryLabel)
        categoryLabel.text = category
        categoryLabel.textColor = color
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 25),
            categoryLabel.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 20)
        ])
    }
    
    
    private func setupAddButton() {
        headerView.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -69),
            addButton.heightAnchor.constraint(equalToConstant: 20),
            addButton.widthAnchor.constraint(equalToConstant: 20)
            
        ])
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.tintColor = color
    }
    
    private func setupSettingsButton() {
        headerView.addSubview(settingsButton)
        NSLayoutConstraint.activate([
            settingsButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -14),
            settingsButton.heightAnchor.constraint(equalToConstant: 28),
            settingsButton.widthAnchor.constraint(equalToConstant: 28)
        ])
        settingsButton.tintColor = color
        settingsButton.setImage(UIImage(systemName: "dot.circle.fill"), for: .normal)
    }
    
    private func setupTaskTableView() {
        view.addSubview(taskTableView)
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: -> TableVIew DataSource and Delegat methods

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        cell.taskLabel.text = taskList[indexPath.row]
        cell.statusButton.tintColor = color
        return cell
    }
}
