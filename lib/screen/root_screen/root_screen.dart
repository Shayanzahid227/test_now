import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_now/core/constant/colors.dart';
import 'package:test_now/core/constant/text_style.dart';
import 'package:test_now/core/widgets/search_bar.dart' hide SearchBar;
import 'dart:ui';

import 'package:test_now/screen/root_screen/root_screen_view_model.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RootScreenViewModel(),
      child: Consumer<RootScreenViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: whiteColor,
            body: Stack(
              children: [
                Positioned.fill(
                  child: viewModel.screens[viewModel.currentIndex],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 8.0,
                          ),
                          child: CustomSearchBar(),
                        ),
                        CustomBottomBar(viewModel: viewModel),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final RootScreenViewModel viewModel;
  const CustomBottomBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.9;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey.shade300, secondColor, thirdColor],
            ),
            borderRadius: BorderRadius.circular(296.0),
            border: Border.all(color: rootTabColor, width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(viewModel.items.length, (index) {
              return _BottomBarItem(
                item: viewModel.items[index],
                isSelected: viewModel.currentIndex == index,
                onTap: () => viewModel.currentIndex = index,
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final BottomBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = ternaryColor;
    final Color unselectedColor = secondaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(296.0),
          color: isSelected ? rootTabColor : transparentColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              item.icon,
              height: 28,
              width: 28,
              color: isSelected ? selectedColor : unselectedColor,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: style12.copyWith(
                color: isSelected ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
