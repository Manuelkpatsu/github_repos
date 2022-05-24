import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_repos/store/github_store.dart';

class RepositoryListView extends StatelessWidget {
  const RepositoryListView(this.store, {Key? key}) : super(key: key);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Observer(
          builder: (_) {
            if (!store.hasResults) {
              return Container();
            }

            if (store.repositories.isEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('We could not find any repos for user: '),
                  Text(
                    store.user,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }

            return ListView.builder(
              itemCount: store.repositories.length,
              itemBuilder: (_, int index) {
                final repo = store.repositories[index];

                return ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                        repo.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(' (${repo.stargazersCount} ⭐️)'),
                    ],
                  ),
                  subtitle: Text(repo.description),
                );
              },
            );
          },
        ),
      );
}
