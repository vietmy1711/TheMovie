//
//  ViewController.swift
//  TheMovie
//
//  Created by MM on 5/14/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var nowPlayingManager = NowPlayingManager()
    var nowPlaying: NowPlaying?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nowPlayingManager.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200;
        nowPlayingManager.fetchNowPlaying()
        
        setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = "Now Playing"
        view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "NowPlayingCell", bundle: nil), forCellReuseIdentifier: "NowPlayingCell")
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let nowPlayingList = nowPlaying {
            return nowPlayingList.results.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingCell", for: indexPath) as! NowPlayingCell
        //cell.result = nowPlaying?.results[indexPath.row]
        cell.configCellWithObject(obj: nowPlaying?.results[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.movieId = nowPlaying?.results[indexPath.row].id
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: NowPlayingManagerDelegate {
    func didUpdateNowPlaying(_ nowPlayingManager: NowPlayingManager, _ nowPlayingModel: NowPlaying) {
        nowPlaying = nowPlayingModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}


