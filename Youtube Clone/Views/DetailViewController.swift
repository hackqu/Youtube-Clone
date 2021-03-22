//
//  DetailViewController.swift
//  Youtube Clone
//
//  Created by tsaqifammar on 19/03/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else {
            return
        }
        
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        textView.text = video!.description
        
    }
}
