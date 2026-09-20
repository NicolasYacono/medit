# Script PowerShell para Sincronizar PC Local
# Guardar en: C:\Users\nmyac\medit\scripts\sync-local.ps1
# Usar: powershell -ExecutionPolicy Bypass -File sync-local.ps1

Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  SYNC MEDIT - Sincronizar Proyecto    ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Preguntar qué quiere hacer
Write-Host "¿Qué deseas hacer?" -ForegroundColor Yellow
Write-Host "1) PULL - Traer cambios (antes de trabajar)"
Write-Host "2) PUSH - Subir cambios (después de trabajar)"
Write-Host "3) STATUS - Ver estado actual"
Write-Host "4) PULL + PUSH - Sincronizar completo"
Write-Host ""

$opcion = Read-Host "Ingresa número (1-4)"

Write-Host ""

switch ($opcion) {
    "1" {
        Write-Host "📥 PULLING cambios..." -ForegroundColor Green
        git pull origin claude/gallant-allen-0iu8vx
        Write-Host "✅ Pull completado" -ForegroundColor Green
    }

    "2" {
        Write-Host "📤 PUSHING cambios..." -ForegroundColor Green

        # Verificar si hay cambios
        $status = git status --short
        if ($status) {
            Write-Host "Cambios detectados:" -ForegroundColor Yellow
            Write-Host $status
            Write-Host ""

            $mensaje = Read-Host "Ingresa mensaje de commit"
            git add .
            git commit -m "$mensaje"
            git push origin claude/gallant-allen-0iu8vx

            Write-Host "✅ Push completado" -ForegroundColor Green
        }
        else {
            Write-Host "⚠️  No hay cambios para subir" -ForegroundColor Yellow
        }
    }

    "3" {
        Write-Host "📊 Estado Actual:" -ForegroundColor Green
        Write-Host ""
        git status
        Write-Host ""
        Write-Host "📈 Últimos 3 commits:" -ForegroundColor Green
        git log --oneline -3
    }

    "4" {
        Write-Host "🔄 SINCRONIZACIÓN COMPLETA" -ForegroundColor Green
        Write-Host ""

        Write-Host "1. Trayendo cambios..." -ForegroundColor Yellow
        git pull origin claude/gallant-allen-0iu8vx
        Write-Host "✅ Pull completado" -ForegroundColor Green
        Write-Host ""

        Write-Host "2. Verificando cambios locales..." -ForegroundColor Yellow
        $status = git status --short
        if ($status) {
            Write-Host "Cambios detectados:" -ForegroundColor Yellow
            Write-Host $status
            Write-Host ""

            $mensaje = Read-Host "Ingresa mensaje de commit"
            git add .
            git commit -m "$mensaje"
            git push origin claude/gallant-allen-0iu8vx

            Write-Host "✅ Push completado" -ForegroundColor Green
        }
        else {
            Write-Host "✅ No hay cambios locales" -ForegroundColor Green
        }

        Write-Host ""
        Write-Host "🎉 Sincronización completada" -ForegroundColor Green
    }

    default {
        Write-Host "❌ Opción inválida" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Presiona cualquier tecla para salir..." -ForegroundColor Gray
Read-Host
