--- config.mk.orig	2026-05-01 05:58:14 UTC
+++ config.mk
@@ -1,5 +1,6 @@ PACKAGE ?= feh
 PACKAGE ?= feh
-VERSION ?= ${shell git describe --dirty}
+#VERSION ?= ${shell git describe --dirty}
+VERSION ?= ${GH_TAGNAME}
 
 app ?= 0
 curl ?= 1
@@ -19,7 +20,7 @@ ifeq (${app},1)
 # generally supported. So ignore PREFIX and always install icons into
 # /usr/share/icons if the user wants to install feh on their local machine.
 ifeq (${app},1)
-	ICON_PREFIX = /usr/share/icons
+	ICON_PREFIX = ${PREFIX}/share/icons
 endif
 
 # Directories for manuals, executables, docs, data, etc.
