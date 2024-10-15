class ScriptModel {
  final String userScript, destinationScript;

  ScriptModel.fromJson(Map<String, dynamic> json)
      : userScript = json['userScript'],
        destinationScript = json['destinationScript'];
}