import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_companion_app/domain/core/auth/entities/user_entity.dart';
import 'package:up_companion_app/presentation/core/loading/loading_dialog.dart';
import 'package:up_companion_app/presentation/login/state_holders/cubit/state_params.dart';
import 'package:up_companion_app/utils/failures/failure_intf.dart';
import 'package:up_companion_app/utils/failures/firebase_auth_failure.dart';

import '../../../utils/service_locators/injection_container.dart';
import '../state_holders/cubit/login_cubit.dart';

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

                  final SuccessStateParams params = state.params;
                  _showDialog(
                    context: context,
                    rootCause: 'Firebase Auth',
                    errorCode: params.id,
                    errorMsg: params.email,
                  );
                } else if (state is LoginLoadFailure) {
                  Navigator.pop(context);

                  final FailureStateParams params = state.params;

                  _showDialog(
                    context: context,
                    rootCause: params.rootCause,
                    errorCode: params.errorCode,
                    errorMsg: params.errorMsg,
                  );
                } else {
                  Navigator.pop(context);

                  _showDialog(
                    context: context,
                    rootCause: 'Unknown Cause',
                    errorCode: '500',
                    errorMsg: 'An unknown error has occurred.',
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

  Future<String?> _showDialog({
    required BuildContext context,
    required String errorMsg,
    required String errorCode,
    required String rootCause,
  }) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('$rootCause Response'),
        content: Column(
          children: [
            Text('Error code: $errorCode'),
            Text('Error message: $errorMsg'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Okay'),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }
}
