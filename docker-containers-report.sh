#!/bin/bash
CURRENT_DATE=$(date +%Y-%m-%d)
CURRENT_TIME=$(date +%H:%M:%S)
REPORT_FILE="containers-$CURRENT_DATE.txt"
echo "=== Docker Container Report ==="
echo "Report date: $CURRENT_DATE $CURRENT_TIME"
echo ""
if ! command -v docker &> /dev/null; then
  echo "ERROR: Docker is not installed!"
  exit 1
fi
{
    echo "DOCKER CONTAINERS REPORT"
    echo "Generated: $CURRENT_DATE $CURRENT_TIME"
    echo "========================================"
    echo ""
    echo "RUNNING CONTAINERS:"
    echo "-------------------"
    docker ps
    echo ""
    echo "ALL CONTAINERS:"
    echo "---------------"
    docker ps -a
    
    echo ""
    echo "STATISTICS:"
    echo "-----------"
    echo "Running: $(docker ps -q | wc -l)"
    echo "Total:   $(docker ps -a -q | wc -l)"
} > "$REPORT_FILE"
echo "Report saved to: $REPORT_FILE"
echo "File size: $(wc -l < "$REPORT_FILE") lines"
