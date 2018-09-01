package cn.edu.nyist.springboot09_jsp_hbi.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ValidtorController {
	
	@RequestMapping("/vcode.png")
	public void getVcode(HttpServletResponse response,HttpServletRequest request) throws IOException {
		int width = 100;
		int height = 40;
		int codeCount = 4;
		int xx = width / (codeCount + 1);
		int fontHeight = height - 2;
		int codeY = height - 4;
		char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
				'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D gd = buffImg.createGraphics();

		Random random = new Random();

	
		gd.setColor(Color.WHITE);
		gd.fillRect(0, 0, width, height);

	
		Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);
	
		gd.setFont(font);

		
		gd.setColor(Color.BLACK);
		gd.drawRect(0, 0, width - 1, height - 1);

		
		gd.setColor(Color.BLACK);
		for (int i = 0; i < 30; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}

	
		StringBuffer randomCode = new StringBuffer();
		int red = 0, green = 0, blue = 0;

	
		for (int i = 0; i < codeCount; i++) {
			
			String strRand = String.valueOf(codeSequence[random.nextInt(36)]);
			
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);

		
			gd.setColor(new Color(red, green, blue));
			gd.drawString(strRand, (i + 1) * xx, codeY);

		
			randomCode.append(strRand);
		}
	
		HttpSession session = request.getSession();
		session.setAttribute("validateCode", randomCode.toString());

		
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		response.setContentType("image/jpeg");

	
		ServletOutputStream sos = response.getOutputStream();
		ImageIO.write(buffImg, "jpeg", sos);
		sos.close();

	}
}
