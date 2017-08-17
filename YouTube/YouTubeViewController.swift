//
//  ViewController.swift
//  YouTube
//
//  Created by Taymoor Khan on 7/27/17.
//  Copyright © 2017 Taymoor Khan. All rights reserved.
//

import UIKit
class NavigationController: UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}

class YouTubeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        let width:CGFloat
        if let navWidth = navigationController?.navigationBar.bounds.width {
            width = navWidth - 32
        } else {
            width = 288
        }
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "Home"
        
        navigationItem.titleView = titleLabel
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(YouTubeFeedCell.self, forCellWithReuseIdentifier: "FeedCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = thumbnailWidth()
        return CGSize(width: view.bounds.width, height: 16+(width*0.526)+8+44+8)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func thumbnailWidth() -> CGFloat {
        var width:CGFloat = 0
        width = view.bounds.width-32
        return width
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}

class YouTubeFeedCell: UICollectionViewCell {
    let thumbnailView:UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = UIColor.orange
        imageView.image = UIImage(named: "VideoImage.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = UIColor.red
        imageview.image = UIImage(named: "AdeleProfile.jpeg")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.layer.cornerRadius = 22
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailsTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.contentMode = .topLeft
        textView.textColor = UIColor.lightGray
        textView.text = "Taylor Swift - 1,6435,986 views - 2 years"
        return textView
    }()
    
    let separatorView:UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor.lightGray
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(thumbnailView)
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailsTextView)
        contentView.addSubview(separatorView)
        setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviewsConstraints() {
        thumbnailView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        thumbnailView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32).isActive = true
        thumbnailView.heightAnchor.constraint(equalTo: thumbnailView.widthAnchor, multiplier: 0.5).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: thumbnailView.leftAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor, constant: 8).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        detailsTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        detailsTextView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        detailsTextView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        detailsTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
