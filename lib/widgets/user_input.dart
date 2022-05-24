import 'package:flutter/material.dart';
import 'package:github_repos/store/github_store.dart';

class UserInput extends StatelessWidget {
  const UserInput(this.store, {Key? key}) : super(key: key);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                onSubmitted: (String user) {
                  store.setUser(user);
                  store.fetchRepos();
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: store.fetchRepos,
          )
        ],
      );
}
