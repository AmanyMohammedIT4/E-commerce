

class CartProductModel{
  String? name,image,price,productId;
  int? quantity;
  CartProductModel({this.productId,this.quantity,this.image,this.name,this.price});


  CartProductModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return;
     }
  name=map['name'];
  image=map['image'];
  price=map['price'].toString();
  quantity = map['quantity'] is String ? int.parse(map['quantity']) : map['quantity'];
  productId=map['productId'];
}

  toJson(){
    return{
      'name':name,
      'image':image,
      'price':price,
      'quantity':quantity.toString(),
      'productId':productId
    };
  }
}