
import 'package:ema_shop/core/view_model/home_view_model.dart';
import 'package:ema_shop/model/best_selling_product_model.dart';
import 'package:ema_shop/model/product_model.dart';
import 'package:ema_shop/view/best_selling_details_view.dart';
import 'package:ema_shop/view/category_details_view.dart';
import 'package:ema_shop/view/details_view.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
 
String searchText='';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init:HomeViewModel(),
      builder:(controller) =>controller.loading.value 
       ? Center(child: CircularProgressIndicator())
       : SafeArea(
         child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20,left: 20.0,right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _searchTextFormField(),
                   SizedBox(height: 20,),
                  Text('Categories',
                    style: TextStyle(fontSize: 15,),),
                    SizedBox(height: 30,),
                    _listViewCategory(),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   Text('Best Selling',
                   style: TextStyle(fontSize: 15,),),
                   Text('See all',
                   style: TextStyle(fontSize: 13,),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  _listViewBestProducts(controller.productModel),
                  
                  // SizedBox(height: 15.0,),
                  // Text("Products",
                  //     style: TextStyle(fontSize: 15,),),
                  // SizedBox(height: 15.0,),
                  // _listViewProducts(controller.productModel),
                ],
              ),
            ),
          ),
          
             ),
       ),
    );
  }
  
 Widget _searchTextFormField() {
  return  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,color: Colors.black,)
                  ),
                  onChanged: (value) {
                    searchText = value;
                    // حدث قيمة searchText في صنف HomeView عند تغييرها
                    Get.find<HomeViewModel>().updateSearchText(value);
                  },
              ),
            );
 }
 
 Widget _listViewCategory() {
  return   GetBuilder<HomeViewModel>(
    builder:(controller)=> Container(
                height: 120,
                child: ListView.separated(
                  itemCount: controller.categoryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                         Get.to(()=>CategoryDetailsView(categoryId: controller.categoryModel[index].categoryId!,
                        ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(controller.categoryModel[index].image!),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(controller.categoryModel[index].name!,
                          style: TextStyle(fontSize: 15,),),
                        ],
                      ),
                    );
                  }, separatorBuilder: (context,index)=>SizedBox(width: 20,),
                ),
              ),
  );
 }

 Widget _listViewBestProducts(List<ProductModel> bestproducts) {
    List<ProductModel> filteredProducts = [];

    if (searchText.isNotEmpty) {
      filteredProducts = bestproducts.where((product) =>
          product.name!.toLowerCase().contains(searchText.toLowerCase())).toList();
    } else {
      filteredProducts = bestproducts;
    }

    return Container(
      height: 250,
      child: ListView.separated(
        itemCount: filteredProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: () {
            //   Get.to(() => BestSellingDetailsView(
            //     model: filteredProducts[index],
            //   ));
            // },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100
                    ),
                    width: MediaQuery.of(context).size.width * .4,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.network(
                          filteredProducts[index].image!,
                          fit: BoxFit.fill,)),
                  ),

                  SizedBox(height: 7,),
                CustomText(
                    text: filteredProducts[index].name!,
                    alignment: Alignment.bottomLeft,
                    fontSize: 15,
                    maxLine: 1,
                  ),

                  SizedBox(height: 8,),
                  Expanded(
                    child: CustomText(
                      text: filteredProducts[index].description!,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      fontSize: 15,
                      maxLine: 1,
                    ),
                  ),

                  SizedBox(height: 8,),
                  CustomText(
                    text: '\$${filteredProducts[index].price!.toString()}',
                    color: Colors.blueAccent,
                    alignment: Alignment.bottomLeft,
                    fontSize: 15,),
                ],
              ),
            ),
          );
        }, separatorBuilder: (context, index) => SizedBox(width: 20,),
      ),
    );
  }

 Widget _listViewProducts(List<ProductModel> bestproducts) {
    List<ProductModel> filteredProducts = [];

    if (searchText.isNotEmpty) {
      filteredProducts = bestproducts.where((product) =>
          product.name!.toLowerCase().contains(searchText.toLowerCase())).toList();
    } else {
      filteredProducts = bestproducts;
    }

    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: filteredProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => DetailsView(
                model: filteredProducts[index],
              ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100
                    ),
                    width: MediaQuery.of(context).size.width * .4,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.network(
                          filteredProducts[index].image!,
                          fit: BoxFit.fill,)),
                  ),

                  SizedBox(height: 7,),
                CustomText(
                    text: filteredProducts[index].name!,
                    alignment: Alignment.bottomLeft,
                    fontSize: 15,
                    maxLine: 1,
                  ),

                  SizedBox(height: 8,),
                  Expanded(
                    child: CustomText(
                      text: filteredProducts[index].description!,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      fontSize: 15,
                      maxLine: 1,
                    ),
                  ),

                  SizedBox(height: 8,),
                  CustomText(
                    text: '\$${filteredProducts[index].price!.toString()}',
                    color: Colors.blueAccent,
                    alignment: Alignment.bottomLeft,
                    fontSize: 15,),
                ],
              ),
            ),
          );
        }, 
      ),
    );
  }

}


