import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/widgets/home_appbar.dart';
import 'package:task/features/home/widgets/home_body.dart';
import '../../core/components/components.dart';
import '../../core/components/constants.dart';
import 'cubit/home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (isConnect != null) checkNet(context);
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  HomeAppBar(),
                  HomeBody(state: state,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
