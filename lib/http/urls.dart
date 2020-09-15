class Urls{
  static final String homeBanner = "/banner/json";

  static String getHomeArticles(int param){
    return "/article/list/$param/json";
  }
}