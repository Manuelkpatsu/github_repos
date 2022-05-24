import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_repos/store/github_store.dart';
import 'package:mobx/mobx.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(this.store, {Key? key}) : super(key: key);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => store.fetchReposFuture.status == FutureStatus.pending
            ? const LinearProgressIndicator()
            : Container(),
      );
}
