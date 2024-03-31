import 'package:hive/hive.dart';

class SystemSettings {
  SystemSettings({
    required this.isDarkMode,
    required this.followSystem,
    required this.themeColor,
    required this.isThemeColorFromWallpaper,
    required this.language,
  });

  final bool isDarkMode;
  final bool followSystem;
  final int themeColor;
  final bool isThemeColorFromWallpaper;
  final String language;
}

class SystemSettingsAdapter extends TypeAdapter<SystemSettings> {
  @override
  final int typeId = 1;

  @override
  SystemSettings read(BinaryReader reader) {
    return SystemSettings(
      isDarkMode: reader.readBool(),
      followSystem: reader.readBool(),
      themeColor: reader.readInt(),
      isThemeColorFromWallpaper: reader.readBool(),
      language: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, SystemSettings obj) {
    writer
      ..writeBool(obj.isDarkMode)
      ..writeBool(obj.followSystem)
      ..writeInt(obj.themeColor)
      ..writeBool(obj.isThemeColorFromWallpaper)
      ..writeString(obj.language);
  }
}
