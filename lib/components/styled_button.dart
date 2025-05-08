import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, danger, success, info }

enum ButtonSize { small, medium, large }

enum ButtonShape { rounded, full, none }

class StyledButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonType type;
  final ButtonSize size;
  final ButtonShape shape;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool isDisabled;
  final bool isFullWidth;

  const StyledButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.shape = ButtonShape.rounded,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
  });

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: textColor ?? _getButtonColors(type)['foreground'],
          strokeWidth: 2,
        ),
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? _getButtonColors(type)['background'],
        foregroundColor: textColor ?? _getButtonColors(type)['foreground'],
        minimumSize: Size(
          width ?? _getButtonSize(size).width,
          height ?? _getButtonSize(size).height,
        ),
        shape: _getButtonShape(shape),
        side:
            type == ButtonType.secondary
                ? BorderSide(color: Colors.black12, width: 1)
                : null,
      ),

      child: _buildChild(),
    );
  }

  Map<String, Color> _getButtonColors(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return {'background': Colors.black, 'foreground': Colors.white};
      case ButtonType.secondary:
        return {'background': Colors.white, 'foreground': Colors.black};
      case ButtonType.danger:
        return {'background': Colors.red, 'foreground': Colors.white};
      case ButtonType.success:
        return {'background': Colors.green, 'foreground': Colors.white};
      case ButtonType.info:
        return {'background': Colors.blue, 'foreground': Colors.white};
    }
  }

  Size _getButtonSize(ButtonSize size) {
    final width = isFullWidth ? double.infinity : 100.0;

    switch (size) {
      case ButtonSize.small:
        return Size(width, 30);
      case ButtonSize.medium:
        return Size(width, 40);
      case ButtonSize.large:
        return Size(width, 50);
    }
  }

  OutlinedBorder _getButtonShape(ButtonShape shape) {
    switch (shape) {
      case ButtonShape.rounded:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      case ButtonShape.full:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));
      case ButtonShape.none:
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(0));
    }
  }
}
