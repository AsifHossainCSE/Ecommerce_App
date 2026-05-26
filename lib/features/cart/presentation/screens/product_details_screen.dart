import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/common/presentation/widgets/favourite_button.dart';
import 'package:crafty_bay/features/common/presentation/widgets/rating_view.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_piker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
         
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: .symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ProductImagelSlider(),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Text(
                                'Nike Shoe A3434 - All New Edition 2026',
                                style: textTheme.titleMedium,
                              ),
                            ),
                            IncDecButton(onChange: (newValue) {}),
                          ],
                        ),
                        Row(
                          children: [
                            RatingView(),
                            TextButton(
                              onPressed: () {},
                              child: Text('Reviews'),
                            ),
                            FavouriteButton(),
                          ],
                        ),
                        Text('Color', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        ColorPiker(
                          colors: ['Black', 'White', 'Red'],
                          onChange: (selectedColor) {},
                        ),
                        const SizedBox(height: 16),
                        Text('Size', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        SizePiker(
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                          onChange: (selectedSize) {},
                        ),
                        Text('Description', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          '''Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.''',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(40),
        borderRadius: .only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Price', style: textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}500',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text('Add to Cart')),
          ),
        ],
      ),
    );
  }
}
