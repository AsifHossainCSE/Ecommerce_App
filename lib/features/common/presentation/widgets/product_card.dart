
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/presentation/screens/product_details_screen.dart';
import 'package:crafty_bay/features/common/presentation/widgets/favourite_button.dart';
import 'package:crafty_bay/features/common/presentation/widgets/rating_view.dart';
import 'package:crafty_bay/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: productModel.id);
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 3,
          shadowColor: AppColors.themeColor.withAlpha(50),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: .only(
                    topRight: .circular(8),
                    topLeft:  .circular(8),
                  ),
                  color: AppColors.themeColor.withAlpha(30),
                  image: DecorationImage(
                    image: NetworkImage(productModel.photo),
                   ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  
                  children: [
                    Text(productModel.title, maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                      '${Constants.takaSign}${productModel.currentPrice}',

                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColor,
                      ),
                    ),
                        RatingView(),
                        FavouriteButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 