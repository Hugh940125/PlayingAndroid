class Urls{
  static final String homeBanner = "/banner/json";
  static final String systemTree = "/tree/json";

  static String getHomeArticles(int pageIndex){
    return "/article/list/$pageIndex/json";
  }

  static String getQAList(int pageIndex){
    return "/wenda/list/$pageIndex/json";
  }
}