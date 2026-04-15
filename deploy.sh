#!/bin/bash
# BidHub deploy script — run from repo root (cs4135_BidHub/)
# Usage:
#   ./deploy.sh                          → deploy all services
#   ./deploy.sh frontend                 → deploy frontend only
#   ./deploy.sh notification-service delivery-service  → specific services
set -e

ALL_SERVICES=(
  account-service
  auction-service
  admin-service
  api-gateway
  notification-service
  delivery-service
  frontend
)

TARGETS=("${@:-${ALL_SERVICES[@]}}")

echo "==> Deploying to Railway from $(pwd)"
echo "    Services: ${TARGETS[*]}"
echo ""

for svc in "${TARGETS[@]}"; do
  echo "  → $svc"
  railway up --service "$svc" --detach
done

echo ""
echo "==> All builds queued. Check status:"
echo "    railway deployment list --service <name>"
echo "    Frontend: https://frontend-production-cff8.up.railway.app"
echo "    API:      https://api-gateway-production-d819.up.railway.app"
