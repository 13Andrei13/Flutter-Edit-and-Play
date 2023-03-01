import 'dart:async';

import 'package:am_proiect/init/init.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    final List<FutureOr<Store<AppState>>?> result =
        await ConcatStream<FutureOr<Store<AppState>>?>(<Stream<FutureOr<Store<AppState>>?>>[
      init().asStream(),
      Future<FutureOr<Store<AppState>>?>.delayed(const Duration(seconds: 5)).asStream(),
    ]).toList();

    _completer //
        .complete(result[0]);
  }

  Future<Store<AppState>> get future => _completer.future;
}
