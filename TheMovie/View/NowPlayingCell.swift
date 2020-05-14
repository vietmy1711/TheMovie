//
//  NowPlayingCell.swift
//  TheMovie
//
//  Created by MM on 5/14/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class NowPlayingCell: UITableViewCell {
    
    var result: Results?
    
    let vwInside = UIView()
    
    let lblTitle = UILabel()
    let lblReleaseDateLarge = UILabel()
    let lblReleaseDate = UILabel()
    let lblVoteAverageLarge = UILabel()
    let lblVoteAverage = UILabel()
    let lblOverview = UILabel()
    
    let imgPoster = UIImageView()
    
    let stackView = UIStackView()
    let innerStackView = UIStackView()
    let releaseDateStackView = UIStackView()
    let voteAverageStackView = UIStackView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCellWithObject(obj: Results?) {
        guard let obj = obj else { return }
        lblTitle.text = obj.title
        lblReleaseDate.text = obj.release_date
        lblVoteAverage.text = String(obj.vote_average)
        lblOverview.text = obj.overview
        //        let url = URL(string: )
        //        let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //        DispatchQueue.main.async {
        //            self.imgPoster.image = UIImage(data: data!)
        //        }
        imgPoster.downloaded(from: "https://image.tmdb.org/t/p/w185\(obj.poster_path)")
    }
    
    func setupCell() {
        lblTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .left
        
        lblReleaseDateLarge.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        lblReleaseDateLarge.text = "Release Date:"
        lblReleaseDateLarge.numberOfLines = 0
        lblReleaseDateLarge.textAlignment = .left
        
        lblReleaseDate.font = UIFont(name: "HelveticaNeue", size: 14)
        lblReleaseDate.numberOfLines = 0
        lblReleaseDate.textAlignment = .left
        
        lblVoteAverageLarge.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        lblVoteAverageLarge.text = "Vote Average:"
        lblVoteAverageLarge.numberOfLines = 0
        lblVoteAverageLarge.textAlignment = .left
        
        lblVoteAverage.font = UIFont(name: "HelveticaNeue", size: 14)
        lblVoteAverage.numberOfLines = 0
        lblVoteAverage.textAlignment = .left
        
        lblOverview.font = UIFont(name: "HelveticaNeue", size: 12)
        lblOverview.textColor = .gray
        lblOverview.numberOfLines = 5
        lblOverview.textAlignment = .left
        
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblReleaseDate.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        imgPoster.translatesAutoresizingMaskIntoConstraints = false
        vwInside.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(vwInside)
        vwInside.addSubview(stackView)

        contentView.backgroundColor = UIColor(red: 0.08, green: 0.12, blue: 0.12, alpha: 0.10)
        vwInside.backgroundColor = .white
        vwInside.layer.cornerRadius = 12
        
        vwInside.layer.shadowColor = UIColor.black.cgColor
        vwInside.layer.shadowOpacity = 0.8
        vwInside.layer.shadowOffset = .zero
        vwInside.layer.shadowRadius = 2
                
        stackView.addArrangedSubview(imgPoster)
        stackView.addArrangedSubview(innerStackView)
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 6
        
        innerStackView.axis = .vertical
        innerStackView.spacing = 8
        innerStackView.addArrangedSubview(lblTitle)
        innerStackView.addArrangedSubview(releaseDateStackView)
        innerStackView.addArrangedSubview(voteAverageStackView)
        innerStackView.addArrangedSubview(lblOverview)
        
        releaseDateStackView.addArrangedSubview(lblReleaseDateLarge)
        releaseDateStackView.addArrangedSubview(lblReleaseDate)

        voteAverageStackView.addArrangedSubview(lblVoteAverageLarge)
        voteAverageStackView.addArrangedSubview(lblVoteAverage)
        
        vwInside.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        vwInside.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
        vwInside.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6).isActive = true
        vwInside.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6).isActive = true
        
        let cts = stackView.topAnchor.constraint(equalTo: vwInside.topAnchor, constant: 0)
        cts.priority = UILayoutPriority(rawValue: 750)
        cts.isActive = true
        //stackView.topAnchor.constraint(equalTo: vwInside.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: vwInside.bottomAnchor, constant: 0).isActive = true
        stackView.leftAnchor.constraint(equalTo: vwInside.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: vwInside.rightAnchor, constant: 0).isActive = true

        imgPoster.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imgPoster.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
//        imgPoster.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
//        imgPoster.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
//        imgPoster.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
//        imgPoster.rightAnchor.constraint(equalTo: innerStackView.leftAnchor
//            , constant: 0).isActive = true
        
        innerStackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 18).isActive = true
 
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
