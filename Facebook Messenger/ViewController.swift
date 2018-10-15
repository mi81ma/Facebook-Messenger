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
        super.viewDidLoad()

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

    class FriendCell: UICollectionViewCell {

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

