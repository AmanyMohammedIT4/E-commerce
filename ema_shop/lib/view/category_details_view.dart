import 'package:ema_shop/constants.dart';
import 'package:ema_shop/core/view_model/home_view_model.dart';
import 'package:ema_shop/model/product_model.dart';
import 'package:ema_shop/view/details_view.dart';
import 'package:ema_shop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsView extends StatelessWidget {
  final String categoryId;
  CategoryDetailsView({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) {
          if (controller.loading.value) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator(color: primaryColor,)),
            );
          } else {
            final filteredData = controller.productModel
                .where((data) => data.productId == categoryId)
                .toList();
            final itemsPerRow = 2; // عدد العناصر في كل صف

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: filteredData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: itemsPerRow,
                    childAspectRatio:2 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return buildItem(context, controller, filteredData[index]);
                  },
                ),
              ),
            );
          }
        },
      ),
    );
 
  }

  Widget buildItem(BuildContext context, HomeViewModel controller, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>DetailsView(
          model:product,
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
            width: MediaQuery.of(context).size.width * .4,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width * .4,
              child: Image.network(
                product.image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 7,),
          CustomText(
            text: product.name!,
            alignment: Alignment.bottomLeft,
            fontSize: 15,
            maxLine: 1,
          ),
          SizedBox(height: 8,),
          CustomText(
            text: product.description!,
            color: Colors.grey,
            alignment: Alignment.bottomLeft,
            fontSize: 15,
            maxLine: 1,
          ),
          SizedBox(height: 8,),
          CustomText(
            text: '\$${product.price!.toString()}',
            color: Colors.blueAccent,
            alignment: Alignment.bottomLeft,
            fontSize: 15,
          ),
        ],
      ),
    );
  }

}