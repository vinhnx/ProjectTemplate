//
//  Log.swift
//  Tools
//

import Foundation

enum LogEvent: String {

    // MARK: - Enumeration cases

    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}

// Wrapping Swift.print() within LOGGING flag

func print(_ object: Any) {
    #if LOGGING
        Swift.print(object)
    #endif
}

enum Log {

    // MARK: - Type Properties
    
    static var dateFormat = "hh:mm:ss"

    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()

        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current

        return formatter
    }

    // MARK: - Type Methods

    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }

    // swiftlint:disable:next function_parameter_count
    private static func printLog(_ object: Any?, filename: String, line: Int, column: Int, funcName: String, event: LogEvent) {
        if Log.isLoggingEnabled {
            var body = "\(Date().string) \(event.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName)"

            if let object = object {
                body.append(" -> \(object)")
            }

            print(body)
        }
    }

    // MARK: -
    // swiftlint:disable:next function_parameter_count
    static func e(_ object: Any? = nil, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: filename, line: line, column: column, funcName: funcName, event: .e)
    }

    // swiftlint:disable:next function_parameter_count
    static func d(_ object: Any? = nil, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: filename, line: line, column: column, funcName: funcName, event: .d)
    }

    // swiftlint:disable:next function_parameter_count
    static func i(_ object: Any? = nil, sender: Any, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: "\(String(describing: type(of: sender)))", line: line, column: column, funcName: funcName, event: .i)
    }

    // swiftlint:disable:next function_parameter_count
    static func i(_ object: Any? = nil, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: filename, line: line, column: column, funcName: funcName, event: .i)
    }

    // swiftlint:disable:next function_parameter_count
    static func v(_ object: Any? = nil, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: filename, line: line, column: column, funcName: funcName, event: .v)
    }

    // swiftlint:disable:next function_parameter_count
    static func w(_ object: Any? = nil, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: filename, line: line, column: column, funcName: funcName, event: .w)
    }

    // swiftlint:disable:next function_parameter_count
    static func s(_ object: Any? = nil, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        Log.printLog(object, filename: filename, line: line, column: column, funcName: funcName, event: .s)
    }
}

// MARK: - Date

// swiftlint:disable:next no_extension_access_modifier
private extension Date {

    // MARK: - Instance Methods

    var string: String {
        return Log.dateFormatter.string(from: self)
    }
}
