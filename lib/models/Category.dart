import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_clone/repositories/table_key.dart';

class Category {
  final String id, description;

  Category({
    this.id,
    this.description,
  });

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(keyCategoryDescription);
}
