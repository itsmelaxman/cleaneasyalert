<img src="package banner.png" alt="cleaneasyalert" width="100%">

*A Flutter plugin to display animated alert dialogs such as success, error, warning, confirm, loading or even a custom dialog.*

[![Pub Package](https://img.shields.io/pub/v/cleaneasyalert)](https://pub.dev/packages/cleaneasyalert)
[![Licence](https://img.shields.io/badge/Licence-BSD-orange.svg)](https://github.com/itsmelaxman/cleaneasyalert/blob/master/LICENSE)
[![Demo](https://img.shields.io/badge/Demo-APP-blueviolet.svg)](https://github.com/itsmelaxman/cleaneasyalert/blob/master/LICENSE)
[![effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://dart.dev/guides/language/effective-dart)

### Salient Features 

* Easy To Use
* Predefined Beautiful Alert Styles
* Predefined Title & Actions
* Super Customizable
* Change Animation*
* Set Autoclose
* Set Overlay Tap to Dismiss
* And Many More... Coming Soon...

## Getting Started 

Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  cleaneasyalert: <latest version>
```
Run the command to get the dependency
```command
$ flutter pub get
```
## Usage

Then you just have to import the package with
```dart
import 'package:cleaneasyalert/cleaneasyalert.dart';
```
## Examples

In order to display alert use <code>EasyAlert.show()</code> and define the <code>type</code> of alert.
```dart
EasyAlert.show(
  context: context,
  type: EasyAlertType.success,
); // That's it to display an alert, use other properties to customize.
```

> ### Success

  ```dart
  EasyAlert.show(
   context: context,
   type: EasyAlertType.success,
   text: 'Homework completed Successfully!',
  );
  ```

<br>

> ### Error

  ```dart
  EasyAlert.show(
   context: context,
   type: EasyAlertType.error,
   title: 'Oops...',
   text: 'Sorry, something went wrong',
  );
  ```

<br>

> ### Warning

  ```dart
  EasyAlert.show(
   context: context,
   type: EasyAlertType.warning,
   text: 'You just broke protocol',
  );
  ```   

<br>

> ### Info

  ```dart
  EasyAlert.show(
   context: context,
   type: EasyAlertType.info,
   text: 'Buy two, get one free',
  );
  ```   

<br>

> ### Confirm

  ```dart
  EasyAlert.show(
   context: context,
   type: EasyAlertType.confirm,
   text: 'Do you want to logout',
   confirmBtnText: 'Yes',
   cancelBtnText: 'No',
   confirmBtnColor: Colors.green,
  );
  ``` 

<br>

> ### Loading

  ```dart
  EasyAlert.show(
   context: context,
   type: EasyAlertType.loading,
   title: 'Loading',
   text: 'Fetching your data',
  );
  ``` 

<br>

> ### Custom

  ```dart
  EasyAlert.show(
    context: context,
    type: EasyAlertType.custom,
    barrierDismissible: true,
    confirmBtnText: 'Save',
    customAsset: 'assets/custom.gif',
    widget: TextFormField(
    decoration: const InputDecoration(
       alignLabelWithHint: true,
       hintText: 'Enter Phone Number',
       prefixIcon: Icon(
       Icons.phone_outlined,
       ),
      ),
      textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        onChanged: (value) => message = value,
      ),
      onConfirmBtnTap: () async {
       if (message.length < 5) {
        await EasyAlert.show(
         context: context,
         type: EasyAlertType.error,
         text: 'Please input something',
        );
        return;
      }
      Navigator.pop(context);
       await Future.delayed(const Duration(milliseconds: 1000));
       await EasyAlert.show(
        context: context,
        type: EasyAlertType.success,
        text: "Phone number '$message' has been saved!.",
       );
      },
    );
   },
   title: 'Custom',
   text: 'Custom Widget Alert',
   leadingImage: 'assets/custom.gif',
  ); 
  ``` 
## Example

[Detailed Example](https://github.com/itsmelaxman/easyalert/tree/master/example)


## License

```
Copyright (c) 2022 Laxman Magarati. 
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```