//
//  ContactInformation.swift
//  MyContactView
//
//  Created by ANT MAN on 17/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import UIKit

class ContactInformation: NSObject {
    var contactName: String
    var contactNickName: String
    var contactPhoneNumber: String
    var contactType: Int
    var contactPublicType: Int
    var contactImage: UIImage
    
    init(contactName: String, contactNickName: String, contactPhoneNumber: String, contactType: Int, contactPublicType: Int, contactImage: UIImage){
        self.contactName = contactName
        self.contactNickName = contactNickName
        self.contactType = contactType
        self.contactPhoneNumber = contactPhoneNumber
        self.contactPublicType = contactPublicType
        self.contactImage = contactImage
    }
}
