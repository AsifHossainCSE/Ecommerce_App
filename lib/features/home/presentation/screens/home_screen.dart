import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/category/presentation/providers/category_list_provider.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bay/features/common/presentation/widgets/category_card.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/common/presentation/widgets/product_card.dart';
import 'package:crafty_bay/features/home/presentation/provider/home_slider_provider.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
          
            children: [
              ProductSearchField(),
              const SizedBox(height: 16),
              Consumer<HomeSliderProvider>(
                builder: (context, homeSliderProvider, _) {
                  if (homeSliderProvider.getHomeSlidersInProgress){
                    return SizedBox(
                      height: 200,
                      child: CenterCircularProgress());
                  } 
                  if (homeSliderProvider.homeSliders.isEmpty){
                    return SizedBox(
                      height: 200,
                      child: Center(child: Text('No sliders found')));
                    
                  }
                  return HomeCarouselSlider(
                    sliders: homeSliderProvider.homeSliders,
                  );
                }
              ),
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
              _buildPopularProductList(),
              SectionHeader(title: 'Special', onTapSeeAll: () {
                
              }),
              _buildPopularProductList(),
              SectionHeader(title: 'New Arrivals', onTapSeeAll: () {
                
              }),
              _buildPopularProductList(),
           
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
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
              height: 110,
              child: Consumer<CategoryListProvider>(
                builder: (context, categoryListProvider, _) {

                  if (categoryListProvider.initialLoading){
                    return CenterCircularProgress();
                  }
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryListProvider.categoryList.length>10? 10: categoryListProvider.categoryList.length,
                    itemBuilder: (context, index) {
                     return CategoryCard(categoryModel: categoryListProvider.categoryList[index],);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                  );
                }
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
 

 