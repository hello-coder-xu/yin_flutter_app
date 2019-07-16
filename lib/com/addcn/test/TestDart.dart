import 'dart:async';

void main(){


  StreamController streamController=new StreamController();
  Stream stream=streamController.stream;


  stream.listen((value){
    print(value);
  });

  streamController.add("1");
  streamController.add("2");
  streamController.add("3");
  streamController.add("4");

  streamController.close();
}