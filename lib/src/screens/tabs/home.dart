import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryColor, Colors.white],
                  stops: [0, .4]),
              image: DecorationImage(
                  image: AssetImage('${imageDir}cover.png'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
              image: DecorationImage(
                image: AssetImage('${imageDir}profile.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text('Hello ${state.user!.username}',
              style: Styles.w600(size: 32, color: Colors.black)),
          const SizedBox(height: 10),
          Text('Phone: ${state.user!.phone}',
              style: Styles.w400(
                size: 14,
              )),
          const SizedBox(height: 10),
          Text('Interest:', style: Styles.w400(size: 14)),
          const SizedBox(height: 5),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.user!.interest
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          e,
                          style: Styles.w400(size: 14),
                        ),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
