import 'package:base_project/common/commons.dart';
import 'package:base_project/common/extensions/state_less_ext.dart';
import 'package:base_project/router/routers.dart';
import 'package:base_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          if (state is LoadingState) {
            showLoading(context, state.isShow);
          }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  //context.read<LoginBloc>().add(const LoginSubmitted());
                  //context.go(AppRoutes.navigation.toPath());
                  //showErrorMsg(context, 'Đã có lỗi xảy ra');

                  // showDlg(context: context, children: [
                  //   const TextView('Thông báo', fontSize: 20, bottom: 16, fontWeight: FontWeight.bold),
                  // ]);
                  //
                  // showConfirmDialog(context: context, content: 'content', onSubmit: (){});
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
