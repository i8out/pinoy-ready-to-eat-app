class Store {
  String iD;
  String storeName;
  String proprietor;
  String mobileNo;
  String address1;
  String address2;
  String openingTime;
  String closingTime;
  String image;

  Store(this.iD, this.storeName, this.proprietor, this.mobileNo, this.address1,
      this.address2, this.openingTime, this.closingTime, this.image);

  factory Store.fromJson(dynamic json) {
    return Store(
      json['iD'] as String,
      json['storeName'] as String,
      json['proprietor'] as String,
      json['mobileNo'] as String,
      json['address1'] as String,
      json['address2'] as String,
      json['openingTime'] as String,
      json['closingTime'] as String,
      json['image'] as String,
    );
  }
}
