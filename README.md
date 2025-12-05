# VoronV0

Kit orginally bought from Siboor and received in January 2024
- Mellow Fly Gemini v3 board
- V0Display
- Rainbow barf on kirinami bed
- led lights on Hotend
- Dragon HF hotend

Added
- Nevermore v6 micro
- 120mm Aux fan
- Klipper Expander board
- USB Camera (needed a small hub to allow expander and camera to share the one USB left on main board)
- Rainbow on matchstick lights

## Deployment Workflow

### Test Physically Before Committing to Git
This workflow ensures we never commit broken code:

1. **Make changes locally** (in `C:\Dev\Control\GitHub\VoronV0\Config\`)
2. **Deploy to printer** via `.\deploy.ps1` (or `./deploy.sh`) to copy files to printer
3. **Restart firmware** via `.\restart.ps1` (or `./restart.sh`) to load changes using Moonraker API
4. **Test physically** - Actually run the printer and verify changes work
5. **Only after successful testing** - Commit to git and push to GitHub

### Git Remote Setup
We have two remotes configured:
- `printer` = The V0 printer itself (ssh://fly@192.168.4.127/home/fly/printer_data/config) - Source of truth
- `origin` = GitHub backup (https://github.com/mikehend/VoronV0.git)

To push to GitHub: `git push origin main`

### Key Benefits
- **No downtime** - Never commit broken configs that break the printer
- **Real validation** - Test under actual print conditions, not just syntax checks
- **Easy rollback** - Can always pull working config from printer if local changes fail
- **Safe experimentation** - Try changes without fear of breaking the printer permanently

