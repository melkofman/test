//
//  SettingsSection.swift
//  SettingsTemplate
//
//  Created by Таисия Хахарова on 01.11.2020.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//
protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum Options: Int, CaseIterable, SectionType {
    case personalInf
    case payments
    case travel
    case notifications
    case phonenumber
    
    var containsSwitch: Bool{
    switch self{
    case.notifications:return true
    case.phonenumber:return true
    case.personalInf:return false
    case.payments: return false
    case.travel:return false
        
    }
        }
    
    var description: String {
        switch self{
        case .personalInf: return "Personal information"
        case .payments: return "Payments and payouts"
        case .travel:return "Travel for work"
        case .notifications: return "Notifications"
        case .phonenumber: return "Show phone number"
        }
    }
}


