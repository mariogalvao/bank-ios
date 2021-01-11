//
//  CardsHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit
import OpenAPIClient

class CardsHomeViewController: ViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: MenuTableView!
    
    var viewModelDelegate: CardsHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cartões"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionViewCell")
                
        tableView.menuDelegate = self
        tableView.register(UINib(nibName: "CardInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CardInfoTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelDelegate?.getCards()
        viewModelDelegate?.getMenuSectionList()
    }
    
}

extension CardsHomeViewController: UICollectionViewDelegate {}

extension CardsHomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfCards = viewModelDelegate?.getNumberOfCards() ?? 0
        pageControl.numberOfPages = numberOfCards
        return numberOfCards
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
            tableView.reloadData()
        }
    }
    
}

extension CardsHomeViewController: MenuTableViewProtocol {
    
    func getCustomCellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardInfoTableViewCell", for: indexPath) as? CardInfoTableViewCell else {
            return UITableViewCell()
        }
        guard let card = viewModelDelegate?.getCard(for: pageControl.currentPage) else { return nil }
        cell.cardLabel.text = card.name
        cell.spentLabel.text = card.spentString
        cell.availableLabel.text = card.availableString
        cell.setLimits(spentValue: card.spentValue, availableValue: card.availableValue)
        return cell
    }
    
    func didSelect(menu: Menu) {
        viewModelDelegate?.selectItem(for: menu)
    }
    
}

protocol CardsHomeViewControllerProtocol: ViewControllerProtocol {
    
    func updateMenus(_ menus: [MenuSection])
    func reloadData()
    
}

extension CardsHomeViewController: CardsHomeViewControllerProtocol {
    
    func updateMenus(_ menus: [MenuSection]) {
        tableView.setMenuSectionList(menus)
        tableView.reloadData()
    }
    
    func reloadData() {
        collectionView.reloadData()
        tableView.reloadData()
    }
    
}
