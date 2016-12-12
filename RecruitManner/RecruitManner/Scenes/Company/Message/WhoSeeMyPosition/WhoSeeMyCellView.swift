//
//  WhoSeeMyCellView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/12.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

class WhoSeeMyCellView: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var fristLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tagBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    struct ViewModel {
        var logoImage: String?
        var name: String?
        var describe: String?
        var time: Date?
        var tabImage: String?
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var viewModel: ViewModel? {
        didSet {
            self.fristLabel.text = viewModel?.name
            self.secondLabel.text = viewModel?.describe
            self.timeLabel.text = (viewModel?.time == nil) ? "" : dateFormatter.string(from: (viewModel?.time)!)
            if let urlstring = viewModel?.logoImage, let url = URL(string: urlstring) {
                self.logoImageView.sd_setImageWithPreviousCachedImage(with: url,
                                                                      placeholderImage: UIImage(named: "social_logo"),
                                                                      options: .continueInBackground,
                                                                      progress: nil,
                                                                      completed: nil)
            }
            
            let tagImage = UIImage(color: .clear)
            if let urlstring = viewModel?.tabImage, let url = URL(string: urlstring) {
                self.tagBtn.sd_setBackgroundImage(with: url,
                                                  for: .normal,
                                                  placeholderImage: tagImage,
                                                  options: .continueInBackground,
                                                  completed: nil)
            }
        }
    }

}
