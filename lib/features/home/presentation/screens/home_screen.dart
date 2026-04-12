import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bay/features/common/presentation/widgets/product_card.dart';
import 'package:crafty_bay/features/home/presentation/widgets/circle_icon_button.dart';
import 'package:crafty_bay/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/presentation/widgets/product_search_field.dart';
import 'package:crafty_bay/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
          
            children: [
              ProductSearchField(),
              const SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(title: 'Categories', onTapSeeAll: () {
                context.read<MainNavContainerProvider>().changeToCategories();
              }),
              const SizedBox(height: 16),
              _buildCategoryList(),
              const SizedBox(height: 16),
              SectionHeader(title: 'Popular', onTapSeeAll: () {
                
              }),
              const SizedBox(height: 16),
              _buildPopularProductList()
           
            ],
          ),
        ), 
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SizedBox(
              height: 200,   
              child: ListView.builder(
                scrollDirection: .horizontal,
                itemCount: 10,
                itemBuilder: (context, index){
                return ProductCard();
              }),
            );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
              height: 110,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CategoryCard();
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 12),
              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.logoNavSvg),
      actions: [
        CircleIconButton(onTap: () {}, icon: Icons.person),
        const SizedBox(width: 4),
        CircleIconButton(onTap: () {}, icon: Icons.call),
        const SizedBox(width: 4),
        CircleIconButton(
          onTap: () {},
          icon: Icons.notifications_active_outlined,
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
 

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
