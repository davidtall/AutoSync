#!/bin/bash

# ʹ�� find ����������� Makefile �ļ�������ȡ PKG_VERSION �� PKG_BASE_VERSION ������ֵ
find . -type f -name Makefile -exec grep -E 'PKG_(BASE_)?VERSION\s*?:=' {} \; | awk -F '[:=]' '{print $2}'

