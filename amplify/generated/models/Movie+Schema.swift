// swiftlint:disable all
import Amplify
import Foundation

extension Movie {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case description
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let movie = Movie.keys
    
    model.pluralName = "Movies"
    
    model.fields(
      .id(),
      .field(movie.title, is: .optional, ofType: .string),
      .field(movie.description, is: .optional, ofType: .string)
    )
    }
}