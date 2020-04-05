//
//  ViewController.swift
//  SteamNews
//
//  Created by Сергей Фадеев on 05.04.2020.
//  Copyright © 2020 Сергей Фадеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var updateNews: UIButton?
    
    var tableView: UITableView? = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    private func updateLayout(with size: CGSize) {
        self.tableView?.frame = CGRect.init(origin: .zero, size: size)
    }
    
    private func registerTableViewCells() {
        let newsCall = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView?.register(newsCall, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Steam apps News:"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.tableView!)
    
        self.view.backgroundColor = #colorLiteral(red: 0.7321722388, green: 0.9139052496, blue: 1, alpha: 1)
        
        self.tableView?.dataSource = self
        self.tableView?.delegate = self as? UITableViewDelegate

        self.registerTableViewCells()
        loadUpdateNews()
        self.updateLayout(with: self.view.frame.size)
        
        
    }
    
    func loadUpdateNews() {
        updateNews = UIButton()
        updateNews?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        updateNews?.alpha = 0.5
        
        updateNews?.setTitle("Update News", for: .normal)
        
        updateNews!.frame = CGRect(x: 0, y: self.view.frame.height - 45, width: self.view.frame.width, height: 45)
        self.view.addSubview(updateNews!)
        
        updateNews?.addTarget(self, action: #selector(getUpdateNews), for: .touchUpInside)
    }
    
    @objc func getUpdateNews() {
        updateNews!.setTitleColor(UIColor.black, for: .normal)
        arrayOfNews.removeAll()
        getSortedNews(appID)
        self.tableView?.reloadData()
        
        updateNews!.setTitleColor(UIColor.white, for: .normal)
    }
    
}

