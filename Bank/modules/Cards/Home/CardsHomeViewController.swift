//
//  CardsHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit

class CardsHomeViewController: ViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelDelegate: CardsHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cartões"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        pageControl.numberOfPages = viewModelDelegate?.getNumberOfCards() ?? 0
        pageControl.hidesForSinglePage = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CardInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CardInfoTableViewCell")
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
    }

}

extension CardsHomeViewController: UICollectionViewDelegate {}

extension CardsHomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelDelegate?.getNumberOfCards() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
}

extension CardsHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
    
}

extension CardsHomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    }
    
}

extension CardsHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else {
            return nil
        }
        switch section {
        case 0:
            header.setTitle("Dados do cartão")
        case 1:
            header.setTitle("Menu")
        default:
            return nil
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let transaction = viewModelDelegate?.getMenu(for: indexPath.row) {
            viewModelDelegate?.selectItem(for: transaction)
        }
    }
    
}

extension CardsHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return viewModelDelegate?.getNumberOfMenus() ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getCardInfoCell(tableView, cellForRowAt: indexPath)
        case 1:
            return getMenuCell(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func getCardInfoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardInfoTableViewCell", for: indexPath) as? CardInfoTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func getMenuCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell, let transaction = viewModelDelegate?.getMenu(for: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setUp(icon: transaction.icon, title: transaction.title, details: transaction.details)
        return cell
    }
    
}

protocol CardsHomeViewControllerProtocol: ViewControllerProtocol {}

extension CardsHomeViewController: CardsHomeViewControllerProtocol {}
