// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct MovieInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<ID> = nil,
    title: String,
    year: String,
    genre: String,
    poster: String
  ) {
    __data = InputDict([
      "id": id,
      "title": title,
      "year": year,
      "genre": genre,
      "poster": poster
    ])
  }

  public var id: GraphQLNullable<ID> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var title: String {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }

  public var year: String {
    get { __data["year"] }
    set { __data["year"] = newValue }
  }

  public var genre: String {
    get { __data["genre"] }
    set { __data["genre"] = newValue }
  }

  public var poster: String {
    get { __data["poster"] }
    set { __data["poster"] = newValue }
  }
}
