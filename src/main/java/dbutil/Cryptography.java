package dbutil;

import java.util.Base64;
import java.util.Base64.Decoder;

public class Cryptography {
	public static String encode(String text) {
		Base64.Encoder encoder=Base64.getEncoder();
		byte byteArr[]=encoder.encode(text.getBytes());
		return new String(byteArr);
	}
	
	public static String decode (String encrypt) {
		Base64.Decoder decoder=Base64.getDecoder();
		byte byteArr[]=decoder.decode(encrypt);
		return new String(byteArr);
	}

}
