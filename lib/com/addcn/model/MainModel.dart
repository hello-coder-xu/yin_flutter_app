
import 'package:flutter_app/com/addcn/model/ContainerPageModel.dart';
import 'package:flutter_app/com/addcn/model/MainTabPageModel.dart';
import 'package:flutter_app/com/addcn/model/ScopedPageModel.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with MainTabPageModel, ContainerPageModel, ScopedPageModel {
  MainModel of(context) => ScopedModel.of<MainModel>(context);
}
