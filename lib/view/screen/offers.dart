import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/favorite_controller.dart';
import 'package:k_mandi/controller/offers_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/screen/home.dart';
import 'package:k_mandi/view/widget/customappbar.dart';
import 'package:k_mandi/view/widget/offers/customitemsoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    // lezem na3mel injewt lel FavoriteController khtaer l CustomListItemsOffer testha9ha
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  //1ér partie customAppBar ( recherche l fouganeya w les boutton l bejnabha )
                  CustomAppBar(
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    title: "61".tr,
                    //onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoutes.myfavorite);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // 2ém partie affichage data
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) =>
                                CustomListItemsOffer(
                                    itemsModel: controller.data[index]),
                          ),
                        )
                      : ListItemsSearch(
                          listdatamodel: controller.listdata,
                        ),
                ],
              ),
            ));
  }
}
