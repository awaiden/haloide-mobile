import 'package:flutter/material.dart';
import 'package:flutter_app/components/or_divider.dart';
import 'package:flutter_app/components/styled_button.dart';
import 'package:flutter_app/constants/theme_constants.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  _handleSubmit() {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    final formData = _formKey.currentState!.value;

    logger.i('Form data: $formData');
  }

  Widget _buildForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 4,
        children: [
          Text('Username', style: Theme.of(context).textTheme.labelLarge),
          FormBuilderTextField(
            name: 'username',
            decoration: inputDecoration.copyWith(
              helperText: 'Email or username',
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(3),
            ]),
          ),
          const SizedBox(height: 16.0),
          Text('Email', style: Theme.of(context).textTheme.labelLarge),
          FormBuilderTextField(
            name: 'email',
            decoration: inputDecoration.copyWith(helperText: 'Email address'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 16.0),
          Text('Password', style: Theme.of(context).textTheme.labelLarge),
          FormBuilderTextField(
            name: 'password',
            decoration: inputDecoration.copyWith(
              helperText: 'At least 6 characters',
            ),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(6),
            ]),
          ),
          const SizedBox(height: 16.0),
          StyledButton(
            onPressed: _handleSubmit,
            size: ButtonSize.large,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.0,
              children: [
                const Text('Login'),
                const Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.toNamed('/'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.toNamed('/login'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: Theme.of(context).textTheme.titleMedium,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8.0,
          children: [
            const Text(
              'Register',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Create an account to get started',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            _buildForm(context),
            const SizedBox(height: 16.0),
            OrDivider(),
            StyledButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              size: ButtonSize.large,
              type: ButtonType.secondary,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
