import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/common/presentation/widgets/favourite_button.dart';
import 'package:crafty_bay/features/common/presentation/widgets/rating_view.dart';
import 'package:crafty_bay/features/product/presentation/providers/product_details_provider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_piker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  static const String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailsProvider.getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (_) => _productDetailsProvider,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: Consumer<ProductDetailsProvider>(
          builder: (context, provider, child) {
            if (provider.getProductDetailsInProgress) {
              return const CenterCircularProgress();
            }

            if (provider.productDetails == null) {
              return Center(
                child: Text(provider.errorMessage ?? 'No Product Found'),
              );
            }

            final product = provider.productDetails!;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductImagelSlider(
                            imageUrls: product.photos,
                          ),

                          const SizedBox(height: 16),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product.title,
                                  style: textTheme.titleMedium,
                                ),
                              ),
                              IncDecButton(
                                maxValue: product.quantity,
                                onChange: (value) {},
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              const RatingView(),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Reviews'),
                              ),
                              const FavouriteButton(),
                            ],
                          ),

                          if (product.colors.isNotEmpty) ...[
                            Text(
                              'Color',
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            ColorPiker(
                              colors: product.colors,
                              onChange: (color) {},
                            ),
                            const SizedBox(height: 16),
                          ],

                          if (product.sizes.isNotEmpty) ...[
                            Text(
                              'Size',
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            SizePiker(
                              sizes: product.sizes,
                              onChange: (size) {},
                            ),
                            const SizedBox(height: 16),
                          ],

                          Text(
                            'Description',
                            style: textTheme.titleMedium,
                          ),

                          const SizedBox(height: 8),

                          Text(
                            product.description,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                _buildPriceAndAddToCartSection(
                  textTheme,
                  product.price,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(
    TextTheme textTheme,
    double price,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(40),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: textTheme.bodyLarge,
              ),
              Text(
                '${Constants.takaSign}$price',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}