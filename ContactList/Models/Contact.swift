//
//  Contact.swift
//  ContactList
//
//  Created by HOLY NADRUGANTIX on 23.08.2023.
//

import Foundation

struct Contact {
    private let name: String
    private let surname: String
    
    let phone: String
    let email: String
    
    var fullName: String { "\(name) \(surname)" }
    
    static func getRandomContactList(fromNames names: [String], surnames: [String], phones: [String], andEmails emails: [String]) -> [Contact] {
        var contacts: [Contact] = []
        
        let names = names.shuffled()
        let surnames = surnames.shuffled()
        let phones = phones.shuffled()
        let emails = emails.shuffled()
        
        let count = [names.count, surnames.count, phones.count, emails.count].min() ?? 0
        
        for index in 0..<count {
            contacts.append(
                Contact(
                    name: names[index],
                    surname: surnames[index],
                    phone: phones[index],
                    email: emails[index]
                )
            )
        }
        
        return contacts.sorted { $0.name < $1.name }
    }
}

