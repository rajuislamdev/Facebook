import 'package:facebook/core/utils/app_colors.dart';
import 'package:facebook/gen/assets.gen.dart';
import 'package:facebook/presentation/friend/view/friend_page.dart';
import 'package:facebook/presentation/home/view/home_page.dart';
import 'package:facebook/presentation/message/view/message_page.dart';
import 'package:facebook/presentation/people/view/people_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);

    _tabController.addListener(() {
      _pageController.animateToPage(
        _tabController.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.appLogo.image(),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          dividerColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),

          tabs: [
            Tab(icon: SvgPicture.asset(Assets.svgs.home)),
            Tab(icon: SvgPicture.asset(Assets.svgs.friend)),
            Tab(icon: SvgPicture.asset(Assets.svgs.comment)),
            Tab(icon: SvgPicture.asset(Assets.svgs.people)),
          ],
          onTap:
              (index) => _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [HomePage(), FriendPage(), MessagePage(), PeoplePage()],
      ),
    );
  }
}
