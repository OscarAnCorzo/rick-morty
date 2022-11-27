import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/core/settings/app_assets.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';
import 'package:rick_and_morty/src/features/presentation/controllers/character_detail.controller.dart';
import 'package:rick_and_morty/src/features/presentation/widgets/character_card.widget.dart';
import 'package:rick_and_morty/src/injection_container.dart';

class CharacterDetailView extends StatelessWidget {
  final CharacterEntity character;
  final CharacterDetailController ctrl = sl<CharacterDetailController>();
  
  CharacterDetailView({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthCard = (MediaQuery.of(context).size.width * 0.5) - 30;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          SizedBox(
            height: 360,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.black.withOpacity(0.65),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.detail,
                        height: 180,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Container(
                        color: Color(0xff081F32),
                        height: 180,
                      )
                    ]
                  )
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: this.character.image == null
                                ? Image.asset(AppAssets.noImage).image
                                : NetworkImage(this.character.image!)
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.0)
                          )
                        ),
                        Positioned(
                          top: 140,
                          left: 80.0 - 18,
                          child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF0F0F0)
                            ),
                            child: Icon(Icons.star_rounded, color: Color(0xffB9B9B9))
                          )
                        )
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: this.character.status == 'Alive'
                              ? Color(0xffB2DF28)
                              : this.character.status == 'Dead'
                                ? Colors.red
                                : Colors.grey,
                            shape: BoxShape.circle
                          ),
                          width: 8.0,
                          height: 8.0,
                        ),
                        SizedBox(width: 5.0),
                        Center(
                          child: Text(
                            this.character.status ?? 'No status',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        )
                      ]
                    ),
                    SizedBox(height: 5),
                    Text(
                      this.character.name ?? 'No name',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      this.character.specie ?? 'No specie',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ]
                )
              ]
            )
          ),
          
          SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Information',
                  style: TextStyle(color: Color(0xff7A7A7A), fontSize: 18, fontWeight: FontWeight.w500)
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widthCard,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xffB9B9B9))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info, color: Color(0xff7A7A7A)),
                              Text(
                                'Gender:',
                                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                              )
                            ]
                          ),
                          Text(
                            this.character.gender ?? 'No gender',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          )
                        ]
                      )
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: widthCard,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xffB9B9B9))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info, color: Color(0xff7A7A7A)),
                              Text(
                                'Origin:',
                                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                              )
                            ]
                          ),
                          Text(
                            this.character.originName ?? 'No origin',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          )
                        ]
                      )
                    )
                  ]
                ),

                SizedBox(height: 5),

                Container(
                  padding: EdgeInsets.all(10),
                  width: widthCard,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xffB9B9B9))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info, color: Color(0xff7A7A7A)),
                          Text(
                            'Type:',
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                          )
                        ]
                      ),
                      Text(
                        this.character.type ?? 'No type',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ]
                  )
                ),

                SizedBox(height: 25),

                Text(
                  'Episodes',
                  style: TextStyle(color: Color(0xff7A7A7A), fontSize: 18, fontWeight: FontWeight.w500)
                ),

                SizedBox(height: 10),

                GetBuilder<CharacterDetailController>(
                  id: 'episodes',
                  init: ctrl,
                  initState: (state) => ctrl.getEpisodes(this.character),
                  builder: (_) {
                    if(_.loadingEpisodes){
                      return Center(
                        child: CircularProgressIndicator()
                      );
                    }

                    if(_.episodes == null){
                      return Center(
                        child: Text(
                          'Error',
                          style: TextStyle(color: Colors.grey[800])
                        )
                      );
                    }

                    if(_.episodes!.isEmpty){
                      return Center(
                        child: Text(
                          'There is not episodes!!',
                          style: TextStyle(color: Colors.grey[800])
                        )
                      );
                    }
                    
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 1.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        mainAxisExtent: 90.0
                      ),
                      itemCount: _.episodes!.length,
                      itemBuilder: (c,i) {
                        var e = _.episodes![i];
                        
                        return Container(
                          padding: EdgeInsets.all(10),
                          width: widthCard,
                          // height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Color(0xffB9B9B9))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name ?? 'No name',
                                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                e.episode ?? 'No episode',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                e.airDate ?? 'No date',
                                style: TextStyle(color: Color(0xff515151), fontWeight: FontWeight.w300, fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ]
                          )
                        );
                      }
                    );
                  }
                ),

                SizedBox(height: 25),

                Text(
                  'Interesting Characters',
                  style: TextStyle(color: Color(0xff7A7A7A), fontSize: 18, fontWeight: FontWeight.w500)
                ),

                SizedBox(height: 10),

                GetBuilder<CharacterDetailController>(
                  id: 'characters',
                  initState: (state) => ctrl.getCharacters(),
                  builder: (_) {
                    if(_.loadingCharacters){
                      return Center(
                        child: CircularProgressIndicator()
                      );
                    }

                    if(_.characters == null){
                      return Center(
                        child: Text(
                          'Error',
                          style: TextStyle(color: Colors.grey[800])
                        )
                      );
                    }

                    if(_.characters!.isEmpty){
                      return Center(
                        child: Text(
                          'There is not characters!!',
                          style: TextStyle(color: Colors.grey[800])
                        )
                      );
                    }

                    return Column(
                      children: _.characters!.map((e) => InkWell(
                        child: CharacterCardWidget(character: e),
                        onTap: () => _.goToCharacterView(e),
                      )).toList()
                    );
                  }
                )
              ]
            )
          )
        ]
      )
    );
  }
}