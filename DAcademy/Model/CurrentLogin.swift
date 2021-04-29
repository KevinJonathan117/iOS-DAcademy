//
//  CurrentLogin.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import Foundation

struct CurrentLogin {
    private var userDefaults = UserDefaults.standard
    
    func getStatusForLogin(key: String) -> Bool {
        if(userDefaults.value(forKey: key) != nil){
            return true
        }
        return false
    }
    func getValueForLogin(key: String) -> String {
        if(userDefaults.value(forKey: key) != nil){
            return userDefaults.value(forKey: key) as! String
        }
        return ""
    }
    func setValueForLogin(value: String, key: String) {
        userDefaults.setValue(value, forKey: key)
    }
    func removeKeyForLogin(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}

let currentLogin = CurrentLogin()
