//
//  ViewController.swift
//  Assignment_10
//
//  Created by Yerzhan Syzdyk on 22.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var myVar = 0
    private var currentBackgroundColor = UIColor.systemMint
    
    private lazy var firstCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width * 0.3, height: view.frame.height * 0.15 - 5)
        
        let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        firstCollectionView.register(myCollectionViewCell.self, forCellWithReuseIdentifier: myCollectionViewCell.IDA)
        firstCollectionView.backgroundColor = currentBackgroundColor
        return firstCollectionView
    }()
    
    private lazy var secondCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width * 0.45, height: view.frame.height * 0.4 - 5)
        
        let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        firstCollectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.IDB)
        firstCollectionView.backgroundColor = currentBackgroundColor
        return firstCollectionView
    }()
    
    private lazy var myLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Tap to Change Color"
        myLabel.font = UIFont.boldSystemFont(ofSize: 30)
        myLabel.textColor = .black
        myLabel.backgroundColor = .systemCyan
        myLabel.textAlignment = .center
        myLabel.layer.cornerRadius = 15
        myLabel.layer.masksToBounds = true
        
        myLabel.isUserInteractionEnabled = true
        let labelTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.doSomeThing))
        myLabel.addGestureRecognizer(labelTapGesture)
        
        return myLabel
    }()
    
    @objc func doSomeThing(){
        //var index = 0
        let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.systemMint]
        view.backgroundColor = colors[myVar]
        currentBackgroundColor = colors[myVar]
        firstCollectionView.backgroundColor = currentBackgroundColor
        secondCollectionView.backgroundColor = currentBackgroundColor
        myVar += 1
        if myVar == colors.count{
            myVar = 0
        }
    }
    
    private let myHeaderData = ["apple","banana","kiwi","milk","pineapple","marrow","fish","coca cola","bread"]
    private let mySecondData = ["1","2","3","4","5","6","7","8","9","10"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        firstCollectionView.dataSource = self
        secondCollectionView.dataSource = self
        
        setupViews()
        setupConstraints()
    }


}

//MARK: setup CollectionViewDataSource

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView{
            return myHeaderData.count
        }else{
            return mySecondData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == firstCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCollectionViewCell.IDA, for: indexPath) as! myCollectionViewCell
            cell.setInformation(by: myHeaderData[indexPath.row])
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.IDB, for: indexPath) as! SecondCollectionViewCell
            cell.setInformation(by: mySecondData[indexPath.row])
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }
    }
}


//MARK: setup views and constraints

extension ViewController{
    func setupViews(){
        view.addSubview(firstCollectionView)
        view.addSubview(secondCollectionView)
        view.addSubview(myLabel)
    }
    
    func setupConstraints(){
        firstCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        secondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(firstCollectionView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(secondCollectionView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
