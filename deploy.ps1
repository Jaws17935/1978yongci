# 一鍵：加入變更 → 提交 → 推送到 GitHub（Pages 會自動更新）
# 用法：
#   .\deploy.ps1
#   .\deploy.ps1 -Message "修正聯絡資訊"

param(
    [string]$Message = "更新網站"
)

Set-Location $PSScriptRoot

git add -A
$changes = git status --porcelain
if (-not $changes) {
    Write-Host "[deploy] 沒有變更，已略過。" -ForegroundColor Yellow
    exit 0
}

git commit -m $Message
if ($LASTEXITCODE -ne 0) {
    Write-Host "[deploy] 提交失敗。" -ForegroundColor Red
    exit $LASTEXITCODE
}

git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "[deploy] 推送失敗（請檢查網路或 GitHub 登入）。" -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "[deploy] 已推送到 GitHub，Pages 約 1～3 分鐘後更新。" -ForegroundColor Green
