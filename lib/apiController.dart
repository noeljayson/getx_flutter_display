import 'package:get/get.dart';
import 'httpHelper.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList productList = RxList();
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var product = await httpHelper.fetchDetails();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}


class PostController extends GetxController {
  var isLoading = true.obs;
  RxList postList = RxList();
  @override
  void onInit() {
    super.onInit();
    fetchPost();
    fetchnewPost(0);
  }

  void fetchPost() async {
    try {
      isLoading(true);
      var post = await httpHelper.fetchpostDetails();
      if (post != null) {
        postList.value = post;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchnewPost(value) async {
    print("newsdd");
    print(value);
    try {
      isLoading(true);
      var newpost = await httpHelper.fetchpostnewDetails(value);
      print("newpost");
      print(newpost);
      if (newpost != null) {
        postList.value = newpost;
      }
    } finally {
      isLoading(false);
    }
  }
}
