class Meal {
  String iD;
  String name;
  String storeId;
  String price;
  int orderQty;
  String monthStatistic;
  String image;

  Meal({
    this.iD = '',
    this.name = '',
    this.storeId = '',
    this.price = '',
    this.orderQty = 0,
    this.monthStatistic = '',
    this.image = '',
  });

  Meal.fromJson(dynamic json) {
    this.iD = json['iD'];
    this.name = json['name'];
    this.storeId = json['storeId'];
    this.price = json['price'];
    this.orderQty = json['orderQty'];
    this.monthStatistic = json['monthStatistic'];
    this.image = json['image'];
  }
}
