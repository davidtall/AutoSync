#!/bin/bash

# ʹ�û������� MATRIX_PACKAGES �����ò�����ƣ�����������
PLUGIN_VERSION=$($MATRIX_PACKAGES version | grep "$PKG_VERSION")

# ���汾���������׼���
echo "$PLUGIN_VERSION"

