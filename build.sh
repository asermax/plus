#!/bin/bash
docker-compose -f docker-compose-build.yml run --rm build
docker build -t asermax/plus .
