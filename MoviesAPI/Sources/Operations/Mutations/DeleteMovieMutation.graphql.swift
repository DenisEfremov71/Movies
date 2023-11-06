// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteMovieMutation: GraphQLMutation {
  public static let operationName: String = "DeleteMovie"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteMovie($movieId: ID!) { deleteMovie(id: $movieId) { __typename id title year genre poster } }"#
    ))

  public var movieId: ID

  public init(movieId: ID) {
    self.movieId = movieId
  }

  public var __variables: Variables? { ["movieId": movieId] }

  public struct Data: MoviesAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MoviesAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteMovie", DeleteMovie?.self, arguments: ["id": .variable("movieId")]),
    ] }

    public var deleteMovie: DeleteMovie? { __data["deleteMovie"] }

    /// DeleteMovie
    ///
    /// Parent Type: `Movie`
    public struct DeleteMovie: MoviesAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MoviesAPI.Objects.Movie }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", MoviesAPI.ID.self),
        .field("title", String.self),
        .field("year", String.self),
        .field("genre", String.self),
        .field("poster", String.self),
      ] }

      public var id: MoviesAPI.ID { __data["id"] }
      public var title: String { __data["title"] }
      public var year: String { __data["year"] }
      public var genre: String { __data["genre"] }
      public var poster: String { __data["poster"] }
    }
  }
}
