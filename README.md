# FontDrawer

FontDrawer 是一個基於 HTML5 Canvas 的字型繪製工具，允許使用者自由繪製字型並生成 OTF 字型檔案。此工具提供繁體中文界面，並提供自動化功能以簡化手寫字型的生成過程。

## 功能特性

- **自由繪製字型**：使用 Canvas 在網頁上自由繪製字型。
- **字型生成**：支援生成 OTF 格式的字型檔案。
- **界面語言**：繁體中文（`index.html`）。
- **縮放字框**：可調整字型的大小和比例。
- **筆壓模擬**：即使設備不支援筆壓，也能模擬筆壓效果。

## 版本紀錄

請見[版本紀錄](ChangeLog.md)。

## 技術細節

- **主要技術**：
  - HTML5 Canvas
  - JavaScript
  - IndexedDB 用於儲存字型資料
  - [potrace.js](https://github.com/kilobtye/potrace) （GPL 2.0授權）用於將繪製的圖像轉換為 SVG。
  - [opentype.js](https://github.com/opentypejs/opentype.js) （MIT授權）用於生成 OTF 字型檔案。

- **檔案結構**：
  - `fontdrawer.js`：主要的字型繪製和生成邏輯。
  - `index.html`：繁體中文界面。
  - `glist/`：用於產生字表的工具。

## 注意事項

- **字型權利**：
  - 使用者生成的字型檔案的所有權屬於使用者，可自由公開或商業使用。並考慮斗內一下(笑)

- **技術限制**：
  - 生成的字型檔案可能不完全符合 CID 格式，部分 Adobe 應用可能無法正確識別為 CJK 字型。

- **建議**：
  - 定期備份未完成的字型檔案，以防資料遺失。

- **原始碼開源授權**：
  - 本專案程式碼開源授權，但由於引用之專案授權條款不同，請自行評估引用時須遵守之各授權規範。並請勿侵害以下商標等權益：
    - 網站名稱的「字嗨」為在台灣正式註冊的商標。
    - 產出之字型檔，VendorID所填入的「ZIHI」值，為本人於微軟註冊的字型廠商代碼。

## 貢獻者

- **開發者**：[@buttaiwan](https://x.com/buttaiwan)
- **感謝**：
  - [potrace.js](https://github.com/kilobtye/potrace)
  - [opentype.js](https://github.com/opentypejs/opentype.js)

## 斗內

若您覺得此工具能幫助到您，麻煩斗內一下吧～

信用卡（含國際信用卡）、超商條碼、超商代收，請 [點這裡](https://p.ecpay.com.tw/930AED7) 。亦支援 [PayPal](https://www.paypal.com/paypalme/buttaiwan) 。