#!/usr/bin/env bash
# Removes the course cluster and stops cloud-provider-kind.
# Docker can be slow to stop a node; one retry covers it.
kind delete cluster --name k8s-course || { sleep 15; kind delete cluster --name k8s-course; }
pkill -f cloud-provider-kind || true
