import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/settings/app_assets.dart';
import 'package:rick_and_morty/src/features/domain/entities/character_entity.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterEntity character;
  
  const CharacterCardWidget({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffB9B9B9)),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                  child: FadeInImage(
                    image: this.character.image == null
                      ? Image.asset(AppAssets.noImage).image
                      : NetworkImage(this.character.image!),
                    fit: BoxFit.cover,
                    placeholder: Image.asset(AppAssets.noImage).image,
                  )
                ),
                Positioned(
                  bottom: 10,
                  right: 13,
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
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.50,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Expanded(
                      child: Text(
                        '${this.character.status ?? 'No status'} - ${this.character.specie ?? 'No specie'}',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    )
                  ]
                ),
                Text(
                  this.character.name ?? 'No name',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10),

                Text(
                  'Last know location:',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12)
                ),
                Text(
                  this.character.locationName ?? 'No location',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10),

                Text(
                  'First seen in:',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12)
                ),
                Text(
                  this.character.originName ?? 'No origin',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ]
            )
          )
        ]
      )
    );
  }
}