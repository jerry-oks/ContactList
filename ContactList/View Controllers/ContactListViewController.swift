//
//  ViewController.swift
//  ContactList
//
//  Created by HOLY NADRUGANTIX on 23.08.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {
    var contacts: [Contact]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let contactDetailsVC = segue.destination as? ContactDetailsViewController {
            contactDetailsVC.contact = sender as? Contact
        }
    }
}

// MARK: - UITableViewDataSource
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "contactCell",
            for: indexPath
        )
        let contact = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    
}

// MARK: - UITableViewDelegate
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        performSegue(withIdentifier: "openContactDetailsVC", sender: contact)
    }
}
