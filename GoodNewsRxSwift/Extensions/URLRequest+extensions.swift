//
//  URLRequest+extensions.swift
//  GoodNewsRxSwift
//
//  Created by mohamed  habib on 05/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct Ressource<T: Decodable> {
    
    let url: URL
}

extension URLRequest {
    
    static func load<T>(ressource: Ressource<T>) -> Observable<T?> {
        
        return Observable.from([ressource.url])
            .flatMap { url -> Observable<Data> in
            
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            
        }.map { data -> T? in
            return try? JSONDecoder().decode(T.self, from: data)
        }.asObservable() 
    }
}
