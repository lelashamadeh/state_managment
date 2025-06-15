
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlproject/graphql/gql_posts.dart';
import 'package:graphqlproject/model/posts_model.dart';

class PostsService {
 late GraphQLClient cleint ;
//  HttpLink url = HttpLink(dotenv.env['URL']!);
late HttpLink url;

 initCleint()async{
 var response= await Dio().get(dotenv.env["URL"]!);
 url =HttpLink( response.data['graphQlEndpoint']);
  cleint = GraphQLClient(
    link: url,
    cache: GraphQLCache(store: HiveStore(),),
    );
 }

 Future<PostsModel> fetchPosts(int id)async{
  QueryResult result =    await cleint.query(
    QueryOptions(
      document: gql(gql_posts,),
      variables: {
    "id":id
  }),
  );

   if (result.hasException || result.data == null) {
      throw Exception("GraphQL Error: ${result.exception}");
    }

  print(
    result.data!['post']
  );
  PostsModel post = PostsModel.fromMap(result.data!['post']);

  return post;
  }
Future<PostsModel> fetchPostsFromRest(int id) async{
  final baseUrl =dotenv.env["REST_URL"];

  if (baseUrl == null) {
      throw Exception("REST_URL not found in .env");
    }

    final url = "$baseUrl/posts/$id";
    print("Fetching from: $url");
    
  final response = await Dio().get(url);

   if (response.statusCode == 200) {
      return PostsModel(
        title: response.data["title"],
        body: response.data["body"],
      );
    } else {
      throw Exception("Failed to load from REST API");
    }
    
  }
}

