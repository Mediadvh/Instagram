//
//  FeedCell.swift
//  InstagramFirestoeTutorial
//
//  Created by Media Davarkhah on 4/19/1400 AP.
//

import UIKit
class FeedCell:UICollectionViewCell{
    // MARK: -Properties
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = #imageLiteral(resourceName: "venom-7")
        return imageView
    }()
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = #imageLiteral(resourceName: "venom-7")
        return imageView
    }()
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        button.tintColor = . black
        return button
    }()
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.tintColor = . black
        return button
    }()
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        button.tintColor = . black
        return button
    }()
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 Like"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Venom"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    private let dateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2 days ago", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    // MARK: -LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(
            top: topAnchor
            , left: leftAnchor
            , paddingTop: 12
            , paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(
            inView: profileImageView
            ,leftAnchor:profileImageView.rightAnchor
            , paddingLeft: 10)
        addSubview(postImageView)
        postImageView.anchor(
            top: profileImageView.bottomAnchor
           ,paddingTop: 10)
        postImageView.setDimensions(
            height: frame.width
            ,width: frame.width)
        
        configureButtons()
        
        addSubview(likeLabel)
        likeLabel.anchor(
            top: likeButton.bottomAnchor
            ,left: leftAnchor
            , paddingTop: 8
            ,paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(
            top: likeLabel.bottomAnchor
            ,left: leftAnchor
            ,paddingTop: 8
            ,paddingLeft: 8)
        
        addSubview(dateButton)
        dateButton.anchor(
            top: captionLabel.bottomAnchor
            ,left: leftAnchor
            ,paddingTop: 8
            ,paddingLeft: 8)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Actions
    @objc func didTapUsername() {
        print("DEBUG: Did tap user name")
    }
    
    // MARK: -Helpers
    func configureButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
}

