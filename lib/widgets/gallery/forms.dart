/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020, 2021 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * wger Workout Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wger/helpers/consts.dart';
import 'package:wger/helpers/json.dart';
import 'package:wger/models/gallery/image.dart' as gallery;
import 'package:wger/providers/gallery.dart';

class ImageForm extends StatefulWidget {
  late gallery.Image _image;

  ImageForm([gallery.Image? image]) {
    this._image = image ?? gallery.Image.emtpy();
  }

  @override
  _ImageFormState createState() => _ImageFormState();
}

class _ImageFormState extends State<ImageForm> {
  final _form = GlobalKey<FormState>();

  PickedFile? _file;

  final dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    dateController.text = toDate(widget._image.date)!;
    descriptionController.text = widget._image.description;
  }

  void _showPicker(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.getImage(source: source);

    setState(() {
      _file = file!;
    });
  }

  /// Returns widget with current picture, depending on whether the user is
  /// editing an existing entry or adding a new one. A text message is shown if
  /// neither is available
  Widget getPicture() {
    // An image file was selected, use it
    if (_file != null) {
      return Image(
        image: FileImage(File(_file!.path)),
      );
    }

    // We are editing an existing entry
    if (widget._image.url != null) {
      return Image.network(widget._image.url!);
    }

    // No picture available, show a message to the user
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context).selectImage),
        SizedBox(height: 8),
        Icon(Icons.photo_camera),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              _showPicker(ImageSource.camera);
                            },
                            leading: Icon(Icons.photo_camera),
                            title: Text(AppLocalizations.of(context).takePicture),
                          ),
                          ListTile(
                              onTap: () {
                                Navigator.of(context).pop();
                                _showPicker(ImageSource.gallery);
                              },
                              leading: Icon(Icons.photo_library),
                              title: Text(AppLocalizations.of(context).chooseFromLibrary))
                        ],
                      ),
                    );
                  },
                );
              },
              child: getPicture(),
            ),
          ),
          TextFormField(
            key: Key('field-date'),
            decoration: InputDecoration(labelText: AppLocalizations.of(context).date),
            controller: dateController,
            onTap: () async {
              // Stop keyboard from appearing
              FocusScope.of(context).requestFocus(new FocusNode());

              // Show Date Picker Here
              var pickedDate = await showDatePicker(
                context: context,
                initialDate: widget._image.date,
                firstDate: DateTime(DateTime.now().year - 10),
                lastDate: DateTime.now(),
              );

              dateController.text = toDate(pickedDate)!;
            },
            onSaved: (newValue) {
              widget._image.date = DateTime.parse(newValue!);
            },
            validator: (value) {
              if (widget._image.id == null && _file == null) {
                return AppLocalizations.of(context).selectImage;
              }

              return null;
            },
          ),
          TextFormField(
            key: Key('field-description'),
            decoration: InputDecoration(labelText: AppLocalizations.of(context).description),
            minLines: 3,
            maxLines: 10,
            controller: descriptionController,
            onSaved: (newValue) {
              widget._image.description = newValue!;
            },
          ),
          ElevatedButton(
            key: Key(SUBMIT_BUTTON_KEY_NAME),
            child: Text(AppLocalizations.of(context).save),
            onPressed: () async {
              // Validate and save
              final isValid = _form.currentState!.validate();
              if (!isValid) {
                return;
              }
              _form.currentState!.save();

              if (widget._image.id == null) {
                Provider.of<GalleryProvider>(context, listen: false)
                    .addImage(widget._image, _file!);
                Navigator.of(context).pop();
              } else {
                Provider.of<GalleryProvider>(context, listen: false)
                    .editImage(widget._image, _file);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}