
import 'package:flutter_mongodb_app/resources/assets_manager.dart';

class Resources {
  static List<Map<String,dynamic>> startersveg=[
    {
      'foodname':'Panner Tanduri',
      'cost':160,
      'imageurl':ImageAssets.starters,
      'check':true,
    },
    {
      'foodname':'Spring rolls',
      'cost':150,
      'imageurl':ImageAssets.springroll,
      'check':true,
    },
    {
      'foodname':'Veg Crispy',
      'cost':180,
      'imageurl':ImageAssets.vegcrispy,
      'check':true,
    },

  ];
  // static List<Map<String,dynamic>> startersnonveg=[
  //   {
  //     'foodname':'Panner Tanduri',
  //     'cost':160,
  //     'imageurl':ImageAssets.starters,
  //     'check':true,
  //   },
  //   {
  //     'foodname':'Spring rolls',
  //     'cost':150,
  //     'imageurl':ImageAssets.starters,
  //     'check':true,
  //   },
  //   {
  //     'foodname':'Afghani Paneer',
  //     'cost':180,
  //     'imageurl':ImageAssets.starters,
  //     'check':true,
  //   },
  //
  // ];
  static List<Map<String,dynamic>> mainmenuveg=[
    {
      'foodname':'Panner Tikka Masala',
      'cost':210,
      'imageurl':ImageAssets.paneertikka,
    },
    {
      'foodname':'Veg Kofta',
      'cost':180,
      'imageurl':ImageAssets.vegkofta,
    },
    {
      'foodname':'Dal Tadka',
      'cost':170,
      'imageurl':ImageAssets.daltadka,
    },
    {
      'foodname':'Afghani Paneer',
      'cost':180,
      'imageurl':ImageAssets.afganipanner,
      'check':true,
    },

  ];
  static List<Map<String,dynamic>> desertsveg=[
    {
      'foodname':'Peanut Butter Blossoms',
      'cost':230,
      'imageurl':ImageAssets.peanutbutter,
    },
    {
      'foodname':'Cake Mix Cookies',
      'cost':240,
      'imageurl':ImageAssets.cakecookies,
    },
    {
      'foodname':'Treacle tart',
      'cost':250,
      'imageurl':ImageAssets.treacletart,
    },

  ];
  static List<Map<String,dynamic>> soupsveg=[
    {
      'foodname':'Thai Sweet Potato Soup',
      'cost':120,
      'imageurl':ImageAssets.sweetpotatosoup,

    },
    {
      'foodname':'Manchow Momo Soup',
      'cost':100,
      'imageurl':ImageAssets.manchowsoup,
    },
    {
      'foodname':'Coconut And Beetroot Soup',
      'cost':140,
      'imageurl':ImageAssets.beetrootsoup,
    },

  ];
}