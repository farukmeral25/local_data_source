enum LocalKeys {
  language,
  cacheuserinfo,
  notification,
}

extension LocalKeysExtension on LocalKeys {
  String getLocalKey() {
    switch (this) {
      case LocalKeys.language:
        return "language";
      case LocalKeys.cacheuserinfo:
        return "cacheuserinfo";
      case LocalKeys.notification:
        return "notification";
    }
  }
}
