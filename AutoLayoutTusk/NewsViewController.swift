//
//  SecondViewController.swift
//  AutoLayoutTusk
//
//  Created by user on 02.07.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    var suggestions = [SuggestionModel]()
    
    let headerView : HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Mulchsaat, Strip Till, Direktsaat - was spart merh Wasser?"
        return label
    }()
    
    let titleSourceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Mulchsaat, Strip Till, Direktsaat"
        label.textColor = .darkGray
        return label
    }()
    
    let autorView : AutorView = {
        let view = AutorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cornFieldImage")
        return imageView
    }()
    
    let newsTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = Array(repeating: "Bla bla bla bla ", count: 100).joined()
        return label
    }()
    
    let adView : AdView = {
        let view = AdView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    let suggestionsView0 : SuggestionsView = {
        let view = SuggestionsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let suggestionsView1 : SuggestionsView = {
        let view = SuggestionsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.avatarImageView.layer.masksToBounds = false
        view.avatarImageView.layer.cornerRadius = 25
        view.avatarImageView.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuggestion()
        configureUI()
    }
    
    func fetchSuggestion() {
        let suggestion0 = SuggestionModel(avatarName: "dlgIcon", title: "Deutsche Landwirtschafts Gesellschaft", description: "Run by Richard Ballard and his business partners", folowStatus: true)
        let suggestion1  = SuggestionModel(avatarName: "autorIcon", title: "Raimund Kunze", description: "Run by Richard Ballard and his business partners", folowStatus: false)
        suggestions.append(suggestion0)
        suggestions.append(suggestion1)
    }
    
    private func configureUI() {
        navigationController?.isNavigationBarHidden = true
        setupHeaderView()
        setupScrollView()
        setupContentView()
        setupTitleLabel()
        setupTitleSourceLabel()
        setupAutorView()
        setupNewsImageView()
        setupNewsTextLabel()
        setupAdView()
        setupSuggestionView0()
        setupSuggestionView1()
    }
    
    private func setupHeaderView() {
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
        ])
    }
    
    private func setupTitleSourceLabel() {
        contentView.addSubview(titleSourceLabel)
        NSLayoutConstraint.activate([
            titleSourceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleSourceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleSourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupAutorView() {
        contentView.addSubview(autorView)
        NSLayoutConstraint.activate([
            autorView.topAnchor.constraint(equalTo: titleSourceLabel.bottomAnchor, constant: 20),
            autorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            autorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupNewsImageView(){
        contentView.addSubview(newsImageView)
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: autorView.bottomAnchor, constant: 80),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupNewsTextLabel() {
        contentView.addSubview(newsTextLabel)
        NSLayoutConstraint.activate([
            newsTextLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20),
            newsTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    private func setupAdView() {
        contentView.addSubview(adView)
        NSLayoutConstraint.activate([
            adView.topAnchor.constraint(equalTo: newsTextLabel.bottomAnchor, constant: 20),
            adView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            adView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
    }
    private func setupSuggestionView0() {
        contentView.addSubview(suggestionsView0)
        NSLayoutConstraint.activate([
            suggestionsView0.topAnchor.constraint(equalTo: adView.bottomAnchor, constant: 30),
            suggestionsView0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            suggestionsView0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            suggestionsView0.heightAnchor.constraint(equalToConstant: 100)
        ])
        let suggestion = suggestions[0]
        suggestionsView0.getSuggestion(suggestion: suggestion)
    }
    
    private func setupSuggestionView1() {
        contentView.addSubview(suggestionsView1)
        NSLayoutConstraint.activate([
            suggestionsView1.topAnchor.constraint(equalTo: suggestionsView0.bottomAnchor),
            suggestionsView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            suggestionsView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            suggestionsView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80)
        ])
        let suggestion = suggestions[1]
        suggestionsView1.getSuggestion(suggestion: suggestion)
    }
    
}
