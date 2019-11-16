//
//  DetailView.swift
//  SwiftUIAPIExample
//
//  Created by Navnit Baldha on 17/11/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import SwiftUI
import Combine

struct DetailView: View {
    var articleModel: ArticelObjectModel
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                // Mark - Banner image
                Image(uiImage: articleModel.bgImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .border(Color.gray.opacity(0.5))
                    .offset(x: 0, y:0)
                    .padding(.bottom, 0)
                
                Text(verbatim: articleModel.title)
                    .font(.headline)
                    .padding(.top, 5)
                
                Text(verbatim: articleModel.abstract)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .foregroundColor(.gray)
                
                Text(verbatim: articleModel.byline)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .foregroundColor(.gray)
                
                Text(verbatim:articleModel.created_date )
                    .font(.subheadline)
                    .padding(.top, 5)
                    .foregroundColor(.gray)
                
            } .navigationBarTitle(Text("Article Detail"))
                .padding()
        }
        .frame(height: 640)
        
    }
}

struct DetailView_Preview: PreviewProvider {
    static var previews: some View {
        let coureseVM = ArticlesViewModel()
        return DetailView(articleModel: coureseVM.articleModel[0])
    }
}
