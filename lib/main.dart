import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mizu/widgets/water_drop.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  var progress = 0.0;
  var progressTweening = 0.0;

  late final AnimationController riseTweeningController;

  late final Animation riseTweeningAnimation;

  @override
  void initState() {
    super.initState();
    riseTweeningController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    riseTweeningAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: riseTweeningController,
        curve: Curves.easeInOut,
      ),
    );
    riseTweeningController.addListener(() {
      setState(() {
        debugPrint('progressTweening: $progressTweening');
        if (progress > 0.99) {
          progressTweening = 1.0 * (1 - riseTweeningAnimation.value);
        } else {
          progressTweening = progress + riseTweeningAnimation.value * 0.125;
        }
      });
    });
    riseTweeningController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        progress = progressTweening;
        riseTweeningController.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Mizu(
                  progress: progressTweening,
                ),
                ElevatedButton(
                    onPressed: () {
                      riseTweeningController.forward();
                    },
                    child: Text(progress > 0.99 ? '重置' : '吨吨吨')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mizu extends StatefulWidget {
  final double progress;

  const Mizu({super.key, this.progress = 0.5});

  @override
  State<Mizu> createState() => _MizuState();
}

class _MizuState extends State<Mizu> with SingleTickerProviderStateMixin {
  // animation controller, duration: 1s, repeat: infinite
  late final AnimationController waveFactorController;

  late final Animation waveFactorAnimation;

  @override
  void initState() {
    super.initState();
    waveFactorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    waveFactorAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(waveFactorController);
    waveFactorController.addListener(() {
      setState(() {});
    });
    waveFactorController.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery.of(context).size.shortestSide * 0.75;
    return Stack(
      alignment: Alignment.center,
      children: [
        WaterDropIcon(
          size: iconSize,
          currentColor: Colors.blueGrey.shade100,
          progress: 2,
          waveFactor: 0,
        ),
        WaterDropIcon(
          size: iconSize,
          currentColor: Colors.lightBlue.shade100,
          progress: widget.progress,
          waveFactor: waveFactorAnimation.value * 2,
        ),
        WaterDropIcon(
          size: iconSize,
          currentColor: Colors.lightBlue,
          maskFilter: MaskFilter.blur(BlurStyle.inner, iconSize * 0.05),
          progress: widget.progress,
          waveFactor: waveFactorAnimation.value,
        ),
        Padding(
          padding: EdgeInsets.only(top: iconSize * 0.14),
          child: Text(
            '氺',
            style: TextStyle(
              fontSize: iconSize * 0.25,
              color: Colors.lightBlue[50],
              fontFamily: 'Kinghwa',
            ),
          ),
        )
      ],
    );
  }
}
