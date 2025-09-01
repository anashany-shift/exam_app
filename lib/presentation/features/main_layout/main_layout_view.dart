import 'package:exam_app/core/utils/app_assets.dart';
import 'package:exam_app/core/utils/app_colors.dart';
import 'package:exam_app/presentation/features/main_layout/profile/view/profile_view.dart';
import 'package:exam_app/presentation/features/main_layout/result/view/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'explore/view/explore_view.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int currentPageIndex = 0;
  late final PageController pageController;

  @override
  void initState() {

      pageController = PageController(initialPage: currentPageIndex);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0,right: 16,left: 16),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged:onPageChanged,

            children: const <Widget>[ExploreView(), ResultView(), ProfileView()],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        backgroundColor: AppColors.lightBlue,
        selectedIndex: currentPageIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset(AppAssets.iconHome),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AppAssets.iconResult),
            label: 'Result',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AppAssets.iconProfile)  ,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
      pageController.jumpToPage(index);
    });
  }
  onPageChanged(value) {
  setState(() {
  currentPageIndex = value;
  });
  }
}
