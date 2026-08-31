PORTNAME=		feh
DISTVERSION=	g20260828
CATEGORIES=		graphics
MASTER_SITES= 	GH
PKGNAMESUFFIX=  -dev
DISTNAME=		${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=		nope@nothere
COMMENT=		Image viewer that utilizes Imlib2
WWW=			https://feh.finalrewind.org/

LICENSE=		MIT

LIB_DEPENDS=	libImlib2.so:graphics/imlib2 libpng.so:graphics/png

USES=			compiler:c++11-lang cpe desktop-file-utils gmake localbase:ldflags tar:bzip2 xorg

CONFLICTS=		feh

USE_GITHUB=		yes
GH_ACCOUNT=		derf
GH_PROJECT=		feh
GH_TAGNAME=		f9642a0bfbfe0f2f6e59ba2cee11d6c8c9ce8332

USE_XORG=		x11 xt xinerama

MAKE_ENV+=		LDFLAGS="${LDFLAGS}"

OPTIONS_DEFINE=	APP CURL DEBUG EXIF HELP STAT64 MAGIC MKSTEMPS VERSCMP XINERAMA

OPTIONS_DEFAULT=DOCS DCRAW EXIF HELP MAGIC MKSTEMPS XINERAMA
OPTIONS_SUB=	yes
SLASH=/
APP_DESC=				Install icons to "${SLASH}usr${SLASH}share", and call gtk-update-icon-cache afterwards
CURL_DESC=				Data transfer support, requires curl heimdal option. use libcurl to view https:// and similar images
DEBUG_DESCR=			Debug build, enables --debug
EXIF_DESC=				Enable builtin EXIF tag display support
HELP_DESC=				Include help text (refers to the manpage otherwise)
#INOTIFY_DESC=			Enable inotify, needed for --auto-reload
STAT64_DESC=			Support CIFS shares from 64bit hosts on 32bit machines
MAGIC_DESC=				Use libmagic to filter unsupported file formats
MKSTEMPS_DESC=			Whether your libc provides mkstemps(). feh will be able to load gif images via libcurl
VERSCMP_DESC=			Whether your libc provides strvercmp() [it does not?] feh will not use an internal implementation
XINERAMA_DESC=			Support Xinerama/XRandR multiscreen setups

APP_MAKE_ENV=			app=1
APP_MAKE_ENV_OFF=		app=0

CURL_LIB_DEPENDS=		libcurl.so:ftp/curl
CURL_MAKE_ENV=			curl=1
CURL_MAKE_ENV_OFF=		curl=0

DEBUG_MAKE_ENV=			debug=1
DEBUG_MAKE_ENV_OFF=		debug=0

EXIF_LIB_DEPENDS=		libexif.so:graphics/libexif
EXIF_MAKE_ENV=			exif=1
EXIF_MAKE_ENV_OFF=		exif=0

HELP_MAKE_ENV=			help=1
HELP_MAKE_ENV_OFF=		help=0

#INOTIFY_MAKE_ENV=		inotify=1
INOTIFY_MAKE_ENV_OFF=	inotify=0

STAT64_MAKE_ENV=		stat64=1
STAT64_MAKE_ENV_OFF=	stat64=0

MAGIC_MAKE_ENV=			magic=1
MAGIC_MAKE_ENV_OFF=		magic=0

MKSTEMPS_MAKE_ENV=		mkstemps=1
MKSTEMPS_MAKE_ENV_OFF=	mkstemps=0

VERSCMP_MAKE_ENV=		verscmp=1
VERSCMP_MAKE_ENV_OFF=	verscmp=0

XINERAMA_MAKE_ENV=		xinerama=1
XINERAMA_MAKE_ENV_OFF=	xinerama=0

# Defined options from upstream github page grid:
#	Flag 	Default value 	Description
#	app 		0 			install icons to /usr/share, regardless of DESTDIR and PREFIX, and call gtk-update-icon-cache afterwards
#	curl	 	1 			use libcurl to view https:// and similar images
#	debug 		0 			debug build, enables --debug
#	exif 		0 			Builtin EXIF tag display support
#	help 		0 			include help text (refers to the manpage otherwise)
#	inotify 	0 			enable inotify, needed for --auto-reload
#	stat64 		0 			Support CIFS shares from 64bit hosts on 32bit machines
#	magic 		0 			Use libmagic to filter unsupported file formats
#	mkstemps 	1 			Whether your libc provides mkstemps(). If set to 0, feh will be unable to load gif images via libcurl
#	verscmp 	1 			Whether your libc provides strvercmp(). If set to 0, feh will use an internal implementation.
#	xinerama 	1 			Support Xinerama/XRandR multiscreen setups

# Not sure if necessary
#post-install:
#	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/feh

.include <bsd.port.mk>
