import 'dart:html';
import 'dart:js';
import 'dart:io' as io;
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
      child: Text(t.managepanel.importChanges),
    );
  }
}


class FileDownloadButton extends StatelessWidget {
  const FileDownloadButton({
    Key? key,
    required this.begin,
    required this.end,
  }) : super(key: key);

  final String begin;
  final String end;

  void _downloadFile() async {
    try {
      final response = await http.get(Uri.parse('api/flight/export?begin=$begin&end=$end'));

      if (response.statusCode == 200) {
        final responseBody = response.body;
        final tempDir = await getTemporaryDirectory();
        final tempFile = io.File('${tempDir.path}/data.xlsx');
        await tempFile.writeAsBytes(responseBody.codeUnits);
        final downloadsDir = await DownloadsPathProvider.downloadsDirectory;
        final downloadFile = await tempFile.copy('${downloadsDir!.path}/data.xlsx');
        await Share.shareXFiles([XFile(downloadFile.path)]);
      } else {
        print('Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error downloading file: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _downloadFile,
      child: Text(t.managepanel.exportChanges),
    );
  }
}


