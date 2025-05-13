import 'package:flutter/material.dart';

import 'const_color.dart';

class AppBtn extends StatefulWidget {
  final String? title;
  final Color? titleColor;
  final Color? color;
  final Function()? onTap;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool loading;
  final Gradient? gradient;
  final bool hideBorder;
  final Widget? child;
  final FontWeight? fontWeight;
  final BoxBorder? border;
  final double borderRadius;

  const AppBtn({
    Key? key,
    this.title,
    this.titleColor,
    this.color,
    this.onTap,
    this.width,
    this.height,
    this.fontSize,
    this.loading = false,
    this.gradient,
    this.hideBorder = false,
    this.child,
    this.fontWeight,
    this.border,
    this.borderRadius = 5,
  }) : super(key: key);

  @override
  State<AppBtn> createState() => _AppBtnState();
}

class _AppBtnState extends State<AppBtn> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.3).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuart));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.loading
                ? Center(
              child: Container(
                height: 45,
                width: 43,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.kDeepBlueColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                padding: const EdgeInsets.all(12),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              ),
            )
                : Container(
              height: widget.height ?? MediaQuery.of(context).size.height * 0.06,
              width: widget.width ?? MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: widget.gradient,
                color: widget.color ?? AppColor.kSelectItemColor,
                border: widget.hideBorder ? null : widget.border,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: widget.child ??
                  Text(
                    (widget.title?.toUpperCase() ?? "PRESS ME!"), // Convert the title to uppercase
                    style: TextStyle(
                      color: widget.titleColor ?? AppColor.kBackgroundColor,
                      fontSize: widget.fontSize ?? 14,
                      fontWeight: widget.fontWeight ?? FontWeight.bold,
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}

class AppBackBtn extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const AppBackBtn({Key? key, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: color ?? AppColor.kBackgroundColor,
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final TextDecoration? decoration;

  const TextButtonWidget({
    Key? key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.onTap,
    this.padding,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          (text?.toUpperCase() ?? "PRESS ME!"), // Convert the text to uppercase
          style: TextStyle(
            fontSize: fontSize ?? 10,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor ?? AppColor.kBackgroundColor,
            decoration: decoration,
          ),
        ),
      ),
    );
  }
}
