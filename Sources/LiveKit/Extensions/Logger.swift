/*
 * Copyright 2022 LiveKit
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation
import Logging

/// Allows to extend with custom `log` method which automatically captures current type (class name).
internal protocol Loggable: Any {

}

internal extension Loggable {

    /// Automatically captures current type (class name) to ``Logger.Metadata``
    func log(_ message: Logger.Message? = nil,
             _ level: Logger.Level = .debug,
             file: String = #file,
             type type_: Any.Type? = nil,
             function: String = #function,
             line: UInt = #line) {

        logger.log(message ?? "",
                   level,
                   file: file,
                   type: type_ ?? type(of: self),
                   function: function,
                   line: line)
    }
}

internal extension Logger {

    /// Adds `type` param to capture current type (usually class)
    func log(_ message: @autoclosure () -> Logger.Message,
             _ level: Logger.Level = .debug,
             source: @autoclosure () -> String? = nil,
             file: String = #file,
             type: Any.Type,
             function: String = #function,
             line: UInt = #line) {

        let metadata: Logger.Metadata  = [
            "type": .string(String(describing: type))
        ]

        log(level: level,
            message(),
            metadata: metadata,
            source: source(),
            file: file,
            function: function,
            line: line)
    }
}

/// ``LogHandler`` which formats log output preferred for debugging the LiveKit SDK.
public struct LiveKitLogHandler: LogHandler {

    public let label: String
    public let timeStampFormat = "%Y-%m-%dT%H:%M:%S%z"

    public var logLevel: Logger.Level
    public var metadata = Logger.Metadata()

    public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
        get { self.metadata[metadataKey] }
        set { self.metadata[metadataKey] = newValue }
    }

    public init(label: String, level: Logger.Level = .debug) {
        self.label = label
        self.logLevel = level
    }

    public func log(level: Logger.Level,
                    message: Logger.Message,
                    metadata: Logger.Metadata?,
                    source: String,
                    file: String,
                    function: String,
                    line: UInt) {

        var elements: [String] = [
            label.padding(toLength: 10, withPad: " ", startingAt: 0),
            // longest level string is `critical` which is 8 characters
            String(describing: level).uppercased().padding(toLength: 8, withPad: " ", startingAt: 0)
        ]

        // append type (usually class name) if available
        if case .string(let type) = metadata?["type"] {
            elements.append("\(type).\(function)".padding(toLength: 40, withPad: " ", startingAt: 0))
        }

        let str = String(describing: message)
        if !str.isEmpty {
            elements.append(str)
        }

        // join all elements with a space in between
        print(elements.joined(separator: " "))
    }

    private func timestamp() -> String {
        var buffer = [Int8](repeating: 0, count: 255)
        var timestamp = time(nil)
        let localTime = localtime(&timestamp)
        strftime(&buffer, buffer.count, timeStampFormat, localTime)
        return buffer.withUnsafeBufferPointer {
            $0.withMemoryRebound(to: CChar.self) {
                String(cString: $0.baseAddress!)
            }
        }
    }
}
