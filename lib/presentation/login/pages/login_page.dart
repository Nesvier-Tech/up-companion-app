import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/service_locators/injection_container.dart';
import '../../../utils/validators/text_form_field_validator.dart';
import '../../forgot_password/pages/forgot_password.dart';
import '../../sign_up/pages/sign_up_page.dart';
import '../state_holders/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Image.asset(
                  'assets/photos/University_of_The_Philippines_seal.png',
                  fit: BoxFit.scaleDown,
                  height: 200,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login to UPCAPP',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                const LoginForm(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'New to UPCAPP? ',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(SignUpPage.routeName),
                      child: const Text(
                        'Create a FREE account!',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _email;
  String? _password;
  final _validator = const TextFormFieldValidator();
  String _dialogMsg = 'Unchanged';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: _validator,
            onSaved: (newValue) => _email = newValue,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: _validator,
            onSaved: (newValue) => _password = newValue,
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(ForgotPasswordPage.routeName),
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: BlocProvider(
              create: (_) => getIt<LoginCubit>(),
              child: Builder(
                builder: (context) => BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    print('Bloc listener: $state');

                    final isSuccessOrFailureState =
                        (state is LoginLoadSuccess) ||
                            (state is LoginLoadFailure);

                    if (isSuccessOrFailureState) {
                      showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Firebase Auth Response'),
                          content: Text('$state'),
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
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();

                        _emailController.clear();
                        _passwordController.clear();

                        print('email: $_email');
                        print('password: $_password');

                        BlocProvider.of<LoginCubit>(context).loginUser(
                          email: _email!,
                          password: _password!,
                        );

                        // Navigator.of(context).pushNamed(Dashboard.routeName);
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
