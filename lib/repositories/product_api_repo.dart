import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/models/product_data.dart';



class AllProductRepository {
  Future<List<ProductModal>> fetchProducts() async {
    final response = await http
        .get(Uri.parse('http://${ApiConstants.getdata}'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(response.body);
      return data.map((json) => ProductModal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}




// class FaceMakeUpProductRepository {
//   Future<List<ProductModal>> fetchProducts() async {
//     final response = await http
//         .get(Uri.parse('http://${ApiConstants.getdata}/facemakeup'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print(response.body);
//       return data.map((json) => ProductModal.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }

// class EyeMakeUpProductRepository {
//   Future<List<ProductModal>> fetchProducts() async {
//     final response = await http
//         .get(Uri.parse('http://${ApiConstants.getdata}/eyemakeup'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print(response.body);
//       return data.map((json) => ProductModal.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }



// class LipMakeUpProductRepository {
//   Future<List<ProductModal>> fetchProducts() async {
//     final response = await http
//         .get(Uri.parse('http://${ApiConstants.getdata}/lipmakeup'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print(response.body);
//       return data.map((json) => ProductModal.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }



// class SkinCareProductRepository {
//   Future<List<ProductModal>> fetchProducts() async {
//     final response = await http
//         .get(Uri.parse('http://${ApiConstants.getdata}/skincare'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print(response.body);
//       return data.map((json) => ProductModal.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }

// class MenMakeUpProductRepository {
//   Future<List<ProductModal>> fetchProducts() async {
//     final response = await http
//         .get(Uri.parse('http://${ApiConstants.getdata}/menmakeup'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print(response.body);
//       return data.map((json) => ProductModal.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }