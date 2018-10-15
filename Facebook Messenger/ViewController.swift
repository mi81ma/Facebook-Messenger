//
//  ViewController.swift
//  Facebook Messenger
//
//  Created by masato on 15/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit





class FriendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellID = "cellId"

    override func viewDidLoad() {

        view.translatesAutoresizingMaskIntoConstraints = false

        super.viewDidLoad()

        navigationItem.title = "Recent"

        collectionView?.backgroundColor = UIColor.red
        collectionView?.alwaysBounceVertical = true

        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellID)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)

    }

    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}


class FriendCell: BaseCell {

    var profileImageView: UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }

    var dividerLineView: UIView {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }

    var nameLabel: UILabel {
        let label = UILabel()
        label.text = "Mark Zuckerberg"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }

    var messageLabel: UILabel {
        let label = UILabel()
        label.text = "Your friend's message and something else..."
        return label
    }

    var timeLabel: UILabel {
        let label = UILabel()
        label.text = "12:05 pm"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }

    var hasReadImageView: UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }


    override func setupViews() {

        addSubview(profileImageView)
        addSubview(dividerLineView)

        profileImageView.image = #imageLiteral(resourceName: "Zuckerberg-1")
        hasReadImageView.image = #imageLiteral(resourceName: "Zuckerberg-1")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        addConstraintsWithFormat("H:|-12-[v0(68)]", views: profileImageView)
        addConstraintsWithFormat("V:|-12-[v0(68)]", views: profileImageView)

        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

        addConstraintsWithFormat("H:|-82-[v0]|", views: dividerLineView)
        addConstraintsWithFormat("V:|-82-[v0]|", views: dividerLineView)

    }

    private func setupContainerView() {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        addConstraintsWithFormat("H: |-90-[v0]|", views: containerView)
        addConstraintsWithFormat("H: [v0(50)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(hasReadImageView)

        containerView.addConstraintsWithFormat("H:|[v0][v1(08)]|", views: nameLabel, timeLabel)

        containerView.addConstraintsWithFormat("V:|[v0][v1(24)]|", views: nameLabel, nameLabel)

        containerView.addConstraintsWithFormat("H:|[v0]-12-|", views: messageLabel)

        containerView.addConstraintsWithFormat("V:|[v0(24)]", views: timeLabel)

        containerView.addConstraintsWithFormat("V: |[v0(24)]|", views: hasReadImageView)
    }
}


/*
 Extention for "addConstraintsWithFormat("H:|-82-[v0]|", views: dividerLineView)"
 */
extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


class BaseCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        backgroundColor = UIColor.blue
    }
}

