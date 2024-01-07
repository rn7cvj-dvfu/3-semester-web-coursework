import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_susch/constants.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.buttonWidth,
    required this.onTap,
    required this.icon,
    required this.label,
    this.isLoading = false,
  });

  final double buttonWidth;
  final VoidCallback onTap;
  final Widget icon;
  final String label;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
        icon
      ],
    );

    if (isLoading) {
      child = Center(
        child: LoadingAnimationWidget.prograssiveDots(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          size: 60,
        ),
      );
    }

    return SizedBox(
      width: buttonWidth,
      height: 60,
      child: Material(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(appPaddingMedium),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(appPaddingMedium),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPaddingMedium),
            child: child,
          ),
        ),
      ),
    );
  }
}
