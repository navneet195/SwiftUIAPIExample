//
//  ArticelView.swift
//  SwiftUIAPIExample
//
//  Created by Navnit Baldha on 17/11/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import SwiftUI
import Combine

struct ArticelView: View {
    
    // Mark - ViewModel Observer Object
    @ObservedObject var coureseVM = ArticlesViewModel()
    
    var body: some View {
        NavigationView {
            List(self.coureseVM.articleModel, id: \.byline) { article in
                HStack {
                    NavigationLink (
                        destination: DetailView(articleModel: article)
                        )
                    {
                        // Mark - thumb image
                        Image(uiImage: article.iconImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:100, height:100)
                            .border(Color.gray.opacity(0.5))
                            .cornerRadius(50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .shadow(radius: 5)
                        
                        VStack(alignment: .leading)
                        {
                            Text(verbatim: article.title) .font(.headline)
                                .padding(.leading, 10)
                                .padding(.top, 5)
                            
                            Text(verbatim: article.byline) .font(.footnote)
                                .padding(.top, 5)
                                .padding(.leading, 10).foregroundColor(.gray)
                            
                            Text(verbatim: article.created_date) .font(.footnote)
                                .padding(.top, 5)
                                .padding(.leading, 10).foregroundColor(.gray)
                        }
                    }
                }
            } .navigationBarTitle(Text("Articles"))
        }
    }
}


struct ArticelView_Previews: PreviewProvider {
    static var previews: some View {
        ArticelView()
    }
}


