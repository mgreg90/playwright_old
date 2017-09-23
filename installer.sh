# Welcome to playwright!

# Cancel install if no bash profile given
[ -z "$2" ] && echo "You gotta gimme your bash profile bruh" && exit
# Create file structure
md -pv ~/playwright/plays ~/playwright/lib/classes ~/playwright/lib/modules ~/playwright/shell ~/playwright/.src
# Copy this repo over
cp -Rv $(pwd) ~/playwright/.src
# Blammo! Done installing!
echo 'Playwright has been installed!'