//
//  HomeVC.swift
//  SataFood
//
//  Created by abdrahman on 06/06/2022.
//

import UIKit

class HomeVC: UIViewController {
    let homeListViewModel =  HomeListVM()
    let categoryListViewModel =  CategoryListVM()
    let slidersListViewModel =  SliderListVM()
    let newOffersListViewModel =  NewOffersListVM()
    var myCollectionView: UICollectionView?
    
    var totalSliders = 0
    var totalCategories = 0
    var totalNewOffers = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "5437842")!)
        configCollectionView()
        //loadData()
        loadCategories()
        loadSlidres()
        loadNewOffers()
    }
    func loadData(){
//        homeListViewModel.loadHomeData { homeData, error in
//            guard let homeData = homeData, error == nil else{
//                return
//            }
//            self.totalCategories = homeData.categories.count
//            self.totalSliders = homeData.sliders.count
//            self.totalNewOffers = homeData.newOffers.count
//            DispatchQueue.main.async {
//                self.myCollectionView?.reloadData()
//            }
//        }
    }
    
    func loadCategories(){
        categoryListViewModel.loadCategories { categories, error in
            guard let categories = categories, error == nil else{
                return
            }
            self.totalCategories = categories.count
            DispatchQueue.main.async {
                self.myCollectionView?.reloadData()
            }
        }
    }
    
    func loadSlidres(){
        slidersListViewModel.loadSliders { sliders, error in
            guard let sliders = sliders, error == nil else{
                return
            }
            self.totalSliders = sliders.count
            DispatchQueue.main.async {
                self.myCollectionView?.reloadData()
            }
        }
    }
    
    func loadNewOffers(){
        newOffersListViewModel.loadNewOffers { newOffers, error in
            guard let newOffers = newOffers, error == nil else{
                return
            }
            self.totalNewOffers = newOffers.count
            DispatchQueue.main.async {
                self.myCollectionView?.reloadData()
            }
        }
    }
    func configCollectionView(){
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createComposionalLayout())
        myCollectionView?.dataSource = self
        myCollectionView?.backgroundColor = .clear
        myCollectionView?.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.identifier)
        myCollectionView?.register(SlidersCell.self, forCellWithReuseIdentifier: SlidersCell.identifier)
        myCollectionView?.register(HeaderView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: HeaderView.identifier)
        myCollectionView?.register(NewOffersCell.self, forCellWithReuseIdentifier: NewOffersCell.identifier)
        guard let collectionView = myCollectionView else {return}
                view.addSubview(collectionView)
                collectionView.frame = view.bounds
    }
    
    func createComposionalLayout() -> UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout{ [weak self] (index, environment) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, environment: environment)
        }
        return layout
    }
    
    func createSectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection{
        switch index {
        case 0:
            return createCategoriesSection()
        case 1:
            return createSlidersSection()
        case 2:
            return createNewOffersSection()
        default:
            return createCategoriesSection()
        }
    }
    func createCategoriesSection() -> NSCollectionLayoutSection{
        let inset: CGFloat = 10
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func createSlidersSection() -> NSCollectionLayoutSection{
        let inset: CGFloat = 10
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: 1, trailing: inset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    func createNewOffersSection() -> NSCollectionLayoutSection{
        let inset: CGFloat = 3.5
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: inset, bottom: inset, trailing: inset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.5), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
}
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            print("homeListViewModel.numberOfRows() :- \(homeListViewModel.numberOfRows())")
            return totalCategories
        case 1:
            print("total items are :- \(totalSliders)")
            return totalSliders
        case 2:
            return totalNewOffers
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let vm = self.categoryListViewModel.cells[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.identifier, for: indexPath) as! CategoriesCell
            cell.configCell(vm)
            return cell
        case 1:
            let vm = self.slidersListViewModel.cells[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlidersCell.identifier, for: indexPath) as! SlidersCell
            cell.configCell(vm)
            return cell
        case 2:
            let vm = self.newOffersListViewModel.cells[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewOffersCell.identifier, for: indexPath) as! NewOffersCell
            cell.configCell(vm)
            return cell
        
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.identifier, for: indexPath) as! CategoriesCell
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView
        else{
            return UICollectionReusableView()
        }
        switch indexPath.section{
        case 0:
            view.configTitle("title Enjoy the largest selection of restaurants and offers")
        case 1:
            view.configTitle("")
        case 2:
            view.configTitle("Browse our best offers")
        default:
            view.configTitle("")
        }
        return view
    }
}
