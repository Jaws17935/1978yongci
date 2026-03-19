# 詠慈佛像雕刻 — 官方網站

靜態官網原始檔，正式網域：**[yongciart.com](https://yongciart.com/)**

## GitHub Pages

1. 儲存庫 **Settings → Pages**：Source 選 `Deploy from a branch`，Branch 選 `main` / 資料夾 `(root)`。
2. 網域：根目錄已含 `CNAME`（`yongciart.com`），請在網域 DNS 依 [GitHub 說明](https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site) 設定 **A 記錄** 或 **CNAME**。

## 本機預覽

直接用瀏覽器開啟 `index.html` 即可。

## 修正後同步到線上（部署）

網站架在 **GitHub Pages**：只要 **`git push` 到 `main`**，GitHub 會自動重建；不必再手動按別的部署鈕。

### 方式一：一鍵腳本（建議）

在專案資料夾開 PowerShell：

```powershell
.\deploy.ps1
```

或自訂說明文字：

```powershell
.\deploy.ps1 -Message "修正首頁圖片"
```

會自動：`git add -A` → `commit` → `push`。

### 方式二：每次 commit 完就自動 push

只要設定一次，之後照平常 `git add` + `git commit`，**提交成功後會自動 `git push`**：

```powershell
cd "專案路徑"
git config core.hooksPath .githooks
```

（此設定僅影響本機這份 repo。）

若要取消自動 push：

```powershell
git config --unset core.hooksPath
```

### 小提醒

- **存檔 ≠ 上線**：一定要 **提交並推送**，線上才會更新。
- 推送前請確認已登入 GitHub（HTTPS 憑證或 SSH）。
