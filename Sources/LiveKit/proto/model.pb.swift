// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: model.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Livekit_TrackType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case audio // = 0
  case video // = 1
  case data // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .audio
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .audio
    case 1: self = .video
    case 2: self = .data
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .audio: return 0
    case .video: return 1
    case .data: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Livekit_TrackType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Livekit_TrackType] = [
    .audio,
    .video,
    .data,
  ]
}

#endif  // swift(>=4.2)

struct Livekit_Room {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sid: String = String()

  var name: String = String()

  var emptyTimeout: UInt32 = 0

  var maxParticipants: UInt32 = 0

  var creationTime: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Livekit_ParticipantInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sid: String = String()

  var identity: String = String()

  var state: Livekit_ParticipantInfo.State = .joining

  var tracks: [Livekit_TrackInfo] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum State: SwiftProtobuf.Enum {
    typealias RawValue = Int

    /// websocket' connected, but not offered yet
    case joining // = 0

    /// server received client offer
    case joined // = 1

    /// ICE connectivity established
    case active // = 2

    /// WS disconnected
    case disconnected // = 3
    case UNRECOGNIZED(Int)

    init() {
      self = .joining
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .joining
      case 1: self = .joined
      case 2: self = .active
      case 3: self = .disconnected
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .joining: return 0
      case .joined: return 1
      case .active: return 2
      case .disconnected: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Livekit_ParticipantInfo.State: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Livekit_ParticipantInfo.State] = [
    .joining,
    .joined,
    .active,
    .disconnected,
  ]
}

#endif  // swift(>=4.2)

struct Livekit_TrackInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sid: String = String()

  var type: Livekit_TrackType = .audio

  var name: String = String()

  var muted: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Livekit_DataMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var value: Livekit_DataMessage.OneOf_Value? = nil

  var text: String {
    get {
      if case .text(let v)? = value {return v}
      return String()
    }
    set {value = .text(newValue)}
  }

  var binary: Data {
    get {
      if case .binary(let v)? = value {return v}
      return Data()
    }
    set {value = .binary(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_Value: Equatable {
    case text(String)
    case binary(Data)

  #if !swift(>=4.1)
    static func ==(lhs: Livekit_DataMessage.OneOf_Value, rhs: Livekit_DataMessage.OneOf_Value) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.text, .text): return {
        guard case .text(let l) = lhs, case .text(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.binary, .binary): return {
        guard case .binary(let l) = lhs, case .binary(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "livekit"

extension Livekit_TrackType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "AUDIO"),
    1: .same(proto: "VIDEO"),
    2: .same(proto: "DATA"),
  ]
}

extension Livekit_Room: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Room"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sid"),
    2: .same(proto: "name"),
    3: .standard(proto: "empty_timeout"),
    4: .standard(proto: "max_participants"),
    5: .standard(proto: "creation_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.emptyTimeout) }()
      case 4: try { try decoder.decodeSingularUInt32Field(value: &self.maxParticipants) }()
      case 5: try { try decoder.decodeSingularInt64Field(value: &self.creationTime) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sid.isEmpty {
      try visitor.visitSingularStringField(value: self.sid, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if self.emptyTimeout != 0 {
      try visitor.visitSingularUInt32Field(value: self.emptyTimeout, fieldNumber: 3)
    }
    if self.maxParticipants != 0 {
      try visitor.visitSingularUInt32Field(value: self.maxParticipants, fieldNumber: 4)
    }
    if self.creationTime != 0 {
      try visitor.visitSingularInt64Field(value: self.creationTime, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Livekit_Room, rhs: Livekit_Room) -> Bool {
    if lhs.sid != rhs.sid {return false}
    if lhs.name != rhs.name {return false}
    if lhs.emptyTimeout != rhs.emptyTimeout {return false}
    if lhs.maxParticipants != rhs.maxParticipants {return false}
    if lhs.creationTime != rhs.creationTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Livekit_ParticipantInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ParticipantInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sid"),
    2: .same(proto: "identity"),
    3: .same(proto: "state"),
    4: .same(proto: "tracks"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sid) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.identity) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.state) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.tracks) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sid.isEmpty {
      try visitor.visitSingularStringField(value: self.sid, fieldNumber: 1)
    }
    if !self.identity.isEmpty {
      try visitor.visitSingularStringField(value: self.identity, fieldNumber: 2)
    }
    if self.state != .joining {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 3)
    }
    if !self.tracks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.tracks, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Livekit_ParticipantInfo, rhs: Livekit_ParticipantInfo) -> Bool {
    if lhs.sid != rhs.sid {return false}
    if lhs.identity != rhs.identity {return false}
    if lhs.state != rhs.state {return false}
    if lhs.tracks != rhs.tracks {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Livekit_ParticipantInfo.State: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "JOINING"),
    1: .same(proto: "JOINED"),
    2: .same(proto: "ACTIVE"),
    3: .same(proto: "DISCONNECTED"),
  ]
}

extension Livekit_TrackInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TrackInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sid"),
    2: .same(proto: "type"),
    3: .same(proto: "name"),
    4: .same(proto: "muted"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sid) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.muted) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sid.isEmpty {
      try visitor.visitSingularStringField(value: self.sid, fieldNumber: 1)
    }
    if self.type != .audio {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if self.muted != false {
      try visitor.visitSingularBoolField(value: self.muted, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Livekit_TrackInfo, rhs: Livekit_TrackInfo) -> Bool {
    if lhs.sid != rhs.sid {return false}
    if lhs.type != rhs.type {return false}
    if lhs.name != rhs.name {return false}
    if lhs.muted != rhs.muted {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Livekit_DataMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DataMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "text"),
    2: .same(proto: "binary"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        if self.value != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.value = .text(v)}
      }()
      case 2: try {
        if self.value != nil {try decoder.handleConflictingOneOf()}
        var v: Data?
        try decoder.decodeSingularBytesField(value: &v)
        if let v = v {self.value = .binary(v)}
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.value {
    case .text?: try {
      guard case .text(let v)? = self.value else { preconditionFailure() }
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }()
    case .binary?: try {
      guard case .binary(let v)? = self.value else { preconditionFailure() }
      try visitor.visitSingularBytesField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Livekit_DataMessage, rhs: Livekit_DataMessage) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
