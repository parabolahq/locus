import 'package:flutter/widgets.dart';
import 'package:locus/src/components/card.dart';
import 'package:locus/src/core/theme.dart';

class LocusEntry extends StatefulWidget {
  final TextStyle? style;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  const LocusEntry({
    super.key,
    this.style,
    this.focusNode,
    this.controller,
  });

  @override
  State<LocusEntry> createState() => _LocusEntryState();
}

class _LocusEntryState extends State<LocusEntry> {
  FocusNode get _effectiveFocusNode => widget.focusNode ?? FocusNode();
  late final TextEditingController _effectiveController;

  @override
  void initState() {
    super.initState();
    _effectiveController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _effectiveController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocusCard(
      constraints: BoxConstraints.expand(height: 50),
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(400),
      child: AnimatedBuilder(
        animation: _effectiveController,
        builder: (BuildContext context, Widget? child) {
          return Stack(children: [
            if (_effectiveController.text.isEmpty)
              Opacity(
                opacity: .5,
                child: Text('Placeholder'),
              ),
            child!,
          ]);
        },
        child: EditableText(
          keyboardAppearance: LocusTheme.of(context).brightness,
          backgroundCursorColor:
              LocusTheme.of(context).colorScheme.controlsSurface,
          controller: _effectiveController,
          cursorColor: LocusTheme.of(context).colorScheme.onSurface,
          focusNode: _effectiveFocusNode,
          style: widget.style ?? DefaultTextStyle.of(context).style,
        ),
      ),
    );
  }
}
