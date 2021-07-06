//
//  ToDoViewController.swift
//  AutoLayoutTusk
//
//  Created by user on 02.07.2021.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let headerView : UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let taskTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        let whitePlaceholderText = NSAttributedString(string: "Tap to add task", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.attributedPlaceholder = whitePlaceholderText
        return textField
    }()
    
    let categoryTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CaregoryCell.self, forCellReuseIdentifier: "ToDoTableViewCell")
        tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    var categoryes = [Category]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryes = fetchCategory()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        setupHeaderView ()
        setupTaskTextField()
        setupCategoryTableVIew()
    }
    
    private func setupHeaderView(){
        view.addSubview(headerView)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 62),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),            
        ])
        
        headerView.layer.cornerRadius = 20

    }
    
    private func setupTaskTextField() {
        headerView.addSubview(taskTextField)

        NSLayoutConstraint.activate([
            taskTextField.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -18),
            taskTextField.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 18),
            taskTextField.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            taskTextField.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            
        ])
    }
    
    private func setupCategoryTableVIew() {
        view.insertSubview(categoryTableView, belowSubview: headerView)
        
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            
        ])
        
    }
    
    func fetchCategory () -> [Category] {

        let category1 = Category(title: "Today", count: "\(Int.random(in: 0...10))", color: .random)
        let category2 = Category(title: "Tomorrow", count: "\(Int.random(in: 0...10))", color: .random)
        let category3 = Category(title: "Soon", count: "\(Int.random(in: 0...10))", color: .random)
        let category4 = Category(title: "Things", count: "\(Int.random(in: 0...10))", color: .random)
        let category5 = Category(title: "Croceries", count: "\(Int.random(in: 0...10))", color: .random)
        let category6 = Category(title: "Home", count: "\(Int.random(in: 0...10))", color: .random)
        let category7 = Category(title: "Ideas", count: "\(Int.random(in: 0...10))", color: .random)
        let category8 = Category(title: "To buy", count: "\(Int.random(in: 0...10))", color: .random)
        return [category1, category2, category3, category4, category5, category6, category7, category8]
    }
    
}
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! CaregoryCell
        
        let category = categoryes[indexPath.row]
        cell.set(category: category)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = TaskViewController()
        let category = categoryes[indexPath.row]
        vc.color = category.color
        vc.category = category.title
        self.show(vc, sender: self)
        
    }

}
extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
