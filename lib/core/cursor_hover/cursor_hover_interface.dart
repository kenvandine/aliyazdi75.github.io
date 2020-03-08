import 'package:flutter/material.dart';

import 'cursor_hover_stub.dart'
    if (dart.library.html) 'web_cursor_hover.dart'
    if (dart.library.io) 'desktop_cursor_hover.dart';

extension CursorHoverExtension on Widget {
  Widget showCursorOnHover({Function onHovered}) {
    return MouseRegion(
      child: this,
      onHover: (event) {
        if (onHovered != null) onHovered(true);
        CursorHover().onHover();
      },
      onExit: (event) {
        if (onHovered != null) onHovered(false);
        CursorHover().onExit();
      },
    );
  }
}

abstract class CursorHover {
  void onHover();

  void onExit();

  factory CursorHover() => getCursorHover();
}
