import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'ad_service.dart';

class PurchaseService {
  static final PurchaseService _instance = PurchaseService._internal();
  static PurchaseService get instance => _instance;
  PurchaseService._internal();

  // 상품 ID
  static const String removeAdsProductId = 'english_word_10000_remove_ads';
  static const Set<String> _productIds = {removeAdsProductId};

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  List<ProductDetails> _products = [];
  bool _isAvailable = false;
  bool _isPurchasePending = false;
  String? _errorMessage;

  // Getters
  List<ProductDetails> get products => _products;
  bool get isAvailable => _isAvailable;
  bool get isPurchasePending => _isPurchasePending;
  String? get errorMessage => _errorMessage;

  // 콜백
  Function()? onPurchaseSuccess;
  Function(String)? onPurchaseError;

  Future<void> initialize() async {
    // 웹 또는 데스크톱에서는 IAP 비활성화
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      _isAvailable = false;
      return;
    }

    _isAvailable = await _inAppPurchase.isAvailable();
    if (!_isAvailable) {
      debugPrint('In-app purchase is not available');
      return;
    }

    // 구매 스트림 구독
    _subscription = _inAppPurchase.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (error) {
        debugPrint('Purchase stream error: $error');
        _errorMessage = error.toString();
      },
    );

    // 상품 정보 로드
    await _loadProducts();
  }

  Future<void> _loadProducts() async {
    if (!_isAvailable) return;

    final ProductDetailsResponse response = await _inAppPurchase
        .queryProductDetails(_productIds);

    if (response.error != null) {
      debugPrint('Error loading products: ${response.error}');
      _errorMessage = response.error?.message;
      return;
    }

    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('Products not found: ${response.notFoundIDs}');
    }

    _products = response.productDetails;
    debugPrint('Products loaded: ${_products.length}');
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    for (final purchaseDetails in purchaseDetailsList) {
      _handlePurchase(purchaseDetails);
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.status == PurchaseStatus.pending) {
      _isPurchasePending = true;
    } else {
      _isPurchasePending = false;

      if (purchaseDetails.status == PurchaseStatus.error) {
        _errorMessage = purchaseDetails.error?.message ?? 'Purchase failed';
        onPurchaseError?.call(_errorMessage!);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        // 구매 성공 - 광고 제거 처리
        if (purchaseDetails.productID == removeAdsProductId) {
          await AdService.instance.removeAds();
          onPurchaseSuccess?.call();
          debugPrint('Ads removed successfully');
        }
      }

      // 구매 완료 처리
      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
  }

  // 광고 제거 구매
  Future<bool> buyRemoveAds() async {
    if (!_isAvailable) {
      _errorMessage = 'In-app purchase is not available';
      return false;
    }

    final ProductDetails? product = _products.firstWhere(
      (p) => p.id == removeAdsProductId,
      orElse:
          () =>
              _products.isEmpty
                  ? throw Exception('Product not found')
                  : _products.first,
    );

    if (product == null || _products.isEmpty) {
      _errorMessage = 'Product not found';
      return false;
    }

    // 비소모성 상품으로 구매
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    return await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  // 구매 복원
  Future<void> restorePurchases() async {
    if (!_isAvailable) return;
    await _inAppPurchase.restorePurchases();
  }

  // 광고 제거 상품 가격 가져오기
  String? getRemoveAdsPrice() {
    final product =
        _products.where((p) => p.id == removeAdsProductId).firstOrNull;
    return product?.price;
  }

  void dispose() {
    _subscription?.cancel();
  }
}
