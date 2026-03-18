#!/bin/bash
# Clone alle NoveuFlow repos naast deze meta-repo
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

repos=(
  "FameMartijn/noveuflow-wordpress"
  "FameMartijn/marketing-website-noveuflow"
  "FameMartijn/noveuflow-saas"
  "FameMartijn/noveuflow-npm"
  "FameMartijn/noveuflow-odoo"
  "FameMartijn/noveuflow-archief"
)

for repo in "${repos[@]}"; do
  name=$(basename "$repo")
  target="$PARENT_DIR/$name"
  if [ -d "$target" ]; then
    echo "✓ $name bestaat al, overslaan"
  else
    echo "→ Clonen: $repo"
    git clone "https://github.com/$repo.git" "$target"
  fi
done

echo ""
echo "Klaar! Alle repos staan in: $PARENT_DIR"
