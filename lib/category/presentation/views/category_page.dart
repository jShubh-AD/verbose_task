// pages/category_grid_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../vender/presentation/views/vender_page.dart';
import '../../data/venders/venders_model.dart';
import '../bloc/category_bloc/category_cubit.dart';
import '../bloc/category_bloc/category_state.dart';
import '../bloc/vendors_bloc/vendor_cubit.dart';
import '../bloc/vendors_bloc/vendor_state.dart';
import '../widgets/category_card.dart';
import '../widgets/vender_list_tile.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Food',
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // SEARCH
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // REFRESH INDICATOR
            Expanded(
              child: RefreshIndicator(
                color: Colors.green,
                onRefresh: () async {
                  context.read<CategoryCubit>().getCategories();
                  context.read<VendorCubit>().getVendors();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero, // keeps spacing consistent
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CATEGORY GRID
                      BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                          if (state is CategoryLoading) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 32),
                                child:
                                    CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (state is CategoryLoaded) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 1,
                                  ),
                              itemBuilder: (context, index) => CategoryCard(
                                category: state.categories[index],
                                onTap: () {
                                  // handle tap
                                },
                              ),
                            );
                          }
                          // initial / error fallback
                          return const SizedBox.shrink();
                        },
                      ),

                      // Restaurants nearby
                      const SizedBox(height: 20),
                      const Text(
                        'Restaurants nearby',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      // VENDORS LIST
                      BlocBuilder<VendorCubit, VendorState>(
                        builder: (context, state) {
                          if(state is VendorLoading){
                            return Center(child:

                            CircularProgressIndicator()
                            );
                          }
                          if (state is VendorLoaded){
                            final List<Datum> allVendors = state.vendors;
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allVendors.length,
                              itemBuilder: (context, index) {
                                print('${allVendors.length}');
                                print('Building tile for ${allVendors[index].name}');
                               return VendorTile(
                               vendor: allVendors[index],
                                onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> VendorPage(vendor: allVendors[index],)));
                                },
                              );
                              }
                            );
                          }
                          return SizedBox();
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
