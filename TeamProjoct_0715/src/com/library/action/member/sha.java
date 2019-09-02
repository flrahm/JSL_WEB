package com.library.action.member;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class sha {
	    public static void main(String[] args) throws Exception {
	        System.out.println(sha256("needjarvis"));        
	    }
	 
	 
	    /**
	     * SHA-256���� �ؽ��ϴ� �޼ҵ�
	     * 
	     * @param bytes
	     * @return
	     * @throws NoSuchAlgorithmException 
	     */
	    public static String sha256(String msg)  {
	    	
	    	try {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(msg.getBytes());
	        return bytesToHex(md.digest());
	    	}catch (Exception e) {
				e.printStackTrace();
			}
	        return "";
	        
	    }
	 
	 
	    /**
	     * ����Ʈ�� �������� ��ȯ�Ѵ�
	     * 
	     * @param bytes
	     * @return
	     */
	    public static String bytesToHex(byte[] bytes) {
	        StringBuilder builder = new StringBuilder();
	        for (byte b: bytes) {
	          builder.append(String.format("%02x", b));
	        }
	        return builder.toString();
	    }
	}


