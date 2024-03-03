//
//  HolidayService.swift
//  LloydsTest
//
//  Created by Gaurav pande on 07/02/23.
//

import Foundation

protocol HolidayServiceProtocol {
    func getHolidayList(completion: @escaping (_ success: Bool, _ results: Holiday?, _ error: String?) -> ())
}

protocol DivisionProtocol {
    func getDivisionList(completion: @escaping (_ success: Bool, _ results: [String], _ error: String?) -> ())
}

class HolidayService: HolidayServiceProtocol, DivisionProtocol {
    // Fetch Division name in UK from server
    func getDivisionList(completion: @escaping (Bool, [String], String?) -> ()) {
        HttpHelper().GET(url: Constants.BaseURL, params: ["": ""], httpHeader: .applicationjson) { success, data in
            if success {
                do {
                if let dict = try JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                        var keyArray: Array = [String]()
                        for obj in dict.keys {
                            keyArray.append(obj.description)
                        }
                        completion(true, keyArray, nil)
                    }
                } catch {
                    print(error)
                }
            } else {
                completion(false, [""], "Division Request failed")
            }
        }
    }
    // Fetch Holiday List
    func getHolidayList(completion: @escaping (Bool, Holiday?, String?) -> ()) {
        HttpHelper().GET(url: Constants.BaseURL, params: ["": ""], httpHeader: .applicationjson) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Holiday.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Unable to parse the data")
                }
            } else {
                completion(false, nil, "Request failed")
            }
        }
    }
}
