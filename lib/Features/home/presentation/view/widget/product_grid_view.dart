import 'package:flutter/material.dart';
import 'package:stellar_shop/Features/home/data/model/product_model.dart';
import 'package:stellar_shop/Features/home/presentation/view/widget/build_product_item.dart';


class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.model,});

  final ProductModel model;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.1/ 4.0,
      ),
      itemCount: model.items!.length,
      itemBuilder: (context, index) {
        return BuildProductItem(
          image: model.items![index].coverPictureUrl!,
          name: model.items![index].name!,
          description: model.items![index].description!,
          price: model.items![index].price?.toString() ?? "0.0",
          id: model.items![index].id!,
        );
      },
    );
  }
}
