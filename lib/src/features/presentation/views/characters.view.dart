import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/core/settings/app_assets.dart';
import 'package:rick_and_morty/src/features/presentation/controllers/characters_controller.dart';
import 'package:rick_and_morty/src/features/presentation/widgets/button_widget.dart';
import 'package:rick_and_morty/src/features/presentation/widgets/character_card.widget.dart';
import 'package:rick_and_morty/src/injection_container.dart';

class CharactersView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final CharactersController _ctrl = sl<CharactersController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  
  CharactersView({Key? key}) : super(key: key){
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        if ( !(_ctrl.loadingAll || _ctrl.loadingNextPage) && _ctrl.characters?.nextPageUrl != null) {
          _ctrl.getCharacters();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharactersController>(
      id: 'list',
      init: this._ctrl,
      builder: (_) {
        Widget result;
        
        if(_.loadingAll){
          result = Center(
            child: CircularProgressIndicator()
          );
        }else if(_.characters == null){
          result = SizedBox(
            // width: size!.width,
            height: 200,
            child: Center(
              child: Text(
                'Error',
                style: TextStyle(color: Colors.grey[800])
              )
            )
          );
        }else if((_.characters!.data ?? []).isEmpty){
          result = Column(
            children: [
              Text(
                'Uh-oh!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36)
              ),
              
              SizedBox(height: 10),

              Text(
                'Pareces perdido en tu viaje',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)
              ),

              SizedBox(height: 10),

              Button(
                text: 'Delete Filters',
                onPressed: () => _.deleteFilter()
              )
            ]
          );
        }else{
          List<Widget> temp =  _.characters!.data!.map<Widget>((e) => InkWell(
            onTap: () => _.goToCharacterView(e),
            child: CharacterCardWidget(character: e)
          )).toList();

          if(_.filterBy != null && _.filterOption != null) {
            temp = [
              Button(text: 'Delete Filters', onPressed: () => _.deleteFilter()),
              SizedBox(height: 20),
              ...temp
            ];
          }

          if(_.loadingNextPage) temp.add(Center(child: CircularProgressIndicator()));

          result = Column(
            children: temp
          );
        }

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: _key,
            endDrawerEnableOpenDragGesture: false,
            endDrawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Filter by:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      )
                    )
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Gender:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            )
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: ['Female', 'Male', 'Genderless', 'unknown'].map((e) => ListTile(
                              title: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                              onTap: () {
                                _.filter(by: 'gender', option: e);
                                Navigator.of(Get.context!).pop();
                              },
                            )).toList()
                          )
                        ),
                        ListTile(
                          title: Text(
                            'Status:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            )
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: ['Alive', 'Dead', 'unknown'].map((e) => ListTile(
                              title: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                              onTap: () {
                                _.filter(by: 'status', option: e);
                                Navigator.of(Get.context!).pop();
                              },
                            )).toList()
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.fondo), fit: BoxFit.fill)
              ),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.logo,
                    width: 271,
                    height: 152.44
                  ),
                  Container(
                    color: Color(0xff081F32),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            // width: 300,
                            child: TextFormField(
                              controller: _.searchController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: Colors.white),
                                hintText: 'Buscar personaje',
                                hintStyle: TextStyle(color: Colors.white),
                                
                              ),
                              style: TextStyle(color: Colors.white),
                              onChanged: (value) => _.typing(),
                            )
                          )
                        ),
                        SizedBox(width: 30),
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.white, size: 30),
                          onPressed: () => _key.currentState!.openEndDrawer(),
                        )
                      ]
                    )
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 280,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      controller: this._scrollController,
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Mostrar favoritos:'),
                              SizedBox(width: 15),
                              Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF0F0F0)
                                ),
                                child: Icon(Icons.star_rounded, color: Color(0xffB9B9B9))
                              )
                            ]
                          ),
                          
                          SizedBox(height: 20),

                          result
                        ]
                      )
                    )
                  )
                ]
              )
            )
          )
        );
      }
    );
  }
}