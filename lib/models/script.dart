class ScriptModel {
  final String profileScript, destinationScript;

  ScriptModel.fromJson(Map<String, dynamic> json)
      : profileScript = json['profileScript'],
        destinationScript = json['destinationScript'];
}