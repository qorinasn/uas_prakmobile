class Cake {
  List<Data>? data;

  Cake({required this.data});

  Cake.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nama;
  String? deskripsi;
  String? harga;
  String? gambar;

  Data(
      {required this.id,
      required this.nama,
      required this.deskripsi,
      required this.harga,
      required this.gambar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    harga = json['harga'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['deskripsi'] = this.deskripsi;
    data['harga'] = this.harga;
    data['gambar'] = this.gambar;
    return data;
  }
}
// import 'dart:ffi';

// class cake {
//   int id;
//   String nama;
//   String harga;
//   String deskripsi;
//   String gambar;
//   int rate;
//   String des;

//   cake(
//       {required this.id,
//       required this.nama,
//       required this.harga,
//       required this.deskripsi,
//       required this.gambar,
//       required this.rate,
//       required this.des});

//   factory cake.fromJson(Map<String, dynamic> json) {
//     return cake(
//         id: json['id'],
//         nama: json['nama'],
//         harga: json['harga'],
//         deskripsi: json['deskripsi'],
//         gambar: json['gambar'],
//         rate: json['rate'],
//         des: json['des']);
//   }
// }
