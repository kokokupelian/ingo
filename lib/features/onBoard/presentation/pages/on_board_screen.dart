import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingo/core/app_localizations.dart';
import 'package:ingo/core/color_palette.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:ingo/features/onBoard/presentation/consts/on_board_data.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_image.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as spi;

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  Map<String, String> _currentData(int index) => OnBoardData.data[index];
  final Duration _animationDuration = 300.milliseconds;
  final PageController _pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<OnBoardBloc>().stream.listen((event) async {
        if (event is OnBoardPageChangedState) {
          _pageController.animateToPage(event.currentIndex,
              duration: _animationDuration, curve: Curves.ease);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.echoColorWhite,
      body: BlocBuilder<OnBoardBloc, OnBoardState>(
        builder: (context, state) {
          var index = context.read<OnBoardBloc>().currentIndex;
          return GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx > 0) {
                context.read<OnBoardBloc>().add(OnBoardNextPage());
              } else if (details.velocity.pixelsPerSecond.dx < 0) {
                context
                    .read<OnBoardBloc>()
                    .add(OnBoardEventPreviousPageEvent());
              }
            },
            child: Column(
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
                                  .translate(_currentData(index)['title']!),
                              description:
                                  AppLocalizations.of(context).translate(
                                _currentData(index)['description']!,
                              ),
                            );
                          }),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.primaryColor50,
                          padding: const EdgeInsets.symmetric(horizontal: 50)),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('lets_start_the_conversation'),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    const Spacer()
                  ],
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
