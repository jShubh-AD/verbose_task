
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../category/data/venders/venders_model.dart';


class VendorPage extends StatefulWidget {
  final Datum vendor;
  const VendorPage({super.key, required this.vendor});




  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> cartQty = ValueNotifier<int>(0);
    final ValueNotifier<double> cartTotal = ValueNotifier<double>(0);

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            //  padding: const EdgeInsets.all(16),
              children: [
                InkWell(
                  onTap: () =>  Navigator.pop(context)
                ,child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                SizedBox(height: 20,),
                // ── Header (name, area, rating) ────────────────────────────
                    const SizedBox(width: 12),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.vendor.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.vendor.address,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 8),
                          Divider(color: Colors.grey,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.star, size: 16, color: Colors.green),
                              //const SizedBox(width: 4),
                              Text('${widget.vendor.ratings.toStringAsFixed(1)}  •  (${widget.vendor.ratingsCount} rated)'),
                              Spacer(),
                              const Icon(Icons.timer_outlined, size: 18),
                              const SizedBox(width: 4),
                              Text('Prepare in 10 mins.'), // example
                              const SizedBox(width: 16),
                            ],
                          ),
                        ],
                    ),
                const SizedBox(height: 24),
                // parent widget …
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.vendor.categories.length,
                      itemBuilder: (context, index) {
                        final category = widget.vendor.categories[index];
                        return ExpansionTile(
                          title: Text(category.title),
                          children: [
                            buildMenuItemTile(
                              context,
                                name: category.title,
                                imageUrl: category.mediaurls.images.first.imageDefault,
                                cartQty: cartQty,
                                cartTotal: cartTotal,
                                price: 10
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),

              buildCartSummaryBar(context, cartQty, cartTotal, onViewCart: (){})

          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {},
        label: const Text('Menu',style: TextStyle(color: Colors.white),),
        icon: const Icon(Icons.restaurant_menu,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildMenuItemTile(
      BuildContext context, {
        required String name,
        required double price,
        required String imageUrl,
        required ValueNotifier<int> cartQty,      // shared!
        required ValueNotifier<double> cartTotal, // shared!
      }) {
    final ValueNotifier<int> qty = ValueNotifier<int>(0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          // thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // name, price, customize
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$ ${price.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    // open customizer
                  },
                  child: Text(
                    'Customize',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          // add / qty selector
          ValueListenableBuilder<int>(
            valueListenable: qty,
            builder: (context, count, _) {
              if (count == 0) {
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    qty.value = 1;
                    cartQty.value += 1;
                    cartTotal.value += price;
                  },
                  child: const Text('Add'),
                );
              }

              // – count +
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _roundIcon(
                      icon: Icons.remove,
                      onTap: () {
                        qty.value -= 1;
                        cartQty.value -= 1;
                        cartTotal.value -= price;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      child: Text(
                        '$count',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    _roundIcon(
                      icon: Icons.add,
                      onTap: () {
                        qty.value += 1;
                        cartQty.value += 1;
                        cartTotal.value += price;
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _roundIcon({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Colors.white, shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 14, color: Colors.green),
      ),
    );
  }

  Widget buildCartSummaryBar(
      BuildContext context,
      ValueNotifier<int> cartQty,
      ValueNotifier<double> cartTotal, {
        required VoidCallback onViewCart,
      }) {
    return ValueListenableBuilder<int>(
      valueListenable: cartQty,
      builder: (context, count, _) {
        if (count == 0) return const SizedBox.shrink();

        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Material(
              color: Colors.green,
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      '$count item(s) • \$ ${cartTotal.value.toStringAsFixed(0)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: onViewCart,
                      child: Row(
                        children: const [
                          Icon(Icons.shopping_bag_outlined,
                              color: Colors.white, size: 20),
                          SizedBox(width: 6),
                          Text(
                            'View Cart',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

