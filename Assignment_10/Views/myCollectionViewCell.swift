//
//  myCollectionViewCell.swift
//  Assignment_10
//
//  Created by Yerzhan Syzdyk on 22.01.2023.
//

import UIKit
import SnapKit

class myCollectionViewCell: UICollectionViewCell {
    static let IDA = "IDENTIFIER"
    
    private lazy var myView : UIView = {
        let myView = UIView()
        return myView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setInformation(by backColor: UIColor){
        myView.backgroundColor = backColor
    }
}


//MARK: setup Views and Constraints

extension myCollectionViewCell{
    func setupViews(){
        contentView.addSubview(myView)
    }
    func setupConstraints(){
        myView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
