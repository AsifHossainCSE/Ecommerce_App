import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Card(
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(50),
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              AssetPaths.dummyImagePng,
              height: 90,
              width: 70,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nike KH3434 - New arrival shoe',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodyLarge?.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              'Color: Black Size: XL',
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    
                    children: [
                      Text(
                        '${Constants.takaSign}100',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColor,
                        ),
                      ),
                      IncDecButton(onChange: (int value) {  },)
                    
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
