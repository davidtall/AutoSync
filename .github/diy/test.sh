#!/bin/bash

# �������Ĳ���汾�ſ���ͨ��ִ����������ȡ������ sing-box version
PLUGIN_VERSION=$(${{ matrix.packages }} version | grep "$PKG_VERSION")

# ���汾���������׼���
echo "$PLUGIN_VERSION"
