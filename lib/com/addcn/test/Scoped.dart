library scoped_model;

import 'dart:async';
import 'package:flutter/material.dart';

abstract class Model extends Listenable {
  final Set<VoidCallback> _listeners = Set<VoidCallback>();
  int _version = 0;
  int _microtaskVersion = 0;

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  int get listenerCount => _listeners.length;

  @protected
  void notifyListeners() {
    if (_microtaskVersion == _version) {
      _microtaskVersion++;
      scheduleMicrotask(() {
        _version++;
        _microtaskVersion = _version;

        _listeners.toList().forEach((VoidCallback listener) => listener());
      });
    }
  }
}

@deprecated
class ModelFinder<T extends Model> {
  T of(BuildContext context, {bool rebuildOnChange: false}) {
    return ScopedModel.of<T>(context, rebuildOnChange: rebuildOnChange);
  }
}

class ScopedModel<T extends Model> extends StatelessWidget {
  final T model;
  final Widget child;

  ScopedModel({@required this.model, @required this.child})
      : assert(model != null),
        assert(child != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: model,
      builder: (context, _) => _InheritedModel<T>(model: model, child: child),
    );
  }

  static T of<T extends Model>(
    BuildContext context, {
    bool rebuildOnChange = false,
  }) {
    final Type type = _type<_InheritedModel<T>>();

    Widget widget =
        rebuildOnChange ? context.inheritFromWidgetOfExactType(type) : context.ancestorWidgetOfExactType(type);

    if (widget == null) {
      throw new ScopedModelError();
    } else {
      return (widget as _InheritedModel<T>).model;
    }
  }

  static Type _type<T>() => T;
}

class _InheritedModel<T extends Model> extends InheritedWidget {
  final T model;
  final int version;

  _InheritedModel({Key key, Widget child, T model})
      : this.model = model,
        this.version = model._version,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedModel<T> oldWidget) => (oldWidget.version != version);
}

typedef Widget ScopedModelDescendantBuilder<T extends Model>(
  BuildContext context,
  Widget child,
  T model,
);

class ScopedModelDescendant<T extends Model> extends StatelessWidget {
  final ScopedModelDescendantBuilder<T> builder;

  final Widget child;

  final bool rebuildOnChange;

  ScopedModelDescendant({
    @required this.builder,
    this.child,
    this.rebuildOnChange = true,
  });

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      child,
      ScopedModel.of<T>(context, rebuildOnChange: rebuildOnChange),
    );
  }
}

class ScopedModelError extends Error {
  ScopedModelError();

  String toString() {
    return '''Error: Could not find the correct ScopedModel.
    
To fix, please:
          
  * Provide types to ScopedModel<MyModel>
  * Provide types to ScopedModelDescendant<MyModel> 
  * Provide types to ScopedModel.of<MyModel>() 
  * Always use package imports. Ex: `import 'package:my_app/my_model.dart';
  
If none of these solutions work, please file a bug at:
https://github.com/brianegan/scoped_model/issues/new
      ''';
  }
}
