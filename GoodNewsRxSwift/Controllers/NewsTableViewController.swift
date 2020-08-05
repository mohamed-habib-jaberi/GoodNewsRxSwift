//
//  NewsTableViewController.swift
//  GoodNewsRxSwift
//
//  Created by mohamed  habib on 05/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {

    let disposeBag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }

    private func populateNews(){
        
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-20-07&sortBy=publishedAt&apiKey=eb10f138ce4c4fa7b4187ddefc69bb67")!
        
//        Observable.just(url)
//            .flatMap { (url) -> Observable<Data> in
//                let request = URLRequest(url: url)
//                return URLSession.shared.rx.data(request: request)
//        }.map { (data) -> [Article]? in
//
//            return try? JSONDecoder().decode(ArticleList.self, from: data).articles
//        }.subscribe(onNext: { [weak self] articles in
//
//            print(articles)
//
//            if let articles = articles {
//                self?.articles = articles
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            }
//
//        }).disposed(by:disposeBag)
        
        
        // Refactor code 
        let ressource = Ressource<ArticleList>(url: url)
        URLRequest.load(ressource: ressource)
            .subscribe(onNext: { [weak self] result in
                
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell does not found") }
        
        cell.titleLabel?.text = self.articles[indexPath.row].title
        cell.descriptionLabel?.text = self.articles[indexPath.row].description
        
       return cell
    }
}
