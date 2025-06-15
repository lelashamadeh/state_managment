
String gql_posts = """
query {
  post(id: \$id) {
    title
    body
  }
}
""";