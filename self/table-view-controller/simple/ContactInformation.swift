//
//  ContactInformation.swift
//  MyContactList
//
//  Created by ANT Man on 10/8/2562 BE.
//  Copyright © 2562 Mossnana. All rights reserved.
//

import UIKit

class ContactInformation: NSObject {
    var contactName: String
    var contactNickname: String
    var contactPhoneNumber: String
    var contactType: Int
    var contactPublicType: Int
    var contactImage: UIImage
    
    init(contactName: String, contactNickname: String, contactPhoneNumber: String, contactType: Int, contactPublicType: Int, contactImage: UIImage) {
        self.contactName = contactName
        self.contactNickname = contactNickname
        self.contactPhoneNumber = contactPhoneNumber
        self.contactType = contactType
        self.contactPublicType = contactPublicType
        self.contactImage = contactImage
    }
}
