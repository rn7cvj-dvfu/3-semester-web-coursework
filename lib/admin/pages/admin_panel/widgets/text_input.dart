import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({super.key, required this.width, required this.labelText});

  final double width;
  final labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}

class AddSelectField extends StatelessWidget {
  AddSelectField({
    Key? key,
    required this.width,
    required this.labelText,
    required this.options,
  }) : super(key: key);

  final List<String> options;
  final double width;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    );
  }
}

class AddPassField extends StatelessWidget {
  AddPassField({super.key, required this.width, required this.labelText});

  final double width;
  final String labelText;
  final _isObscure = Observable<bool>(true);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Observer(
                builder: (_) => TextField(
                    decoration: InputDecoration(
                      labelText: labelText,
                      icon: const Icon(Icons.key),
                    ),
                    obscureText: _isObscure.value)),
          ),
          Observer(
            builder: (_) => IconButton(
              onPressed: () =>
                  runInAction(() => _isObscure.value = !_isObscure.value),
              icon: Icon(_isObscure.value
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
            ),
          )
        ],
      ),
    );
  }
}

class FilePickerButton extends StatelessWidget {
  const FilePickerButton({Key? key, required this.onFilePicked})
      : super(key: key);

  final Function(String) onFilePicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles();
        if (result != null) {
          final path = result.files.single.path;
          onFilePicked(path!);
        }
      },
      child: Text(t.managepanel.import),
    );
  }
}
