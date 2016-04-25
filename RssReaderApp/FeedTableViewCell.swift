//
//  FeedTableViewCell.swift
//  RssReaderApp
//
//  Created by Taisuke Araki on 2016/04/24.
//  Copyright © 2016年 arky. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var desc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
