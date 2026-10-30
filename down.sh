#!/usr/bin/env bash
# Removes the course cluster and stops cloud-provider-kind.
kind delete cluster --name k8s-course
pkill -f cloud-provider-kind || true
