//
//  AlbumListCell.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import UIKit
import Combine

class AlbumListCell: UITableViewCell, IdentifiableView {
    // MARK: - Views
    //
    let image = UIImageView()
    let alt_description = UILabel()

    
    var cancelableSet: Set<AnyCancellable> = []
    
    // MARK: - Intialezers
    //
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.updateImage()
        self.updateDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Update UI
    //
    private func updateImage() {
        contentView.addSubview(image)
        image.widthConstraints(100)
        image.makeConstraints(leadingAnchor: contentView.leadingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
        image.fillYSuperViewConstraints(paddingTop: 4, paddingBottom: 4)
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
    }
    
    private func updateDescription() {
        self.alt_description.textColor = .label
        alt_description.numberOfLines = 0
        contentView.addSubview(alt_description)
        alt_description.centerYInSuperview()
        alt_description.makeConstraints(leadingAnchor: image.trailingAnchor,
                                        trailingAnchor: contentView.trailingAnchor,
                                        padding: UIEdgeInsets(top: 0, left: 16,
                                                                bottom: 0, right: 16))
    }
    
    // MARK: -  Public Methods
    //
    public func setup(with unSplashImage: UnSplashImage) {
        self.downloadImage(url: unSplashImage.urls.regular)
        self.alt_description.text = unSplashImage.altDescription ?? "The description for this image is missed"
    }
    
    // MARK: -  Private Methods
    //
    private func downloadImage(url: String) {
        ImageDownloader.download(url: url)
            .sink { error in
                print(error)
            } receiveValue: { image in
                self.image.image = image
            }
            .store(in: &cancelableSet)
    }
    

}
