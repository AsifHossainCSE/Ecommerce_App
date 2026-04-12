
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  image: AssetImage(AssetPaths.dummyImagePng),
                 ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                
                children: [
                  Text('Nike Shoe RG3434 - New Arrival', maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                    '${Constants.takaSign}234',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.themeColor,
                    ),
                  ),
                      Wrap(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Text('4.5'),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: AppColors.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(Icons.favorite_outline, size: 18,color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}