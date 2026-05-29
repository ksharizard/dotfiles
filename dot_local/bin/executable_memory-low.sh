#!/bin/bash
FREE_SWAP=$(free | grep Swap | awk '{print $4/$2 * 100.0}')
FREE_MEM=$(free | grep Mem | awk '{print $7/$2 * 100.0}')

dc="docker compose -f /srv/docker/docker-compose.yaml"

if [ -t 1 ]; then
        echo "Free mem: ${FREE_MEM}%, Free swap: ${FREE_SWAP}%"
fi

if [ 1 -gt "${FREE_SWAP%.*}" ]; then
        echo "[$(date)] SWAP IS TOO LOW! AT $FREE_SWAP, CHECKING MEM"
FREE_MEM=$(free | grep Mem | awk '{print $7/$2 * 100.0}')
        if [ 10 -gt "${FREE_MEM%.*}" ]; then
                echo "[$(date)] SWAP IS TOO LOW! AT $FREE_SWAP, MEM IS TOO LOW, AT $FREE_MEM -- RESTARTING"
                $dc stop && $dc up -d
        fi
fi

if [ 1 -gt "${FREE_MEM%.*}" ]; then
        echo "[$(date)] MEM IS TOO LOW! AT $FREE_MEM -- RESTARTING"
        $dc stop && $dc up -d
fi

