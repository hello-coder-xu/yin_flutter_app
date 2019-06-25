class VariableDart {}

void main() {
  //String转int
  int one = int.parse("1");
  assert(one == 1);

  //String转double
  double two = double.parse("1.1");
  assert(two == 1.1);

  //double转String
  String three = 1.toString();
  assert(three == "1");

  //double转String
  String four = 1.2.toString();
  assert(four == "1.2");

  //取小数点后2位数(四舍五入)
  String five = 12.185421.toStringAsFixed(2);
  assert(five == "12.19");

//  String value = r"this is \n string \t value";

  String key;
  String value = key ??= "test";
  assert(key == "test");

  var list = List<String>();
  var list1 = ["1", "2"];
  var list2 = <String>["1", "2"];
  var list3 = List<String>(2);

//  list3.add("3");
//  list3[0]="3";
  list3 = ["3", "4"];
  const list4 = ["1", "2"];
//  list4 = ["3", "4"];

  var map = Map<String, int>();
  var map1 = {"key": "value"};
  var map2 = const {"key": "value"};
  var map3 = Map.from({"key": "value"});

  var map4 = const {"key": "value"};
//  map4["key"]="test";
  map4 = {"key1": "value1"};
  const map5 = {"key": "value"};

  var set = Set<String>();
  var set1 = Set.from(["one", "two"]);

  var listData = ["1", "2", 3, 4, false, "value", 5, 6];
  var mapData = {"one": "1", "two": "2", "three": 3, "four": 5, "five": false, "six": "value"};
  var setData = Set.from(["1", "2", 3, 4, false, "value"]);

  // 新增
  listData.add("test");
  listData.insert(1, "value");
  mapData["key"] = "test";
  setData.add("test");

  // 联级操作
  listData..add("test")..add(false)..add(100);
  setData..add("test")..add(false)..add(100);
  // 查找

  //截取数组
  listData.sublist(0, 3);
  //截取区间数组
  listData.getRange(2, 4);
  //保留符合条件数据，其他全部删除
  listData.retainWhere((it) => it.toString().length == 1);
  //遍历
  listData.forEach((it) => print(it));
  //遍历数组，返回第一个满足条件的对象，如果没有一个满足条件的数据就返回orElse的方法
  var meetFirst = listData.firstWhere((it) => it == "1", orElse: () => null);
  assert(meetFirst != null);
  //遍历数组，返回最后一个满足条件的对象，如果没有一个满足条件的数据就返回orElse的方法
  var meetLast = listData.lastWhere((it) => it == "1", orElse: () => null);
  assert(meetLast != null);
  //返回所有满足条件的数据,没有一个满足条件，则返回一个空数组
  var meetAllList = listData.where((it) => it.toString().length == 10);
  assert(meetAllList != null);
  //遍历数组，只要有一个满足条件就返回ture,否则false
  bool has = listData.any((it) => it == "1");
  assert(has);
  //遍历数组，所有数据都满足条件返回ture，否则false
  bool meet = listData.every((it) => it.toString().length == 1);
  assert(meet);
  //取前面多少个元素放入新数组中
  var newList = listData.take(3).toList();
  assert(newList[0] == "1");
  //取满足条件放入新的数组中
  var newMeetList = listData.takeWhile((it) => it.toString().length == 1);
  newMeetList.forEach((it) => print(it));

  // 更新
  //更新连续区域的数据
  listData.setRange(0, 2, ["11", "12"]);
  listData.replaceRange(0, 2, ["11", "12"]);
  listData.fillRange(0, 2, ["11", "12"]);

  // 删除
  listData.remove("value");
  //删除指定位置数据
  listData.removeAt(3);
  //删除最后一个数据
  listData.removeLast();
  //删除指定区域数据
  listData.removeRange(2, 4);
  //删除满足条件的数据
  listData.removeWhere((it) => it.toString().length == 1);

  // 其他
  //根据字符的长度排序
  listData.sort((a, b) => a.toString().length.compareTo(b.toString().length));
  //倒序
  listData.reversed;
  //list 转 map
  var listMap = listData.asMap();
  //打乱顺序
  listData.shuffle();

}
