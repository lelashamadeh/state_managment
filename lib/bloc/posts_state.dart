
// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

sealed class  PostsState extends Equatable {
  const PostsState();
  
  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}


class Loading extends PostsState {}

class SuccessToFetchPosts extends PostsState {
 final PostsModel result;
  SuccessToFetchPosts({
    required this.result,
  });
}