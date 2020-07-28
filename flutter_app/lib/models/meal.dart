class Meal {
  String iD;
  String name;
  String storeId;
  String price;
  int orderQty;
  String monthStatistic;
  String image;
  String rating;
  String available;

  Meal({
    this.iD = '',
    this.name = '',
    this.storeId = '',
    this.price = '',
    this.orderQty = 0,
    this.monthStatistic = '',
    this.image = '',
    this.rating = '',
    this.available,
  });

  Meal.fromJson(dynamic json) {
    this.iD = json['iD'];
    this.name = json['name'];
    this.storeId = json['storeId'];
    this.price = json['price'];
    this.orderQty = json['orderQty'];
    this.monthStatistic = json['monthStatistic'];
    this.image = json['image'];
    this.rating = json['rating'];
    this.available = json['available'];
  }
}
