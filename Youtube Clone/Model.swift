//
//  Model.swift
//  Youtube Clone
//
//  Created by tsaqifammar on 15/03/21.
//

import Foundation

class Model {
    
    func getVideos() {
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { ( data, response, error) in
            
            if error != nil || data == nil {
                return
            }
        }
        
        dataTask.resume()
    }
}
