import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/resources.dart';
import '../../../../widgets/common_widget.dart';

class CategoryBlock extends StatefulWidget {
  String imgBackground;
  bool? isButton;
  Widget child;
  Function()? onTap;
  CategoryBlock({
    required this.imgBackground,
    required this.child,
    this.isButton = true,
    this.onTap,
  });

  @override
  State<CategoryBlock> createState() => _CategoryBlockState();
}

class _CategoryBlockState extends State<CategoryBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
              widget.imgBackground,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Assets.images.png.defaultImage.image(),
              fit: BoxFit.cover,
            ),
            widget.isButton ?? true
                ? InkWellWrapper(
                    onTap: widget.onTap,
                    paddingChild:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    margin: EdgeInsets.only(bottom: 14),
                    color: AppColors.primaryWhite.withOpacity(0.53),
                    border: Border.all(color: AppColors.darkCharcoal),
                    child: widget.child,
                  )
                : InkWellWrapper(
                    onTap: widget.onTap,
                    margin: EdgeInsets.only(bottom: 15),
                    child: widget.child,
                  ),
          ],
        ),
      ),
    );
  }
}
