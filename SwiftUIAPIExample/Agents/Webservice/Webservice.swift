/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import Foundation
import CoreLocation
import SwiftUI
import Combine

class Webservice
{
    // Mark - API Call
    func getAllArticles(completion: @escaping([ArticleDataModel]) ->())
    {
        let baseURL = URL(string: Constants.apiUrl + Constants.versionApi + appSecretKey)!
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  return }
            do{
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model:[ArticleDataModel] = try decoder.decode(ResponseModel.self, from:
                    dataResponse).results //Decode JSON Response Data
                DispatchQueue.main.async {
                   completion(model)
                }
              
            } catch _ {
           }
        }
        task.resume()
    }
}





