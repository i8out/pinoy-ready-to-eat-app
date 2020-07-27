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
  String color;
  String rating;

  Store({
      this.iD = '',
      this.storeName = '',
      this.proprietor = '',
      this.mobileNo = '',
      this.address1 = '',
      this.address2 = '',
      this.openingTime = '',
      this.closingTime = '',
      this.image = '',
      this.color = '',
      this.rating = '',});

  Store.fromJson(dynamic json) {
    this.iD = json['iD'];
    this.storeName = json['storeName'];
    this.proprietor = json['proprietor'];
    this.mobileNo = json['mobileNo'];
    this.address1 = json['address1'];
    this.address2 = json['address2'];
    this.openingTime = json['openingTime'];
    this.closingTime = json['closingTime'];
    this.image = json['image'];
    this.color = json['color'];
    this.rating = json['rating'];
  }
}
