import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/presenstation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../core/components/widgets/banner/banner_carousel_widget.dart';
import '../../core/components/widgets/loading_widget.dart';
import 'widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onListenerHomeBloc(BuildContext context, HomeState state) {
    // Show message
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadListProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xffFF9F9F),
                automaticallyImplyLeading: false,
                expandedHeight: 60,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                leadingWidth: 0,
                title: Row(
                  children: const [
                    Text(
                      'E-Commerce Mobile App',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xffFF9F9F).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: BannerCarouselSliderWidget(
                    ratio: 400 / 200,
                    banners: const [
                      'assets/images/img_01.png',
                      'assets/images/img_02.png',
                      'assets/images/img_03.png',
                    ],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                    fit: BoxFit.contain,
                    inactiveIndicatorColor: Colors.grey[300],
                    activeIndicatorColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: _onListenerHomeBloc,
                builder: (context, state) {
                  if (state is LoadingDataHome) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: LoadingWidget(),
                      ),
                    );
                  }
                  var listProduct = <Product>[];
                  if (state is LoadHomeSuccess) {
                    listProduct = state.products!;
                  }

                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: UniversalPlatform.isDesktop ? 4 : 2),
                    itemBuilder: (context, index) {
                      return ProductCardWidget(
                        product: listProduct[index],
                        type: index % 2 == 0 ? CardType.left : CardType.right,
                      );
                    },
                    itemCount: listProduct.length,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
