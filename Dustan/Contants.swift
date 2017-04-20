//
//  Contants.swift
//  Dustan
//
//  Created by Mobile Star on 18/04/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

struct Constants {
    struct DustanCareAPI {
        static let ADDNEWDOOR = "http://52.56.190.147/api/v1/account/sign_up"
        static let GETQUESTIONS = "http://52.56.190.147/api/v1/account/security_questions"
        static let SAVEANSWER = "http://52.56.190.147/api/v1/account/security_answer"
    }
    static var questions = [Question]()
    static var token: String = ""
}

struct Question {
    var id = ""
    var question = ""
}

