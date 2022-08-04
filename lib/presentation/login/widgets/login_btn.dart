import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (_) => getIt<LoginCubit>(),
      child: Builder(
        builder: (context) {
          return SizedBox(
            width: 150,
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                print('Bloc listener: $state');

                final isSuccessOrFailureState =
                    (state is LoginLoadSuccess) || (state is LoginLoadFailure);

                if (state is LoginInitial) {
                  return;
                } else if (state is LoginLoadInProgress) {
                  _showDialog(
                    context: context,
                    message: 'Loading... (Has Internet Connection!)',
                  );
                } else if (isSuccessOrFailureState) {
                  Navigator.pop(context);

                  _showDialog(
                    context: context,
                    message: state.properties.toString(),
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

      print('email: $email');
      print('password: $password');

      context.read<LoginCubit>().loginUser(
            email: email,
            password: password,
          );

      _emailController.clear();
      _passwordController.clear();

      // Navigator.of(context).pushNamed(Dashboard.routeName);
    }
  }

  Future<String?> _showDialog({
    required BuildContext context,
    required String message,
  }) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Firebase Auth Response'),
        content: Text(message),
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
