import '../../../../data/data.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/resources.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  ImageProduct({Key? key, this.product, this.onImageChange, this.indexImage})
      : super(key: key);
  ProductModel? product;
  Function(int)? onImageChange;
  int? indexImage;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    var theme = Theme.of(context);
    var localization = S.of(context);
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: 346,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              onPageChanged: (index) {
                onImageChange?.call(index);
              },
              padEnds: false,
              itemCount: product?.images?.length ?? 1,
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return TweenAnimationBuilder(
                  tween: Tween(begin: 1.0, end: 1.0),
                  duration: const Duration(milliseconds: 350),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: product?.images == null
                      ? Assets.images.png.defaultImage.image(fit: BoxFit.cover)
                      : Image.network(product!.images![index],
                          fit: BoxFit.cover),
                );
              },
            ),
            Positioned(
                top: 10,
                right: 15,
                left: 5,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.star_border,
                                  color: AppColors.primaryBlack, size: 25)),
                          IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.share,
                                  color: AppColors.primaryBlack, size: 25)),
                        ]))),
            (product?.discountPercent == null || product?.discountPercent == 0)
                ? SizedBox()
                : Positioned(
                    top: 85,
                    child: Container(
                      color: AppColors.darkCharcoal,
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 7),
                      child: Text(
                        "${product!.discountPercent.toString()}% ${localization.off}",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  )
          ],
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ...List.generate(
            product?.images?.length ?? 0,
            (index) => Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == indexImage
                        ? AppColors.primaryWhite
                        : AppColors.primaryGrey6,
                    border: index == indexImage
                        ? Border.all(width: 1, color: AppColors.primaryGrey6)
                        : null)))
      ])
    ]);
  }
}
