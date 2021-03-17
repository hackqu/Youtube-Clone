//
//  ViewController.swift
//  Youtube Clone
//
//  Created by tsaqifammar on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
     
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        // Do any additional setup after loading the view.
        model.getVideos()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
    }
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }

   
}

