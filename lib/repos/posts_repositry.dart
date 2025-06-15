
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlproject/graphql/posts_service.dart';
import 'package:graphqlproject/model/posts_model.dart';

class PostsRepositry {
PostsService graphql;
  PostsRepositry({
    required this.graphql,
  });


 Future<PostsModel> fetchPostFromEveryWhere()async{
  try{
    await graphql.initCleint();
    return await graphql.fetchPosts(1);
  }catch (e){
    print("Trying REST API");
    return await graphql.fetchPostsFromRest(1);
  }
  

    // ! add jsonplaceholder to get data using Dio 
    
  }

}