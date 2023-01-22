//
//  SecondCollectionViewCell.swift
//  Assignment_10
//
//  Created by Yerzhan Syzdyk on 22.01.2023.
//

import UIKit
import SnapKit

class SecondCollectionViewCell: UICollectionViewCell {
    static let IDB = "IDENTIFIER"
    private lazy var myImage : UIImageView = {
        let myImage = UIImageView(image: UIImage(named: "apple"))
        return myImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setInformation(by text: String){
        myImage.image = UIImage(named: text)
    }
}


//MARK: setup Views and Constraints

extension SecondCollectionViewCell{
    func setupViews(){
        contentView.addSubview(myImage)
    }
    func setupConstraints(){
        myImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
