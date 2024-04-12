//
//  UIViewController+Ext.swift
//  Calendar
//
//  Created by 김호성 on 2024.04.11.
//

import UIKit

// MARK: - Public Outter Class, Struct, Enum, Protocol
enum ViewControllerEnum: String, CaseIterable {
    case datepicker
}

extension UIViewController {

    // MARK: - Public Method
    class func getViewController(viewControllerEnum: ViewControllerEnum) -> UIViewController {
        switch viewControllerEnum {
        case .datepicker:
            return getViewController(storyboard: "DatePicker", identifier: String(describing: DatePickerViewController.self), modalPresentationStyle: .automatic)
            
        }
    }
    
    // MARK: - Private Method
    private class func getViewController(storyboard: String, identifier: String, modalPresentationStyle: UIModalPresentationStyle) -> UIViewController {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: identifier)
        vc.modalPresentationStyle = modalPresentationStyle
        return vc
    }
}

