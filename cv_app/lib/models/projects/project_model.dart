import 'package:cv_app/models/projects/project_data_model.dart';

class ProjectsModel {
  ProjectsModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<ProjectData> data;
  late final int codeState;

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => ProjectData.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
  }
}
