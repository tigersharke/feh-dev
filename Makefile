PORTNAME=	feh
DISTVERSION=	g20220102
CATEGORIES=	x11-toolkits graphics
PKGNAMESUFFIX=  -dev
DISTNAME=	${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	nope@nothere
COMMENT=	Image viewer that utilizes Imlib2

LICENSE=	MIT

LIB_DEPENDS=	libImlib2.so:graphics/imlib2 libpng.so:graphics/png

USES=		compiler:c++11-lang cpe desktop-file-utils gmake localbase:ldflags tar:bzip2 xorg

USE_GITHUB=	nodefault
GH_ACCOUNT=	derf
GH_PROJECT=	feh
GH_TAGNAME=	4bfea24d19b45d7f6ce99da99fa21d129d63f5d1

#USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

USE_XORG=	x11 xt xinerama
#CPE_VENDOR=	feh_project

MAKE_ENV+=	LDFLAGS="${LDFLAGS}" verscmp=0

#OPTIONS_DEFINE=	APP CURL DCRAW DEBUG DOCS EXAMPLES EXIF HELP INOTIFY STAT64 MKSTEMPS XINERAMA
OPTIONS_DEFINE=	APP CURL DCRAW DEBUG DOCS EXAMPLES EXIF HELP STAT64 MKSTEMPS XINERAMA

EXIF_DESC=	Support EXIF tags
DCRAW_DESC=	Use dcraw to display raw file previews
OPTIONS_DEFAULT=CURL DOCS EXIF HELP MKSTEMPS XINERAMA
OPTIONS_SUB=	yes

APP_MAKE_ENV=		app=1
APP_MAKE_ENV_OFF=	app=0

CURL_LIB_DEPENDS=	libcurl.so:ftp/curl
CURL_MAKE_ENV=		curl=1
CURL_MAKE_ENV_OFF=	curl=0

DCRAW_RUN_DEPENDS=	dcraw:graphics/dcraw

DEBUG_MAKE_ENV=		debug=1
DEBUG_MAKE_ENV_OFF=	debug=0

#DOCS_MAKE_ENV=
#DOCS_MAKE_ENV_OFF=	

EXIF_LIB_DEPENDS=	libexif.so:graphics/libexif
EXIF_MAKE_ENV=		exif=1
EXIF_MAKE_ENV_OFF=	exif=0

HELP_MAKE_ENV=		help=1
HELP_MAKE_ENV_OFF=	help=0

#INOTIFY_MAKE_ENV=	inotify=1
#INOTIFY_MAKE_ENV_OFF=	inotify=0

MKSTEMPS_MAKE_ENV=	mkstemps=1
MKSTEMPS_MAKE_ENV_OFF=	mkstemps=0

XINERAMA_MAKE_ENV=	xinerama=1
XINERAMA_MAKE_ENV_OFF=	xinerama=0



#post-patch-DOCS-off:
#	@${REINPLACE_CMD} -e 's|install-doc||' \
#		${WRKSRC}/Makefile

#post-patch-EXAMPLES-off:
#	@${REINPLACE_CMD} -e 's|install-examples||' \
#		${WRKSRC}/Makefile

#post-install:
#	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/feh

.include <bsd.port.mk>
