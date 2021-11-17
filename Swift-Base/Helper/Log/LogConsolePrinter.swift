//
//  LogConsolePrinter.swift
//  Tools
//

import Foundation

public class LogConsolePrinter: LogPrinter {

    // MARK: - Type Properties

    public static let shared = LogConsolePrinter()

    // MARK: - Initializers

    private init() { }

    // MARK: - LogPrinter

    public func print(_ line: String) {
        Swift.print(line)
    }
}
