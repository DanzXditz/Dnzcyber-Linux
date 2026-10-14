#!/bin/bash
MAGENTA='\033[1;35m'; PINK='\033[1;95m'; CYAN='\033[1;36m'
YELLOW='\033[1;33m'; GREEN='\033[1;32m'; NC='\033[0m'

frames=(
"        ♡
       /\\
      /  \\
     | o o|
     |  ▽ |
    /|   |\\
     |   |
     |_|_|"
"        ♡
       /\\
      /  \\
     | ^ ^|
     |  ▽ |
    /|   |\\
     |   |
     |_|_|"
"        ♡♡
       /\\
      /  \\
     | o o|
     |  ▽ |
    \\|   |/
     \\ | /
     |_|_|"
"       ♡♡♡
       /\\
      /  \\
     | > <|
     |  ▽ |
     /| |\\
    / | | \\
     |_|_|"
)

notes=("♪" "♪♪" "♪♪♪" "♫")
colors=("$MAGENTA" "$PINK" "$CYAN" "$YELLOW")

i=0
while true; do
    clear
    color=${colors[$((i % 4))]}
    frame=${frames[$((i % 4))]}
    note=${notes[$((i % 4))]}
    echo ""
    echo -e "${color}"
    echo "$frame"
    echo -e "${NC}"
    echo ""
    echo -e "    ${PINK}${note} LONELY LONELY ${note}${NC}"
    echo -e "${CYAN}    ══════════════════════════${NC}"
    echo -e "${YELLOW}    Press CTRL+C to stop${NC}"
    i=$((i + 1))
    sleep 0.3
done
