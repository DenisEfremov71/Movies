// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class HelloWorldQuery: GraphQLQuery {
  public static let operationName: String = "HelloWorld"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query HelloWorld { hello }"#
    ))

  public init() {}

  public struct Data: MoviesAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MoviesAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("hello", String?.self),
    ] }

    public var hello: String? { __data["hello"] }
  }
}
