void main() {
  int num = 100;
  setNum(num);
  print("$num");


  Goods goods=new Goods(100);
  setGoodsPrice(goods);
  print('${goods.price}');
}

setNum(int index) {
  index += 100;
}


class Goods{
  int price;
  Goods(this.price);
}

setGoodsPrice(Goods bean){
  bean.price=200;
}

