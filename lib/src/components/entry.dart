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
  Widget build(BuildContext context) {
    return LocusCard(
      constraints: BoxConstraints.expand(height: 50),
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(400),
      child: EditableText(
        keyboardAppearance: LocusTheme.of(context).brightness,
        backgroundCursorColor:
            LocusTheme.of(context).colorScheme.controlsSurface,
        controller: _effectiveController,
        cursorColor: LocusTheme.of(context).colorScheme.onSurface,
        focusNode: _effectiveFocusNode,
        style: widget.style ?? DefaultTextStyle.of(context).style,
      ),
    );
  }
}
