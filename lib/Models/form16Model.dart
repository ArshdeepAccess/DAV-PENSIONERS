class Form16Model {
  int  sr_no = 0;
  String tpf_fin_year  = "";
  String name = "";
  String download = "";


  Form16Model.fromJson(Map<String, dynamic> json) {
    sr_no = json['sr_no'] ?? "";
    tpf_fin_year = json['tpf_fin_year'] ?? "";
    name = json['name'] ?? "";
    download = json['download'] ?? "";

  }
}