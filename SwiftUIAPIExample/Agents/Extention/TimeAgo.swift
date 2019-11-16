
import Foundation


public func timeAgoSince(_ date: Date) -> String {
    
    let calendar = Calendar.current
    let now = Date()
    let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
    let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    let dateInFormat = dateFormatter.string(from: date)
    
    if components.year! >= 2 {
        return dateInFormat
    }
    
    if components.year! >= 1 {
        return dateInFormat
    }
    
    if components.month! >= 2 {
        return dateInFormat
    }
    
    if components.month! >= 1 {
        return dateInFormat
    }
    
    if components.weekOfYear! >= 2 {
        return dateInFormat
    }
    
    if components.weekOfYear! >= 1 {
        return dateInFormat
    }
    
    if components.day! >= 2 {
        return dateInFormat
    }
    
    if components.day! >= 1 {
        return dateInFormat
    }
    
    if components.hour! >= 2 {
        return "\(components.hour!) hours ago"
    }
    
    if components.hour! >= 1 {
        return "An hour ago"
    }
    
    if components.minute! >= 2 {
        return "\(components.minute!) minutes ago"
    }
    
    if components.minute! >= 1 {
        return "A minute ago"
    }
    
    if components.second! >= 3 {
        return "\(components.second!) seconds ago"
    }
    
    return "Just now"
    
}
