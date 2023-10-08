import 'package:eatery/pages/home/model/home_response_model.dart';
import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class AppResponseModelAdapter extends TypeAdapter<AppResponseModel> {
  @override
  final typeId = 1;

  @override
  AppResponseModel read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final description = reader.readString();
    final image = reader.readString();
    final steps = reader.readList();
    final tags = reader.readList();
    final ingredients = reader.readList();
    // final isFavorite = reader.readBool().obs;

    return AppResponseModel(
      id: id,
      name: name,
      description: description,
      image: image,
      steps: steps.cast<String>(),
      tags: tags.cast<String>(),
      ingredients: ingredients.cast<String>(),
      // isFavorite: isFavorite.value,
    );
  }

  @override
  void write(BinaryWriter writer, AppResponseModel obj) {
    writer.writeInt(obj.id ?? 0);
    writer.writeString(obj.name ?? "");
    writer.writeString(obj.description ?? "");
    writer.writeString(obj.image ?? "");
    writer.writeList(obj.steps ?? []);
    writer.writeList(obj.tags ?? []);
    writer.writeList(obj.ingredients ?? []);
    // writer.writeBool(obj.isFavorite??false);
  }
}
