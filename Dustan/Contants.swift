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
        static let SINGIN = "http://52.56.190.147/api/v1/account/sign_in"
        static let ADDNEWDOOR = "http://52.56.190.147/api/v1/account/sign_up"
        static let GETQUESTIONS = "http://52.56.190.147/api/v1/account/security_questions"
        static let SAVEANSWER = "http://52.56.190.147/api/v1/account/security_answer"
        static let GETDOORS = "http://52.56.190.147/api/v1/account/doors"
        static let GETADMINDOORS = "http://52.56.190.147/api/v1/account/admin_doors"
        static let GETDOORSTATUS = "http://52.56.190.147/api/v1/account/door_status"
        static let UPDATEEMIAL = "http://52.56.190.147/api/v1/account/update_email"
        static let UPDATEPASSWORD = "http://52.56.190.147/api/v1/account/update_password"
        static let DELETEDOOR = "http://52.56.190.147/api/v1/account/delete_door"
        static let GETUSERS = "http://52.56.190.147/api/v1/account/users"
        static let INVITEUSER = "http://52.56.190.147/api/v1/account/invite"
        static let DELETEUSER = "http://52.56.190.147/api/v1/account/delete_user"
        static let DOORLOCK = "http://52.56.190.147/api/v1/keypads/door_lock"
        static let DOORBELL = "http://52.56.190.147/api/v1/keypads/door_bell"
        static let DOORBLOCK = "http://52.56.190.147/api/v1/keypads/door_block"
        static let DOORCAMERA = "http://52.56.190.147/api/v1/keypads/door_picture"
    }
    static var questions = [Question]()
    static var doors = [Door]()
    static var users = [User]()
    static var token: String = ""
}

struct Question {
    var id = ""
    var question = ""
}

struct Door {
    var id = ""
    var number = ""
    var code = ""
    var state = ""
    var name = ""
    var password = ""
}

struct User {
    var id = ""
    var first_name = ""
    var last_name = ""
    var phone_number = ""
}
