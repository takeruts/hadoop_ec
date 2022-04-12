#!/bin/bash
hdfs ec -enablePolicy -policy $1
hdfs ec -setPolicy -policy $1 -path /
hdfs ec -getPolicy -path /

