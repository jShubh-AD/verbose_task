class EndPoints {
  static const category = 'categories?meta%5Bvendor_type%5D=food&pagination=0';
  static const venders = 'vendors/list?lat=28.7040592&long=77.10249019999999&meta%5Bvendor_type%5D=food&page=1&per_page=15';


}extension ApiUrls on String {
  baseUrl() {
    const baseURL = "https://deligo.vtlabs.dev/api/";
    return baseURL + this;
  }
}