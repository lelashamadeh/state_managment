
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlproject/model/posts_model.dart';
import 'package:graphqlproject/repos/posts_repositry.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepositry repositry;
  PostsBloc(
    this.repositry,
  ) : super(PostsInitial()) {
    on<FetchPosts>((event, emit)async {
      emit(Loading());
      var data = await repositry.fetchPostFromEveryWhere();
      emit(SuccessToFetchPosts(result: data));
    });
  }
}