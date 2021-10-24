//
//  ProfileCell.swift
//  Instagram
//
//  Created by Media Davarkhah on 6/28/1400 AP.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    //MARK: -Properties
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "venom-7")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    //MARK: -LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubview(postImageView)
        postImageView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Helpers
    
    
}
