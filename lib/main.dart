import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlproject/bloc/posts_bloc.dart';
import 'package:graphqlproject/graphql/posts_service.dart';
import 'package:graphqlproject/repos/posts_repositry.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  await dotenv.load(fileName: ".env");
  
  runApp(DevicePreview(enabled: !kReleaseMode,
    builder: (context) => MyApp() ) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostsBloc(PostsRepositry(graphql: PostsService()))..add(FetchPosts()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return CircularProgressIndicator();
                  }
                  if (state is PostsInitial) {
                    return CircularProgressIndicator();
                  }
                  state as SuccessToFetchPosts;
                  return ListTile(title: Text(state.result.title),subtitle: Text(state.result.body),);
                },
              ),
            ),
          );
        }
      ),
    );
  }
}