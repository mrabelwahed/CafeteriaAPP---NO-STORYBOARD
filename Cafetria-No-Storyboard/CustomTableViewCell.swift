//
//  CustomTableViewCell.swift
//  Cafetria-No-Storyboard
//
//  Created by MahmoudRamadan on 4/15/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var nameLabel:UILabel!
    var ratingLabel:UILabel!
    var heartImageView: UIImageView!
    
    let padding: CGFloat = 8
    let imageHeight : CGFloat = 16
    let imageWidth: CGFloat = 16
    let nameLabelHeight : CGFloat =  16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //name label
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font =  UIFont.systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)
        // rating label
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font =  UIFont.systemFont(ofSize: 12)
        contentView.addSubview(ratingLabel)
        //imageview

        heartImageView = UIImageView()
        heartImageView.image = UIImage(named: "love")
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        contentView.addSubview(heartImageView)
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for cafe: Cafteria){
        nameLabel.text = cafe.name
        ratingLabel.text = "Rating: \(getRatingString(cafe.rating))"
    }
    
    func toggleHeart(for isFavorite:Bool){
        heartImageView.isHidden = !isFavorite
    }
    
    func getRatingString(_ rate : CafteriaRating) ->  String{
        switch rate {
        case .bad:
            return "BAD"
        case .good:
            return "GOOD"
        case .terrible:
            return "TERRIBLE"
        case .great:
            return "GREAT"
        case .moderate:
            return "MODERATE"

        }
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: padding+5)
            
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ratingLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heartImageView.widthAnchor.constraint(equalToConstant: imageWidth),
            heartImageView.heightAnchor.constraint(equalToConstant :imageHeight)
        ])
    }
    
    
}
