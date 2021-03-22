//
//  Model.swift
//  Youtube Clone
//
//  Created by tsaqifammar on 15/03/21.
//
import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
    
}

class Model {
    
    var delegate: ModelDelegate?
  //buat fungsi untuk ngambil data dari Youtube API
  func getVideos() {
    // simpan url ke dalam variabel
    let url = URL (string: Constants.API_URL)
    
    // cek urlnya kosong apa engga?
    guard url != nil else {
      return
    }
    // Mendapatkan URLSession dari object
    let session = URLSession.shared
    
    // mendapatkan data dari URLSession
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      // cek apakah ada error?
      if error != nil || data == nil {
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Response.self, from: data!)
        
        if response.items != nil {
            DispatchQueue.main.async {
                self.delegate?.videosFetched(response.items!)
            }
        }
        
        dump(response)
      }
      catch{
        
      }
      
    }
    // melanjutkan Task
    dataTask.resume()
  }
}
