import 'package:collection/collection.dart';

import '../../../../data/data.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/colors.dart';
import 'package:flutter/material.dart';

import '../../../../router/router.dart';

class TextFieldSeerch extends StatefulWidget {
  final Function(String value)? search;
  final List<ProductModel>? listSearch;
  const TextFieldSeerch(
      {required this.search, required this.listSearch, Key? key})
      : super(key: key);

  @override
  State<TextFieldSeerch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSeerch> {
  final FocusNode _focusNode = FocusNode();
  TextEditingController _myController = TextEditingController();
  OverlayEntry? _overlayEntry;
  OverlayState? overlayState;
  final LayerLink _layerLink = LayerLink();
  GlobalKey _searchProductKey = GlobalKey();
  List<ProductModel>? data;
  @override
  void initState() {
    super.initState();
    data = widget.listSearch;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      } else {
        _hideOverlay();
      }
    });
  }

  @override
  void didUpdateWidget(covariant TextFieldSeerch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (DeepCollectionEquality()
        .equals(oldWidget.listSearch, widget.listSearch)) {
      print(
          "List is different -- ${oldWidget.listSearch?.length} -- ${widget.listSearch?.length}");
      setState(() {
        data = widget.listSearch;
      });
    }
  }

  void _showOverlay() async {
    _hideOverlay();
    await Future.delayed(Duration(milliseconds: 1000));
    _overlayEntry = _createOverlay();
    Overlay.of(context)?.insert(_overlayEntry!);
    setState(() {});
  }

  void _hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
    setState(() {});
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    return OverlayEntry(builder: (context) {
      return Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 5.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 150,
              ),
              child: Scrollbar(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.product,
                            arguments: data?[index]);
                      },
                      title: Text(
                        data?[index].name ?? "",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        key: _searchProductKey,
        controller: _myController,
        focusNode: _focusNode,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(fontWeight: FontWeight.w500),
        cursorColor: AppColors.primaryBlack,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16, right: 8),
            child: Assets.images.svg.icSearch.svg(height: 16, width: 16),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.quickSilver),
          hintText: S.of(context).search,
        ),
        onChanged: (value) async {
          widget.search?.call(value);
          _showOverlay();
        },
      ),
    );
  }
}
