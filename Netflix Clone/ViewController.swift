//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Muhammad on 11/8/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var navBarButton: UIBarButtonItem!
    
    private let sections = ["Trending Movies","Trending TVs","Upcoming Movies","Top Rated"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        addGradientLayerToHeader()
    }
   
    func addGradientLayerToHeader(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = homeImageView.bounds
        homeImageView.layer.addSublayer(gradientLayer)
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"featuredCell" ) as? CollectionTableViewCell else{ return UITableViewCell() }
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? CustomTableHeaderView
        view?.setTitleText(title: self.sections[section])
        return view
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isNavBarHidden = scrollView.contentOffset.y > 10
        navigationController?.setNavigationBarHidden(isNavBarHidden, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
}

