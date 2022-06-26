class TodoModel {
  int? id;
  String? dia;
  String? horaInicio;
  String? horaFim;
  String? nomeDoCliente;
  String? telefoneDoCliente;
  bool? disponivel;
  int? salaoId;

  TodoModel(
      {this.id,
      this.dia,
      this.horaInicio,
      this.horaFim,
      this.nomeDoCliente,
      this.telefoneDoCliente,
      this.disponivel,
      this.salaoId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dia = json['dia'];
    horaInicio = json['horaInicio'];
    horaFim = json['horaFim'];
    nomeDoCliente = json['nomeDoCliente'];
    telefoneDoCliente = json['telefoneDoCliente'];
    disponivel = json['disponivel'];
    salaoId = json['salaoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dia'] = this.dia;
    data['horaInicio'] = this.horaInicio;
    data['horaFim'] = this.horaFim;
    data['nomeDoCliente'] = this.nomeDoCliente;
    data['telefoneDoCliente'] = this.telefoneDoCliente;
    data['disponivel'] = this.disponivel;
    data['salaoId'] = this.salaoId;
    return data;
  }
}