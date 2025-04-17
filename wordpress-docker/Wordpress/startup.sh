#!/bin/bash

# Detect full URL based on environment or fallback
if [ -z "$WP_HOME" ]; then
  # Use HTTP_HOST if passed in by Render, etc.
  WP_HOME="https://${RENDER_EXTERNAL_URL:-localhost:8080}"
  export WP_HOME
  export WP_SITEURL=$WP_HOME
fi

echo "Using WP_HOME=$WP_HOME"
echo "Using WP_SITEURL=$WP_SITEURL"

# Run the original entrypoint (Apache + PHP + WordPress)
exec docker-entrypoint.sh apache2-foreground
