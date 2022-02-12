--- config.mk.orig	2022-02-12 09:35:10 UTC
+++ config.mk
@@ -1,5 +1,6 @@
 PACKAGE ?= feh
-VERSION ?= ${shell git describe --dirty}
+#VERSION ?= ${shell git describe --dirty}
+VERSION ?= ${GH_TAGNAME}
 
 app ?= 0
 curl ?= 1
