PORTNAME=		feh
DISTVERSION=	g20260506
CATEGORIES=		graphics
MASTER_SITES= 	GH
PKGNAMESUFFIX=  -dev
DISTNAME=		${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=		nope@nothere
COMMENT=		Image viewer that utilizes Imlib2

LICENSE=		MIT

LIB_DEPENDS=	libImlib2.so:graphics/imlib2 libpng.so:graphics/png

USES=			compiler:c++11-lang cpe desktop-file-utils gmake localbase:ldflags tar:bzip2 xorg

CONFLICTS=		feh

USE_GITHUB=		yes
GH_ACCOUNT=		derf
GH_PROJECT=		feh
GH_TAGNAME=		9dccd2f0c5dec0bab733dd30fd828662d682a6f7

USE_XORG=		x11 xt xinerama
#CPE_VENDOR=	feh_project

MAKE_ENV+=		LDFLAGS="${LDFLAGS}"

OPTIONS_DEFINE=	APP CURL DCRAW DEBUG DOCS EXAMPLES EXIF HELP STAT64 MKSTEMPS XINERAMA

OPTIONS_DEFAULT=DOCS DCRAW EXIF HELP MKSTEMPS XINERAMA
OPTIONS_SUB=	yes

APP_DESC=				install icons to /usr/share, and call gtk-update-icon-cache afterwards
CURL_DESC=				Data transfer support, requires curl heimdal option. use libcurl to view https:// and similar images
DEBUG_DESCR=			debug build, enables --debug
EXIF_DESC=				Enable builtin EXIF tag display support
HELP_DESC=				include help text (refers to the manpage otherwise)
#INOTIFY_DESC=			enable inotify, needed for --auto-reload
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
# Above options may affect some dependencies but presently do not change what is installed.
# The pkg-plist attempts to conditional install for the examples option, but uncertain.

#post-install:
#	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/feh

.include <bsd.port.mk>
