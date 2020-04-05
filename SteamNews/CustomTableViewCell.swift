//
//  CustomTableViewCell.swift
//  SteamNews
//
//  Created by Сергей Фадеев on 05.04.2020.
//  Copyright © 2020 Сергей Фадеев. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {    
    @IBOutlet weak var titleTextLable: UILabel!
    @IBOutlet weak var previewTextLable: UILabel!
    @IBOutlet weak var urlTextLable: UILabel!
    @IBOutlet weak var openURL: UIButton!
    

    func initFields(title: String, preview: String, url: String) {
        titleTextLable.text = title
        previewTextLable.text = preview
        urlTextLable.text = url
    }
    
    @IBAction func openURL(_ sender: Any) {
        if let url = urlTextLable.text {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return arrayOfNews.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            cell.initFields(title: arrayOfNews[indexPath.row].title, preview: arrayOfNews[indexPath.row].contents, url: arrayOfNews[indexPath.row].url)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
