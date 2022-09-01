import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator/injection_container.dart';
import '../../core/dialogs/dialogs.dart';
import '../../core/loading/loading_dialog.dart';
import '../state_holders/cubit/login_cubit.dart';
import '../../core/states/failure_state.dart';
import '../state_holders/states/user_state.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: Builder(
        builder: (context) {
          return SizedBox(
            width: 150,
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginInitial) {
                  return;
                } else if (state is LoginLoadInProgress) {
                  LoadingDialog.showLoadingDialog(context: context);
                } else if (state is LoginLoadSuccess) {
                  Navigator.pop(context);

                  final UserState userState = state.userState;
                  Dialogs.showAboutUser(
                    context: context,
                    title: 'Firebase Auth Response',
                    id: userState.id,
                    username: userState.username,
                    email: userState.email,
                    upCampus: userState.upCampus,
                    dateCreated: userState.dateCreated,
                  );
                } else if (state is LoginLoadFailure) {
                  Navigator.pop(context);

                  final FailureState failureState = state.failureState;
                  Dialogs.showError(
                    context: context,
                    title: '${failureState.errorSource} Response',
                    errorCode: failureState.errorCode,
                    errorMsg: failureState.errorMsg,
                    errorSource: failureState.errorSource,
                  );
                } else {
                  Navigator.pop(context);
                  Dialogs.showError(
                    context: context,
                    title: 'Unknown Error',
                    errorCode: '500',
                    errorMsg: 'Something unexpected have happened.',
                    errorSource: 'Unknown',
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () => _onPressed(context: context),
                child: const Text('Login'),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onPressed({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      context.read<LoginCubit>().loginUser(
            email: email,
            password: password,
          );

      _emailController.clear();
      _passwordController.clear();
    }
  }
}
