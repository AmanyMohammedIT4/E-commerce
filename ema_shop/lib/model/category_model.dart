class CategoryModel{
  String? name,image,categoryId;

  CategoryModel({this.image,this.name});

  CategoryModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return;
    }
    image=map['image'];
    name=map['name'];
    categoryId=map['categoryId'];
  }
  toJson(){
    return {
      'image':image,
      'name':name,
      'categoryId':categoryId
    };
  }
}