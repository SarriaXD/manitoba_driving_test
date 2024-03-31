import 'package:hive/hive.dart';

class UserSettings {
  UserSettings({
    required this.preferredQuestionQty,
  });

  final int preferredQuestionQty;
}

class UserSettingsAdapter extends TypeAdapter<UserSettings> {
  @override
  final int typeId = 2;

  @override
  UserSettings read(BinaryReader reader) {
    return UserSettings(
      preferredQuestionQty: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, UserSettings obj) {
    writer.writeInt(obj.preferredQuestionQty);
  }
}
