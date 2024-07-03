import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';
import 'package:veflat/presentation/home/widgets/custom_appbar_widget.dart';
import 'package:veflat/presentation/home/widgets/home_header_widget.dart';
import 'package:veflat/presentation/product/widgets/products_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => ref.read(productProvider.notifier).getAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderWidget(),
            ProductsWidget(),
          ],
        ),
      ),
    );
  }
}
