//
//  DetailedContactListViewController.swift
//  ContactList
//
//  Created by HOLY NADRUGANTIX on 23.08.2023.
//

import UIKit

class DetailedContactListViewController: UITableViewController {
    var contacts: [Contact]!
}

// MARK: - UITableViewDataSource
extension DetailedContactListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "detailedContactCell",
            for: indexPath
        )
        
        let contact = contacts[indexPath.section]
        
        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0: do {
            content.image = UIImage(systemName: "at.circle.fill")
            content.text = contact.email
        }
        default: do {
            content.image = UIImage(systemName: "phone.circle.fill")
            content.text = contact.phone
        }
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

