# custom_widgets_2

[![pub package](https://img.shields.io/pub/v/custom_widgets_2.svg)](https://pub.dev/packages/custom_widgets_2)

This package contains a collection of custom widgets that are indispensable in any Flutter project. These widgets are designed to provide ease of handling and enhance the user experience.

## Widgets Included

- **CustomElevatedButton**: A customizable button widget with various styling options.
- **CustomTextField**: A custom text field widget with additional features such as validation and input formatting.
- **CustomText**: A custom Text widget with text.
- **CustomDropDownButton**: A custom drop down button widget for multi drop down items.
- **CustomSteper**: A custom steper widget for steps.
- **CustomCachNetwork**: A custom cach network widget for display network imge.
- **CustomDivider**: A custom divider widget for display divider.
- **ContainerSadow**: A container shadow widget for display container with shadow.
- **sh**: A sh widget for sized box with height.
- **sw**: A sw widget for sized box with width.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_widgets_2: <last version>
```
Replace `last version` with the latest version of the package available on [pub.dev](https://pub.dev/).

Run the following command to install the package:
```dart
flutter pub get
```

## Usage
Import the package in your Dart code:
```dart
import 'package:custom_widgets_2/custom_widgets_2.dart';
```
Now, you can use the custom widgets in your Flutter app. Here's an example of how to use the `CustomElevatedButton` widget:

```dart
CustomElevatedButton(
  onPressed: () {
    // Add your button click logic here
  },
  child: CustomText(text:"click me"),
  color: Colors.blue,
),
```
Refer to the documentation of each widget for detailed usage instructions and customization options.

## Contributing
Contributions to this package are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on GitHub.

## License
This package is licensed under the [GNU GENERAL PUBLIC LICENSE](https://github.com/abdalmuneim/custom_widgets_2/blob/main/LICENSE).

```vbnet
Replace abdalmuneim with your GitHub username if you plan to host the package's source code on GitHub. Save this content as README.md in the root directory of your package. It will serve as the documentation for your custom_widgets_2 package on pub.dev.
```
