package com.stone.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串处理类
 * @author 崔辉
 *
 */
public class StringUtil {

	private static final int[] wi = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 };
	private static final int[] vi = { 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 };
	private static int[] ai = new int[18];

	/**
	 * 判断字符串是否为空
	 * 
	 * @param string 设置字符串
	 * @return boolean 返回是否为空
	 */
	public static boolean isEmpty(String string) {
		return string == null || string.length() == 0;
	}

	/**
	 * 判断两个字符串是否值相等
	 * 
	 * @param a 设置第一个字符串
	 * @param b 设置第二个字符串
	 * @return boolean 返回比较的结果
	 */
	public static boolean compare(String a, String b) {
		if (isEmpty(a) && isEmpty(b))
			return true;
		if (!isEmpty(a) && !isEmpty(b))
			return a.equals(b);
		else
			return false;
	}

	/**
	 * 判断两个字符串是否值相等，忽略大小写
	 * 
	 * @param a 设置第一个字符串
	 * @param b 设置第二个字符串
	 * @return boolean 返回比较的结果
	 */
	public static boolean compareIgnoreCase(String a, String b) {
		if (isEmpty(a) && isEmpty(b))
			return true;
		if (!isEmpty(a) && !isEmpty(b))
			return a.equalsIgnoreCase(b);
		else
			return false;
	}

	/**
	 * 复制字符串中从开始到指定的位置
	 * 
	 * @param src 设置字符串
	 * @param len 指定复制到某个位置
	 * @return String 返回结果
	 */
	public static String copy(String src, int len) {
		if (src == null)
			return null;
		if (src.length() > len)
			return len <= 0 ? null : src.substring(0, len);
		else
			return src;
	}

	/**
	 * 删除字符串中指定的一段字符串内容
	 * 
	 * @param src 设置原字符串
	 * @param delStr 设置需要删除的字符串
	 * @return String 返回结果
	 */
	public static String delete(String src, String delStr) {
		if (isEmpty(src) || isEmpty(delStr))
			return src;
		StringBuffer buffer = new StringBuffer(src);
		for (int index = src.length(); (index = src.lastIndexOf(delStr, index)) >= 0; index -= delStr.length())
			buffer.delete(index, index + delStr.length());

		return buffer.toString();
	}

	/**
	 * 将指定的字符和位置插入到原字符串中
	 * 
	 * @param src 设置原字符串
	 * @param anotherStr 设置需要插入的字符串
	 * @param offset 位置
	 * @return String 返回结果
	 */
	public static String insert(String src, String anotherStr, int offset) {
		if (isEmpty(src) || isEmpty(anotherStr))
			return src;
		StringBuffer buffer = new StringBuffer(src);
		if (offset >= 0 && offset <= src.length())
			buffer.insert(offset, anotherStr);
		return buffer.toString();
	}

	/**
	 * 追加指定的字符串到原字符串中
	 * 
	 * @param src 设置原字符串
	 * @param appendStr 设置需要追加的字符串
	 * @return String 返回结果
	 */
	public static String append(String src, String appendStr) {
		if (isEmpty(src) || isEmpty(appendStr)) {
			return src;
		} else {
			StringBuffer buffer = new StringBuffer(src);
			buffer.append(appendStr);
			return buffer.toString();
		}
	}

	/**
	 * 根据参数替换字符串内容功能
	 * 
	 * @param src 设置原字符串
	 * @param oldStr 指定替换字符串
	 * @param newStr 将要替换的内容
	 * @param isCaseSensitive 是否区分大小写
	 * @return String 返回结果
	 */
	public static String replace(String src, String oldStr, String newStr, boolean isCaseSensitive) {
		if (isEmpty(src) || isEmpty(oldStr) || newStr == null)
			return src;
		String s = isCaseSensitive ? src : src.toLowerCase();
		String o = isCaseSensitive ? oldStr : oldStr.toLowerCase();
		StringBuffer buffer = new StringBuffer(src);
		for (int index = s.length(); (index = s.lastIndexOf(o, index)) >= 0; index -= o.length())
			buffer.replace(index, index + o.length(), newStr);

		return buffer.toString();
	}

	/**
	 * 根据参数替换字符串内容功能，可指定位置
	 * 
	 * @param src 设置原字符串
	 * @param oldStr 指定替换字符串
	 * @param newStr 将要替换的内容
	 * @param isCaseSensitive 是否区分大小写
	 * @param index 指定位置
	 * @return String 返回结果
	 */
	public static String replace(String src, String oldStr, String newStr, boolean isCaseSensitive, int index) {
		if (src == null || src.length() == 0 || oldStr == null || oldStr.length() == 0 || index <= 0)
			return src;
		if (newStr == null)
			newStr = "";
		String s = isCaseSensitive ? src : src.toLowerCase();
		String old = isCaseSensitive ? oldStr : oldStr.toLowerCase();
		StringBuffer buffer = new StringBuffer(src);
		int length = old.length();
		int pos;
		for (pos = s.indexOf(old, 0); pos >= 0; pos = s.indexOf(old, pos + length))
			if (--index == 0)
				break;
		if (pos >= 0 && index == 0)
			buffer.replace(pos, pos + length, newStr);
		return buffer.toString();
	}

	/**
	 * 给传入的字符串前后加双引号
	 * 
	 * @param str 设置原字符串
	 * @return String 返回结果
	 */
	public static String quote(String str) {
		if (isEmpty(str))
			return "\"\"";
		StringBuffer buffer = new StringBuffer(str);
		if (!str.startsWith("\""))
			buffer.insert(0, "\"");
		if (!str.endsWith("\""))
			buffer.append("\"");
		return buffer.toString();
	}

	/**
	 * 去除字符串中的双引号
	 * 
	 * @param str 设置原字符串
	 * @return String 返回结果
	 */
	public static String extractQuotedStr(String str) {
		if (isEmpty(str))
			return str;
		StringBuffer buffer = new StringBuffer(str);
		int index = str.length();
		while (buffer.charAt(buffer.length() - 1) == '"') {
			buffer.deleteCharAt(buffer.length() - 1);
			index = buffer.length();
			if (index <= 0)
				break;
		}
		if (buffer.length() == 0)
			return "";
		while (buffer.charAt(0) == '"') {
			buffer.deleteCharAt(0);
			index = buffer.length();
			if (index <= 0)
				break;
		}
		return buffer.toString();
	}

	/**
	 * 截取字符串中到指定的字符的内容，从左边开始
	 * 
	 * @param str 设置原字符串
	 * @param c 设置指定字符
	 * @return String 返回结果
	 */
	public static String strChar(String str, char c) {
		if (str == null || str.length() == 0)
			return null;
		for (int i = 0; i < str.length(); i++)
			if (str.charAt(i) == c)
				return str.substring(i);

		return null;
	}

	/**
	 * 截取字符串中到指定的字符的内容，从右边开始
	 * 
	 * @param str 设置原字符串
	 * @param c   设置指定字符
	 * @return String 返回结果
	 */
	public static String strRChar(String str, char c) {
		if (str == null || str.length() == 0)
			return null;
		for (int i = str.length() - 1; i >= 0; i--)
			if (str.charAt(i) == c)
				return str.substring(i);

		return null;
	}

	/**
	 * 将Object对象数组转成字符串数组
	 * 
	 * @param array  设置Object对象数组
	 * @return String[] 返回结果
	 */
	public static String[] toArray(Object array[]) {
		if (array == null || array.length == 0)
			return null;
		String result[] = new String[array.length];
		for (int i = 0; i < array.length; i++)
			if (array[i] != null)
				result[i] = array[i].toString();

		return result;
	}

	/**
	 * 将字符串数组复制到LIST中
	 * 
	 * @param array 设置字符串数组
	 * @param list 设置LIST集合对象
	 * @param index 设置复制到LIST位置
	 * @return List 返回结果
	 */
	public static List copyToList(String array[], List list, int index) {
		if (array == null || array.length == 0)
			return list;
		if (list == null || index < 0)
			return list;
		for (int i = 0; i < array.length; i++)
			if (list.size() <= i + index)
				list.add(index + i, array[i]);
			else
				list.set(index + i, array[i]);

		return list;
	}

	/**
	 * 验证是否为电子邮件格式
	 * 
	 * @param theEmail 设置电子邮件地址字符串
	 * @return boolean 返回是否合法
	 */
	public static boolean isValidEmail(String theEmail) {
		boolean isEmail = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(theEmail);
			boolean isMatched = matcher.matches();
			if (isMatched) {
				isEmail = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return isEmail;
		}
		return isEmail;
	}

	/**
	 * 去除字符串左边空格
	 * 
	 * @param str 设置原字符串
	 * @return String 返回结果
	 */
	public static String trimLeft(String str) {
		if (str == null)
			return null;
		int length = str.length();
		if (length == 0)
			return "";
		StringBuffer buffer = new StringBuffer(str);
		int index;
		for (index = 0; index < length && buffer.charAt(index) == ' '; index++)
			;
		if (index == length)
			return "";
		else
			return buffer.substring(index);
	}

	/**
	 * 去除字符串右边空格
	 * 
	 * @param str 设置原字符串
	 * @return String 返回结果
	 */
	public static String trimRight(String str) {
		if (str == null)
			return null;
		int length = str.length();
		if (length == 0)
			return "";
		StringBuffer buffer = new StringBuffer(str);
		int index;
		for (index = length - 1; index >= 0 && buffer.charAt(index) == ' '; index--)
			;
		if (index < 0 && buffer.charAt(0) == ' ')
			return "";
		else
			return buffer.substring(0, index + 1);
	}

	/**
	 * 验证身份证的合法性
	 * 
	 * @param idcard 设置身份证字符串
	 * @return boolean 返回结果
	 */
	public static boolean idCardVerify(String idcard) {
		if (idcard.length() == 15) {
			idcard = idCardUptoeighteen(idcard);
		}
		if (idcard.length() != 18) {
			return false;
		}
		String verify = idcard.substring(17, 18);
		if (verify.equals(getIdCardVerify(idcard))) {
			return true;
		}
		return false;
	}

	/**
	 * 获得身份证的合法性
	 * 
	 * @param eightcardid 设置身份证字符串
	 * @return String 返回结果
	 */
	public static String getIdCardVerify(String eightcardid) {
		int remaining = 0;
		if (eightcardid.length() == 18) {
			eightcardid = eightcardid.substring(0, 17);
		}
		if (eightcardid.length() == 17) {
			int sum = 0;
			for (int i = 0; i < 17; i++) {
				String k = eightcardid.substring(i, i + 1);
				ai[i] = Integer.parseInt(k);
			}
			for (int i = 0; i < 17; i++) {
				sum = sum + wi[i] * ai[i];
			}
			remaining = sum % 11;
		}
		return remaining == 2 ? "X" : String.valueOf(vi[remaining]);
	}

	/**
	 * 获得身份证15转18位
	 * 
	 * @param fifteencardid 设置身份证字符串
	 * @return String 返回结果
	 */
	public static String idCardUptoeighteen(String fifteencardid) {
		if (fifteencardid.length() != 15)
			return null;
		String eightcardid = fifteencardid.substring(0, 6);
		eightcardid = eightcardid + "19";
		eightcardid = eightcardid + fifteencardid.substring(6, 15);
		eightcardid = eightcardid + getIdCardVerify(eightcardid);
		return eightcardid;
	}

	/**
	 * 验证电话号码合法格式，格式为02584555112
	 * 
	 * @param phoneCode 设置电话号码字符串
	 * @return boolean 返回结果
	 */
	public static boolean isPhoneNum(String phoneCode) {
		Pattern p = Pattern.compile("[0][1-9]{2,3}[1-9]{6,8}");
		Matcher m = p.matcher(phoneCode);
		boolean b = m.matches();
		return b;
	}

	/**
	 * 字符数组转换为字符串,用逗号隔开
	 * @param str
	 * @return
	 */
	public static String arrayToString(String[] str) {
		if (str == null)
			return "";
		StringBuffer rStr = new StringBuffer("");
		for (int i = 0; i < str.length; i++) {
			rStr.append(str[i]);
			rStr.append(",");
		}
		// 截取逗号
		if (rStr.toString().length() > 0) {
			rStr.setLength(rStr.length() - 1);
		}
		return rStr.toString();
	}

	/**
	 * 将String转换成BigDecimal
	 * @param str
	 * @return
	 */
	public static BigDecimal asBigDecimal(String str) {
		return asBigDecimal(str, new BigDecimal(BigInteger.ZERO));
	}

	/**
	 * 将String转换成BigDecimal
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static BigDecimal asBigDecimal(String str, BigDecimal defaultValue) {
		try {
			return new BigDecimal(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		} catch (RuntimeException runtimeexception) {
			return defaultValue;
		}
	}

	/**
	 * 将String转换成BigInteger
	 * @param str
	 * @return
	 */
	public static BigInteger asBigInteger(String str) {
		return asBigInteger(str, BigInteger.ZERO);
	}

	/**
	 * 将String转换成BigInteger
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static BigInteger asBigInteger(String str, BigInteger defaultValue) {
		try {
			return new BigInteger(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 boolean
	 * @param str
	 * @return
	 */
	public static boolean asBoolean(String str) {
		return asBoolean(str, false);
	}

	/**
	 *  将 String 解码为 Boolean
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Boolean asBoolean(String str, Boolean defaultValue) {
		try {
			str = str.trim();
			return Integer.decode(str).intValue() == 0 ? Boolean.FALSE : Boolean.TRUE;
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
		}
		if (str.equals(""))
			return defaultValue;
		for (int i = 0; i < FALSE_STRINGS.length; i++)
			if (str.equalsIgnoreCase(FALSE_STRINGS[i]))
				return Boolean.FALSE;

		return Boolean.TRUE;
	}

	/**
	 *  将 String 解码为 boolean
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static boolean asBoolean(String str, boolean defaultValue) {
		try {
			str = str.trim();
			return Integer.decode(str).intValue() != 0;
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
		}
		if (str.equals(""))
			return defaultValue;
		for (int i = 0; i < FALSE_STRINGS.length; i++)
			if (str.equalsIgnoreCase(FALSE_STRINGS[i]))
				return false;

		return true;
	}

	/**
	 * 将 String 解码为 byte
	 * @param str
	 * @return
	 */
	public static byte asByte(String str) {
		return asByte(str, (byte) 0);
	}

	/**
	 * 将 String 解码为 Byte
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Byte asByte(String str, Byte defaultValue) {
		try {
			return Byte.decode(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 byte
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static byte asByte(String str, byte defaultValue) {
		try {
			return Byte.decode(str.trim()).byteValue();
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 char
	 * @param str
	 * @return
	 */
	public static char asCharacter(String str) {
		return asCharacter(str, '\0');
	}

	/**
	 * 将 String 解码为 Character
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Character asCharacter(String str, Character defaultValue) {
		try {
			return new Character(str.trim().charAt(0));
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (IndexOutOfBoundsException indexoutofboundsexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 char
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static char asCharacter(String str, char defaultValue) {
		try {
			return str.trim().charAt(0);
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (IndexOutOfBoundsException indexoutofboundsexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 double
	 * @param str
	 * @return
	 */
	public static double asDouble(String str) {
		return asDouble(str, 0.0D);
	}

	/**
	 * 将 String 解码为 Double
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Double asDouble(String str, Double defaultValue) {
		try {
			return new Double(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 double
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static double asDouble(String str, double defaultValue) {
		try {
			return (new Double(str.trim())).doubleValue();
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 float
	 * @param str
	 * @return
	 */
	public static float asFloat(String str) {
		return asFloat(str, 0.0F);
	}

	/**
	 * 将 String 解码为 Float
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Float asFloat(String str, Float defaultValue) {
		try {
			return new Float(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 float
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static float asFloat(String str, float defaultValue) {
		try {
			return (new Float(str.trim())).floatValue();
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 int
	 * @param str
	 * @return
	 */
	public static int asInteger(String str) {
		return asInteger(str, 0);
	}

	/**
	 * 将 String 解码为 Integer
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Integer asInteger(String str, Integer defaultValue) {
		try {
			return Integer.decode(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 *  将 String 解码为 int
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static int asInteger(String str, int defaultValue) {
		try {
			return Integer.decode(str.trim()).intValue();
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 long
	 * @param str
	 * @return
	 */
	public static long asLong(String str) {
		return asLong(str, 0L);
	}

	/**
	 * 将 String 解码为 Long
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Long asLong(String str, Long defaultValue) {
		try {
			return Long.decode(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 long
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static long asLong(String str, long defaultValue) {
		try {
			return Long.decode(str.trim()).longValue();
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 short
	 * @param str
	 * @return
	 */
	public static short asShort(String str) {
		return asShort(str, (short) 0);
	}

	/**
	 * 将 String 解码为 Short
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Short asShort(String str, Short defaultValue) {
		try {
			return Short.decode(str.trim());
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 short
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static short asShort(String str, short defaultValue) {
		try {
			return Short.decode(str.trim()).shortValue();
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		} catch (NumberFormatException numberformatexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 String
	 * @param str
	 * @return
	 */
	public static String asString(String str) {
		return asString(str, "", "");
	}

	/**
	 * 将 String 解码为 String
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static String asString(String str, String defaultValue) {
		return asString(str, defaultValue, defaultValue);
	}

	/**
	 * 将 String 解码为 String
	 * @param str
	 * @param defaultValue 默认值
	 * @param emptyStringValue ""对应的值
	 * @return
	 */
	public static String asString(String str, String defaultValue, String emptyStringValue) {
		try {
			return str.equals("") ? emptyStringValue : str;
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		}
	}

	/**
	 * 将 String 解码为 Date
	 * @param str
	 * @return
	 */
	public static Date asDate(String str) {
		return asDate(str, new Date(), null);
	}

	/**
	 * 将 String 解码为 Date
	 * @param str
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Date asDate(String str, Date defaultValue) {
		return asDate(str, defaultValue, null);
	}

	/**
	 * 将 String 解码为 Date
	 * @param str
	 * @param defaultValue 默认值
	 * @param pattern
	 * @return
	 */
	public static Date asDate(String str, Date defaultValue, String pattern) {
		DateFormat formatter = new SimpleDateFormat(pattern != null ? pattern : DEFAULT_DATE_PATTTERN);
		try {
			return formatter.parse(str);
		} catch (ParseException parseexception) {
			return defaultValue;
		} catch (NullPointerException nullpointerexception) {
			return defaultValue;
		}
	}

	/**
	 * 将String按指定的type进行解码
	 * @param type 指定类型 （基本类型对象或Date）
	 * @param str
	 * @return
	 */
	public static Object asType(Class type, String str) {
		if (type.isAssignableFrom(java.lang.String.class))
			return asString(str, "", "");
		if (type.isAssignableFrom(java.lang.Integer.class) || type.equals(Integer.TYPE))
			return asInteger(str, new Integer(0));
		if (type.isAssignableFrom(java.lang.Double.class) || type.equals(Double.TYPE))
			return asDouble(str, new Double(0.0D));
		if (type.isAssignableFrom(java.lang.Boolean.class) || type.equals(Boolean.TYPE))
			return asBoolean(str, Boolean.FALSE);
		if (type.isAssignableFrom(java.lang.Float.class) || type.equals(Float.TYPE))
			return asFloat(str, new Float(0.0F));
		if (type.isAssignableFrom(java.lang.Long.class) || type.equals(Long.TYPE))
			return asLong(str, new Long(0L));
		if (type.isAssignableFrom(java.lang.Short.class) || type.equals(Short.TYPE))
			return asShort(str, new Short((short) 0));
		if (type.isAssignableFrom(java.lang.Byte.class) || type.equals(Byte.TYPE))
			return asByte(str, new Byte((byte) 0));
		if (type.isAssignableFrom(java.lang.Character.class) || type.equals(Character.TYPE))
			return asCharacter(str, new Character('\0'));
		if (type.isAssignableFrom(java.math.BigDecimal.class))
			return asBigDecimal(str, new BigDecimal(BigInteger.ZERO));
		if (type.isAssignableFrom(java.math.BigInteger.class))
			return asBigInteger(str, BigInteger.ZERO);
		if (type.isAssignableFrom(java.util.Date.class))
			return asDate(str, new Date(), null);
		else
			return null;
	}

	/**
	 * 将String按指定的type进行解码
	 * @param type
	 * @param str
	 * @param defaultValue 默认值 （str为null或""时的值）
	 * @return
	 */
	public static Object asType(Class type, String str, Object defaultValue) {
		if (type.isAssignableFrom(java.lang.String.class))
			return asString(str, (String) defaultValue);
		if (type.isAssignableFrom(java.lang.Integer.class) || type.equals(Integer.TYPE))
			return asInteger(str, (Integer) defaultValue);
		if (type.isAssignableFrom(java.lang.Double.class) || type.equals(Double.TYPE))
			return asDouble(str, (Double) defaultValue);
		if (type.isAssignableFrom(java.lang.Boolean.class) || type.equals(Boolean.TYPE))
			return asBoolean(str, (Boolean) defaultValue);
		if (type.isAssignableFrom(java.lang.Float.class) || type.equals(Float.TYPE))
			return asFloat(str, (Float) defaultValue);
		if (type.isAssignableFrom(java.lang.Long.class) || type.equals(Long.TYPE))
			return asLong(str, (Long) defaultValue);
		if (type.isAssignableFrom(java.lang.Short.class) || type.equals(Short.TYPE))
			return asShort(str, (Short) defaultValue);
		if (type.isAssignableFrom(java.lang.Byte.class) || type.equals(Byte.TYPE))
			return asByte(str, (Byte) defaultValue);
		if (type.isAssignableFrom(java.lang.Character.class) || type.equals(Character.TYPE))
			return asCharacter(str, (Character) defaultValue);
		if (type.isAssignableFrom(java.math.BigDecimal.class))
			return asBigDecimal(str, (BigDecimal) defaultValue);
		if (type.isAssignableFrom(java.math.BigInteger.class))
			return asBigInteger(str, (BigInteger) defaultValue);
		if (type.isAssignableFrom(java.util.Date.class))
			return asDate(str, (Date) defaultValue);
		else
			return null;
	}

	/**
	 * 将Object按指定的type进行解码
	 * @param type 指定类型
	 * @param obj 
	 * @return
	 */
	public static Object asType(Class type, Object obj) {
		if (!type.equals(java.lang.String.class) && type.isInstance(obj))
			return obj;
		if (obj == null || (obj instanceof String))
			return asType(type, (String) obj);
		if ((obj instanceof Date) && (java.lang.String.class).isAssignableFrom(type))
			return (new SimpleDateFormat(DEFAULT_DATE_PATTTERN)).format((Date) obj);
		if ((obj instanceof Number) && (java.lang.Number.class).isAssignableFrom(type)) {
			Number num = (Number) obj;
			if (type.isAssignableFrom(java.lang.Number.class))
				return num;
			if (type.isAssignableFrom(java.lang.Integer.class))
				return new Integer(num.intValue());
			if (type.isAssignableFrom(java.lang.Double.class))
				return new Double(num.doubleValue());
			if (type.isAssignableFrom(java.lang.Float.class))
				return new Float(num.floatValue());
			if (type.isAssignableFrom(java.lang.Long.class))
				return new Long(num.longValue());
			if (type.isAssignableFrom(java.lang.Short.class))
				return new Short(num.shortValue());
			if (type.isAssignableFrom(java.lang.Byte.class))
				return new Byte(num.byteValue());
			if (type.isAssignableFrom(java.math.BigInteger.class))
				return (new BigDecimal(num.toString())).toBigInteger();
			if (type.isAssignableFrom(java.math.BigDecimal.class))
				return new BigDecimal(num.toString());
		}
		return asType(type, obj.toString());
	}

	/**
	 * 将Object按指定的type进行解码
	 * @param type
	 * @param obj
	 * @param defaultValue 默认值
	 * @return
	 */
	public static Object asType(Class type, Object obj, Object defaultValue) {
		if (!type.equals(java.lang.String.class) && type.isInstance(obj))
			return obj;
		if (obj == null || (obj instanceof String))
			return asType(type, (String) obj, defaultValue);
		if ((obj instanceof Date) && (java.lang.String.class).isAssignableFrom(type))
			return (new SimpleDateFormat(DEFAULT_DATE_PATTTERN)).format((Date) obj);
		if ((obj instanceof Number) && (java.lang.Number.class).isAssignableFrom(type)) {
			Number num = (Number) obj;
			if (type.isAssignableFrom(java.lang.Number.class))
				return num;
			if (type.isAssignableFrom(java.lang.Integer.class))
				return new Integer(num.intValue());
			if (type.isAssignableFrom(java.lang.Double.class))
				return new Double(num.doubleValue());
			if (type.isAssignableFrom(java.lang.Float.class))
				return new Float(num.floatValue());
			if (type.isAssignableFrom(java.lang.Long.class))
				return new Long(num.longValue());
			if (type.isAssignableFrom(java.lang.Short.class))
				return new Short(num.shortValue());
			if (type.isAssignableFrom(java.lang.Byte.class))
				return new Byte(num.byteValue());
			if (type.isAssignableFrom(java.math.BigInteger.class))
				return (new BigDecimal(num.toString())).toBigInteger();
			if (type.isAssignableFrom(java.math.BigDecimal.class))
				return new BigDecimal(num.toString());
		}
		return asType(type, obj.toString(), defaultValue);
	}

	/**
	 * 获取className
	 * @param cls
	 * @return
	 */
	public static String getClassName(Class cls) {
		return getClassName(cls.getName());
	}

	/**
	 * 根据给定的应用全名获取类名
	 * @param fullName
	 * @return
	 */
	public static String getClassName(String fullName) {
		if (fullName == null) {
			return null;
		} else {
			fullName = fullName.trim();
			String className = fullName.substring(fullName.lastIndexOf('.') + 1).replace('$', '.').trim();
			return className.equals("") ? null : className;
		}
	}

	/**
	 * 指定解析为false的字符串
	 */
	private static String FALSE_STRINGS[] = { "false", "null", "nul", "off", "no", "n" };
	/**
	 * 默认日期模式
	 */
	private static String DEFAULT_DATE_PATTTERN = "yyyy-M-d";

	/**
	 * 转换UTF8的字符串为Unicode
	 * @param instr
	 * @return
	 * @throws IOException
	 */
	public static String convertUTF8String2Unicode(String instr) throws IOException {
		// byte[] strbytes = instr.getBytes();
		int charindex = instr.length();
		int actualValue;
		int inputValue;
		StringBuffer sbtemp = new StringBuffer();

		for (int i = 0; i < charindex;) {

			actualValue = -1;
			inputValue = instr.charAt(i++);

			inputValue &= 0xff;

			if ((inputValue & 0x80) == 0) {
				actualValue = inputValue;
			} else if ((inputValue & 0xF8) == 0xF0) {
				actualValue = (inputValue & 0x1f) << 18;

				int nextByte = instr.charAt(i++) & 0xff;
				if ((nextByte & 0xC0) != 0x80)
					throw new IOException("Invalid UTF-8 format");
				actualValue += (nextByte & 0x3F) << 12;

				nextByte = instr.charAt(i++) & 0xff;
				if ((nextByte & 0xC0) != 0x80)
					throw new IOException("Invalid UTF-8 format");
				actualValue += (nextByte & 0x3F) << 6;

				nextByte = instr.charAt(i++) & 0xff;
				if ((nextByte & 0xC0) != 0x80)
					throw new IOException("Invalid UTF-8 format");
				actualValue += (nextByte & 0x3F);
			} else if ((inputValue & 0xF0) == 0xE0) {
				actualValue = (inputValue & 0x1f) << 12;

				int nextByte = instr.charAt(i++) & 0xff;
				if ((nextByte & 0xC0) != 0x80)
					throw new IOException("Invalid UTF-8 format");
				actualValue += (nextByte & 0x3F) << 6;

				nextByte = instr.charAt(i++) & 0xff;
				if ((nextByte & 0xC0) != 0x80)
					throw new IOException("Invalid UTF-8 format");
				actualValue += (nextByte & 0x3F);
			} else if ((inputValue & 0xE0) == 0xC0) {
				actualValue = (inputValue & 0x1f) << 6;

				int nextByte = instr.charAt(i++) & 0xff;
				if ((nextByte & 0xC0) != 0x80)
					throw new IOException("Invalid UTF-8 format");
				actualValue += (nextByte & 0x3F);
			}
			sbtemp.append((char) actualValue);
		}

		return sbtemp.toString();
	}
	
	/**
	 * 将Unicode字符串转换为UTF8的字节数组
	 * @param instr
	 * @return
	 */
	public static byte[] convertUnicode2UTF8Byte(String instr) {
		int len = instr.length();
		byte[] abyte = new byte[len << 2];
		int j = 0;
		for (int i = 0; i < len; i++) {
			char c = instr.charAt(i);

			if (c < 0x80) {
				abyte[j++] = (byte) c;
			} else if (c < 0x0800) {
				abyte[j++] = (byte) (((c >> 6) & 0x1F) | 0xC0);
				abyte[j++] = (byte) ((c & 0x3F) | 0x80);
			} else if (c < 0x010000) {
				abyte[j++] = (byte) (((c >> 12) & 0x0F) | 0xE0);
				abyte[j++] = (byte) (((c >> 6) & 0x3F) | 0x80);
				abyte[j++] = (byte) ((c & 0x3F) | 0x80);
			} else if (c < 0x200000) {
				abyte[j++] = (byte) (((c >> 18) & 0x07) | 0xF8);
				abyte[j++] = (byte) (((c >> 12) & 0x3F) | 0x80);
				abyte[j++] = (byte) (((c >> 6) & 0x3F) | 0x80);
				abyte[j++] = (byte) ((c & 0x3F) | 0x80);
			}
		}

		byte[] retbyte = new byte[j];
		for (int i = 0; i < j; i++) {
			retbyte[i] = abyte[i];
		}
		return retbyte;
	}

	/**
	 * 将ISO10646转换为Unicode
	 * @param myByte
	 * @return
	 */
	public static String ISO106462Unicode(byte[] myByte) {
		String result = new String("");

		StringBuffer sb = new StringBuffer("");
		try {
			/* 将字符串转换成byte数组 */
			// byte[] myByte= str.getBytes("ISO10646");
			int len = myByte.length;

			for (int i = 0; i < len; i = i + 2) {
				byte hiByte = myByte[i];
				byte loByte = myByte[i + 1];

				int ch = hiByte << 8;
				ch = ch & 0xff00;
				ch += loByte & 0xff;

				sb.append((char) ch);
			}

			result = new String(sb.toString());

		} catch (Exception e) {
			System.out.println("Encoding Error");
		}
		return result;
	}
	
	/**
	 * 将Unicode字符串转换为字节
	 * @param s
	 * @return
	 */
	public static byte[] Unicode2Byte(String s) {
		int len = s.length();
		byte abyte[] = new byte[len << 1];
		int j = 0;
		for (int i = 0; i < len; i++) {
			char c = s.charAt(i);
			abyte[j++] = (byte) (c & 0xff);
			abyte[j++] = (byte) (c >> 8);
		}

		return abyte;
	}

	/**
	 * 将字符串转换成整数
	 * @param str
	 * @return
	 */
	public static int ConvertToInt(String str){
		int num = 0;
		try{
			num = Integer.parseInt(str);
		}catch(Exception e){
			num = 0;
		}
		return num;
	}
	/**
	 * 将字符串转换成整数对象
	 * @param str
	 * @return
	 */
	public static Integer ConvertToInteger(String str){
		Integer num = 0;
		try{
			num = Integer.parseInt(str);
		}catch(Exception e){
			num = 0;
		}
		return num;
	}
	
	/**
	 * 将字符串转换成长整数
	 * @param str
	 * @return
	 */
	public static long ConvertToLong(String str){
		long num = 0L;
		try{
			num = Long.parseLong(str);
		}catch(Exception e){
			num = 0L;
		}
		return num;
	}
	
	
	/**
	 * 将字符串转换成长整数对象
	 * @param str
	 * @return
	 */
	public static Long ConvertToLonger(String str){
		Long num = 0L;
		try{
			num = Long.parseLong(str);
		}catch(Exception e){
			num = 0L;
		}
		return num;
	}
	
	private static final String[] LOWERCASES = { "O", "一", "二", "三", "四", "五",
		"六", "七", "八", "九", "十" };

	private static final String[] UPPERCASES = { "零", "壹", "贰", "叁", "肆", "伍",
		"陆", "柒", "捌", "玖", "拾" };
	
	/**
	 * 把字符串中的数字转换成简体大写中文的格式
	 * 
	 * @param transStr
	 * @return 返回结果
	 */
	public static String lowerCaseTrans(String transStr) {
		if (null == transStr) {
			return null;
		}
		StringBuffer sbTmp = new StringBuffer();
		for (int i = 0; i < transStr.length(); i++) {
			String stmp = String.valueOf(transStr.charAt(i));
			if ("0123456789".indexOf(stmp) >= 0) {
				int irec = Integer.parseInt(stmp);
				sbTmp.append(LOWERCASES[irec]);
			} else {
				sbTmp.append(stmp);
			}
		}
		return sbTmp.toString();
	}
	/**
	 * 把字符串中的数字转换成繁体大写中文的格式
	 * 
	 * @param transStr
	 * @return 返回结果
	 */
	public static String upperCaseTrans(String transStr) {
		if (null == transStr) {
			return null;
		}
		StringBuffer sbTmp = new StringBuffer();
		for (int i = 0; i < transStr.length(); i++) {
			String stmp = String.valueOf(transStr.charAt(i));
			if ("0123456789".indexOf(stmp) >= 0) {
				int irec = Integer.parseInt(stmp);
				sbTmp.append(UPPERCASES[irec]);
			} else {
				sbTmp.append(stmp);
			}
		}
		return sbTmp.toString();
	}
	/**
	 * 把字符串中的数字转换成简体大写中文的格式(如:1977年11月08日->一九七七年十一月八日)
	 * 
	 * @param transStr
	 * @return 返回结果
	 */
	public static String lowerDateTrans(String transStr) {
		if (null == transStr) {
			return null;
		}
		String sbTmp = "";
		try{
			String syear = transStr.substring(0, 4);
			int imon = Integer.parseInt(transStr.substring(5, 7));
			int iday = Integer.parseInt(transStr.substring(8, transStr.length()-1));
			sbTmp += lowerCaseTrans(syear) + "年";
			if(imon>9 && imon<19) {
				String mtmp = String.valueOf(imon).substring(1, 2);
				if("0".equals(mtmp)){
					sbTmp += "十";
				} else {
					sbTmp += "十" + lowerCaseTrans(mtmp);
				}
			} else if(imon > 19) {
				String mtmp = lowerCaseTrans(String.valueOf(imon));
				sbTmp += mtmp.substring(0, 1) + "十" + mtmp.substring(1, 2);
			} else {
				sbTmp += lowerCaseTrans(String.valueOf(imon));
			}
			sbTmp += "月";
			if(iday>9 && iday<19) {
				String dtmp = String.valueOf(iday).substring(1, 2);
				if("0".equals(dtmp)){
					sbTmp += "十";
				} else {
					sbTmp += "十" + lowerCaseTrans(dtmp);
				}
			} else if(iday > 19) {
				String dtmp = lowerCaseTrans(String.valueOf(iday));
				sbTmp += dtmp.substring(0, 1) + "十" + dtmp.substring(1, 2);
			} else {
				sbTmp += lowerCaseTrans(String.valueOf(iday));
			}
			sbTmp += "号";
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		return sbTmp;
	}
	/**
	 * 把字符串中的数字转换成繁体大写中文的格式(如:1977年11月08日->壹玖柒柒年拾壹月捌日)
	 * 
	 * @param transStr
	 * @return 返回结果
	 */
	public static String upperDateTrans(String transStr) {
		if (null == transStr) {
			return null;
		}
		String sbTmp = "";
		try{
			String syear = transStr.substring(0, 4);
			int imon = Integer.parseInt(transStr.substring(5, 7));
			int iday = Integer.parseInt(transStr.substring(8, transStr.length()-1));
			sbTmp += upperCaseTrans(syear) + "年";
			if(imon>9 && imon<19) {
				String mtmp = String.valueOf(imon).substring(1, 2);
				if("0".equals(mtmp)){
					sbTmp += "拾";
				} else {
					sbTmp += "拾" + upperCaseTrans(mtmp);
				}
			} else if(imon > 19) {
				String mtmp = upperCaseTrans(String.valueOf(imon));
				sbTmp += mtmp.substring(0, 1) + "拾" + mtmp.substring(1, 2);
			} else {
				sbTmp += upperCaseTrans(String.valueOf(imon));
			}
			sbTmp += "月";
			if(iday>9 && iday<19) {
				String dtmp = String.valueOf(iday).substring(1, 2);
				if("0".equals(dtmp)){
					sbTmp += "拾";
				} else {
					sbTmp += "拾" + upperCaseTrans(dtmp);
				}
			} else if(iday > 19) {
				String dtmp = upperCaseTrans(String.valueOf(iday));
				sbTmp += dtmp.substring(0, 1) + "拾" + dtmp.substring(1, 2);
			} else {
				sbTmp += upperCaseTrans(String.valueOf(iday));
			}
			sbTmp += "号";
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		return sbTmp;
	}
	/**
	 * 切掉字符串中从右边开始相同的字符
	 * 
	 * @param str 需要处理的字符串
	 * @param chr 需要切掉的字符
	 * @return String 切掉后的字符
	 */
	public static String removeRigthChar(String str, char chr) {
		if (str == null || str.trim().length() < 1) {
			return null;
		}

		char[] chrArray = str.toCharArray();
		int iCount = 0;
		for (int i = chrArray.length - 1; i >= 0; i--) {
			if (chrArray[i] != chr) {
				break;
			}
			++iCount;
		}

		StringBuffer buf = new StringBuffer();
		for (int j = 0; j < chrArray.length - iCount; j++) {
			buf.append(chrArray[j]);
		}
		return buf.toString();
	}
	/**
	 * 在字符串中加上回车换行符，用在文本域文字
	 * 
	 * @param str 设置原字符串
	 * @param len 每行的字数
	 * @return String 返回字符串
	 */
	public static String warp(String str, int len) {
		StringBuffer buffer;
		if (StringUtil.isEmpty(str))
			return str;
		if (len <= 0 || len >= str.length())
			return str;
		buffer = new StringBuffer();
		StringReader reader = new StringReader(str);
		BufferedReader r = new BufferedReader(reader);

		// str = str.replaceAll("\n\r", ""); //替换掉字符串里已有的回车换行符
		String line;
		try {
			while ((line = r.readLine()) != null) {
				for (int i = 0; i < line.length(); i += len) {
					if (i + len < line.length())
						buffer.append(line.substring(i, i + len));
					else
						buffer.append(line.substring(i, line.length()));
					buffer.append("\n");
				}

			}
		} catch (IOException ioexception) {
		} finally {
			try {
				r.close();
			} catch (IOException ioexception1) {
			}
		}
		return buffer.toString();
	}
	/**
	 * 转换大写开头字符串
	 * 
	 * @param str 设置原字符串
	 * @return String 返回字符串
	 */
	public static String capitalize(String str) {
		if (StringUtil.isEmpty(str)) {
			return str;
		} else {
			StringBuffer buffer = new StringBuffer(str);
			buffer.setCharAt(0, str.substring(0, 1).toUpperCase().charAt(0));
			return buffer.toString();
		}
	}
	/**
	 * 转换小写开头字符串
	 * 
	 * @param str 设置原字符串
	 * @return String 返回字符串
	 */
	public static String deCapitalize(String str) {
		if (StringUtil.isEmpty(str)) {
			return str;
		} else {
			StringBuffer buffer = new StringBuffer(str);
			buffer.setCharAt(0, str.substring(0, 1).toLowerCase().charAt(0));
			return buffer.toString();
		}
	}
	/**
	 * 查询码功能，将输入的汉字，智能转换为英文简写码提供查询使用
	 * 
	 * @param character 设置字符串
	 * @return String 返回结果
	 */
	public static String getQueryCode(String character) {
		StringBuffer result=new StringBuffer("");
		  int  j=0,k=0,l=0,q=0;
		  char zm1[]={'A','B','C','D','E','F','G','H','J','K','L','M','N','O','P','Q','R','S','T','W','X','Y','Z'};
		  long n,m,p;
		  char firstzm;
		  
		 String Strhz[]={" 锕 捱 嗳 嗌 嫒 瑷 暧 砹 锿 霭 谙 埯 揞 犴 庵 桉 铵 鹌 黯 "+
              " 嚣 坳 拗 嗷 岙 廒 遨 媪 骜 獒 聱 螯 鏊 鳌 鏖 ",""+
              " 茇 菝 岜 灞 钯 粑 鲅 魃 捭 掰 阪 坂 钣 瘢 癍 舨 蒡 浜 曝 "+
              " 葆 孢 煲 鸨 褓 趵 龅 孛 陂 邶 埤 萆 蓓 呗 悖 碚 鹎 褙 鐾 鞴 夯 "+
              " 畚 坌 贲 锛 嘣 甏 匕 俾 埤 芘 荜 荸 萆 薜 吡 哔 狴 庳 愎 滗 濞 "+
              " 弼 妣 婢 嬖 璧 贲 睥 畀 铋 秕 裨 筚 箅 篦 舭 襞 跸 髀 匾 弁 苄 "+
              " 忭 汴 缏 飚 煸 砭 碥 窆 褊 蝙 笾 鳊 婊 骠 杓 飑 飙 镖 镳 瘭 裱 "+
              " 鳔 髟 蹩 傧 豳 缤 玢 槟 殡 膑 镔 髌 鬓 禀 邴 摒 槟 柏 卜 孛 亳 "+
              " 啵 饽 檗 掰 擘 礴 钹 鹁 簸 趵 跛 踣 卟 逋 瓿 晡 钚 钸 醭 ",""+
              " 嚓 礤 孱 骖 璨 粲 黪 嘈 漕 螬 艚 恻 岑 涔 刹 喳 嚓 猹 馇 汊 姹 杈 楂 "+
              " 槎 檫 锸 镲 衩 侪 钗 瘥 虿 冁 谄 蒇 廛 忏 潺 澶 孱 羼 婵 骣 觇 "+
              " 禅 镡 蟾 躔 倘 伥 鬯 苌 菖 徜 怅 惝 阊 娼 嫦 昶 氅 鲳 绰 剿 怊 "+
              " 晁 焯 耖 坼 砗 郴 伧 谌 谶 抻 嗔 宸 琛 榇 碜 龀 骋 秤 丞 埕 噌 "+
              " 枨 柽 塍 瞠 铖 铛 裎 蛏 酲 傺 坻 墀 茌 叱 哧 啻 嗤 饬 媸 敕 眵 "+
              " 鸱 瘛 褫 蚩 螭 笞 篪 豉 踟 魑 茺 忡 憧 铳 舂 艟 俦 帱 惆 瘳 雠 "+
              " 畜 亍 刍 怵 憷 绌 杵 楮 樗 褚 蜍 蹰 黜 搋 膪 踹 啜 嘬 舛 遄 巛 "+
              " 氚 钏 舡 怆 陲 棰 槌 茈 呲 祠 鹚 糍 楱 辏 腠 蔟 徂 猝 殂 酢 蹙 "+
              " 蹴 攒 汆 撺 爨 镩 萃 啐 悴 璀 榱 毳 隹 忖 皴 厝 嵯 脞 锉 矬 痤 瘥 鹾 蹉 ",""+
              " 耷 哒 嗒 怛 妲 沓 疸 褡 笪 靼 鞑 埭 甙 呔 岱 迨 骀 绐 玳 黛 "+
              " 诞 儋 萏 啖 澹 殚 赕 眈 疸 瘅 聃 箪 谠 凼 菪 宕 砀 裆 叨 帱 忉 "+
              " 氘 焘 纛 锝 噔 嶝 戥 磴 镫 簦 氐 籴 诋 谛 邸 坻 荻 嘀 娣 绨 柢 "+
              " 棣 觌 砥 碲 睇 镝 羝 骶 嗲 阽 坫 巅 玷 钿 癜 癫 簟 踮 铞 铫 貂 "+
              " 鲷 垤 堞 揲 喋 牒 瓞 耋 踮 蹀 鲽 仃 啶 玎 腚 碇 町 铤 疔 耵 酊 "+
              " 铥 垌 咚 岽 峒 氡 胨 胴 硐 鸫 蔸 窦 蚪 篼 芏 嘟 渎 椟 牍 蠹 笃 "+
              " 髑 黩 椴 煅 簖 怼 憝 碓 沌 炖 砘 礅 盹 镦 趸 驮 咄 哚 沲 缍 柁 铎 裰 踱 ",""+
              " 噩 谔 垩 苊 莪 萼 呃 愕 屙 婀 轭 腭 锇 锷 鹗 颚 鳄 诶 蒽 摁 佴 迩 珥 铒 鸸 鲕 ",""+
              " 垡 砝 蕃 蘩 幡 梵 燔 畈 蹯 坊 邡 彷 枋 钫 舫 鲂 芾 狒 悱 淝 妃 绯 榧 腓 "+
              " 斐 扉 镄 痱 蜚 篚 翡 霏 鲱 偾 瀵 玢 棼 鲼 鼢 俸 酆 葑 唪 沣 砜 缶 "+
              " 匐 凫 郛 芙 芾 苻 茯 莩 菔 拊 呋 幞 怫 滏 艴 孚 驸 绂 绋 桴 赙 "+
              " 祓 砩 黻 黼 罘 稃 馥 蚨 蜉 蝠 蝮 麸 趺 跗 鲋 鳆 ",""+
              " 尬 尕 尜 旮 钆 丐 陔 垓 戤 赅 坩 苷 尴 擀 泔 淦 澉 绀 橄 旰 矸 疳 酐 "+
              " 戆 罡 筻 睾 诰 郜 藁 缟 槔 槁 杲 锆 咯 屹 鬲 仡 哿 圪 塥 嗝 纥 "+
              " 搿 膈 硌 镉 袼 颌 虼 舸 骼 亘 茛 哏 艮 哽 赓 绠 鲠 珙 肱 蚣 觥 "+
              " 佝 诟 岣 遘 媾 缑 枸 觏 彀 笱 篝 鞲 嘏 诂 菰 呱 崮 汩 梏 轱 牯 "+
              " 牿 臌 毂 瞽 罟 钴 锢 鸪 鹄 痼 蛄 酤 觚 鲴 鹘 卦 诖 呱 栝 胍 鸹 "+
              " 纶 倌 莞 掼 涫 盥 鹳 矜 鳏 咣 犷 桄 胱 傀 炔 匦 刿 庋 宄 妫 桧 "+
              " 炅 晷 皈 簋 鲑 鳜 衮 绲 磙 鲧 涡 馘 埚 掴 呙 帼 崞 猓 椁 虢 聒 蜾 蝈 ",""+
              " 蛤 虾 铪 嘿 咳 嗨 胲 醢 邗 菡 撖 阚 瀚 晗 焓 顸 颔 蚶 鼾 沆 绗 珩 颃 镐 "+
              " 貉 蒿 薅 嗥 嚆 濠 灏 昊 皓 颢 蚝 诃 劾 壑 嗬 阖 纥 曷 盍 颌 蚵 翮 "+
              " 蘅 珩 桁 黉 訇 讧 荭 蕻 薨 闳 泓 堠 後 逅 瘊 篌 糇 鲎 骺 冱 唿 囫 "+
              " 岵 猢 怙 惚 浒 滹 琥 槲 轷 觳 烀 煳 戽 扈 祜 瓠 鹄 鹕 鹱 笏 醐 斛 "+
              " 骅 桦 砉 铧 踝 郇 奂 萑 擐 圜 獾 洹 浣 漶 寰 逭 缳 锾 鲩 鬟 隍 徨 "+
              " 湟 潢 遑 璜 肓 癀 蟥 篁 鳇 茴 荟 蕙 咴 哕 喙 隳 洄 浍 彗 缋 珲 桧 "+
              " 晖 恚 虺 蟪 麾 诨 馄 阍 溷 劐 藿 攉 嚯 夥 钬 锪 镬 耠 蠖 ",""+
              " 丌 亟 乩 剞 佶 偈 诘 墼 芨 芰 荠 蒺 蕺 掎 叽 咭 哜 唧 岌 嵴 洎 屐 骥 畿 "+
              " 玑 楫 殛 戟 戢 赍 觊 犄 齑 矶 羁 嵇 稷 瘠 虮 笈 笄 暨 跻 跽 霁 鲚 "+
              " 鲫 髻 麂 嘏 伽 郏 葭 岬 浃 迦 珈 戛 胛 恝 铗 镓 痂 瘕 袷 蛱 笳 "+
              " 袈 跏 僭 谏 谫 菅 蒹 搛 囝 湔 蹇 謇 缣 枧 楗 戋 戬 牮 犍 毽 腱 "+
              " 睑 锏 鹣 裥 笕 翦 趼 踺 鲣 鞯 吉 安 茳 洚 绛 缰 犟 礓 耩 糨 豇 "+
              " 僬 艽 茭 挢 噍 峤 徼 湫 姣 敫 皎 鹪 蛟 醮 跤 鲛 偈 讦 诘 拮 喈 "+
              " 嗟 婕 孑 桀 碣 疖 颉 蚧 羯 鲒 骱 饥 饿 卺 荩 堇 噤 馑 廑 妗 缙 "+
              " 瑾 槿 赆 觐 衿 刭 儆 阱 菁 獍 憬 泾 迳 弪 婧 肼 胫 腈 旌 靓 迥 "+
              " 炅 扃 僦 啾 阄 柩 桕 鸠 鹫 赳 鬏 倨 讵 苣 苴 莒 掬 遽 屦 琚 枸 "+
              " 椐 榘 榉 橘 犋 飓 钜 锔 窭 裾 趄 醵 踽 龃 雎 瞿 鞫 鄄 狷 涓 桊 "+
              " 蠲 锩 镌 隽 厥 劂 谲 矍 蕨 嗟 噘 噱 崛 獗 孓 珏 桷 橛 爝 镢 蹶 "+
              " 觖 巨 额 捃 皲 筠 麇 ",""+
              " 佧 咔 胩 剀 垲 蒈 忾 恺 铠 锎 锴 侃 莰 阚 戡 龛 瞰 伉 闶 钪 尻 栲 "+
              " 犒 铐 嗑 岢 恪 溘 骒 缂 珂 轲 氪 瞌 钶 锞 稞 疴 窠 颏 蝌 髁 "+
              " 裉 铿 倥 崆 箜 芤 蔻 叩 眍 筘 刳 堀 喾 绔 骷 侉 侩 蒯 郐 哙 "+
              " 狯 浍 脍 髋 诓 诳 邝 圹 夼 哐 纩 贶 馗 匮 夔 隗 蒉 揆 喹 喟 "+
              " 悝 愦 逵 暌 睽 聩 蝰 篑 跬 悃 阃 琨 锟 醌 鲲 髡 栝 蛞 ",""+
              " 剌 邋 旯 砬 瘌 崃 徕 涞 濑 赉 睐 铼 癞 籁 岚 漤 榄 斓 罱 镧 褴 "+
              " 莨 蒗 啷 阆 锒 稂 螂 潦 唠 崂 栳 铑 铹 痨 耢 醪 仂 叻 泐 鳓 "+
              " 羸 诔 嘞 嫘 缧 檑 耒 酹 塄 愣 鬲 俪 俚 郦 坜 苈 莅 蓠 藜 呖 "+
              " 唳 喱 猁 悝 溧 澧 逦 娌 嫠 骊 缡 枥 栎 轹 戾 砺 詈 罹 锂 鹂 "+
              " 疠 疬 蛎 蜊 蠡 笠 篥 粝 醴 跞 雳 鲡 鳢 黧 蔹 奁 潋 濂 琏 楝 "+
              " 殓 臁 裢 裣 蠊 鲢 立 案 墚 莨 椋 踉 靓 魉 蓼 尥 嘹 獠 寮 缭 "+
              " 钌 鹩 冽 埒 捩 咧 洌 趔 躐 鬣 蔺 啉 嶙 廪 懔 遴 檩 辚 膦 瞵 "+
              " 粼 躏 酃 苓 呤 囹 泠 绫 柃 棂 瓴 聆 蛉 翎 鲮 浏 遛 骝 绺 旒 "+
              " 熘 锍 镏 鹨 鎏 茏 泷 珑 栊 胧 砻 癃 偻 蒌 喽 嵝 镂 瘘 耧 蝼 "+
              " 髅 垆 蓼 撸 噜 闾 泸 渌 漉 逯 璐 栌 榈 橹 轳 辂 辘 氇 胪 膂 "+
              " 镥 稆 鸬 鹭 褛 簏 舻 鲈 挛 孪 滦 脔 娈 栾 鸾 銮 锊 囵 倮 蠃 "+
              " 荦 捋 摞 猡 泺 漯 珞 椤 脶 硌 镙 瘰 雒 麟 ",""+
              " 唛 犸 嬷 杩 蟆 劢 荬 霾 墁 幔 缦 熳 镘 颟 螨 鳗 鞔 邙 漭 硭 蟒 "+
              " 袤 茆 峁 泖 瑁 昴 牦 耄 旄 懋 瞀 蟊 髦 麽 莓 嵋 猸 浼 湄 楣 "+
              " 镅 鹛 袂 魅 扪 焖 懑 钔 勐 甍 瞢 懵 朦 礞 虻 蜢 蠓 艋 艨 芈 "+
              " 谧 蘼 咪 嘧 猕 汨 宓 弭 脒 祢 敉 糸 縻 麋 沔 渑 湎 腼 眄 喵 "+
              " 邈 缈 缪 杪 淼 眇 鹋 乜 咩 蠛 篾 苠 岷 闵 泯 缗 玟 珉 愍 黾 "+
              " 鳘 冥 茗 溟 暝 瞑 酩 谟 茉 蓦 馍 嫫 殁 镆 秣 瘼 耱 貊 貘 侔 "+
              " 哞 缪 眸 蛑 蝥 鍪 仫 坶 苜 沐 毪 钼 ",""+
              " 捺 肭 镎 衲 鼐 艿 萘 柰 喃 囝 囡 楠 腩 蝻 赧 攮 囔 馕 曩 孬 垴 呶 猱 "+
              " 瑙 硇 铙 蛲 讷 恁 伲 坭 猊 怩 昵 旎 祢 慝 睨 铌 鲵 廿 埝 辇 "+
              " 黏 鲇 鲶 茑 嬲 脲 袅 乜 陧 蘖 嗫 颞 臬 蹑 佞 苎 咛 甯 聍 拗 "+
              " 狃 忸 妞 侬 哝 耨 弩 胬 孥 驽 恧 钕 衄 傩 搦 喏 锘 ",""+
              " 讴 怄 瓯 耦 噢",""+
              " 葩 杷 钯 筢 俳 蒎 拚 爿 泮 袢 襻 蟠 蹒 彷 滂 逄 螃 匏 狍 庖 脬 疱 辔 "+
              " 帔 旆 锫 醅 霈 湓 堋 嘭 怦 蟛 丕 仳 陂 陴 邳 郫 圮 埤 鼙 芘 "+
              " 擗 吡 噼 庀 淠 媲 纰 枇 甓 睥 罴 铍 癖 裨 疋 蚍 蜱 貔 谝 骈 "+
              " 缏 犏 胼 翩 蹁 剽 莩 嘌 嫖 骠 缥 殍 瞟 螵 苤 氕 姘 嫔 榀 牝 "+
              " 颦 俜 娉 鲆 叵 陂 鄱 泺 珀 攴 钋 钷 钹 皤 笸 裒 掊 匍 噗 溥 "+
              " 濮 璞 氆 镤 镨 蹼 ",""+
              " 亟 亓 俟 圻 芑 芪 荠 萁 萋 葺 蕲 嘁 屺 岐 岖 汔 淇 骐 绮 琪 琦 杞 桤 "+
              " 槭 耆 欹 祺 憩 碛 颀 蛴 蜞 綦 綮 蹊 鳍 麒 葜 袷 髂 倩 佥 阡 "+
              " 芊 芡 茜 荨 掮 岍 悭 慊 骞 搴 褰 缱 椠 犍 肷 愆 钤 虔 箬 箝 "+
              " 戕 嫱 樯 戗 炝 锖 锵 镪 襁 蜣 羟 跄 劁 诮 谯 荞 峤 愀 憔 缲 "+
              " 樵 硗 跷 鞒 郄 惬 慊 妾 挈 锲 箧 芩 揿 吣 嗪 噙 廑 溱 檎 锓 "+
              " 矜 覃 螓 衾 苘 圊 檠 磬 蜻 罄 箐 綮 謦 鲭 黥 邛 茕 穹 蛩 筇 "+
              " 跫 銎 俅 巯 犰 湫 逑 遒 楸 赇 虬 蚯 蝤 裘 糗 鳅 鼽 诎 劬 苣 "+
              " 蕖 蘧 岖 衢 阒 璩 觑 氍 朐 祛 磲 鸲 癯 蛐 蠼 麴 瞿 黢 诠 荃 "+
              " 悛 绻 辁 畎 铨 蜷 筌 鬈 阕 阙 悫 逡 ",""+
              " 苒 蚺 髯 禳 穰 荛 娆 桡 仞 荏 葚 饪 轫 嵘 狨 榕 肜 蝾 糅 蹂 鞣 蓐 薷 "+
              " 嚅 洳 溽 濡 缛 铷 襦 颥 朊 芮 蕤 枘 睿 蚋 偌 ",""+
              " 卅 仨 挲 脎 飒 噻 馓 毵 糁 磉 颡 埽 缫 缲 臊 瘙 鳋 啬 铯 唼 嗄 挲 歃 "+
              " 铩 痧 裟 霎 鲨 剡 讪 鄯 埏 芟 潸 姗 嬗 骟 膻 禅 钐 疝 蟮 舢 "+
              " 跚 鳝 垧 绱 殇 熵 觞 劭 苕 潲 杓 蛸 筲 艄 慑 厍 佘 摺 猞 滠 "+
              " 歙 畲 麝 诜 谂 莘 葚 哂 渖 椹 胂 矧 蜃 嵊 渑 晟 眚 笙 嗜 噬 "+
              " 仕 侍 恃 谥 埘 莳 蓍 弑 轼 贳 炻 铈 螫 舐 筮 酾 豕 鲥 鲺 狩 "+
              " 绶 艏 黍 倏 塾 菽 摅 沭 澍 姝 纾 毹 腧 殳 秫 唰 蟀 闩 涮 泷 "+
              " 孀 蒴 搠 妁 槊 铄 嗣 伺 巳 厮 俟 兕 厶 咝 汜 泗 澌 姒 驷 缌 "+
              " 祀 锶 鸶 耜 蛳 笥 怂 讼 诵 凇 菘 崧 嵩 忪 悚 淞 竦 薮 嗖 嗾 "+
              " 馊 溲 飕 瞍 锼 螋 夙 谡 蔌 嗉 愫 涑 簌 觫 稣 蒜 狻 隋 绥 髓 "+
              " 遂 隧 祟 谇 荽 濉 邃 燧 眭 睢 荪 狲 飧 榫 隼 蓑 嗍 娑 桫 挲 睃 羧 ",""+
              " 獭 挞 蹋 拓 嗒 闼 溻 漯 遢 榻 沓 铊 趿 鳎 苔 酞 汰 邰 薹 呔 骀 肽 炱 "+
              " 钛 跆 鲐 檀 痰 潭 谭 毯 袒 叹 郯 澹 昙 忐 钽 锬 镡 傥 帑 溏 "+
              " 瑭 樘 铴 镗 耥 螗 螳 羰 醣 鼗 啕 洮 韬 焘 饕 忒 忑 慝 铽 藤 "+
              " 誊 滕 锑 蹄 啼 嚏 涕 剃 屉 倜 荑 悌 逖 绨 缇 鹈 裼 醍 舔 恬 "+
              " 腆 掭 忝 阗 殄 畋 佻 苕 祧 窕 蜩 笤 粜 龆 鲦 髫 萜 餮 烃 汀 "+
              " 亭 艇 莛 葶 婷 梃 町 铤 蜓 霆 侗 恫 桐 酮 瞳 彤 捅 佟 仝 垌 "+
              " 茼 嗵 峒 恸 潼 砼 钭 骰 堍 荼 菟 钍 酴 抟 彖 疃 蜕 忒 煺 饨 "+
              " 暾 豚 乇 佗 坨 庹 沱 柝 柁 橐 砣 铊 箨 酡 跎 鼍  ",""+
              " 佤 娲 腽 烷 皖 惋 宛 婉 腕 剜 芄 莞 菀 纨 绾 琬 脘 畹 蜿 罔 尢 惘 辋 "+
              " 魍 诿 隈 隗 圩 葳 薇 帏 帷 崴 嵬 猥 猬 闱 沩 洧 涠 逶 娓 玮 "+
              " 韪 軎 炜 煨 痿 艉 鲔 紊 刎 阌 汶 璺 雯 蓊 蕹 斡 倭 莴 喔 幄 "+
              " 渥 肟 硪 龌 兀 仵 阢 邬 圬 芴 唔 庑 怃 忤 浯 寤 迕 妩 婺 骛 "+
              " 杌 牾 焐 鹉 鹜 痦 蜈 鋈 鼯 ",""+
              " 僖 兮 隰 郗 茜 菥 葸 蓰 奚 唏 徙 饩 阋 浠 淅 屣 玺 樨 曦 觋 欷 歙 熹 "+
              " 禊 禧 皙 穸 裼 蜥 螅 蟋 舄 舾 羲 粞 翕 醯 蹊 鼷 呷 狎 遐 瑕 "+
              " 柙 硖 瘕 罅 黠 冼 苋 莶 藓 岘 猃 暹 娴 氙 燹 祆 鹇 痫 蚬 筅 "+
              " 籼 酰 跣 跹 霰 芗 葙 饷 庠 骧 缃 蟓 鲞 飨 哓 崤 潇 逍 骁 绡 "+
              " 枭 枵 蛸 筱 箫 魈 偕 亵 勰 燮 薤 撷 獬 廨 渫 瀣 邂 绁 缬 榭 "+
              " 榍 颉 躞 忻 衅 囟 馨 昕 歆 镡 鑫 陉 荇 荥 擤 饧 悻 硎 芎 咻 "+
              " 岫 馐 庥 溴 鸺 貅 髹 诩 勖 圩 蓿 洫 浒 溆 顼 栩 煦 砉 盱 胥 "+
              " 糈 醑 儇 谖 萱 揎 泫 渲 漩 璇 楦 暄 炫 煊 碹 铉 镟 痃 薛 谑 "+
              " 噱 泶 踅 鳕 浚 巽 郇 埙 荀 蕈 獯 恂 洵 浔 曛 窨 醺 鲟 ",""+
              " 垭 揠 岈 迓 娅 琊 桠 氩 砑 睚 痖 厣 赝 剡 俨 偃 兖 谳 阽 郾 鄢 芫 菸 "+
              " 崦 恹 闫 阏 湮 滟 妍 嫣 琰 檐 晏 胭 腌 焱 罨 筵 酽 魇 餍 鼹 "+
              " 疡 炀 烊 恙 蛘 舀 钥 夭 爻 吆 崾 徭 幺 珧 杳 轺 曜 肴 铫 鹞 "+
              " 窈 繇 鳐 噎 耶 掖 曳 腋 拽 靥 谒 邺 揶 晔 烨 铘 铱 翌 绎 刈 "+
              " 劓 仡 佚 佾 诒 圯 埸 懿 苡 荑 薏 弈 奕 挹 弋 呓 咦 咿 嗌 噫 "+
              " 峄 嶷 猗 饴 怿 怡 悒 殪 轶 贻 欹 旖 熠 眙 钇 镒 镱 痍 瘗 癔 "+
              " 翊 蜴 舣 羿 翳 酏 黟 胤 鄞 圻 垠 堙 茚 吲 喑 狺 夤 洇 湮 氤 "+
              " 铟 瘾 窨 蚓 霪 龈 嬴 郢 茔 荥 莺 萦 蓥 撄 嘤 膺 滢 潆 瀛 瑛 "+
              " 璎 楹 媵 鹦 瘿 颍 罂 臃 痈 雍 踊 咏 泳 恿 俑 壅 墉 喁 慵 邕 "+
              " 镛 甬 鳙 饔 釉 卣 攸 侑 莠 莜 莸 尢 呦 囿 宥 柚 猷 牖 铕 疣 "+
              " 蚰 蚴 蝣 蝤 繇 鱿 黝 鼬 禺 毓 伛 俣 谀 谕 萸 菀 蓣 揄 圄 圉 "+
              " 嵛 狳 饫 馀 庾 阈 鬻 妪 妤 纡 瑜 昱 觎 腴 腧 欤 於 煜 熨 燠 "+
              " 聿 钰 鹆 鹬 瘐 瘀 窬 窳 蜮 蝓 竽 臾 舁 雩 龉 垸 塬 芫 掾 圜 "+
              " 沅 媛 瑗 橼 爰 眢 鸢 螈 箢 鼋 龠 瀹 栎 樾 刖 钺 郧 陨 蕴 酝 "+
              " 晕 韵 郓 芸 狁 恽 愠 纭 韫 殒 昀 氲 熨 ",""+
              " 咂 甾 拶 瓒 昝 簪 糌 趱 錾 奘 驵 臧 唣 仄 赜 啧 帻 迮 昃 笮 箦 舴 谮 "+
              " 缯 甑 罾 锃 揸 吒 哳 喋 楂 砟 痄 蚱 齄 砦 瘵 谵 搌 旃 瘴 仉 "+
              " 鄣 幛 嶂 獐 嫜 璋 蟑 肇 诏 啁 棹 钊 笊 锗 蔗 谪 摺 柘 辄 磔 "+
              " 鹧 褶 蜇 赭 甄 砧 臻 贞 侦 枕 疹 圳 蓁 浈 溱 缜 桢 椹 榛 轸 "+
              " 赈 胗 朕 祯 畛 稹 鸩 箴 帧 诤 峥 徵 钲 卮 陟 郅 埴 芷 摭 帙 "+
              " 徵 忮 彘 咫 骘 栉 枳 栀 桎 轵 轾 贽 胝 膣 祉 祗 黹 雉 鸷 痣 "+
              " 蛭 絷 酯 跖 踬 踯 豸 觯 冢 忪 锺 螽 舯 踵 荮 啁 妯 纣 绉 胄 "+
	           " 碡 籀 繇 酎 伫 侏 邾 茱 洙 渚 潴 杼 槠 橥 炷 铢 疰 瘃 褚 竺 "+
              " 箸 舳 翥 躅 麈 挝 曳 拽 篆 啭 馔 沌 颛 僮 奘 骓 缒 倬 诼 擢 "+
              " 浞 涿 濯 棹 焯 禚 斫 镯 茈 呲 嵫 姊 孳 缁 梓 辎 赀 恣 眦 锱 "+
              " 秭 耔 笫 粢 趑 觜 訾 龇 鲻 髭 偬 枞 腙 粽 诹 陬 鄹 驺 鲰 诅 "+
              " 俎 菹 镞 攥 缵 躜 蕞 撙 樽 鳟 柞 阼 唑 嘬 怍 胙 祚 笮 "};

		 int len=character.getBytes().length;
		 int i=0;
		  k=-1;
		  while (i<len)
		  {
		   j=(int)(character.getBytes()[i]&0xFF);
		   if (j<128) 
		   {
			   k++;
			   result.append((char)character.getBytes()[i]);
			   i++;
		   }  
		   else   
		   { 
			  k++;
		      n=(int)(character.getBytes()[i]&0xFF);
		      n=n*256;
		      m=(int)(character.getBytes()[i+1]&0xFF);
		      p=n+m;
		      System.out.println(p);
		      if (p==41891) {firstzm='#';}
		      else if (p==41892) {firstzm='$';}
		      else if (p==41901) {firstzm='-';}
		      else if (p==41458) {firstzm='@';}
		      else if (p==41407) {firstzm=']';}
		      else if (p==41406) {firstzm='[';}
		      else if (p==41399) {firstzm='>';}
		      else if (p==41398) {firstzm='<';}
		      else if (p==41279) {firstzm='.';}

		      else if (p==41896) {firstzm='(';}
		      else if (p==41897) {firstzm=')';}
		      else if (p==41387) {firstzm='~';}
		      else if (p==41893) {firstzm='%';}
		      else if (p==41465) {firstzm='&';}
		      else if (p==41915) {firstzm=';';}
		      else if (p==41900) {firstzm=',';}
		      else if (p==41889) {firstzm='?';}
		      else if (p==41919) {firstzm='!';}

		      else if (p==41904) {firstzm='0';}
		      else if (p==41905) {firstzm='1';}
		      else if (p==41906) {firstzm='2';}
		      else if (p==41907) {firstzm='3';}
		      else if (p==41908) {firstzm='4';}
		      else if (p==41909) {firstzm='5';}
		      else if (p==41910) {firstzm='6';}
		      else if (p==41911) {firstzm='7';}
		      else if (p==41912) {firstzm='8';}
		      else if (p==41913) {firstzm='9';}


		      else if (p==41921) {firstzm='A';}
		      else if (p==41922) {firstzm='B';}
		      else if (p==41923) {firstzm='C';}
		      else if (p==41924) {firstzm='D';}
		      else if (p==41925) {firstzm='E';}
		      else if (p==41926) {firstzm='F';}
		      else if (p==41927) {firstzm='G';}
		      else if (p==41928) {firstzm='H';}
		      else if (p==41929) {firstzm='I';}
		      else if (p==41930) {firstzm='G';}
		      else if (p==41931) {firstzm='K';}
		      else if (p==41932) {firstzm='L';}
		      else if (p==41933) {firstzm='M';}
		      else if (p==41934) {firstzm='N';}
		      else if (p==41935) {firstzm='O';}
		      else if (p==41936) {firstzm='P';}
		      else if (p==41937) {firstzm='Q';}
		      else if (p==41938) {firstzm='R';}
		      else if (p==41939) {firstzm='S';}
		      else if (p==41940) {firstzm='T';}
		      else if (p==41941) {firstzm='U';}
		      else if (p==41942) {firstzm='V';}
		      else if (p==41943) {firstzm='W';}
		      else if (p==41944) {firstzm='X';}
		      else if (p==41945) {firstzm='Y';}
		      else if (p==41946) {firstzm='Z';}


		      else if (p>=45217&&p<=45252){firstzm='A';}
		      else if (p>=45253&&p<=45760){firstzm='B';}
		      else if (p>=45761&&p<=46317){firstzm='C';}
		      else if (p>=46318&&p<=46825){firstzm='D';}
		      else if (p>=46826&&p<=47009){firstzm='E';}
		      else if (p>=47010&&p<=47296){firstzm='F';}
		      else if (p>=47297&&p<=47613){firstzm='G';}
		      else if (p>=47614&&p<=48118){firstzm='H';}
		      else if (p>=48119&&p<=49061){firstzm='J';}
		      else if (p>=49062&&p<=49323){firstzm='K';}
		      else if (p>=49324&&p<=49895){firstzm='L';}
		      else if (p>=49896&&p<=50370){firstzm='M';}
		      else if (p>=50371&&p<=50613){firstzm='N';}
		      else if (p>=50614&&p<=50621){firstzm='O';}
		      else if (p>=50622&&p<=50905){firstzm='P';}
		      else if (p>=50906&&p<=51386){firstzm='Q';}
		      else if (p>=51387&&p<=51445){firstzm='R';}
		      else if (p>=51446&&p<=52217){firstzm='S';}
		      else if (p>=52218&&p<=52697){firstzm='T';}
		      else if (p>=52698&&p<=52979){firstzm='W';}
		      else if (p>=52980&&p<=53688){firstzm='X';}
		      else if (p>=53689&&p<=54480){firstzm='Y';}
		      else if (p>=54481&&p<=55289){firstzm='Z';}
		      else {firstzm='*';}

		      if (firstzm=='*') 
				     {
					 byte[] tmp=new byte[2];
					 tmp[0]=character.getBytes()[i];
					 tmp[1]=character.getBytes()[i+1];
					 String s=new String(tmp);
					 for (l=0;l<23;l++)
					 {
						 if(Strhz[l].indexOf(s)>=0)
						 {
							 result.append(zm1[l]);
							 break;
						 }
					 }
					 if (l==23) result.append('*'); 
		       }else{
		    	   result.append(firstzm);
		       }
		      i++;
		      i++;
		    }  

		   }  
		  return result.toString();
	}	
	
	/**
	 * 判断一个字符串是否有值，空格也不算有值
	 * @author 
	 * @param str
	 * @return
	 */
	public static boolean availableStr(String str){
		return (str!=null && !"".equals(str));
	}
	
	//测试主方法
//	public static void main(String args[]) {
//		String str = StringUtil.insert("abcdefg", "abc", 5);
//		System.out.println("str=" + str);
	
//	String str=FormatString.getQueryCode("管理员");
//	System.out.println("str="+str);
//	}
}
