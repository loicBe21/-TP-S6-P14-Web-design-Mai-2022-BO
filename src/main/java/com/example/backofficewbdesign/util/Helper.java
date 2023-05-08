package com.example.backofficewbdesign.util;

public class Helper {


    public static int pagesCount(int dataLength , int element) {
        int val = dataLength/element;
        int reste = dataLength%element;
        if(reste == 0)
            return val;
        return val+1;
    }
}
