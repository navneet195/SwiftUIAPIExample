//
//  ArticlesViewModel.swift
//  SwiftUIDemo
//
//  Created by Navneet on 14/11/19.
//  Copyright © 2019 Navneet Baldha. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class ArticlesViewModel: ObservableObject {
    
    // Mark - Artice View Model ObsevebleObject
    let didChange = PassthroughSubject<Void, Never>()
    @Published var articleModel = [ArticelObjectModel]() {
        didSet { didChange.send() }
    }
    init()
    {
        // Mark - Webservice load funcation
        loadArticles()
    }
    private func loadArticles() {
        Webservice().getAllArticles{ article in
            DispatchQueue.main.async {
                // Mark - getter and setter call for ArticelObjectModel
                self.articleModel = article.map(ArticelObjectModel.init)
            }
        }
    }
}

// Mark - ArticelObjectModel data parsing
struct ArticelObjectModel {
    var article: ArticleDataModel
    init(article: ArticleDataModel)
    {
        self.article = article
    }
    var byline: String {
        
        return "Owner \(self.article.byline!)"
    }
    var created_date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssHHZ"
        let date  = formatter.date(from:self.article.created_date! as String)
        return "Created by - \(timeAgoSince(date!))"
    }
    
    var section: String {
        return self.article.section!
    }
    
    var title: String {
        return self.article.title!
    }
    
    var abstract: String {
        return self.article.abstract!
    }
    
    var imageURL: String {
        return (self.article.multimedia?.first?.url)!
    }
    
    var iconImage: UIImage {
             return  ImageStore.shared.image(name:((self.article.multimedia?.first?.url!)!))
    }
    var bgImage: UIImage {
            return  ImageStore.shared.image(name:((self.article.multimedia?.last?.url!)!))
    }
}

