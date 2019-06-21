class Book {
  String name;
  int price;

  Book(this.name, this.price);

  Book.price(this.price);


  get carPrice=>Car("宝马").price;

}

class Car {
  final String name;
  int price;

  bool mute = false;

  static final Map<String, Car> _cashe = <String, Car>{};

  factory Car(String name) {
    if (_cashe.containsKey(name)) {
      return _cashe[name];
    } else {
      final car = new Car._internal(name);
      _cashe[name] = car;
      return car;
    }
  }

  Car._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(name + ":" + msg);
    }
  }
}

void main() {
  var book = Book.price(12);
//  book.name = "Dart";
//  print('name=${book.name}');

  var car = Car("宝马");
  car.price=190;
  car.log("1573");
  print('price=${book.carPrice}');

  var car1 = Car("宝马");
  assert(car1.price==190);

}
