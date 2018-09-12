//
//  SubRedditTableViewCell.swift
//  ReditC2.0
//
//  Created by DevMountain on 9/12/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class SubRedditTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var redditImageView: UIImageView!
    
    var subreddit: TRASubreddit?{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        guard let subreddit = subreddit else {return}
        titleLabel.text = subreddit.title
        likesCountLabel.text = "Likes: \(subreddit.likeCount)"
        commentsLabel.text = "Comments: \(subreddit.commentCount)"
        redditImageView.image = subreddit.photo
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        redditImageView.image = nil
    }
}
