import 'package:base_project/common/commons.dart';
import 'package:base_project/common/extensions/state_less_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (ctx, state) {
          // if (state is ShowLoading) {
          //   showLoading(context, state.s);
          // }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                },
                child: const Text('Show loading'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
