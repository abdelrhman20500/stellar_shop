import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stellar_shop/Features/home/presentation/view/home_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  static const String routeName ="LayoutScreen";
  final List<Widget> tabs=[
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: tabs[cubit.currentIndex]
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: GNav(
                  onTabChange: (index) {
                    cubit.changeIndex(index);
                  },
                  rippleColor: const Color(0xFFFF6B00).withOpacity(0.2),
                  hoverColor: const Color(0xFFFF6B00).withOpacity(0.1),
                  haptic: true,
                  tabBorderRadius: 15,
                  duration: const Duration(milliseconds: 250),
                  gap: 60,
                  color: Colors.grey[400],
                  iconSize: 27,
                  activeColor: Colors.white,
                  tabBackgroundColor: const Color(0xFFFF6B00),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),                  tabs: const [
                    GButton(icon: Icons.home, text: 'Home',),
                    GButton(icon: Icons.person, text: 'Profile',),
                  ],
                ),
              ),
            ),          );
        },
      ),
    );
  }
}
