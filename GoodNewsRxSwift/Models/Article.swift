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
struct Article : Decodable{
    let title : String
    let description : String
   // let source : Source
    
}
struct Source : Decodable{
    let name : String
}
