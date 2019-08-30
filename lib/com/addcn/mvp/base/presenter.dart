
import 'package:flutter_app/com/addcn/mvp/base/model.dart';
import 'package:weui/toast/index.dart';

class Presenter  {
  final Model model;
  Function close;

  Presenter({this.model});

  @override
  hideLoading() {
    if (close is Function) close();
  }

  @override
  showLoading({message = '加载中...'}) {
    if (model is Model) {
      close = WeToast.loading(model.context)(message: message);
    }
  }
}
