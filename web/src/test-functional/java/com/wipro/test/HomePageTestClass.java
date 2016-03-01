package com.wipro.test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.Test;

public class HomePageTestClass {
	@Test
	public void testCaseHomepage() {
		System.setProperty("webdriver.chrome.driver",
				System.getProperty("user.dir")
						+ "\\chromedriver\\chromedriver.exe");
		ChromeDriver driver = new ChromeDriver();
		//FirefoxDriver driver = new FirefoxDriver();
		driver.get(System.getProperty("url"));

		driver.findElement(By.xpath("//input [@id='hcpName']")).sendKeys(
				"jhon@mail.com");
		driver.findElement(By.xpath("//input [@id='hcpPass']")).sendKeys(
				"12345");
		driver.findElement(By.xpath("//*[@type='submit']")).click();
	
		WebElement e1 = driver.findElement(By.xpath("//*[@id='navbar']/ul/li[1]/a"));
		System.out.println(e1);
		String expectedName ="Welcome Jhon Doe";

		try {
			Assert.assertEquals(e1.getText(), expectedName);
		} finally {
			driver.close();
			driver.quit();
		}
	}
}
