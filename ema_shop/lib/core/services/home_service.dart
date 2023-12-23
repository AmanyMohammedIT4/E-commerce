import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{

  final CollectionReference _categoryCollectionRef=
  FirebaseFirestore.instance.collection('Categories');

 final CollectionReference _bestproductCollectionRef=
  FirebaseFirestore.instance.collection('BestSelling');

 final CollectionReference _productCollectionRef=
  FirebaseFirestore.instance.collection('Products');
  
  Future<List<QueryDocumentSnapshot<dynamic>>> getCategory()async{
    var value= await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot<dynamic>>> getProducts()async{
    var value= await _productCollectionRef.get();

    return value.docs;
  }
 Future<List<QueryDocumentSnapshot<dynamic>>> getBestSelling()async{
    var value= await _bestproductCollectionRef.get();

    return value.docs;
  }
  Future<List<QueryDocumentSnapshot<dynamic>>> getCategoryProduct()async{
    var value= await _productCollectionRef.get();

    return value.docs;
  }
}