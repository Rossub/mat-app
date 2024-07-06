#!/bin/bash

# Colors for text
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print a separator line
print_separator() {
  echo -e "${YELLOW}-------------------------------------------------${NC}"
}

# Prompt user for the application name
print_separator
echo -e "${BLUE}Enter Name of your App: ${NC}"
read app_name

print_separator
echo -e "${GREEN}Creating Application $app_name.${NC}"
sleep 1

ng new $app_name --standalone=false

sleep 1
print_separator
echo -e "${GREEN}Creating images directory inside assets directory.${NC}"
mkdir $app_name/src/assets/images
echo -e "${GREEN}images directory created.${NC}"

sleep 1
print_separator
echo -e "${RED}Deleting everything from app.component.html.${NC}"
> $app_name/src/app/app.component.html

sleep 1
print_separator
echo -e "${GREEN}Adding Material.${NC}"
cd $app_name
ng add @angular/material

sleep 1
print_separator
echo -e "${GREEN}Creating modules directory and adding material-ui.module.ts file.${NC}"
cd src/app
mkdir modules
# cp ~/College/Sem3/Web/MaterialUIModuleFile/material-ui.module.ts modules/
cd modules
wget -O material-ui.module.ts "http://0x0.st/XBS4.ts"

sleep 1
print_separator
echo -e "${GREEN}Updating app.module.ts${NC}"
sed -i "7i import {MaterialModule} from './modules/material-ui.module';" "app.module.ts"
sed -i "8i import {ReactiveFormsModule} from '@angular/forms';" "app.module.ts"
sed -i "9i import {FormsModule} from '@angular/forms';" "app.module.ts"
sed -i '16i MaterialModule,' "app.module.ts"
sed -i '17i ReactiveFormsModule,' "app.module.ts"
sed -i '18i FormsModule,' "app.module.ts"

sleep 1
print_separator
echo -e "${GREEN}Copying google fonts link in app.component.html${NC}"
echo '<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">' > app.component.html

sleep 1
print_separator
echo -e "${GREEN}Serving the app to localhost.${NC}"
ng serve --open
