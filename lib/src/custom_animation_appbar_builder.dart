import 'package:flutter/material.dart';
import 'animated_row_screen.dart';

/// A highly customizable SliverAppBar with animation support
class CustomAnimationAppBar {
  /// Creates a customizable SliverAppBar with expanded and collapsed states
  static SliverAppBar create({
    required BuildContext context,

    // Size customization
    double? expandedHeight,
    double heightDivider = 4.7,

    // AppBar properties
    bool pinned = true,
    Color backgroundColor = Colors.white,
    double elevation = 0,
    Color? surfaceTintColor = Colors.black,

    // Leading widget customization
    Widget? leading,
    bool showBackButton = false,
    VoidCallback? onBackPressed,

    // Expanded state widget (when AppBar is fully expanded)
    Widget? expandedWidget,

    // Collapsed state widget (when AppBar is collapsed)
    Widget? collapsedWidget,

    // Default content (backwards compatibility)
    String? image,
    String? title,
    String? description,

    // Animation settings
    Duration animationDuration = const Duration(milliseconds: 300),
    double compactThreshold = 140,
    bool centerTitle = true,
  }) {
    return SliverAppBar(
      pinned: pinned,
      backgroundColor: backgroundColor,
      elevation: elevation,
      surfaceTintColor: surfaceTintColor,
      expandedHeight:
          expandedHeight ?? MediaQuery.of(context).size.height / heightDivider,
      leading: leading ??
          (showBackButton
              ? _buildDefaultLeading(context, onBackPressed)
              : null),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxHeight < compactThreshold;

          Widget content;

          // Use custom widgets if provided
          if (expandedWidget != null && collapsedWidget != null) {
            content = AnimatedSwitcher(
              duration: animationDuration,
              child: isCompact
                  ? _wrapCollapsedWidget(collapsedWidget)
                  : _wrapExpandedWidget(expandedWidget),
            );
          }
          // Use default content with backwards compatibility
          else if (image != null && title != null) {
            content = AnimatedSwitcher(
              duration: animationDuration,
              child: isCompact
                  ? AnimatedRowScreen(image: image, name: title)
                  : _buildDefaultExpandedContent(
                      image, title, description ?? ''),
            );
          }
          // Use provided widgets or empty container
          else {
            content = AnimatedSwitcher(
              duration: animationDuration,
              child: isCompact
                  ? _wrapCollapsedWidget(
                      collapsedWidget ?? const SizedBox.shrink())
                  : _wrapExpandedWidget(
                      expandedWidget ?? const SizedBox.shrink()),
            );
          }

          return FlexibleSpaceBar(
            title: SafeArea(
              top: true,
              bottom: false,
              child: content,
            ),
            centerTitle: centerTitle,
          );
        },
      ),
    );
  }

  /// Creates a simple customizable AppBar with just expanded and collapsed widgets
  static SliverAppBar simple({
    required BuildContext context,
    required Widget expandedWidget,
    required Widget collapsedWidget,
    double? expandedHeight,
    double heightDivider = 4.7,
    bool pinned = true,
    Color backgroundColor = Colors.white,
    double elevation = 0,
    Widget? leading,
    List<Widget>? actions,
    Duration animationDuration = const Duration(milliseconds: 300),
    double compactThreshold = 140,
  }) {
    return create(
      context: context,
      expandedHeight: expandedHeight,
      heightDivider: heightDivider,
      pinned: pinned,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading,
      expandedWidget: expandedWidget,
      collapsedWidget: collapsedWidget,
      animationDuration: animationDuration,
      compactThreshold: compactThreshold,
    );
  }

  // Wrap collapsed widget to prevent overflow
  static Widget _wrapCollapsedWidget(Widget widget) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 40,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: widget,
        ),
      ),
    );
  }

  // Wrap expanded widget to ensure proper layout
  static Widget _wrapExpandedWidget(Widget widget) {
    return SizedBox(
      // width: double.infinity,
      child: widget,
    );
  }

  static Widget _buildDefaultLeading(
      BuildContext context, VoidCallback? onBackPressed) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 7.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
    );
  }

  static Widget _buildDefaultExpandedContent(
      String image, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 35,
          width: 35,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ],
    );
  }
}

/// Legacy function for backwards compatibility
SliverAppBar customAnimationAppbar({
  required BuildContext context,
  required String image,
  required String title,
  required String descripton,
}) {
  return CustomAnimationAppBar.create(
    context: context,
    image: image,
    title: title,
    description: descripton,
  );
}
