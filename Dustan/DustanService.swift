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
    
}

