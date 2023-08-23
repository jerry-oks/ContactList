//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by HOLY NADRUGANTIX on 23.08.2023.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var phoneLabel: UILabel!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = contact.fullName
        emailLabel.text = contact.email
        phoneLabel.text = contact.phone
    }
}
