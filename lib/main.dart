import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_flutter/apiController.dart';
import 'package:getx_flutter/demo_home_screen.dart';
import 'package:getx_flutter/new_post_screen.dart';
import 'package:getx_flutter/presentation/demo_bloc/demo_bloc.dart';
import 'package:getx_flutter/presentation/demo_code_bloc/demo_code_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [  BlocProvider(
        create: (context) => DemoBloc(),
      ),

        BlocProvider(
          create: (context) => DemoCodeBloc(),
        )

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx with flutter"),
      ),

      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(() => const NewPostScreen());
        },

        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: productController.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: ()=> Get.to(() => const FoodHomeScreen()),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: CachedNetworkImage(
                          imageUrl:
                          ("${productController.productList[index].profileImage}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title:
                      Text("${productController.productList[index].name}"),
                      subtitle:
                      Text("${productController.productList[index].email}"),
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
