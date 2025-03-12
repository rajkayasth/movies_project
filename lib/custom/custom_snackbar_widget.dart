import '../../../utils/exports.dart';

/// A custom widget that displays a SnackBar-like message with
/// optional icon and button.
///
/// This widget is typically used for showing a brief message to the user,
/// with the
/// flexibility of including an icon and a button.
/// The button can trigger an action when clicked.
///
// ignore: must_be_immutable,avoid_classes_with_only_static_members // This is mutable because values change dynamically
class CustomSnackBarWidget extends StatelessWidget {
  /// A custom widget that displays a SnackBar-like message with
  /// optional icon and button.
  CustomSnackBarWidget({
    required this.message,
    this.buttonText,
    this.onButtonClick,
    super.key,
  });

  /// The message to display in the widget.
  final String message;

  /// The optional icon to display next to the message.
  // final SvgGenImage? icon;

  /// The optional text for a button (if any) in the SnackBar.
  String? buttonText = '';

  /// The optional callback function that is triggered
  /// when
  ///  the button is clicked.
  final Function()? onButtonClick;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: Dimens.space8),
              child: icon?.svg(
                height: Dimens.size16,
                width: Dimens.size16,
              ),
            )*/
         /* else
            Container(),*/
          Flexible(
            child: Text(
              message,
              textAlign: TextAlign.center,
              maxLines:3,
            ),
          ),
        ],
      );
}

/// snackBar
///
/// [message] display message
/// [buttonText] String for button
/// [duration] Duration of SnackBar display
/// [isDismissible] value for dismiss snackbar
/// [icon] display icon before message
void displaySnackBar(
  String message,
  BuildContext context, {
  String buttonText = '',
  Function()? onButtonClick,
  Duration? duration,
  bool? isDismissible,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: 28,
      ),
      duration: duration ?? const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      behavior: SnackBarBehavior.floating,
      content: CustomSnackBarWidget(
        message: message,

        buttonText: buttonText,
        onButtonClick: onButtonClick,
      ),
      backgroundColor:Colors.blue,
    ),
  );
}

  /// Displays a custom blue SnackBar with the given message.
  ///
  /// The [context] is required for showing the SnackBar within the Scaffold.
  /// The [message] is the text displayed inside the SnackBar.
  /// The [alignLeft] boolean determines whether
  /// the message is aligned
  /// to the left
  /// (default is true) or right.
  ///
  /// The SnackBar features a floating style, a blue background, and white text,
  /// with rounded corners and adjustable margin at the bottom of the screen.
   void showSnackBar(
    BuildContext context,
    String message, {
    bool alignLeft = true, // Optional alignment of the message.
  }) {
    // Creating the SnackBar with a custom message and style.
    SnackBar snackBar = SnackBar(
      content: Align(
        // Aligning the message either left or right based on [alignLeft].
        alignment: alignLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Text(
           message,
          style: context.textTheme.labelSmall?.copyWith(
            color:Colors.white, // White text color.
            fontSize: 16, // Custom font size.
          ),
        ),
      ),
      dismissDirection: DismissDirection.up,
      // Allows dismissal from upwards.
      backgroundColor: Colors.blue,
      // Blue background.
      behavior: SnackBarBehavior.floating,
      // Floating style for the SnackBar.

      elevation: 0,
      // Zero elevation (flat).
      margin: EdgeInsets.only(
        // Adjusting the margin based on screen height.
        bottom: context.height * 0.85
      ),
    );

    // Display the SnackBar in the Scaffold messenger.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

