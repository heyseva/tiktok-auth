const puppeteer = require("puppeteer");

(async () => {
  const browser = await puppeteer.launch({
    headless: false,
    args: ["--no-sandbox", "--disable-setuid-sandbox", "--display=:99"],
  });
  const page = await browser.newPage();
  await page.goto("https://www.tiktok.com/login");
  // Perform login and other actions
})();
