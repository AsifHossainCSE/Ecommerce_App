import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImagelSlider extends StatefulWidget {
  const ProductImagelSlider({super.key});

  @override
  State<ProductImagelSlider> createState() => _ProductImagelSliderState();
}

class _ProductImagelSliderState extends State<ProductImagelSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {        
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.withAlpha(50),
                  alignment: .center,
                  child: Text('Image $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, selectedIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0; i<5; i++)
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: i == selectedIndex ? AppColors.themeColor: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}
