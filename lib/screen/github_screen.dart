import 'package:flutter/material.dart';
import 'package:github_repos/store/github_store.dart';
import 'package:github_repos/widgets/loading_indicator.dart';
import 'package:github_repos/widgets/repository_list_view.dart';
import 'package:github_repos/widgets/show_error.dart';
import 'package:github_repos/widgets/user_input.dart';

class GithubScreen extends StatefulWidget {
  const GithubScreen({Key? key}) : super(key: key);

  @override
  State<GithubScreen> createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
  final GithubStore store = GithubStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repos'),
      ),
      body: Column(
        children: <Widget>[
          UserInput(store),
          ShowError(store),
          LoadingIndicator(store),
          RepositoryListView(store)
        ],
      ),
    );
  }
}
