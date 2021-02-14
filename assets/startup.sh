#!/bin/bash

cd /app

FLOW_CONTEXT=Production ./flow doctrine:migrate

FLOW_CONTEXT=Production ./flow flow:cache:flush

FLOW_CONTEXT=Production ./flow cache:warmup

exec php-fpm