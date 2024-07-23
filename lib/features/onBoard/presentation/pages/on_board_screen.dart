import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingo/core/app_localizations.dart';
import 'package:ingo/core/color_palette.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:ingo/features/onBoard/presentation/consts/on_board_data.dart';
import 'package:ingo/features/onBoard/presentation/pages/on_board_login_page.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_button.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_image.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as spi;

class OnBoardScreen extends StatefulWidget {
  static route() => PageTransition(
      child: const OnBoardScreen(), type: PageTransitionType.leftToRight);

  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  Map<String, String> _currentData(int index) => OnBoardData.data[index];
  final Duration _animationDuration = 300.milliseconds;
  final PageController _pageController = PageController();
  bool _isBottomSheetOpen = false;
  late final Size screenSize = MediaQuery.of(context).size;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _showBottomSheet() {
    setState(() {
      _isBottomSheetOpen = !_isBottomSheetOpen;
    });
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => const OnBoardLoginPage(),
      backgroundColor: ColorPalette.echoColorWhite,
      enableDrag: false,
      constraints: BoxConstraints(
        minHeight: screenSize.height * 0.25,
        maxWidth: double.infinity,
        minWidth: double.infinity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorPalette.echoColorWhite,
      body: BlocConsumer<OnBoardBloc, OnBoardState>(
        builder: (context, state) {
          var index = context.read<OnBoardBloc>().currentIndex;
          return PopScope(
            canPop: _isBottomSheetOpen,
            onPopInvoked: (didPop) {
              if (didPop) {
                setState(() {
                  _isBottomSheetOpen = !_isBottomSheetOpen;
                });
              }
            },
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  context.read<OnBoardBloc>().add(OnBoardNextPage());
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  context
                      .read<OnBoardBloc>()
                      .add(OnBoardEventPreviousPageEvent());
                }
              },
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: OnBoardImage(
                          animationDuration: _animationDuration,
                          backgroundAsset: _currentData(index)['background']!,
                          foregroundAsset: _currentData(index)['foreground']!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: spi.SmoothPageIndicator(
                            controller: _pageController,
                            count: OnBoardData.data.length,
                            effect: spi.SwapEffect(
                              dotHeight: 4,
                              dotWidth: 4,
                              spacing: 3,
                              activeDotColor: ColorPalette.primaryColor50,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SvgPicture.asset(
                            'assets/images/svg/onBoarding/logoColored.svg'),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 4,
                              child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: OnBoardData.data.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return OnBoardText(
                                      animationDuration: _animationDuration,
                                      title: AppLocalizations.of(context)
                                          .translate(
                                              _currentData(index)['title']!),
                                      description: AppLocalizations.of(context)
                                          .translate(
                                        _currentData(index)['description']!,
                                      ),
                                    );
                                  }),
                            ),
                            const Spacer(),
                            OnBoardButton(
                              onPressed: () {
                                _showBottomSheet();
                              },
                              text: AppLocalizations.of(context)
                                  .translate('lets_start_the_conversation'),
                            ),
                            const Spacer()
                          ],
                        ),
                      )
                    ],
                  ),
                  IgnorePointer(
                    ignoring: !_isBottomSheetOpen,
                    child: AnimatedContainer(
                      duration: 250.milliseconds,
                      color: _isBottomSheetOpen
                          ? Colors.black45
                          : Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, OnBoardState state) {
          if (state is OnBoardPageFinishedState) {
            _showBottomSheet();
          } else if (state is OnBoardPageChangedState) {
            _pageController.animateToPage(state.currentIndex,
                duration: _animationDuration, curve: Curves.ease);
          }
        },
      ),
    );
  }
}
