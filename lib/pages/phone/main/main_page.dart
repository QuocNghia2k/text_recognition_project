import '../../../blocs/blocs.dart';
import '../../../generated/l10n.dart';
import '../../pages.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/resources.dart';

class MainPage extends StatefulWidget {
  final HomeBloc homeBloc;
  final ProfileBloc profileBloc;

  const MainPage({required this.homeBloc, required this.profileBloc});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];
  @override
  void initState() {
    _widgetOptions = [HomePage(widget.homeBloc), Scaffold(), ProfilePage(widget.profileBloc)];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryWhite,
        title: Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Assets.images.png.logo.image(height: 19, width: 104)),
        actions: [
          IconButton(icon: Assets.images.svg.icShoppingCart.svg(height: 21, width: 22), onPressed: () {}),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.darkCharcoal,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Assets.images.svg.icHome.svg(width: 24, height: 24),
              activeIcon: Assets.images.svg.icHome.svg(color: AppColors.darkCharcoal, width: 24, height: 24),
              label: localization.home),
          BottomNavigationBarItem(
              icon: Assets.images.svg.icFavorite.svg(width: 24, height: 24),
              activeIcon: Assets.images.svg.icFavorite.svg(color: AppColors.darkCharcoal, width: 24, height: 24),
              label: localization.wishlist),
          BottomNavigationBarItem(
              icon: Assets.images.svg.icNarbarUser.svg(width: 24, height: 24),
              activeIcon: Assets.images.svg.icNarbarUser.svg(color: AppColors.darkCharcoal, width: 24, height: 24),
              label: localization.profile),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
