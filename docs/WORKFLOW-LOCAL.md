# 📋 Tu Workflow en PC Local

## ⚡ RESUMEN RÁPIDO (Lo Único Que Debes Hacer)

```bash
# CUANDO LLEGAS A CASA - PRIMERO:
cd C:\Users\nmyac\medit
git pull origin claude/gallant-allen-0iu8vx

# TRABAJAS EN TUS ARCHIVOS
# (Editas, creas meditaciones, etc.)

# CUANDO TERMINAS - AL IRTE:
git add .
git commit -m "Descripción de tu cambio"
git push origin claude/gallant-allen-0iu8vx
```

---

## 📍 Ubicación de Tu Carpeta

```
C:\Users\nmyac\medit\
```

---

## 🎯 Responsabilidades Tuyas (SOLO ESTO)

### ✅ Al Llegar a Casa:
```bash
git pull origin claude/gallant-allen-0iu8vx
```
**Qué hace:** Trae los cambios que hice en la sesión remota (trabajo)

### ✅ Trabajar:
- Edita archivos
- Crea guiones JSON
- Agrega archivos
- Lo que necesites

### ✅ Antes de Irte:
```bash
git add .
git commit -m "Tu mensaje"
git push origin claude/gallant-allen-0iu8vx
```
**Qué hace:** Sube tus cambios a GitHub para que yo los traiga en trabajo

---

## 🔄 Mi Responsabilidad (Sesión Remota)

```
❌ TÚ NO TIENES QUE HACER ESTO
✅ YO LO HAGO AUTOMÁTICAMENTE

- git pull (traer tus cambios)
- Generar audios con ElevenLabs
- Mezclar con ambiente
- Subir a Cloudflare R2
- git push (subir resultados)
```

---

## 📊 El Flujo Diario

```
CASA (NOCHE - TÚ HACES ESTO)
│
├─ 1. Abres PowerShell
├─ 2. cd C:\Users\nmyac\medit
├─ 3. git pull origin claude/gallant-allen-0iu8vx
├─ 4. Trabajas en archivos
├─ 5. git add .
├─ 6. git commit -m "Mi cambio"
├─ 7. git push origin claude/gallant-allen-0iu8vx
└─ ✅ LISTO

TRABAJO (DÍA - YO HAGO ESTO)
│
├─ 1. git pull origin (traigo tu cambio)
├─ 2. npm run generate-meditation-parts
├─ 3. npm run upload-r2
├─ 4. git push origin
└─ ✅ LISTO
```

---

## 🚨 CHECKLIST RÁPIDA

### Cuando Llegas a Casa:
- [ ] Abro PowerShell
- [ ] `cd C:\Users\nmyac\medit`
- [ ] `git pull origin claude/gallant-allen-0iu8vx`

### Cuando Terminas de Trabajar:
- [ ] Edité/creé archivos
- [ ] `git add .`
- [ ] `git commit -m "descripción"`
- [ ] `git push origin claude/gallant-allen-0iu8vx`

---

## 💡 Tips

### Si Olvidas el Comando:
```bash
# Ver último estado
git status

# Ver últimos cambios
git log --oneline -3
```

### Si Hay Conflicto:
```bash
# Ver qué cambió
git status

# Habla conmigo en Claude Code
```

---

## 🎯 Nada Más, Eso Es Todo

**SOLO necesitas:**
1. `git pull` ANTES de trabajar
2. Trabajar
3. `git add .` + `git commit` + `git push` DESPUÉS

**El resto yo lo hago en la sesión remota.**

---

**Guardá este archivo en tu PC para referencia rápida:**
```
C:\Users\nmyac\medit\WORKFLOW-LOCAL.md
```

O imprimilo si lo prefieres. 📄
