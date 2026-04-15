import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/presentation/Screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategoryScreen.name);
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.themeColor.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.computer,
                size: 32,
                color: AppColors.themeColor,
              ),
            ),
          ),
          Text(
            'Computer',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
              letterSpacing: .6,
            ),
          ),
        ],
      ),
    );
  }
}
