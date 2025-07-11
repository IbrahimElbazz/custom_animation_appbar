import 'package:flutter/material.dart';
import 'animated_row_screen.dart';

SliverAppBar customAnimationAppbar({
  required BuildContext context,
  required String image,
  required String title,
  required String descripton,
}) {
  return SliverAppBar(
    pinned: true,
    backgroundColor: Colors.white,
    elevation: 0,
    surfaceTintColor: Colors.black,
    expandedHeight: MediaQuery.of(context).size.height / 4.7,
    leading: Padding(
      padding: const EdgeInsetsDirectional.only(start: 7.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ),
    flexibleSpace: LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxHeight < 140;
        return FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: isCompact ? 56 : 16, bottom: 16),
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 0),
            child: isCompact
                ? AnimatedRowScreen(image: image, name: title)
                : Column(
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
                      const SizedBox(height: 2),
                      Text(
                        descripton,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
          ),
          centerTitle: true,
        );
      },
    ),
  );
}
