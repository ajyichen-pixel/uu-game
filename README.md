# UU遊戲

UU遊戲是一個紫電風格的 iPhone／iPad 本機 IPA 簽名與安裝 App。它以 [Feather](https://github.com/claration/Feather) 為基礎，使用內含的 zsign 簽名引擎。

## GitHub 公開來源

為了讓沒有 Git 憑證設定的 Windows 電腦也能發布完整專案，這個公開 repository 的完整、可建置來源放在根目錄的 `UU-Game-source.zip`。它包含所有必要的子模組原始碼，但排除了與 macOS 建置無關的 Windows 預編譯檔。下載後解壓縮即可取得 Xcode 專案；GitHub Actions 的 `Build UU遊戲 IPA` 工作流程會自動解壓縮並產生未簽名 IPA。

## 設計原則

- 只簽署你有權使用的 IPA。
- 不提供、下載或內建共用／企業簽名憑證。
- 不經由 URL 匯入或匯出 `.p12` 私鑰；憑證與描述檔必須從裝置的「檔案」App 手動選取。
- 首次安裝的未簽名 IPA 可由 AltStore 或其他合法側載方式簽署至你的裝置。

## 不需要 Mac 的建置方式

此專案包含 GitHub Actions workflow，會在 GitHub 的 macOS runner 上用 Xcode 編譯。

1. 在自己的 GitHub 帳號建立一個 repository，並推送這個資料夾的內容與子模組。
2. 開啟 repository 的 **Actions** 分頁，執行 **Build UU遊戲 IPA**。
3. 下載產物 `UU-Game-unsigned-IPA`，其中包含 `UU-Game-unsigned.ipa`。
4. 用 AltStore 將該 IPA 安裝到你的 iPhone 或 iPad。

該 workflow 產生的是**未簽名** IPA，沒有把任何 Apple 帳號、憑證或描述檔放進 GitHub。不要把 `.p12`、`.mobileprovision` 或密碼提交到 repository 或 Actions secrets，除非你完全瞭解相關風險。

## 裝置端使用

UU遊戲本身安裝後，使用者可在「憑證」頁面從「檔案」App 匯入自己持有的 `.p12` 和 `.mobileprovision`，再匯入有權使用的 IPA 進行本機簽名。Apple 的簽名憑證與描述檔決定哪些裝置與 App ID 可以安裝；本專案不會繞過這些規則。

## 授權與致謝

這是 Feather 的修改版本，依 GPL-3.0 授權。發布 binary 時，必須同時提供完整對應原始碼及本專案的 GPL-3.0 授權內容。保留原始 Feather、zsign 與其他相依套件的著作權與授權聲明。
