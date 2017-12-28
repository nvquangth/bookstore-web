/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author NVQuang
 */
public class DateUtil {
    public static long getDateDiff(String dateString) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        String dateInString = "2017-12-01";

        try {

            Date date = formatter.parse(dateString);
            Date dateCur = new Date();
            
            long diff = Math.abs(dateCur.getTime() - date.getTime());
            long diffDays = diff / (24 * 60 * 60 * 1000);
            
            return diffDays;
            
//            System.out.println(diffDays);
//            System.out.println(date);
//            System.out.println(formatter.format(date));

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
