
abstract class NewsStatess{}
class NewsInitStates extends  NewsStatess{}
class NewsBottomNavBarStates extends  NewsStatess{}
class NewsGetBusinessSuccesStates extends  NewsStatess{}
class NewsLoadingGetBusinessStates extends  NewsStatess{}
class NewsGetBusinessErrorStates extends  NewsStatess{
  String? error;

  NewsGetBusinessErrorStates(this.error);
}
class NewsGetSportSuccesStates extends  NewsStatess{}
class NewsLoadingGetSportStates extends  NewsStatess{}
class NewsGetSportErrorStates extends  NewsStatess{
  String? error;

  NewsGetSportErrorStates(this.error);


}
class NewsGetScienceSuccesStates extends  NewsStatess{}
class NewsLoadingGetScienceStates extends  NewsStatess{}
class NewsGetScieceErrorStates extends  NewsStatess{
  String? error;

  NewsGetScieceErrorStates(this.error);
}


class NewsGetSearchSuccesStates extends  NewsStatess{}
class NewsLoadingGetSearchStates extends  NewsStatess{}
class NewsGetSearchErrorStates extends  NewsStatess{
  String? error;

  NewsGetSearchErrorStates(this.error);
}

