const puppeteer = require("puppeteer");
const { createServer } = require("http");
const express = require("express");

const port = 4001;

const app = express();

// Create an HTTP server
const server = createServer(app);

let page;

(async () => {
  const browser = await puppeteer.launch({
    headless: false,
    args: ["--no-sandbox", "--disable-setuid-sandbox", "--display=:99"],
  });
  page = await browser.newPage();

  // Perform login and other actions
})();

app.get("/app", async () => {
  await page.goto("https://www.tiktok.com/login");
});

app.get("/", async (req, res) => {
  res.send("working...");
});

server.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
