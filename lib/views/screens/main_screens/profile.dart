import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';
import '../../shared/backgroung_image.dart';
import '../../widgets/profile_page/change_card.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.userProfile,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ClipRRect(
                    
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset(AppImages.personPlaceHolder,height: 130,width:  130,),
                  ),
                ),

                const SizedBox(height: 100,),
                ChangeCard(txt: 'Change Name',status: 'Name',),
                const SizedBox(height: 15,),
                ChangeCard(txt: 'Change Number',status:  'Number',),

              ],
            ),
          )
        ],
      ),
    );
  }
}
