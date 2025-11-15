import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:clientapp_studio/Settings/settingsmenu.dart';
import 'package:clientapp_studio/Utilities/utilities.dart';
import 'package:clientapp_studio/pages/favourites_screen.dart';
import 'package:clientapp_studio/pages/home_screen.dart';
import 'package:clientapp_studio/pages/podcast_screen.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../bloc/internet_status/internet_status_bloc.dart';
import '../../services/SocketService.dart';
import '../../utils/DeepLinkMapper.dart';
import '../../utils/color_constants.dart';
import 'package:flutter/rendering.dart';

import '../services/AuthService.dart';
import '../utils/app_responsive.dart';

class Dashboard extends StatefulWidget {
  final int? selectedIndex;
  const Dashboard({super.key, this.selectedIndex});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController _pageController;
  int _selectedIndex = 0;
  StreamSubscription<Uri>? _linkSubscription;
  // Controls the bottom bar visibility
  final ValueNotifier<bool> _showBottomBar = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  Future<void> initDeepLinks() async {
    final appLinks = AppLinks();
    debugPrint('DeepLink: initDeepLinks started');
    try {
      final initialUri = await appLinks.getInitialLink();
      debugPrint('DeepLink: getInitialLink -> $initialUri');
      final loc = DeepLinkMapper.toLocation(initialUri);
      if (loc != null) {
        debugPrint('DeepLink: navigating to $loc');
        context.push(loc);
      } else {
        debugPrint('DeepLink: no mapped location for $initialUri');
      }
    } catch (e) {
      debugPrint('DeepLink: Initial app link error: $e');
    }

    // 2) Handle links while the app is running
    // _linkSubscription = appLinks.uriLinkStream.listen((uri) {
    //   debugPrint('DeepLink: uriLinkStream -> $uri');
    //   final loc = DeepLinkMapper.toLocation(uri);
    //   if (loc != null) {
    //     debugPrint('DeepLink: navigating to $loc');
    //     context.push(loc);
    //   } else {
    //     debugPrint('DeepLink: no mapped location for $uri');
    //   }
    // }, onError: (e) => debugPrint('DeepLink: Link stream error: $e'));
  }

  @override
  void dispose() {
    debugPrint('DeepLink: dispose, cancelling subscription');
    _linkSubscription?.cancel();
    _pageController.dispose();
    _showBottomBar.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {

    var w=SizeConfig.screenWidth;
    var h=SizeConfig.screenHeight;

    bool isWeb=AppResponsive.isDesktop(context);
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          _pageController.jumpToPage(0);
          return false; // Prevent app from exiting
        } else {
          SystemNavigator.pop(); // Exit app
          return true;
        }
      },
      child: Scaffold(
        body: isWeb
            ? Row(
          children: [
            // LEFT NAVIGATION VERTICAL BAR
            // LEFT NAVIGATION VERTICAL BAR
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: isWeb ?  w * 0.05 : 90, // force exact width
              ),
              child: Container(
                color: Colors.black,
                child: Column(
                  children: List.generate(5, (i) {
                    return InkWell(
                      onTap: () => _onItemTapped(i),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: (h * 0.018).clamp(10, 20),
                        ),
                        color: _selectedIndex == i
                            ? Colors.black.withOpacity(0.3)
                            : Colors.transparent,
                        child: Row(
                          children: [
                            SizedBox(width: (w * 0.015).clamp(8, 18)),
                            Image.asset(
                              i == 0
                                  ? (_selectedIndex == 0
                                  ? "assets/icons/events_selected.png"
                                  : "assets/icons/events.png")
                                  : i == 1
                                  ? (_selectedIndex == 1
                                  ? "assets/icons/favourite_selected.png"
                                  : "assets/icons/favourite.png")
                                  : i == 2
                                  ? (_selectedIndex == 2
                                  ? "assets/icons/boardcast_selected.png"
                                  : "assets/icons/broadcast.png")
                                  : i == 3
                                  ? (_selectedIndex == 3
                                  ? "assets/icons/utilities_selected.png"
                                  : "assets/icons/utilities.png")
                                  : (_selectedIndex == 4
                                  ? "assets/icons/settings_selected.png"
                                  : "assets/icons/settings.png"),
                              width: (w * 0.018).clamp(20, 32),
                              height: (w * 0.018).clamp(20, 32),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),



            // RIGHT MAIN AREA (YOUR PAGES)
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) {
                  HapticFeedback.lightImpact();
                  setState(() => _selectedIndex = i);
                },
                children: [
                  HomeScreen(),
                  FavouritesScreen(),
                  PodcastScreen(),
                  UtilHome(),
                  SetMenu(),
                ],
              ),
            ),
          ],
        )
            : BlocListener<InternetStatusBloc, InternetStatusState>(
          listener: (context, state) {
            if (state is InternetStatusLostState) {
              context.push('/no_internet');
            } else if (state is InternetStatusBackState) {}
          },
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (i) {
              HapticFeedback.lightImpact();
              setState(() => _selectedIndex = i);
            },
            children: [
              HomeScreen(),
              FavouritesScreen(),
              PodcastScreen(),
              UtilHome(),
              SetMenu(),
            ],
          ),
        ),

        // Bottom bar only for mobile
        bottomNavigationBar: isWeb
            ? null
            : ValueListenableBuilder<bool>(
            valueListenable: _showBottomBar,
            builder: (context, show, _) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: show ? _buildBottomNav() : const SizedBox.shrink(),
              );
            }),
      ),

    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: primarycolor,
      unselectedItemColor: Color(0xffC8C8C8),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 0
                ? "assets/icons/events_selected.png"
                : "assets/icons/events.png",
            width: 20,
            height: 20,
          ),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 1
                ? "assets/icons/favourite_selected.png"
                : "assets/icons/favourite.png",
            width: 20,
            height: 20,
          ),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 2
                ? "assets/icons/boardcast_selected.png"
                : "assets/icons/broadcast.png",
            width: 20,
            height: 20,
          ),
          label: 'Podcast',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 3
                ? "assets/icons/utilities_selected.png"
                : "assets/icons/utilities.png",
            width: 20,
            height: 20,
          ),
          label: 'Utilities',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 4
                ? "assets/icons/settings_selected.png"
                : "assets/icons/settings.png",
            width: 20,
            height: 20,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
