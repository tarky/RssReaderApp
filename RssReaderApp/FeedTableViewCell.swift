//
//  FeedTableViewCell.swift
//  RssReaderApp
//
//  Created by Taisuke Araki on 2016/04/24.
//  Copyright © 2016年 arky. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class FeedTableViewCell: UITableViewCell {
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var desc: UILabel!
  @IBOutlet weak var thumbnailView: UIImageView!
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  let ogpApi = "http://api.hitonobetsu.com/ogp/analysis?url=";

  var link: String! {
    didSet {
      Alamofire.request(.GET, ogpApi + link).responseJSON { response in
        if let imageUrl = response.result.value?["image"] as? String {
          self.setThumbnailImageView(NSURL(string: imageUrl))
        }
      }
    }
  }
  
  func setThumbnailImageView(imageUrl: NSURL!){
    self.thumbnailView.sd_setImageWithURL(imageUrl){
      (image, error, cacheType, url)->Void in
      UIView.animateWithDuration(0.25){
        self.thumbnailView.alpha = 1
        self.indicator.stopAnimating();
      }
    }
  }

  override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }
}
