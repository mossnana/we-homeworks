//
//  Student.swift
//  RateMyStudentDB
//
//  Created by ANT Man on 7/9/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit

class Student: NSObject {
    var studentName: String
    var studentRatingScore: Int
    var studentImage: UIImage
    
    override init() {
        self.studentName = ""
        self.studentRatingScore = 0
        self.studentImage = UIImage()
    }
    
    init(studentName: String, studentRatingScore: Int, studentImage: UIImage) {
        self.studentName = studentName
        self.studentRatingScore = studentRatingScore
        self.studentImage = studentImage
    }
    
    func resetScore() -> Void {
        self.studentRatingScore = 0
    }
    
    func addScore(ratingScore: Int) -> Void {
        self.studentRatingScore += ratingScore
    }
    
    func minusScore(ratingScore: Int) -> Void {
        self.studentRatingScore -= ratingScore
    }
}
