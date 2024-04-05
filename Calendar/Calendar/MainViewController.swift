//
//  MainViewController.swift
//  Calendar
//
//  Created by 김호성 on 2/22/24.
//

import UIKit
import EventKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var lbMonth: UILabel!
    @IBOutlet weak var lbDay: UILabel!
    
    private let eventStore = EKEventStore()
    private let now: Date = Date()
    private var calendar: Calendar = Calendar(identifier: .gregorian)
    private var year: Int = 2023
    private var month: Int = 11
    private var day: Int = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                print("Access to calendar granted")
            } else {
                print("Access to calendar denied")
            }
        }
        calendar.timeZone = TimeZone(identifier: "Asia/Seoul")!
        year = calendar.component(.year, from: now)
        month = calendar.component(.month, from: now)
        day = calendar.component(.day, from: now)
        NSLog("\(year) \(month) \(day)")
        lbMonth.text = "\(year)년 \(month)월"
        lbDay.text = "\(day)일"
    }
    
    func addEventToCalendar() {
        let event = EKEvent(eventStore: eventStore)
        event.title = "Test"
        event.startDate = Date()
        event.startDate = Date().addingTimeInterval(3600)
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        do {
            try eventStore.save(event, span: .thisEvent)
            print("Event added to calendar")
        } catch let error as NSError {
            print("Failed to save event with error : \(error)")
        }

    }

}
