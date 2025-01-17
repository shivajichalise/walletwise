import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/models/budgets.dart';
import 'dart:convert';

class BudgetController {
  static List<Budget> budgets = [];
  BudgetController._();
  //provides the array of budget for the ui
  static Future<dynamic> getBudgets() async {
    var response =
        await FetchAPI(ApiUrls.testUrl, HttpMethod.get).fetchAuthorizedAPI();
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      budgets = jsonResponse.map((item) => Budget.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load budgets');
    }
  }
}
