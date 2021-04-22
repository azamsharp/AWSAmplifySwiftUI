// swiftlint:disable all
import Amplify
import Foundation

public struct Movie: Model {
  public let id: String
  public var title: String?
  public var description: String?
  
  public init(id: String = UUID().uuidString,
      title: String? = nil,
      description: String? = nil) {
      self.id = id
      self.title = title
      self.description = description
  }
}
