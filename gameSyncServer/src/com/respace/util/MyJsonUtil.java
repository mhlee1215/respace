package com.respace.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class MyJsonUtil{

	public static String toString(String dataToString, String id) {
		String json = "";
		// TODO Auto-generated method stub
		json += "{";
		json += "\""+id+"\":";
		json += dataToString;
		json += "}";
		return json;
	}
}
