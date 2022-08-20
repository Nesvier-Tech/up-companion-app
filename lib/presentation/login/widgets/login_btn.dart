import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/service_locators/injection_container.dart';
import '../../core/dialogs/dialogs.dart';
import '../../core/loading/loading_dialog.dart';
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

                  Dialogs.showAboutUser(
                    context: context,
                    title: 'Firebase Auth Response',
                    id: state.id,
                    username: state.username,
                    email: state.email,
                    upCampus: state.upCampus,
                    dateCreated: state.dateCreated,
                  );
                } else if (state is LoginLoadFailure) {
                  Navigator.pop(context);

                  Dialogs.showError(
                    context: context,
                    title: '${state.errorSource} Response',
                    errorCode: state.errorCode,
                    errorMsg: state.errorMsg,
                    errorSource: state.errorSource,
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
