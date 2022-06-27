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
class SaloesModel {
  int? id;
  String? cnpj;
  String? razaoSocial;
  Endereco? endereco;

  SaloesModel({this.id, this.cnpj, this.razaoSocial, this.endereco});

  SaloesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnpj = json['cnpj'];
    razaoSocial = json['razaoSocial'];
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cnpj'] = this.cnpj;
    data['razaoSocial'] = this.razaoSocial;
    if (this.endereco != null) {
      data['endereco'] = this.endereco!.toJson();
    }
    return data;
  }
}

class Endereco {
  int? id;
  Null? pais;
  String? estado;
  String? cidade;
  String? bairro;
  String? rua;
  String? numero;
  String? cep;

  Endereco(
      {this.id,
      this.pais,
      this.estado,
      this.cidade,
      this.bairro,
      this.rua,
      this.numero,
      this.cep});

  Endereco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pais = json['pais'];
    estado = json['estado'];
    cidade = json['cidade'];
    bairro = json['bairro'];
    rua = json['rua'];
    numero = json['numero'];
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pais'] = this.pais;
    data['estado'] = this.estado;
    data['cidade'] = this.cidade;
    data['bairro'] = this.bairro;
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['cep'] = this.cep;
    return data;
  }
}