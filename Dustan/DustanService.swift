//
//  DustanService.swift
//  Dustan
//
//  Created by Mobile Star on 18/04/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import Foundation
import Alamofire

class DustanService {
    static let sharedInstance = DustanService()
    var sessionManager = Alamofire.SessionManager()

    
    func addNewDoor(name:String, phone:String, code:String, password:String, email:String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "email": email,
            "phone_number": phone,
            "keypad_code": code,
            "password": password,
            "door_name": name
        ]
        self.sessionManager.request(Constants.DustanCareAPI.ADDNEWDOOR, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func signInUser(phone: String, password: String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "phone_number": phone,
            "password": password
        ]
        self.sessionManager.request(Constants.DustanCareAPI.SINGIN, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getQuestions(onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let url: String = String(format: Constants.DustanCareAPI.GETQUESTIONS)
        self.sessionManager.request(url).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func saveAnswers(token: String, answers: [NSDictionary], onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "answers": answers
        ]
        print(parameters)
        self.sessionManager.request(Constants.DustanCareAPI.SAVEANSWER, method: .post, parameters: parameters, encoding: URLEncoding.default)
            .responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getUsers(token:String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token
        ]
        self.sessionManager.request(Constants.DustanCareAPI.GETUSERS, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func inviteUser(token:String, first: String, last: String, code: String, phone: String, email: String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code,
            "phone_number": phone,
            "first_name": first,
            "last_name": last,
            "email": email
        ]
        self.sessionManager.request(Constants.DustanCareAPI.INVITEUSER, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func deleteUser(token:String, code: String, phone: String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code,
            "phone_number": phone
        ]
        self.sessionManager.request(Constants.DustanCareAPI.DELETEUSER, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getDoors(token:String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token
        ]
        self.sessionManager.request(Constants.DustanCareAPI.GETDOORS, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getAdminDoors(token:String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token
        ]
        self.sessionManager.request(Constants.DustanCareAPI.GETADMINDOORS, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getDoorStatus(token:String, code: String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code
        ]
        self.sessionManager.request(Constants.DustanCareAPI.GETDOORSTATUS, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func deleteDoor(token:String, keycodes: [String], onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_codes": keycodes
        ]
        self.sessionManager.request(Constants.DustanCareAPI.DELETEDOOR, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func updateEmail(token:String, old_email: String, new_email: String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "old_email": old_email,
            "new_email": new_email
        ]
        self.sessionManager.request(Constants.DustanCareAPI.UPDATEEMIAL, method:.post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func updatePassword(token:String, old_password: String, new_password: String, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "old_password": old_password,
            "new_password": new_password
        ]
        self.sessionManager.request(Constants.DustanCareAPI.UPDATEPASSWORD, method:.post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func doorLock(token:String, code: String, password: String, on: Bool, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code,
            "keypad_password": password,
            "open": on
        ]
        self.sessionManager.request(Constants.DustanCareAPI.DOORLOCK, method:.post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func doorBell(token:String, code: String, password: String, on: Bool, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code,
            "keypad_password": password,
            "bell": on
        ]
        self.sessionManager.request(Constants.DustanCareAPI.DOORBELL, method:.post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func doorBlock(token:String, code: String, password: String, on: Bool, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code,
            "keypad_password": password,
            "block": on
        ]
        self.sessionManager.request(Constants.DustanCareAPI.DOORBLOCK, method:.post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func doorCamera(token:String, code: String, password: String, on: Bool, onSuccess:@escaping (_ result: DataResponse<Any>) -> Void, onFailure:@escaping (_ error: Error) -> Void) -> Void {
        let parameters: Parameters = [
            "token": token,
            "keypad_code": code,
            "keypad_password": password,
            "view": on
        ]
        self.sessionManager.request(Constants.DustanCareAPI.DOORCAMERA, method:.get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}

