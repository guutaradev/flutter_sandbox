enum ScreenId {
  title,
  game,
}

extension ScreenIdExt on ScreenId {
  String get id {
    switch (this) {
      case ScreenId.title:
        return "/";
      case ScreenId.game:
        return "/game";
    }
  }
}
