package run;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Scanner;

public class main {
	public static void main(String[] args) {
		ArrayList<String> passwords = new ArrayList<String>();
		ArrayList<String> encrypted = new ArrayList<String>();
		
		//ranges:
		//33-126: all printable ascii characters
		
		String fullRange = "33-126";
		//65-90: uppercase letters
		String upperRange = "65-90";
		//97-122: lowercase letters
		String lowerRange = "97-122";
		//48-57: numbers
		String numberRange = "48-57";
		//33-47: special characters
		String specialRange = "33-47";
		
		Scanner in = new Scanner(System.in);
		System.out.println("How many characters?:");
		int n = Integer.parseInt(in.nextLine());
		System.out.println("How many passwords?:");
		int m = Integer.parseInt(in.nextLine());
		System.out.println("What character range? (full, upper, lower, number, special, upperLower, specialUpperLower, lowerNum, upperNum,upperLowerNum):");
		String range = in.nextLine();
		
		
		for (int i = 0; i < m; i++) {
			StringBuilder password = new StringBuilder();
			for (int j = 0; j < n; j++) {
				if (range.equals("full")) {
					password.append((char) (int) (Math.random() * (126 - 33) + 33));
				} else if (range.equals("upper")) {
					password.append((char) (int) (Math.random() * (90 - 65) + 65));
				} else if (range.equals("lower")) {
					password.append((char) (int) (Math.random() * (122 - 97) + 97));
				} else if (range.equals("number")) {
					password.append((char) (int) (Math.random() * (57 - 48) + 48));
				} else if (range.equals("special")) {
					password.append((char) (int) (Math.random() * (47 - 33) + 33));
				}
				else if (range.equals("upperLower")) {
					if (Math.random() < 0.5) {
						password.append((char) (int) (Math.random() * (90 - 65) + 65));
					} else {
						password.append((char) (int) (Math.random() * (122 - 97) + 97));
					}
				}
				else if (range.equals("specialUpperLower")) {
					if (Math.random() < 0.33) {
						password.append((char) (int) (Math.random() * (47 - 33) + 33));
					} else if (Math.random() < 0.66) {
						password.append((char) (int) (Math.random() * (90 - 65) + 65));
					} else {
						password.append((char) (int) (Math.random() * (122 - 97) + 97));
					}
				}
				else if (range.equals("lowerNum")) {
					if (Math.random() < 0.5) {
						password.append((char) (int) (Math.random() * (122 - 97) + 97));
					} else {
						password.append((char) (int) (Math.random() * (57 - 48) + 48));
					}
				} else if (range.equals("upperNum")) {
					if (Math.random() < 0.5) {
						password.append((char) (int) (Math.random() * (90 - 65) + 65));
					} else {
						password.append((char) (int) (Math.random() * (57 - 48) + 48));
					}
				} else if (range.equals("upperLowerNum")) {
					if (Math.random() < 0.33) {
						password.append((char) (int) (Math.random() * (90 - 65) + 65));
					} else if (Math.random() < 0.66) {
						password.append((char) (int) (Math.random() * (122 - 97) + 97));
					} else {
						password.append((char) (int) (Math.random() * (57 - 48) + 48));
					}
				}
				else {
					password.append((char) (int) (Math.random() * (126 - 33) + 33));
				}
			}
			passwords.add(password.toString());
		}
		BufferedWriter writer=null;
		try {
			writer = new BufferedWriter(new FileWriter("C:\\Users\\walli\\Downloads\\hashcat-6.2.6\\hashcat-6.2.6\\output.txt"));
			File f = new File("output.txt");
			System.out.println(f.getAbsolutePath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(String p : passwords) {
            try {
            	//credit till geekforgeeks
            	MessageDigest md = MessageDigest.getInstance("MD5");
            	byte[] messageDigest = md.digest(p.getBytes());
            	
            	BigInteger no = new BigInteger(1, messageDigest);
            	String hashtext = no.toString(16);
                while (hashtext.length() < 32) {
                    hashtext = "0" + hashtext;
                }
                encrypted.add(hashtext);
                
            }
            catch (Exception e) {
                e.printStackTrace();
            }
		}
		for(String password : encrypted) {
			try {
				writer.write(password + "\n");
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		try {
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    }
}
