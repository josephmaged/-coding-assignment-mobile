import 'package:comics/core/utilites/custome_text.dart';
import 'package:comics/features/presentation/cubit/cubit.dart';
import 'package:comics/features/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/comic_response.dart';

class ComicItem extends StatelessWidget {
  ComicResponse comicResponse = ComicResponse();

  ComicItem(this.comicResponse);


  @override
  Widget build(BuildContext context) {
    return  Expanded(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                /*  onPageChanged: (page) {
                   //ComicCubit.get(context).id == page;
                  },*/
                  physics: NeverScrollableScrollPhysics(),
                  controller: ComicCubit.get(context).pageController,
                  itemBuilder: (_, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Card(
                            margin: const EdgeInsets.all(5),
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: '${comicResponse.title}',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text: 'Day : Month : Year',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                    text:
                                        '${comicResponse.day} : ${comicResponse.month} : ${comicResponse.year}',
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(text: '${comicResponse.transcript}', fontSize: 12),
                                  Image.network(
                                    comicResponse.img ?? " ",
                                    width: MediaQuery.of(context).size.width * 0.96,
                                    fit: BoxFit.fill,
                                    height: MediaQuery.of(context).size.width * 0.8,
                                  ),
                                  CustomText(
                                    text: 'number : ${comicResponse.num}',
                                    fontSize: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ],
          ),
        );
  }
}
