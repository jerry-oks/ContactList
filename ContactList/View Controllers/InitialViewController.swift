//
//  InitialViewController.swift
//  ContactList
//
//  Created by HOLY NADRUGANTIX on 23.08.2023.
//

import UIKit

final class InitialViewController: UIViewController {
    private let contacts = Contact.getRandomContactList(
        fromNames: DataStore.names,
        surnames: DataStore.surnames,
        phones: DataStore.phones,
        andEmails: DataStore.emails
    )
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        tabBarController.viewControllers?.forEach { vc in
            if let navigationController = vc as? UINavigationController {
                if let contactListVC = navigationController.topViewController as? ContactListViewController {
                    contactListVC.contacts = sender as? [Contact]
                } else if let detailedContactListVC = navigationController.topViewController as? DetailedContactListViewController {
                    detailedContactListVC.contacts = sender as? [Contact]
                }
            }
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        performSegue(withIdentifier: "openTabBarVC", sender: contacts)
//    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        performSegue(withIdentifier: "openTabBarVC", sender: contacts)
    
    }
}
