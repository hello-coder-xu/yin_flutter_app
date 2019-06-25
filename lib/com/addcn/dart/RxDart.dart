import 'package:rxdart/rxdart.dart';

void main() {
//  Observable<String> observable = Observable(Stream.fromIterable(["hello", "world", "yes", "haha", "good", "hao"]));

//  observable.every((item) => item.length > 4).asObservable().listen(print);
//  observable.any((item) => item.length > 4).asObservable().listen(print);
//  observable.firstWhere((item) => item.length < 4).asObservable().listen(print);
//  observable.lastWhere((item) => item.length < 4).asObservable().listen(print);
//  observable.take(3).asBroadcastStream().listen(print);
//  observable.takeWhile((item) => item.length > 4).asBroadcastStream().listen(print);
//  observable.where((item) => item.length < 4).asBroadcastStream().listen(print);

//  Observable<String> observable = Observable.fromFuture(Future.value("hello"));
//  Observable<String> observable = Observable.fromIterable(["hello", "world"]);
//  Observable<String> observable = Observable.just("hello");
//  Observable<String> observable = Observable.periodic(Duration(seconds: 3), (x) => x.toString()); //间隔3秒 重复执行
//  Observable observable = Observable.merge([
//    Stream.fromIterable(["hello", "world"]),
//    Stream.fromIterable([1, 2, 3]),
//    Stream.fromIterable([false, true]),
//  ]);
//  Observable observable = Observable.concat([
//    Stream.fromIterable(["hello", "world"]),
//    Stream.fromIterable([1, 2, 3]),
//    Stream.fromIterable([false, true]),
//  ]);
//
//  observable.listen(print);

//  PublishSubject<String> publishSubject = PublishSubject<String>();
//  publishSubject.listen((data) => print("publishSubject 1:$data"));
//  publishSubject.add("hello");
//  publishSubject.listen((data) => print("publishSubject 2:${data.toUpperCase()}"));
//  publishSubject.add("world");
//  publishSubject.close();

  BehaviorSubject<String> behaviorSubject = BehaviorSubject<String>();
  behaviorSubject.add("hello");
  behaviorSubject.add("world");
  behaviorSubject.listen((data) => print("behaviorSubject 1:$data"));
  behaviorSubject.listen((data) => print("behaviorSubject 2:${data.toUpperCase()}"));
  behaviorSubject.add("hao");
  behaviorSubject.close();
}
