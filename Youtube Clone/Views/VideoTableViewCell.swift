//
//  VideoTableViewCell.swift
//  Youtube Clone
//
//  Created by tsaqifammar on 18/03/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var thumbnaillimageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCcell(_ v:Video){
        
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        self .titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            self.thumbnaillimageView.image = UIImage(data: cacheData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, Response, error) in
             
            if error == nil && data != nil {
                
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnaillimageView.image = image
                }
    
            }
            
        }
        
        dataTask.resume()
    }

}
