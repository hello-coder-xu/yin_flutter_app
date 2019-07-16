import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends StatefulWidget {
  const MyFutureBuilder({
    Key key,
    this.future,
    this.initialData,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final Future<T> future;

  final AsyncWidgetBuilder<T> builder;

  final T initialData;

  @override
  State<MyFutureBuilder<T>> createState() => _MyFutureBuilderState<T>();
}

class _MyFutureBuilderState<T> extends State<MyFutureBuilder<T>> {
  Object _activeCallbackIdentity;
  AsyncSnapshot<T> _snapshot;

  @override
  void initState() {
    super.initState();
    print('test _MyFutureBuilderState initState');
    _snapshot = AsyncSnapshot<T>.withData(ConnectionState.none, widget.initialData);
    _subscribe();
  }

  @override
  void didUpdateWidget(MyFutureBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('test _MyFutureBuilderState didUpdateWidget');
    if (oldWidget.future != widget.future) {
      if (_activeCallbackIdentity != null) {
        _unsubscribe();
        _snapshot = _snapshot.inState(ConnectionState.none);
      }
      _subscribe();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('test _MyFutureBuilderState build');
    return widget.builder(context, _snapshot);
  }

  @override
  void dispose() {
    print('test _MyFutureBuilderState dispose');
    _unsubscribe();
    super.dispose();
  }

  void _subscribe() {
    print('test _MyFutureBuilderState _subscribe widget.future=${widget.future}');
    if (widget.future != null) {
      final Object callbackIdentity = Object();
      _activeCallbackIdentity = callbackIdentity;
      widget.future.then<void>((T data) {
        print('test _MyFutureBuilderState _subscribe widget.future=$data');
        if (_activeCallbackIdentity == callbackIdentity) {
          setState(() {
            _snapshot = AsyncSnapshot<T>.withData(ConnectionState.done, data);
          });
        }
      }, onError: (Object error) {
        if (_activeCallbackIdentity == callbackIdentity) {
          setState(() {
            _snapshot = AsyncSnapshot<T>.withError(ConnectionState.done, error);
          });
        }
      });
      _snapshot = _snapshot.inState(ConnectionState.waiting);
    }
  }

  void _unsubscribe() {
    print('test _MyFutureBuilderState _unsubscribe');
    _activeCallbackIdentity = null;
  }
}
