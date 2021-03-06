//
//  SubRedditTableViewController.swift
//  ReditC2.0
//
//  Created by DevMountain on 9/12/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class SubRedditTableViewController: UITableViewController {

    @IBOutlet weak var redditSearchBar: UISearchBar!
    
    var subreddits: [TRASubreddit]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditSearchBar.delegate = self
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subreddits?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subredditCell", for: indexPath) as? SubRedditTableViewCell
        let subreddit = subreddits?[indexPath.row]
        cell?.subreddit = subreddit
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension SubRedditTableViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text else {return}
        let dispatchGroup = DispatchGroup()
        //dispatch_group_t group = dispatch_group_create()
        self.title = searchText
        dispatchGroup.enter()
        TRASubredditClient.fetchAllSubReddits(forTitle: searchText) { (subreddits) in
            guard let subreddits = subreddits else {return}
            self.subreddits = subreddits
            for subreddit in subreddits{
                dispatchGroup.enter()
                TRASubredditClient.fetchImageData(forURL: subreddit.imageUrlString, with: { (data) in
                    guard let data = data else {return}
                    let subredditPhoto = UIImage(data: data)
                    subreddit.photo = subredditPhoto
                    dispatchGroup.leave()
                })
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
}
