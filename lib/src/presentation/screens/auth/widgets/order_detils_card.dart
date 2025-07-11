import 'package:flutter/material.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/src/data/models/models.dart';


class OrderDetilsCard extends StatelessWidget {
  final Product product;
 final Lang lang;
  const OrderDetilsCard({super.key, required this.product, required this.lang}); 

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, size: 30),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      product.name ?? 'Product Name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF70b9be)),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        
                       "${lang.priceLabel}: ${product.price.toString()}"??'0',
                        style: const TextStyle(
                            color: Color(0xFF70b9be), fontSize: 15),
                      ),
                       Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        
                       "${lang.Quantityis}: ${product.quantity.toString()}"??'0',
                        style: const TextStyle(
                            color: Color(0xFF70b9be), fontSize: 15),
                      ),
                    
                    ],
                  ),
                ),
              ],
            ),
          ),
       
        ],
      ),
    );
  }
}
