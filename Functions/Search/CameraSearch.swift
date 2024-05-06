//
//  CameraSearch.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
// ATH Á EFTIR AÐ BREYTA ÚR DART Í SWIFT KÓÐA
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

void main() async {
  print("Please enter the name of the camera or lens in the format 'Brand Model' (e.g., 'Canon EOS R5'):");
  String? cameraName = stdin.readLineSync();

  if (cameraName != null && cameraName.isNotEmpty && cameraName.contains(' ')) {
    var url = constructURL(cameraName);
    print('Constructed URL: $url');
    var productDetails = await fetchProductDetails(url);
    if (productDetails.isNotEmpty) {
      print('Product Details for $cameraName:');
      productDetails.forEach((category, details) {
        print('$category:');
        details.forEach((title, value) {
          print('  $title: $value');
        });
      });
    } else {
      print('No product details were fetched for $cameraName.');
    }
  } else {
    print('Invalid input. Please make sure you enter the camera or lens name correctly, including the brand and exact model.');
  }
}




String constructURL(String cameraName) {
  // Split the input into brand and model components
  List<String> parts = cameraName.split(' ');
  if (parts.length >= 2) {
    String brand = parts[0].toLowerCase();  // Brand name, like 'canon'
    // Join all parts after the brand into a model string, replace spaces with nothing (no underscores)
    String model = parts.sublist(1).join().toLowerCase();  // Model name, like 'eosr5'
    // Construct the URL in the format used by DPReview
    return 'https://www.dpreview.com/products/${brand}/slrs/${brand}_${model}/specifications';
  }
  return 'https://www.dpreview.com'; // Default or error handling URL
}




Future<Map<String, Map<String, String>>> fetchProductDetails(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      var specTables = document.querySelectorAll('div.specificationsPage table.specsTable');
      Map<String, Map<String, String>> specs = {};

      for (var table in specTables) {
        var categoryHeader = table.querySelector('th.large.groupLabel');
        if (categoryHeader != null) {
          String currentCategory = categoryHeader.text.trim();
          specs[currentCategory] = {};  // Initialize the map for this category

          var rows = table.querySelectorAll('tbody > tr');
          for (var row in rows) {
            var label = row.querySelector('th.label')?.text.trim();
            var value = row.querySelector('td.value')?.text.trim();

            // Handle elements with embedded tags like <span> or <ul> by extracting their text content efficiently
            if (value != null && value.contains('<')) {
              value = parser.parse(value).body!.text.trim(); // Re-parse to extract clean text
            }

            if (label != null && value != null) {
              specs[currentCategory]![label] = value;  // Use the null-assertion operator as we know it's initialized
            }
          }
        }
      }

      return specs;
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
      return {};
    }
  } catch (e) {
    print('An error occurred: $e');
    return {};
  }
}



