//
//  Article.swift
//  GoodNewsRxSwift
//
//  Created by mohamed  habib on 05/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

struct ArticleList : Decodable {
    let articles : [Article]
}

extension ArticleList {
    
    static var all: Ressource<ArticleList> = {
       let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-20-07&sortBy=publishedAt&apiKey=eb10f138ce4c4fa7b4187ddefc69bb67")!
        return Ressource(url: url)
    }()
}

struct Article : Decodable{
    let title : String
    let description : String
   // let source : Source
    
}
struct Source : Decodable{
    let name : String
}
