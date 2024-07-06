

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguage extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_Us':{
      'Pandit ji': 'Pandit ji',
      'Pooja': 'Pooja',
      'Mantra':'Mantra',
      'Samagrhi':'Samagrhi',
      'Hindu Calender':'Hindu Calender ',
      'Hindu Granth':'Hindu Granth',
      'Traditional Places':'Traditional Places',
      'Festival Pooja': 'Festival Pooja',
      'आज का मंत्र':'Mantra of the day',
      'Profile':'Profile',
      'View Shopping Cart':'View Shopping Cart',
      'Notification':'Notification',
      'Transactions':'Transactions',
      'Pooja Package':'Pooja Package',
      'Help':'Help',
      'FeedBack':'FeedBack',
      'Durga Mata': 'Durga Mata',
      'Shiv Ji': 'Shiv Ji',
      'Ganesh Ji': 'Ganesh Ji',
      'Hanuman Ji': 'Hanuman Ji',
      'Krisna Ji': 'Krisna Ji',
      'Ram ji': 'Ram ji',
      'Radha Rani': 'Radha Rani',
      'Parvati Mata': 'Parvati Mata',
      'Lakshmi Mata': 'Lakshmi Mata',
      'Khatu Shyam': 'Khatu Shyam',
      'Gau Mata': 'Gau Mata',
      'Ganga Mata': 'Ganga Mata',
      'Gayatri Mata': 'Gayatri Mata',
      'Saraswati Mata': 'Saraswati Mata',
      'Santoshi Mata': 'Santoshi Mata',
      'Tulsi Mata': 'Tulsi Mata',
      'Sita Mata': 'Sita Mata',
      'Vaishno Mata': 'Vaishno Mata',
      'Shani Dev': 'Shani Dev',
      'Vishnu Ji': 'Vishnu Ji',
      'Sai baba': 'Sai baba',
      'Chalisa':'Chalisa',
      'Arti':'Arti',
      'Katha':'Katha',
  'Basant panchami (Wed, 14 Feb, 2024)': 'Basant panchami (Wed, 14 Feb, 2024)',
  'Shivratri (Fri, 8 Mar, 2024)': 'Shivratri (Fri, 8 Mar, 2024)',
  'Hanuman jayanti (Tue, 23 Apr, 2024)': 'Hanuman jayanti (Tue, 23 Apr, 2024)',
  'Nag panchami (Fri, 9 Aug, 2024)': 'Nag panchami (Fri, 9 Aug, 2024)',
  'Rakhsha bandhan (Mon, 19 Aug, 2024)': 'Rakhsha bandhan (Mon, 19 Aug, 2024)',
  'Ganesh chaturthi (Sat, 7 Sept, 2024)': 'Ganesh chaturthi (Sat, 7 Sept, 2024)',
  'Dussehra (Sat, 12 Oct, 2024)': 'Dussehra (Sat, 12 Oct, 2024)',
  'Karva chauth (Sun, 20 Oct, 2024)': 'Karva chauth (Sun, 20 Oct, 2024)',
  'Ahoi Ashtami (Thu, 24 Oct, 2024)': 'Ahoi Ashtami (Thu, 24 Oct, 2024)',
  'Dhanteras (Tue, 29 Oct, 2024)': 'Dhanteras (Tue, 29 Oct, 2024)',
  'Govardhan (Sat, 2 Nov, 2024)': 'Govardhan (Sat, 2 Nov, 2024)',
  'Bhai dooj (Sun, 3 Nov, 2024)': 'Bhai dooj (Sun, 3 Nov, 2024)',
      'diwali ( Fri, 1 Nov, 2024)':'diwali ( Fri, 1 Nov, 2024)'






},
    'hi_IN':{
      'Pandit ji': 'पंडित जी',
      'Pooja': 'पूजा',
      'Mantra':'मंत्र',
      'Samagrhi':'समग्रही',
      'Hindu Calender':'हिन्दू कैलेण्डर ',
      'Hindu Granth':'हिन्दू ग्रन्थ',
      'Traditional Places':'पारंपरिक स्थान',
      'Festival Pooja': 'त्योहार पूजा',
      'आज का मंत्र':'आज का मंत्र',
      'Profile':'प्रोफ़ाइल',
      'View Shopping Cart':'की हुई खरीददारी देखो',
      'Notification':'अधिसूचना',
      'Transactions':'लेनदेन',
      'Pooja Package':'पूजा पैकेज',
      'Help':'मदद करना',
      'FeedBack':'प्रतिक्रिया',
      'Durga Mata': 'दुर्गा माता',
      'Shiv Ji': 'शिव जी',
      'Ganesh Ji': 'गणेश जी',
      'Hanuman Ji': 'हनुमान जी',
      'Krisna Ji': 'कृष्ण जी',
      'Ram ji': 'राम जी',
      'Radha Rani': 'रंधा रानी',
      'Parvati Mata': 'पार्वती माता',
      'Lakshmi Mata': 'लक्ष्मी माता',
      'Khatu Shyam': 'खाटू श्याम',
      'Gau Mata': 'गौ माता',
      'Ganga Mata': 'गंगा माता',
      'Gayatri Mata': 'गायत्री माता',
      'Saraswati Mata': 'सरस्वती माता',
      'Santoshi Mata': 'संतोषी माता',
      'Tulsi Mata': 'तुलसी माता',
      'Sita Mata': 'सीता माता',
      'Vaishno Mata': 'वैष्णो माता',
      'Shani Dev': 'शनि देव',
      'Vishnu Ji': 'विष्णु जी',
      'Sai baba':'साईं बाबा',
      'Chalisa':'चालीसा',
      'Arti':'आरती',
      'Katha':'कथा',
'Basant panchami (Wed, 14 Feb, 2024)': 'बसंत पंचमी (बुध, 14 फरवरी, 2024)',
'Shivratri (Fri, 8 Mar, 2024)': 'शिवरात्रि (शुक्र, 8 मार्च, 2024)',
'Hanuman jayanti (Tue, 23 Apr, 2024)': 'हनुमान जयंती (मंगल, 23 अप्रैल, 2024)',
'Nag panchami (Fri, 9 Aug, 2024)': 'नाग पंचमी (शुक्र, 9 अगस्त, 2024)',
'Rakhsha bandhan (Mon, 19 Aug, 2024)': 'रक्षा बंधन (सोम, 19 अगस्त, 2024)',
'Ganesh chaturthi (Sat, 7 Sept, 2024)': 'गणेश चतुर्थी (शनि, 7 सितंबर, 2024)',
'Dussehra (Sat, 12 Oct, 2024)': 'दशहरा (शनि, 12 अक्टूबर, 2024)',
'Karva chauth (Sun, 20 Oct, 2024)': 'करवा चौथ (रवि, 20 अक्टूबर, 2024)',
'Ahoi Ashtami (Thu, 24 Oct, 2024)': 'अहोई अष्टमी (गुरु, 24 अक्टूबर, 2024)',
'Dhanteras (Tue, 29 Oct, 2024)': 'धनतेरस (मंगल, 29 अक्टूबर, 2024)',
'Govardhan (Sat, 2 Nov, 2024)': 'गोवर्धन (शनि, 2 नवंबर, 2024)',
'Bhai dooj (Sun, 3 Nov, 2024)': 'भाई दूज (रवि, 3 नवंबर, 2024)',
      'diwali ( Fri, 1 Nov, 2024)':'दीवाली (शुक्र, 1 नवंबर, 2024)'


    }
  };
}