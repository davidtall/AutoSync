#!/bin/bash

# ʾ����ʹ�û������������� matrix.packages ����
PLUGIN_VERSION=$("$matrix_packages" version | grep "$PKG_VERSION")

# ���汾���������׼���
echo "$PLUGIN_VERSION"
