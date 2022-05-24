import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_repos/store/github_store.dart';
import 'package:mobx/mobx.dart';

class ShowError extends StatelessWidget {
  const ShowError(this.store, {Key? key}) : super(key: key);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => store.fetchReposFuture.status == FutureStatus.rejected
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.warning,
                    color: Colors.deepOrange,
                  ),
                  Container(
                    width: 8,
                  ),
                  const Text(
                    'Failed to fetch repos for',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                  Text(
                    store.user,
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            : Container(),
      );
}
