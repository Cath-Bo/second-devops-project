#!/bin/bash

APP_ENV=0
APP_PORT=0
case "$1" in
	dev)
		APP_ENV=development
		APP_PORT=3000
		;;
	stage)
		APP_ENV=staging
		APP_PORT=4000
		;;
	prod)
		APP_ENV=production
		APP_PORT=80
		;;
	*)
		echo "Error: unknown environment" >&2
		exit 1
		;;
esac

cat >  app.env << EOF
APP_ENV=$APP_ENV
APP_PORT=$APP_PORT
EOF

cat > start.sh <<'EOF'
#!/usr/bin/env bash

echo "Starting application in $APP_ENV environment"
echo "Listening on port $APP_PORT"
EOF

chmod +x start.sh
