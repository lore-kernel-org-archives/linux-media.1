Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.247.196.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278801;
	b=a7KZesZURvecPTieXIzyoikMzkWFZdjgpXk8Fu48K4BH5spHA7wLnSo2it9LBQIpHwH6
	 6ty4K2P3ilQV8EV2poqTcFLZZBjNd5cbXFWFf3aqtRW5R/W353EOyIVs6eQ+mPDy7+pdw
	 mXO61Qh3qJy+oUbjQ/NKiFuRqZXWDZmvQRe7PNolu7HLCfVBvaE/1S/pVdiY1hWeS6cx9
	 koq8Zm2aEBLRC/7Z40BUsXqb2YNF6aEb6iuMHsrNh9NE9ARrDbwEAkL6Ko3Uj69uxZZdv
	 vm9DiY+o4BOpTYLkwwKyaexwJDfWHnWCbCdrErb5oMrtuXxPf4RK7V3VIr2yVap/gXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278801;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DRMWQ6ExNQsrh/DoS7+vdrSjDpRi7w+A67I7hnZC7Ec=;
	b=ljn2shljT+fEIJZNe2wsUoOULhTRvOHyUVFi0REoghfTkOdyKHHVTLeDuSNq10NTukHt
	 Q0IB0sdAjt9p64sBjaJ4o9IHTNpDIQrVr/JOHGjzXCKbiw1wBGI/fTNPm19+LIMNEr98N
	 Z7fTJmvyjUy6piSPrqz4/Y5BY6UjCEyn9B9sNUFF8UAir8n62gsEeukMLWzS4nnfcJnRs
	 2KL3tcYC8koFRcUvkUbcapAw2Uq2LEWDv+N06CjYr2lxL/pGJt2v6Xfn2ZiDDj9e6+kg8
	 WwnC2oaFebufOA7tTLL+gUU/yLYvqKk7lhKhH9JhEIXQaUaE500Atl++5nENn0n07Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=IZmW6pqk;
	arc=none smtp.remote-ip=61.247.196.235
Received: from mvsmtppost24.nm.naver.com (mvsmtppost24.nm.naver.com [61.247.196.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3842606A338
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3842606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=IZmW6pqk
Received: from nv1m-hmac-real-3 ([10.174.201.121])
  by mvsmtppost24.nm.naver.com with ESMTP id B8FuHShAQueS1IEA6u60fw
  for <linux-media@vger.kernel.org>;
  Sat, 21 Nov 2026 16:33:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795278790; bh=hbMIvwOITxLX+oKMkl9pPUh5/ZabBj938VN7K/i6f/g=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=IZmW6pqkgpS3MY5E9CVI4gW10wciPFv6qMaVomgdth31UWpWNII9LkZY/ZJr/20nY
	 LWr53x25MzKFGNCn7Kou0Q9KJt93TShkR/HmY/7M+nEBjddntDFxOMZQnSVwpQQR/N
	 heFmqfNY4yaObW8c8ZopumlkPlZTmvzSEzI3i5WeUYDGwvEr2Qz54ebrNW7BOuO4aS
	 88yki1o9Aenf6CxJLQ7sVZ1Mfe33dNkMOOZgn1fvV0A/mY0tMDCT7rgIk271elj/KP
	 XavvWNqrGzb4ocQNtnksrALik5XxniuZ0+xz5Mh4vWsHI8j7DKFI+WGTvbS9+bXrcj
	 v/1n0Wfvm4mnA==
X-Session-ID: 7y43Wh0wSLSlp2zXCLO6Vw
X-Works-Send-Opt: 4qFNWNkvjHwvb4enW4e0bqb/aBmmjAFYKxM/KxulKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: YqndKoElFqJZ+HmmaxKr+6E=
Received: from localhost.localdomain ([121.157.61.46])
  by cvnsmtp001.nm.naver.com with ESMTP id 7y43Wh0wSLSlp2zXCLO6Vw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 21 Nov 2026 16:33:10 -0000
From: dungeonlords789@naver.com
To: linux-media@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
Subject: [PATCH v4l-utils 1/1] doc: upd
Date: Sun, 22 Nov 2026 01:32:37 +0900
Message-ID: <20261121163237.46332-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>

No manual work, just update via code
```
$ doxygen -u Doxyfile.in
warning: Tag 'HTML_TIMESTAMP' at line 1151 of file 'Doxyfile.in' has become obsolete.
         This tag has been removed.
warning: Tag 'FORMULA_TRANSPARENT' at line 1431 of file 'Doxyfile.in' has become obsolete.
         This tag has been removed.
warning: Tag 'DOT_FONTNAME' at line 2062 of file 'Doxyfile.in' has become obsolete.
         This tag has been removed.
warning: Tag 'DOT_FONTSIZE' at line 2069 of file 'Doxyfile.in' has become obsolete.
         This tag has been removed.
warning: Tag 'DOT_TRANSPARENT' at line 2269 of file 'Doxyfile.in' has become obsolete.
         This tag has been removed.

Configuration file 'Doxyfile.in' updated.
```

Signed-off-by: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
---
 doc/Doxyfile.in | 1669 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 1191 insertions(+), 478 deletions(-)

diff --git a/doc/Doxyfile.in b/doc/Doxyfile.in
index b7a76cb1..6b029e0b 100644
--- a/doc/Doxyfile.in
+++ b/doc/Doxyfile.in
@@ -1,7 +1,7 @@
-# Doxyfile 1.8.6
+# Doxyfile 1.15.0
 
 # This file describes the settings to be used by the documentation system
-# doxygen (www.doxygen.org) for a project.
+# Doxygen (www.doxygen.org) for a project.
 #
 # All text after a double hash (##) is considered a comment and is placed in
 # front of the TAG it is preceding.
@@ -12,16 +12,26 @@
 # For lists, items can also be appended using:
 # TAG += value [value, ...]
 # Values that contain spaces should be placed between quotes (\" \").
+#
+# Note:
+#
+# Use Doxygen to compare the used configuration file with the template
+# configuration file:
+# doxygen -x [configFile]
+# Use Doxygen to compare the used configuration file with the template
+# configuration file without replacing the environment variables or CMake type
+# replacement variables:
+# doxygen -x_noenv [configFile]
 
 #---------------------------------------------------------------------------
 # Project related configuration options
 #---------------------------------------------------------------------------
 
-# This tag specifies the encoding used for all characters in the config file
-# that follow. The default is UTF-8 which is also the encoding used for all text
-# before the first occurrence of this tag. Doxygen uses libiconv (or the iconv
-# built into libc) for the transcoding. See http://www.gnu.org/software/libiconv
-# for the list of possible encodings.
+# This tag specifies the encoding used for all characters in the configuration
+# file that follow. The default is UTF-8 which is also the encoding used for all
+# text before the first occurrence of this tag. Doxygen uses libiconv (or the
+# iconv built into libc) for the transcoding. See
+# https://www.gnu.org/software/libiconv/ for the list of possible encodings.
 # The default value is: UTF-8.
 
 DOXYFILE_ENCODING      = UTF-8
@@ -41,58 +51,84 @@ PROJECT_NAME           = libdvbv5
 PROJECT_NUMBER         = @VERSION@
 
 # Using the PROJECT_BRIEF tag one can provide an optional one line description
-# for a project that appears at the top of each page and should give viewer a
+# for a project that appears at the top of each page and should give viewers a
 # quick idea about the purpose of the project. Keep the description short.
 
 PROJECT_BRIEF          = "Library to work with Digital TV devices on Linux"
 
-# With the PROJECT_LOGO tag one can specify an logo or icon that is included in
-# the documentation. The maximum height of the logo should not exceed 55 pixels
-# and the maximum width should not exceed 200 pixels. Doxygen will copy the logo
-# to the output directory.
+# With the PROJECT_LOGO tag one can specify a logo or an icon that is included
+# in the documentation. The maximum height of the logo should not exceed 55
+# pixels and the maximum width should not exceed 200 pixels. Doxygen will copy
+# the logo to the output directory.
 
 PROJECT_LOGO           =
 
+# With the PROJECT_ICON tag one can specify an icon that is included in the tabs
+# when the HTML document is shown. Doxygen will copy the logo to the output
+# directory.
+
+PROJECT_ICON           =
+
 # The OUTPUT_DIRECTORY tag is used to specify the (relative or absolute) path
 # into which the generated documentation will be written. If a relative path is
-# entered, it will be relative to the location where doxygen was started. If
+# entered, it will be relative to the location where Doxygen was started. If
 # left blank the current directory will be used.
 
 OUTPUT_DIRECTORY       = @DOCDIR@
 
-# If the CREATE_SUBDIRS tag is set to YES, then doxygen will create 4096 sub-
-# directories (in 2 levels) under the output directory of each output format and
-# will distribute the generated files over these directories. Enabling this
-# option can be useful when feeding doxygen a huge amount of source files, where
-# putting all generated files in the same directory would otherwise causes
-# performance problems for the file system.
+# If the CREATE_SUBDIRS tag is set to YES then Doxygen will create up to 4096
+# sub-directories (in 2 levels) under the output directory of each output format
+# and will distribute the generated files over these directories. Enabling this
+# option can be useful when feeding Doxygen a huge amount of source files, where
+# putting all generated files in the same directory would otherwise cause
+# performance problems for the file system. Adapt CREATE_SUBDIRS_LEVEL to
+# control the number of sub-directories.
 # The default value is: NO.
 
 CREATE_SUBDIRS         = NO
 
+# Controls the number of sub-directories that will be created when
+# CREATE_SUBDIRS tag is set to YES. Level 0 represents 16 directories, and every
+# level increment doubles the number of directories, resulting in 4096
+# directories at level 8 which is the default and also the maximum value. The
+# sub-directories are organized in 2 levels, the first level always has a fixed
+# number of 16 directories.
+# Minimum value: 0, maximum value: 8, default value: 8.
+# This tag requires that the tag CREATE_SUBDIRS is set to YES.
+
+CREATE_SUBDIRS_LEVEL   = 8
+
+# If the ALLOW_UNICODE_NAMES tag is set to YES, Doxygen will allow non-ASCII
+# characters to appear in the names of generated files. If set to NO, non-ASCII
+# characters will be escaped, for example _xE3_x81_x84 will be used for Unicode
+# U+3044.
+# The default value is: NO.
+
+ALLOW_UNICODE_NAMES    = NO
+
 # The OUTPUT_LANGUAGE tag is used to specify the language in which all
-# documentation generated by doxygen is written. Doxygen will use this
+# documentation generated by Doxygen is written. Doxygen will use this
 # information to generate all constant output in the proper language.
-# Possible values are: Afrikaans, Arabic, Armenian, Brazilian, Catalan, Chinese,
-# Chinese-Traditional, Croatian, Czech, Danish, Dutch, English (United States),
-# Esperanto, Farsi (Persian), Finnish, French, German, Greek, Hungarian,
-# Indonesian, Italian, Japanese, Japanese-en (Japanese with English messages),
-# Korean, Korean-en (Korean with English messages), Latvian, Lithuanian,
-# Macedonian, Norwegian, Persian (Farsi), Polish, Portuguese, Romanian, Russian,
-# Serbian, Serbian-Cyrillic, Slovak, Slovene, Spanish, Swedish, Turkish,
-# Ukrainian and Vietnamese.
+# Possible values are: Afrikaans, Arabic, Armenian, Brazilian, Bulgarian,
+# Catalan, Chinese, Chinese-Traditional, Croatian, Czech, Danish, Dutch, English
+# (United States), Esperanto, Farsi (Persian), Finnish, French, German, Greek,
+# Hindi, Hungarian, Indonesian, Italian, Japanese, Japanese-en (Japanese with
+# English messages), Korean, Korean-en (Korean with English messages), Latvian,
+# Lithuanian, Macedonian, Norwegian, Persian (Farsi), Polish, Portuguese,
+# Romanian, Russian, Serbian, Serbian-Cyrillic, Slovak, Slovene, Spanish,
+# Swedish, Turkish, Ukrainian and Vietnamese.
 # The default value is: English.
 
 OUTPUT_LANGUAGE        = English
 
-# If the BRIEF_MEMBER_DESC tag is set to YES doxygen will include brief member
+# If the BRIEF_MEMBER_DESC tag is set to YES, Doxygen will include brief member
 # descriptions after the members that are listed in the file and class
 # documentation (similar to Javadoc). Set to NO to disable this.
 # The default value is: YES.
 
 BRIEF_MEMBER_DESC      = YES
 
-# If the REPEAT_BRIEF tag is set to YES doxygen will prepend the brief
+# If the REPEAT_BRIEF tag is set to YES, Doxygen will prepend the brief
 # description of a member or function before the detailed description
 #
 # Note: If both HIDE_UNDOC_MEMBERS and BRIEF_MEMBER_DESC are set to NO, the
@@ -113,13 +149,13 @@ REPEAT_BRIEF           = YES
 ABBREVIATE_BRIEF       =
 
 # If the ALWAYS_DETAILED_SEC and REPEAT_BRIEF tags are both set to YES then
-# doxygen will generate a detailed section even if there is only a brief
+# Doxygen will generate a detailed section even if there is only a brief
 # description.
 # The default value is: NO.
 
 ALWAYS_DETAILED_SEC    = NO
 
-# If the INLINE_INHERITED_MEMB tag is set to YES, doxygen will show all
+# If the INLINE_INHERITED_MEMB tag is set to YES, Doxygen will show all
 # inherited members of a class in the documentation of that class as if those
 # members were ordinary class members. Constructors, destructors and assignment
 # operators of the base classes will not be shown.
@@ -127,7 +163,7 @@ ALWAYS_DETAILED_SEC    = NO
 
 INLINE_INHERITED_MEMB  = YES
 
-# If the FULL_PATH_NAMES tag is set to YES doxygen will prepend the full path
+# If the FULL_PATH_NAMES tag is set to YES, Doxygen will prepend the full path
 # before files name in the file list and in the header files. If set to NO the
 # shortest path that makes the file name unique will be used
 # The default value is: YES.
@@ -137,11 +173,11 @@ FULL_PATH_NAMES        = YES
 # The STRIP_FROM_PATH tag can be used to strip a user-defined part of the path.
 # Stripping is only done if one of the specified strings matches the left-hand
 # part of the path. The tag can be used to show relative paths in the file list.
-# If left blank the directory from which doxygen is run is used as the path to
+# If left blank the directory from which Doxygen is run is used as the path to
 # strip.
 #
 # Note that you can specify absolute paths here, but also relative paths, which
-# will be relative from the directory where doxygen is started.
+# will be relative from the directory where Doxygen is started.
 # This tag requires that the tag FULL_PATH_NAMES is set to YES.
 
 STRIP_FROM_PATH        = @SRCDIR@
@@ -155,31 +191,42 @@ STRIP_FROM_PATH        = @SRCDIR@
 
 STRIP_FROM_INC_PATH    =
 
-# If the SHORT_NAMES tag is set to YES, doxygen will generate much shorter (but
-# less readable) file names. This can be useful is your file systems doesn't
+# If the SHORT_NAMES tag is set to YES, Doxygen will generate much shorter (but
+# less readable) file names. This can be useful if your file system doesn't
 # support long names like on DOS, Mac, or CD-ROM.
 # The default value is: NO.
 
 SHORT_NAMES            = NO
 
-# If the JAVADOC_AUTOBRIEF tag is set to YES then doxygen will interpret the
-# first line (until the first dot) of a Javadoc-style comment as the brief
-# description. If set to NO, the Javadoc-style will behave just like regular Qt-
-# style comments (thus requiring an explicit @brief command for a brief
-# description.)
+# If the JAVADOC_AUTOBRIEF tag is set to YES then Doxygen will interpret the
+# first line (until the first dot, question mark or exclamation mark) of a
+# Javadoc-style comment as the brief description. If set to NO, the Javadoc-
+# style will behave just like regular Qt-style comments (thus requiring an
+# explicit @brief command for a brief description.)
 # The default value is: NO.
 
 JAVADOC_AUTOBRIEF      = YES
 
-# If the QT_AUTOBRIEF tag is set to YES then doxygen will interpret the first
-# line (until the first dot) of a Qt-style comment as the brief description. If
-# set to NO, the Qt-style will behave just like regular Qt-style comments (thus
-# requiring an explicit \brief command for a brief description.)
+# If the JAVADOC_BANNER tag is set to YES then Doxygen will interpret a line
+# such as
+# /***************
+# as being the beginning of a Javadoc-style comment "banner". If set to NO, the
+# Javadoc-style will behave just like regular comments and it will not be
+# interpreted by Doxygen.
+# The default value is: NO.
+
+JAVADOC_BANNER         = NO
+
+# If the QT_AUTOBRIEF tag is set to YES then Doxygen will interpret the first
+# line (until the first dot, question mark or exclamation mark) of a Qt-style
+# comment as the brief description. If set to NO, the Qt-style will behave just
+# like regular Qt-style comments (thus requiring an explicit \brief command for
+# a brief description.)
 # The default value is: NO.
 
 QT_AUTOBRIEF           = NO
 
-# The MULTILINE_CPP_IS_BRIEF tag can be set to YES to make doxygen treat a
+# The MULTILINE_CPP_IS_BRIEF tag can be set to YES to make Doxygen treat a
 # multi-line C++ special comment block (i.e. a block of //! or /// comments) as
 # a brief description. This used to be the default behavior. The new default is
 # to treat a multi-line C++ comment block as a detailed description. Set this
@@ -191,15 +238,23 @@ QT_AUTOBRIEF           = NO
 
 MULTILINE_CPP_IS_BRIEF = NO
 
+# By default Python docstrings are displayed as preformatted text and Doxygen's
+# special commands cannot be used. By setting PYTHON_DOCSTRING to NO the
+# Doxygen's special commands can be used and the contents of the docstring
+# documentation blocks is shown as Doxygen documentation.
+# The default value is: YES.
+
+PYTHON_DOCSTRING       = YES
+
 # If the INHERIT_DOCS tag is set to YES then an undocumented member inherits the
 # documentation from any documented member that it re-implements.
 # The default value is: YES.
 
 INHERIT_DOCS           = YES
 
-# If the SEPARATE_MEMBER_PAGES tag is set to YES, then doxygen will produce a
-# new page for each member. If set to NO, the documentation of a member will be
-# part of the file/class/namespace that contains it.
+# If the SEPARATE_MEMBER_PAGES tag is set to YES then Doxygen will produce a new
+# page for each member. If set to NO, the documentation of a member will be part
+# of the file/class/namespace that contains it.
 # The default value is: NO.
 
 SEPARATE_MEMBER_PAGES  = NO
@@ -214,11 +269,16 @@ TAB_SIZE               = 8
 # the documentation. An alias has the form:
 # name=value
 # For example adding
-# "sideeffect=@par Side Effects:\n"
+# "sideeffect=@par Side Effects:^^"
 # will allow you to put the command \sideeffect (or @sideeffect) in the
 # documentation, which will result in a user-defined paragraph with heading
-# "Side Effects:". You can put \n's in the value part of an alias to insert
-# newlines.
+# "Side Effects:". Note that you cannot put \n's in the value part of an alias
+# to insert newlines (in the resulting output). You can put ^^ in the value part
+# of an alias to insert a newline as if a physical newline was in the original
+# file. When you need a literal { or } or , in the value part of an alias you
+# have to escape them by means of a backslash (\), this can lead to conflicts
+# with the commands \{ and \} for these it is advised to use the version @{ and
+# @} or use a double escape (\\{ and \\})
 
 ALIASES                =
 
@@ -250,46 +310,104 @@ OPTIMIZE_FOR_FORTRAN   = NO
 
 OPTIMIZE_OUTPUT_VHDL   = NO
 
+# Set the OPTIMIZE_OUTPUT_SLICE tag to YES if your project consists of Slice
+# sources only. Doxygen will then generate output that is more tailored for that
+# language. For instance, namespaces will be presented as modules, types will be
+# separated into more groups, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_SLICE  = NO
+
 # Doxygen selects the parser to use depending on the extension of the files it
 # parses. With this tag you can assign which parser to use for a given
 # extension. Doxygen has a built-in mapping, but you can override or extend it
 # using this tag. The format is ext=language, where ext is a file extension, and
-# language is one of the parsers supported by doxygen: IDL, Java, Javascript,
-# C#, C, C++, D, PHP, Objective-C, Python, Fortran, VHDL. For instance to make
-# doxygen treat .inc files as Fortran files (default is PHP), and .f files as C
-# (default is Fortran), use: inc=Fortran f=C.
+# language is one of the parsers supported by Doxygen: IDL, Java, JavaScript,
+# Csharp (C#), C, C++, Lex, D, PHP, md (Markdown), Objective-C, Python, Slice,
+# VHDL, Fortran (fixed format Fortran: FortranFixed, free formatted Fortran:
+# FortranFree, unknown formatted Fortran: Fortran. In the later case the parser
+# tries to guess whether the code is fixed or free formatted code, this is the
+# default for Fortran type files). For instance to make Doxygen treat .inc files
+# as Fortran files (default is PHP), and .f files as C (default is Fortran),
+# use: inc=Fortran f=C.
 #
-# Note For files without extension you can use no_extension as a placeholder.
+# Note: For files without extension you can use no_extension as a placeholder.
 #
 # Note that for custom extensions you also need to set FILE_PATTERNS otherwise
-# the files are not read by doxygen.
+# the files are not read by Doxygen. When specifying no_extension you should add
+# * to the FILE_PATTERNS.
+#
+# Note see also the list of default file extension mappings.
 
 EXTENSION_MAPPING      =
 
-# If the MARKDOWN_SUPPORT tag is enabled then doxygen pre-processes all comments
+# If the MARKDOWN_SUPPORT tag is enabled then Doxygen pre-processes all comments
 # according to the Markdown format, which allows for more readable
-# documentation. See http://daringfireball.net/projects/markdown/ for details.
-# The output of markdown processing is further processed by doxygen, so you can
-# mix doxygen, HTML, and XML commands with Markdown formatting. Disable only in
+# documentation. See https://daringfireball.net/projects/markdown/ for details.
+# The output of markdown processing is further processed by Doxygen, so you can
+# mix Doxygen, HTML, and XML commands with Markdown formatting. Disable only in
 # case of backward compatibilities issues.
 # The default value is: YES.
 
 MARKDOWN_SUPPORT       = YES
 
-# When enabled doxygen tries to link words that correspond to documented
+# If the MARKDOWN_STRICT tag is enabled then Doxygen treats text in comments as
+# Markdown formatted also in cases where Doxygen's native markup format
+# conflicts with that of Markdown. This is only relevant in cases where
+# backticks are used. Doxygen's native markup style allows a single quote to end
+# a text fragment started with a backtick and then treat it as a piece of quoted
+# text, whereas in Markdown such text fragment is treated as verbatim and only
+# ends when a second matching backtick is found. Also, Doxygen's native markup
+# format requires double quotes to be escaped when they appear in a backtick
+# section, whereas this is not needed for Markdown.
+# The default value is: YES.
+# This tag requires that the tag MARKDOWN_SUPPORT is set to YES.
+
+MARKDOWN_STRICT        = YES
+
+# When the TOC_INCLUDE_HEADINGS tag is set to a non-zero value, all headings up
+# to that level are automatically included in the table of contents, even if
+# they do not have an id attribute.
+# Note: This feature currently applies only to Markdown headings.
+# Minimum value: 0, maximum value: 99, default value: 6.
+# This tag requires that the tag MARKDOWN_SUPPORT is set to YES.
+
+TOC_INCLUDE_HEADINGS   = 6
+
+# The MARKDOWN_ID_STYLE tag can be used to specify the algorithm used to
+# generate identifiers for the Markdown headings. Note: Every identifier is
+# unique.
+# Possible values are: DOXYGEN use a fixed 'autotoc_md' string followed by a
+# sequence number starting at 0 and GITHUB use the lower case version of title
+# with any whitespace replaced by '-' and punctuation characters removed.
+# The default value is: DOXYGEN.
+# This tag requires that the tag MARKDOWN_SUPPORT is set to YES.
+
+MARKDOWN_ID_STYLE      = DOXYGEN
+
+# When enabled Doxygen tries to link words that correspond to documented
 # classes, or namespaces to their corresponding documentation. Such a link can
-# be prevented in individual cases by by putting a % sign in front of the word
-# or globally by setting AUTOLINK_SUPPORT to NO.
+# be prevented in individual cases by putting a % sign in front of the word or
+# globally by setting AUTOLINK_SUPPORT to NO. Words listed in the
+# AUTOLINK_IGNORE_WORDS tag are excluded from automatic linking.
 # The default value is: YES.
 
 AUTOLINK_SUPPORT       = YES
 
+# This tag specifies a list of words that, when matching the start of a word in
+# the documentation, will suppress auto links generation, if it is enabled via
+# AUTOLINK_SUPPORT. This list does not affect links explicitly created using \#
+# or the \link or commands.
+# This tag requires that the tag AUTOLINK_SUPPORT is set to YES.
+
+AUTOLINK_IGNORE_WORDS  =
+
 # If you use STL classes (i.e. std::string, std::vector, etc.) but do not want
 # to include (a tag file for) the STL sources as input, then you should set this
-# tag to YES in order to let doxygen match functions declarations and
+# tag to YES in order to let Doxygen match functions declarations and
 # definitions whose arguments contain STL classes (e.g. func(std::string);
-# versus func(std::string) {}). This also make the inheritance and collaboration
-# diagrams that involve STL classes more complete and accurate.
+# versus func(std::string) {}). This also makes the inheritance and
+# collaboration diagrams that involve STL classes more complete and accurate.
 # The default value is: NO.
 
 BUILTIN_STL_SUPPORT    = NO
@@ -301,16 +419,16 @@ BUILTIN_STL_SUPPORT    = NO
 CPP_CLI_SUPPORT        = NO
 
 # Set the SIP_SUPPORT tag to YES if your project consists of sip (see:
-# http://www.riverbankcomputing.co.uk/software/sip/intro) sources only. Doxygen
-# will parse them like normal C++ but will assume all classes use public instead
-# of private inheritance when no explicit protection keyword is present.
+# https://www.riverbankcomputing.com/software) sources only. Doxygen will parse
+# them like normal C++ but will assume all classes use public instead of private
+# inheritance when no explicit protection keyword is present.
 # The default value is: NO.
 
 SIP_SUPPORT            = NO
 
 # For Microsoft's IDL there are propget and propput attributes to indicate
 # getter and setter methods for a property. Setting this option to YES will make
-# doxygen to replace the get and set methods by a property in the documentation.
+# Doxygen to replace the get and set methods by a property in the documentation.
 # This will only work if the methods are indeed getting or setting a simple
 # type. If this is not the case, or you want to show the methods anyway, you
 # should set this option to NO.
@@ -319,13 +437,20 @@ SIP_SUPPORT            = NO
 IDL_PROPERTY_SUPPORT   = YES
 
 # If member grouping is used in the documentation and the DISTRIBUTE_GROUP_DOC
-# tag is set to YES, then doxygen will reuse the documentation of the first
+# tag is set to YES then Doxygen will reuse the documentation of the first
 # member in the group (if any) for the other members of the group. By default
 # all members of a group must be documented explicitly.
 # The default value is: NO.
 
 DISTRIBUTE_GROUP_DOC   = NO
 
+# If one adds a struct or class to a group and this option is enabled, then also
+# any nested class or struct is added to the same group. By default this option
+# is disabled and one has to add nested compounds explicitly via \ingroup.
+# The default value is: NO.
+
+GROUP_NESTED_COMPOUNDS = NO
+
 # Set the SUBGROUPING tag to YES to allow class member groups of the same type
 # (for instance a group of public functions) to be put as a subgroup of that
 # type (e.g. under the Public Functions section). Set it to NO to prevent
@@ -370,21 +495,42 @@ TYPEDEF_HIDES_STRUCT   = NO
 # The size of the symbol lookup cache can be set using LOOKUP_CACHE_SIZE. This
 # cache is used to resolve symbols given their name and scope. Since this can be
 # an expensive process and often the same symbol appears multiple times in the
-# code, doxygen keeps a cache of pre-resolved symbols. If the cache is too small
-# doxygen will become slower. If the cache is too large, memory is wasted. The
+# code, Doxygen keeps a cache of pre-resolved symbols. If the cache is too small
+# Doxygen will become slower. If the cache is too large, memory is wasted. The
 # cache size is given by this formula: 2^(16+LOOKUP_CACHE_SIZE). The valid range
 # is 0..9, the default is 0, corresponding to a cache size of 2^16=65536
-# symbols. At the end of a run doxygen will report the cache usage and suggest
+# symbols. At the end of a run Doxygen will report the cache usage and suggest
 # the optimal cache size from a speed point of view.
 # Minimum value: 0, maximum value: 9, default value: 0.
 
 LOOKUP_CACHE_SIZE      = 0
 
+# The NUM_PROC_THREADS specifies the number of threads Doxygen is allowed to use
+# during processing. When set to 0 Doxygen will based this on the number of
+# cores available in the system. You can set it explicitly to a value larger
+# than 0 to get more control over the balance between CPU load and processing
+# speed. At this moment only the input processing can be done using multiple
+# threads. Since this is still an experimental feature the default is set to 1,
+# which effectively disables parallel processing. Please report any issues you
+# encounter. Generating dot graphs in parallel is controlled by the
+# DOT_NUM_THREADS setting.
+# Minimum value: 0, maximum value: 512, default value: 1.
+
+NUM_PROC_THREADS       = 1
+
+# If the TIMESTAMP tag is set different from NO then each generated page will
+# contain the date or date and time when the page was generated. Setting this to
+# NO can help when comparing the output of multiple runs.
+# Possible values are: YES, NO, DATETIME and DATE.
+# The default value is: NO.
+
+TIMESTAMP              = NO
+
 #---------------------------------------------------------------------------
 # Build related configuration options
 #---------------------------------------------------------------------------
 
-# If the EXTRACT_ALL tag is set to YES doxygen will assume all entities in
+# If the EXTRACT_ALL tag is set to YES, Doxygen will assume all entities in
 # documentation are documented, even if no documentation was available. Private
 # class members and static file members will be hidden unless the
 # EXTRACT_PRIVATE respectively EXTRACT_STATIC tags are set to YES.
@@ -394,35 +540,41 @@ LOOKUP_CACHE_SIZE      = 0
 
 EXTRACT_ALL            = YES
 
-# If the EXTRACT_PRIVATE tag is set to YES all private members of a class will
+# If the EXTRACT_PRIVATE tag is set to YES, all private members of a class will
 # be included in the documentation.
 # The default value is: NO.
 
 EXTRACT_PRIVATE        = YES
 
-# If the EXTRACT_PACKAGE tag is set to YES all members with package or internal
+# If the EXTRACT_PRIV_VIRTUAL tag is set to YES, documented private virtual
+# methods of a class will be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PRIV_VIRTUAL   = NO
+
+# If the EXTRACT_PACKAGE tag is set to YES, all members with package or internal
 # scope will be included in the documentation.
 # The default value is: NO.
 
 EXTRACT_PACKAGE        = NO
 
-# If the EXTRACT_STATIC tag is set to YES all static members of a file will be
+# If the EXTRACT_STATIC tag is set to YES, all static members of a file will be
 # included in the documentation.
 # The default value is: NO.
 
 EXTRACT_STATIC         = YES
 
-# If the EXTRACT_LOCAL_CLASSES tag is set to YES classes (and structs) defined
-# locally in source files will be included in the documentation. If set to NO
+# If the EXTRACT_LOCAL_CLASSES tag is set to YES, classes (and structs) defined
+# locally in source files will be included in the documentation. If set to NO,
 # only classes defined in header files are included. Does not have any effect
 # for Java sources.
 # The default value is: YES.
 
 EXTRACT_LOCAL_CLASSES  = YES
 
-# This flag is only useful for Objective-C code. When set to YES local methods,
+# This flag is only useful for Objective-C code. If set to YES, local methods,
 # which are defined in the implementation section but not in the interface are
-# included in the documentation. If set to NO only methods in the interface are
+# included in the documentation. If set to NO, only methods in the interface are
 # included.
 # The default value is: NO.
 
@@ -437,7 +589,14 @@ EXTRACT_LOCAL_METHODS  = NO
 
 EXTRACT_ANON_NSPACES   = NO
 
-# If the HIDE_UNDOC_MEMBERS tag is set to YES, doxygen will hide all
+# If this flag is set to YES, the name of an unnamed parameter in a declaration
+# will be determined by the corresponding definition. By default unnamed
+# parameters remain unnamed in the output.
+# The default value is: YES.
+
+RESOLVE_UNNAMED_PARAMS = YES
+
+# If the HIDE_UNDOC_MEMBERS tag is set to YES, Doxygen will hide all
 # undocumented members inside documented classes or files. If set to NO these
 # members will be included in the various overviews, but no documentation
 # section is generated. This option has no effect if EXTRACT_ALL is enabled.
@@ -445,23 +604,32 @@ EXTRACT_ANON_NSPACES   = NO
 
 HIDE_UNDOC_MEMBERS     = NO
 
-# If the HIDE_UNDOC_CLASSES tag is set to YES, doxygen will hide all
+# If the HIDE_UNDOC_CLASSES tag is set to YES, Doxygen will hide all
 # undocumented classes that are normally visible in the class hierarchy. If set
-# to NO these classes will be included in the various overviews. This option has
-# no effect if EXTRACT_ALL is enabled.
+# to NO, these classes will be included in the various overviews. This option
+# will also hide undocumented C++ concepts if enabled. This option has no effect
+# if EXTRACT_ALL is enabled.
 # The default value is: NO.
 
 HIDE_UNDOC_CLASSES     = NO
 
-# If the HIDE_FRIEND_COMPOUNDS tag is set to YES, doxygen will hide all friend
-# (class|struct|union) declarations. If set to NO these declarations will be
-# included in the documentation.
+# If the HIDE_UNDOC_NAMESPACES tag is set to YES, Doxygen will hide all
+# undocumented namespaces that are normally visible in the namespace hierarchy.
+# If set to NO, these namespaces will be included in the various overviews. This
+# option has no effect if EXTRACT_ALL is enabled.
+# The default value is: YES.
+
+HIDE_UNDOC_NAMESPACES  = YES
+
+# If the HIDE_FRIEND_COMPOUNDS tag is set to YES, Doxygen will hide all friend
+# declarations. If set to NO, these declarations will be included in the
+# documentation.
 # The default value is: NO.
 
 HIDE_FRIEND_COMPOUNDS  = NO
 
-# If the HIDE_IN_BODY_DOCS tag is set to YES, doxygen will hide any
-# documentation blocks found inside the body of a function. If set to NO these
+# If the HIDE_IN_BODY_DOCS tag is set to YES, Doxygen will hide any
+# documentation blocks found inside the body of a function. If set to NO, these
 # blocks will be appended to the function's detailed documentation block.
 # The default value is: NO.
 
@@ -474,23 +642,44 @@ HIDE_IN_BODY_DOCS      = NO
 
 INTERNAL_DOCS          = NO
 
-# If the CASE_SENSE_NAMES tag is set to NO then doxygen will only generate file
-# names in lower-case letters. If set to YES upper-case letters are also
-# allowed. This is useful if you have classes or files whose names only differ
-# in case and if your file system supports case sensitive file names. Windows
-# and Mac users are advised to set this option to NO.
-# The default value is: system dependent.
+# With the correct setting of option CASE_SENSE_NAMES Doxygen will better be
+# able to match the capabilities of the underlying filesystem. In case the
+# filesystem is case sensitive (i.e. it supports files in the same directory
+# whose names only differ in casing), the option must be set to YES to properly
+# deal with such files in case they appear in the input. For filesystems that
+# are not case sensitive the option should be set to NO to properly deal with
+# output files written for symbols that only differ in casing, such as for two
+# classes, one named CLASS and the other named Class, and to also support
+# references to files without having to specify the exact matching casing. On
+# Windows (including Cygwin) and macOS, users should typically set this option
+# to NO, whereas on Linux or other Unix flavors it should typically be set to
+# YES.
+# Possible values are: SYSTEM, NO and YES.
+# The default value is: SYSTEM.
 
 CASE_SENSE_NAMES       = YES
 
-# If the HIDE_SCOPE_NAMES tag is set to NO then doxygen will show members with
-# their full class and namespace scopes in the documentation. If set to YES the
+# If the HIDE_SCOPE_NAMES tag is set to NO then Doxygen will show members with
+# their full class and namespace scopes in the documentation. If set to YES, the
 # scope will be hidden.
 # The default value is: NO.
 
 HIDE_SCOPE_NAMES       = NO
 
-# If the SHOW_INCLUDE_FILES tag is set to YES then doxygen will put a list of
+# If the HIDE_COMPOUND_REFERENCE tag is set to NO (default) then Doxygen will
+# append additional text to a page's title, such as Class Reference. If set to
+# YES the compound reference will be hidden.
+# The default value is: NO.
+
+HIDE_COMPOUND_REFERENCE= NO
+
+# If the SHOW_HEADERFILE tag is set to YES then the documentation for a class
+# will show which file needs to be included to use the class.
+# The default value is: YES.
+
+SHOW_HEADERFILE        = YES
+
+# If the SHOW_INCLUDE_FILES tag is set to YES then Doxygen will put a list of
 # the files that are included by a file in the documentation of that file.
 # The default value is: YES.
 
@@ -503,7 +692,7 @@ SHOW_INCLUDE_FILES     = YES
 
 SHOW_GROUPED_MEMB_INC  = NO
 
-# If the FORCE_LOCAL_INCLUDES tag is set to YES then doxygen will list include
+# If the FORCE_LOCAL_INCLUDES tag is set to YES then Doxygen will list include
 # files with double quotes in the documentation rather than with sharp brackets.
 # The default value is: NO.
 
@@ -515,22 +704,22 @@ FORCE_LOCAL_INCLUDES   = NO
 
 INLINE_INFO            = YES
 
-# If the SORT_MEMBER_DOCS tag is set to YES then doxygen will sort the
+# If the SORT_MEMBER_DOCS tag is set to YES then Doxygen will sort the
 # (detailed) documentation of file and class members alphabetically by member
-# name. If set to NO the members will appear in declaration order.
+# name. If set to NO, the members will appear in declaration order.
 # The default value is: YES.
 
 SORT_MEMBER_DOCS       = YES
 
-# If the SORT_BRIEF_DOCS tag is set to YES then doxygen will sort the brief
+# If the SORT_BRIEF_DOCS tag is set to YES then Doxygen will sort the brief
 # descriptions of file, namespace and class members alphabetically by member
-# name. If set to NO the members will appear in declaration order. Note that
+# name. If set to NO, the members will appear in declaration order. Note that
 # this will also influence the order of the classes in the class list.
 # The default value is: NO.
 
 SORT_BRIEF_DOCS        = NO
 
-# If the SORT_MEMBERS_CTORS_1ST tag is set to YES then doxygen will sort the
+# If the SORT_MEMBERS_CTORS_1ST tag is set to YES then Doxygen will sort the
 # (brief and detailed) documentation of class members so that constructors and
 # destructors are listed first. If set to NO the constructors will appear in the
 # respective orders defined by SORT_BRIEF_DOCS and SORT_MEMBER_DOCS.
@@ -542,7 +731,7 @@ SORT_BRIEF_DOCS        = NO
 
 SORT_MEMBERS_CTORS_1ST = NO
 
-# If the SORT_GROUP_NAMES tag is set to YES then doxygen will sort the hierarchy
+# If the SORT_GROUP_NAMES tag is set to YES then Doxygen will sort the hierarchy
 # of group names into alphabetical order. If set to NO the group names will
 # appear in their defined order.
 # The default value is: NO.
@@ -559,37 +748,35 @@ SORT_GROUP_NAMES       = NO
 
 SORT_BY_SCOPE_NAME     = NO
 
-# If the STRICT_PROTO_MATCHING option is enabled and doxygen fails to do proper
+# If the STRICT_PROTO_MATCHING option is enabled and Doxygen fails to do proper
 # type resolution of all parameters of a function it will reject a match between
 # the prototype and the implementation of a member function even if there is
 # only one candidate or it is obvious which candidate to choose by doing a
-# simple string match. By disabling STRICT_PROTO_MATCHING doxygen will still
+# simple string match. By disabling STRICT_PROTO_MATCHING Doxygen will still
 # accept a match between prototype and implementation in such cases.
 # The default value is: NO.
 
 STRICT_PROTO_MATCHING  = NO
 
-# The GENERATE_TODOLIST tag can be used to enable ( YES) or disable ( NO) the
-# todo list. This list is created by putting \todo commands in the
-# documentation.
+# The GENERATE_TODOLIST tag can be used to enable (YES) or disable (NO) the todo
+# list. This list is created by putting \todo commands in the documentation.
 # The default value is: YES.
 
 GENERATE_TODOLIST      = YES
 
-# The GENERATE_TESTLIST tag can be used to enable ( YES) or disable ( NO) the
-# test list. This list is created by putting \test commands in the
-# documentation.
+# The GENERATE_TESTLIST tag can be used to enable (YES) or disable (NO) the test
+# list. This list is created by putting \test commands in the documentation.
 # The default value is: YES.
 
 GENERATE_TESTLIST      = YES
 
-# The GENERATE_BUGLIST tag can be used to enable ( YES) or disable ( NO) the bug
+# The GENERATE_BUGLIST tag can be used to enable (YES) or disable (NO) the bug
 # list. This list is created by putting \bug commands in the documentation.
 # The default value is: YES.
 
 GENERATE_BUGLIST       = YES
 
-# The GENERATE_DEPRECATEDLIST tag can be used to enable ( YES) or disable ( NO)
+# The GENERATE_DEPRECATEDLIST tag can be used to enable (YES) or disable (NO)
 # the deprecated list. This list is created by putting \deprecated commands in
 # the documentation.
 # The default value is: YES.
@@ -614,8 +801,8 @@ ENABLED_SECTIONS       =
 MAX_INITIALIZER_LINES  = 0
 
 # Set the SHOW_USED_FILES tag to NO to disable the list of files generated at
-# the bottom of the documentation of classes and structs. If set to YES the list
-# will mention the files that were used to generate the documentation.
+# the bottom of the documentation of classes and structs. If set to YES, the
+# list will mention the files that were used to generate the documentation.
 # The default value is: YES.
 
 SHOW_USED_FILES        = YES
@@ -635,24 +822,25 @@ SHOW_FILES             = YES
 SHOW_NAMESPACES        = YES
 
 # The FILE_VERSION_FILTER tag can be used to specify a program or script that
-# doxygen should invoke to get the current version for each file (typically from
+# Doxygen should invoke to get the current version for each file (typically from
 # the version control system). Doxygen will invoke the program by executing (via
 # popen()) the command command input-file, where command is the value of the
 # FILE_VERSION_FILTER tag, and input-file is the name of an input file provided
-# by doxygen. Whatever the program writes to standard output is used as the file
+# by Doxygen. Whatever the program writes to standard output is used as the file
 # version. For an example see the documentation.
 
 FILE_VERSION_FILTER    =
 
 # The LAYOUT_FILE tag can be used to specify a layout file which will be parsed
-# by doxygen. The layout file controls the global structure of the generated
+# by Doxygen. The layout file controls the global structure of the generated
 # output files in an output format independent way. To create the layout file
-# that represents doxygen's defaults, run doxygen with the -l option. You can
+# that represents Doxygen's defaults, run Doxygen with the -l option. You can
 # optionally specify a file name after the option, if omitted DoxygenLayout.xml
-# will be used as the name of the layout file.
+# will be used as the name of the layout file. See also section "Changing the
+# layout of pages" for information.
 #
-# Note that if you run doxygen from a directory containing a file called
-# DoxygenLayout.xml, doxygen will parse it automatically even if the LAYOUT_FILE
+# Note that if you run Doxygen from a directory containing a file called
+# DoxygenLayout.xml, Doxygen will parse it automatically even if the LAYOUT_FILE
 # tag is left empty.
 
 LAYOUT_FILE            =
@@ -660,27 +848,42 @@ LAYOUT_FILE            =
 # The CITE_BIB_FILES tag can be used to specify one or more bib files containing
 # the reference definitions. This must be a list of .bib files. The .bib
 # extension is automatically appended if omitted. This requires the bibtex tool
-# to be installed. See also http://en.wikipedia.org/wiki/BibTeX for more info.
+# to be installed. See also https://en.wikipedia.org/wiki/BibTeX for more info.
 # For LaTeX the style of the bibliography can be controlled using
 # LATEX_BIB_STYLE. To use this feature you need bibtex and perl available in the
-# search path. Do not use file names with spaces, bibtex cannot handle them. See
-# also \cite for info how to create references.
+# search path. See also \cite for info how to create references.
 
 CITE_BIB_FILES         =
 
+# The EXTERNAL_TOOL_PATH tag can be used to extend the search path (PATH
+# environment variable) so that external tools such as latex and gs can be
+# found.
+# Note: Directories specified with EXTERNAL_TOOL_PATH are added in front of the
+# path already specified by the PATH variable, and are added in the order
+# specified.
+# Note: This option is particularly useful for macOS version 14 (Sonoma) and
+# higher, when running Doxygen from Doxywizard, because in this case any user-
+# defined changes to the PATH are ignored. A typical example on macOS is to set
+# EXTERNAL_TOOL_PATH = /Library/TeX/texbin /usr/local/bin
+# together with the standard path, the full search path used by doxygen when
+# launching external tools will then become
+# PATH=/Library/TeX/texbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
+
+EXTERNAL_TOOL_PATH     =
+
 #---------------------------------------------------------------------------
 # Configuration options related to warning and progress messages
 #---------------------------------------------------------------------------
 
 # The QUIET tag can be used to turn on/off the messages that are generated to
-# standard output by doxygen. If QUIET is set to YES this implies that the
+# standard output by Doxygen. If QUIET is set to YES this implies that the
 # messages are off.
 # The default value is: NO.
 
 QUIET                  = YES
 
 # The WARNINGS tag can be used to turn on/off the warning messages that are
-# generated to standard error ( stderr) by doxygen. If WARNINGS is set to YES
+# generated to standard error (stderr) by Doxygen. If WARNINGS is set to YES
 # this implies that the warnings are on.
 #
 # Tip: Turn warnings on while writing the documentation.
@@ -688,42 +891,97 @@ QUIET                  = YES
 
 WARNINGS               = YES
 
-# If the WARN_IF_UNDOCUMENTED tag is set to YES, then doxygen will generate
+# If the WARN_IF_UNDOCUMENTED tag is set to YES then Doxygen will generate
 # warnings for undocumented members. If EXTRACT_ALL is set to YES then this flag
 # will automatically be disabled.
 # The default value is: YES.
 
 WARN_IF_UNDOCUMENTED   = YES
 
-# If the WARN_IF_DOC_ERROR tag is set to YES, doxygen will generate warnings for
-# potential errors in the documentation, such as not documenting some parameters
-# in a documented function, or documenting parameters that don't exist or using
-# markup commands wrongly.
+# If the WARN_IF_DOC_ERROR tag is set to YES, Doxygen will generate warnings for
+# potential errors in the documentation, such as documenting some parameters in
+# a documented function twice, or documenting parameters that don't exist or
+# using markup commands wrongly.
 # The default value is: YES.
 
 WARN_IF_DOC_ERROR      = YES
 
+# If WARN_IF_INCOMPLETE_DOC is set to YES, Doxygen will warn about incomplete
+# function parameter documentation. If set to NO, Doxygen will accept that some
+# parameters have no documentation without warning.
+# The default value is: YES.
+
+WARN_IF_INCOMPLETE_DOC = YES
+
 # This WARN_NO_PARAMDOC option can be enabled to get warnings for functions that
 # are documented, but have no documentation for their parameters or return
-# value. If set to NO doxygen will only warn about wrong or incomplete parameter
-# documentation, but not about the absence of documentation.
+# value. If set to NO, Doxygen will only warn about wrong parameter
+# documentation, but not about the absence of documentation. If EXTRACT_ALL is
+# set to YES then this flag will automatically be disabled. See also
+# WARN_IF_INCOMPLETE_DOC
 # The default value is: NO.
 
 WARN_NO_PARAMDOC       = NO
 
-# The WARN_FORMAT tag determines the format of the warning messages that doxygen
+# If WARN_IF_UNDOC_ENUM_VAL option is set to YES, Doxygen will warn about
+# undocumented enumeration values. If set to NO, Doxygen will accept
+# undocumented enumeration values. If EXTRACT_ALL is set to YES then this flag
+# will automatically be disabled.
+# The default value is: NO.
+
+WARN_IF_UNDOC_ENUM_VAL = NO
+
+# If WARN_LAYOUT_FILE option is set to YES, Doxygen will warn about issues found
+# while parsing the user defined layout file, such as missing or wrong elements.
+# See also LAYOUT_FILE for details. If set to NO, problems with the layout file
+# will be suppressed.
+# The default value is: YES.
+
+WARN_LAYOUT_FILE       = YES
+
+# If the WARN_AS_ERROR tag is set to YES then Doxygen will immediately stop when
+# a warning is encountered. If the WARN_AS_ERROR tag is set to FAIL_ON_WARNINGS
+# then Doxygen will continue running as if WARN_AS_ERROR tag is set to NO, but
+# at the end of the Doxygen process Doxygen will return with a non-zero status.
+# If the WARN_AS_ERROR tag is set to FAIL_ON_WARNINGS_PRINT then Doxygen behaves
+# like FAIL_ON_WARNINGS but in case no WARN_LOGFILE is defined Doxygen will not
+# write the warning messages in between other messages but write them at the end
+# of a run, in case a WARN_LOGFILE is defined the warning messages will be
+# besides being in the defined file also be shown at the end of a run, unless
+# the WARN_LOGFILE is defined as - i.e. standard output (stdout) in that case
+# the behavior will remain as with the setting FAIL_ON_WARNINGS.
+# Possible values are: NO, YES, FAIL_ON_WARNINGS and FAIL_ON_WARNINGS_PRINT.
+# The default value is: NO.
+
+WARN_AS_ERROR          = NO
+
+# The WARN_FORMAT tag determines the format of the warning messages that Doxygen
 # can produce. The string should contain the $file, $line, and $text tags, which
 # will be replaced by the file and line number from which the warning originated
 # and the warning text. Optionally the format may contain $version, which will
 # be replaced by the version of the file (if it could be obtained via
 # FILE_VERSION_FILTER)
+# See also: WARN_LINE_FORMAT
 # The default value is: $file:$line: $text.
 
 WARN_FORMAT            = "$file:$line: $text"
 
+# In the $text part of the WARN_FORMAT command it is possible that a reference
+# to a more specific place is given. To make it easier to jump to this place
+# (outside of Doxygen) the user can define a custom "cut" / "paste" string.
+# Example:
+# WARN_LINE_FORMAT = "'vi $file +$line'"
+# See also: WARN_FORMAT
+# The default value is: at line $line of file $file.
+
+WARN_LINE_FORMAT       = "at line $line of file $file"
+
 # The WARN_LOGFILE tag can be used to specify a file to which warning and error
 # messages should be written. If left blank the output is written to standard
-# error (stderr).
+# error (stderr). In case the file specified cannot be opened for writing the
+# warning and error messages are written to standard error. When as file - is
+# specified the warning and error messages are written to standard output
+# (stdout).
 
 WARN_LOGFILE           =
 
@@ -734,73 +992,93 @@ WARN_LOGFILE           =
 # The INPUT tag is used to specify the files and/or directories that contain
 # documented source files. You may enter file names like myfile.cpp or
 # directories like /usr/src/myproject. Separate the files or directories with
-# spaces.
+# spaces. See also FILE_PATTERNS and EXTENSION_MAPPING
 # Note: If this tag is empty the current directory is searched.
 
 INPUT                  = @SRCDIR@/doc/libdvbv5-index.doc \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-demux.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-dev.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-fe.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-file.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-log.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-sat.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-scan.h \
-			 @SRCDIR@/lib/include/libdvbv5/dvb-v5-std.h \
-			 @SRCDIR@/lib/include/libdvbv5/descriptors.h \
-			 @SRCDIR@/lib/include/libdvbv5/header.h \
-			 @SRCDIR@/lib/include/libdvbv5/atsc_header.h \
-			 @SRCDIR@/lib/include/libdvbv5/atsc_eit.h \
-			 @SRCDIR@/lib/include/libdvbv5/cat.h \
-			 @SRCDIR@/lib/include/libdvbv5/eit.h \
-			 @SRCDIR@/lib/include/libdvbv5/mgt.h \
-			 @SRCDIR@/lib/include/libdvbv5/nit.h \
-			 @SRCDIR@/lib/include/libdvbv5/pat.h \
-			 @SRCDIR@/lib/include/libdvbv5/pmt.h \
-			 @SRCDIR@/lib/include/libdvbv5/sdt.h \
-			 @SRCDIR@/lib/include/libdvbv5/vct.h \
-			 @SRCDIR@/lib/include/libdvbv5/crc32.h \
-			 @SRCDIR@/lib/include/libdvbv5/countries.h \
-			 @SRCDIR@/lib/include/libdvbv5/mpeg_es.h \
-			 @SRCDIR@/lib/include/libdvbv5/mpeg_pes.h \
-			 @SRCDIR@/lib/include/libdvbv5/mpeg_ts.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_atsc_service_location.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_ca.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_ca_identifier.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_cable_delivery.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_event_extended.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_event_short.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_extension.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_frequency_list.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_hierarchy.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_isdbt_delivery.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_language.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_logical_channel.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_network_name.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_partial_reception.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_registration_id.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_sat.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_service.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_t2_delivery.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_terrestrial_delivery.h \
-			 @SRCDIR@/lib/include/libdvbv5/desc_ts_info.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-demux.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-dev.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-fe.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-file.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-log.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-sat.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-scan.h \
+                         @SRCDIR@/lib/include/libdvbv5/dvb-v5-std.h \
+                         @SRCDIR@/lib/include/libdvbv5/descriptors.h \
+                         @SRCDIR@/lib/include/libdvbv5/header.h \
+                         @SRCDIR@/lib/include/libdvbv5/atsc_header.h \
+                         @SRCDIR@/lib/include/libdvbv5/atsc_eit.h \
+                         @SRCDIR@/lib/include/libdvbv5/cat.h \
+                         @SRCDIR@/lib/include/libdvbv5/eit.h \
+                         @SRCDIR@/lib/include/libdvbv5/mgt.h \
+                         @SRCDIR@/lib/include/libdvbv5/nit.h \
+                         @SRCDIR@/lib/include/libdvbv5/pat.h \
+                         @SRCDIR@/lib/include/libdvbv5/pmt.h \
+                         @SRCDIR@/lib/include/libdvbv5/sdt.h \
+                         @SRCDIR@/lib/include/libdvbv5/vct.h \
+                         @SRCDIR@/lib/include/libdvbv5/crc32.h \
+                         @SRCDIR@/lib/include/libdvbv5/countries.h \
+                         @SRCDIR@/lib/include/libdvbv5/mpeg_es.h \
+                         @SRCDIR@/lib/include/libdvbv5/mpeg_pes.h \
+                         @SRCDIR@/lib/include/libdvbv5/mpeg_ts.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_atsc_service_location.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_ca.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_ca_identifier.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_cable_delivery.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_event_extended.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_event_short.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_extension.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_frequency_list.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_hierarchy.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_isdbt_delivery.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_language.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_logical_channel.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_network_name.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_partial_reception.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_registration_id.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_sat.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_service.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_t2_delivery.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_terrestrial_delivery.h \
+                         @SRCDIR@/lib/include/libdvbv5/desc_ts_info.h
 
 # This tag can be used to specify the character encoding of the source files
-# that doxygen parses. Internally doxygen uses the UTF-8 encoding. Doxygen uses
+# that Doxygen parses. Internally Doxygen uses the UTF-8 encoding. Doxygen uses
 # libiconv (or the iconv built into libc) for the transcoding. See the libiconv
-# documentation (see: http://www.gnu.org/software/libiconv) for the list of
-# possible encodings.
+# documentation (see:
+# https://www.gnu.org/software/libiconv/) for the list of possible encodings.
+# See also: INPUT_FILE_ENCODING
 # The default value is: UTF-8.
 
 INPUT_ENCODING         = UTF-8
 
+# This tag can be used to specify the character encoding of the source files
+# that Doxygen parses. The INPUT_FILE_ENCODING tag can be used to specify
+# character encoding on a per file pattern basis. Doxygen will compare the file
+# name with each pattern and apply the encoding instead of the default
+# INPUT_ENCODING if there is a match. The character encodings are a list of the
+# form: pattern=encoding (like *.php=ISO-8859-1).
+# See also: INPUT_ENCODING for further information on supported encodings.
+
+INPUT_FILE_ENCODING    =
+
 # If the value of the INPUT tag contains directories, you can use the
 # FILE_PATTERNS tag to specify one or more wildcard patterns (like *.cpp and
-# *.h) to filter out the source-files in the directories. If left blank the
-# following patterns are tested:*.c, *.cc, *.cxx, *.cpp, *.c++, *.java, *.ii,
-# *.ixx, *.ipp, *.i++, *.inl, *.idl, *.ddl, *.odl, *.h, *.hh, *.hxx, *.hpp,
-# *.h++, *.cs, *.d, *.php, *.php4, *.php5, *.phtml, *.inc, *.m, *.markdown,
-# *.md, *.mm, *.dox, *.py, *.f90, *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf,
-# *.qsf, *.as and *.js.
+# *.h) to filter out the source-files in the directories.
+#
+# Note that for custom extensions or not directly supported extensions you also
+# need to set EXTENSION_MAPPING for the extension otherwise the files are not
+# read by Doxygen.
+#
+# Note the list of default checked file patterns might differ from the list of
+# default file extension mappings.
+#
+# If left blank the following patterns are tested:*.c, *.cc, *.cxx, *.cxxm,
+# *.cpp, *.cppm, *.ccm, *.c++, *.c++m, *.java, *.ii, *.ixx, *.ipp, *.i++, *.inl,
+# *.idl, *.ddl, *.odl, *.h, *.hh, *.hxx, *.hpp, *.h++, *.l, *.cs, *.d, *.php,
+# *.php4, *.php5, *.phtml, *.inc, *.m, *.markdown, *.md, *.mm, *.dox (to be
+# provided as Doxygen C comment), *.py, *.pyw, *.f90, *.f95, *.f03, *.f08,
+# *.f18, *.f, *.for, *.vhd, *.vhdl, *.ucf, *.qsf and *.ice.
 
 FILE_PATTERNS          =
 
@@ -814,7 +1092,7 @@ RECURSIVE              = YES
 # excluded from the INPUT source files. This way you can easily exclude a
 # subdirectory from a directory tree whose root is specified with the INPUT tag.
 #
-# Note that relative paths are relative to the directory from which doxygen is
+# Note that relative paths are relative to the directory from which Doxygen is
 # run.
 
 EXCLUDE                =
@@ -839,10 +1117,7 @@ EXCLUDE_PATTERNS       =
 # (namespaces, classes, functions, etc.) that should be excluded from the
 # output. The symbol name can be a fully qualified name, a word, or if the
 # wildcard * is used, a substring. Examples: ANamespace, AClass,
-# AClass::ANamespace, ANamespace::*Test
-#
-# Note that the wildcards are matched against the file with absolute path, so to
-# exclude all test directories use the pattern */test/*
+# ANamespace::AClass, ANamespace::*Test
 
 EXCLUDE_SYMBOLS        =
 
@@ -872,7 +1147,7 @@ EXAMPLE_RECURSIVE      = NO
 
 IMAGE_PATH             =
 
-# The INPUT_FILTER tag can be used to specify a program that doxygen should
+# The INPUT_FILTER tag can be used to specify a program that Doxygen should
 # invoke to filter for each input file. Doxygen will invoke the filter program
 # by executing (via popen()) the command:
 #
@@ -886,6 +1161,15 @@ IMAGE_PATH             =
 # Note that the filter must not add or remove lines; it is applied before the
 # code is scanned, but not when the output code is generated. If lines are added
 # or removed, the anchors will not be placed correctly.
+#
+# Note that Doxygen will use the data processed and written to standard output
+# for further processing, therefore nothing else, like debug statements or used
+# commands (so in case of a Windows batch file always use @echo OFF), should be
+# written to standard output.
+#
+# Note that for custom extensions or not directly supported extensions you also
+# need to set EXTENSION_MAPPING for the extension otherwise the files are not
+# properly processed by Doxygen.
 
 INPUT_FILTER           =
 
@@ -895,11 +1179,15 @@ INPUT_FILTER           =
 # (like *.cpp=my_cpp_filter). See INPUT_FILTER for further information on how
 # filters are used. If the FILTER_PATTERNS tag is empty or if none of the
 # patterns match the file name, INPUT_FILTER is applied.
+#
+# Note that for custom extensions or not directly supported extensions you also
+# need to set EXTENSION_MAPPING for the extension otherwise the files are not
+# properly processed by Doxygen.
 
 FILTER_PATTERNS        =
 
 # If the FILTER_SOURCE_FILES tag is set to YES, the input filter (if set using
-# INPUT_FILTER ) will also be used to filter the input files that are used for
+# INPUT_FILTER) will also be used to filter the input files that are used for
 # producing the source files to browse (i.e. when SOURCE_BROWSER is set to YES).
 # The default value is: NO.
 
@@ -916,10 +1204,28 @@ FILTER_SOURCE_PATTERNS =
 # If the USE_MDFILE_AS_MAINPAGE tag refers to the name of a markdown file that
 # is part of the input, its contents will be placed on the main page
 # (index.html). This can be useful if you have a project on for instance GitHub
-# and want to reuse the introduction page also for the doxygen output.
+# and want to reuse the introduction page also for the Doxygen output.
 
 USE_MDFILE_AS_MAINPAGE =
 
+# If the IMPLICIT_DIR_DOCS tag is set to YES, any README.md file found in sub-
+# directories of the project's root, is used as the documentation for that sub-
+# directory, except when the README.md starts with a \dir, \page or \mainpage
+# command. If set to NO, the README.md file needs to start with an explicit \dir
+# command in order to be used as directory documentation.
+# The default value is: YES.
+
+IMPLICIT_DIR_DOCS      = YES
+
+# The Fortran standard specifies that for fixed formatted Fortran code all
+# characters from position 72 are to be considered as comment. A common
+# extension is to allow longer lines before the automatic comment starts. The
+# setting FORTRAN_COMMENT_AFTER will also make it possible that longer lines can
+# be processed before the automatic comment starts.
+# Minimum value: 7, maximum value: 10000, default value: 72.
+
+FORTRAN_COMMENT_AFTER  = 72
+
 #---------------------------------------------------------------------------
 # Configuration options related to source browsing
 #---------------------------------------------------------------------------
@@ -934,12 +1240,13 @@ USE_MDFILE_AS_MAINPAGE =
 SOURCE_BROWSER         = YES
 
 # Setting the INLINE_SOURCES tag to YES will include the body of functions,
-# classes and enums directly into the documentation.
+# multi-line macros, enums or list initialized variables directly into the
+# documentation.
 # The default value is: NO.
 
 INLINE_SOURCES         = NO
 
-# Setting the STRIP_CODE_COMMENTS tag to YES will instruct doxygen to hide any
+# Setting the STRIP_CODE_COMMENTS tag to YES will instruct Doxygen to hide any
 # special comment blocks from generated source code fragments. Normal C, C++ and
 # Fortran comments will always remain visible.
 # The default value is: YES.
@@ -947,7 +1254,7 @@ INLINE_SOURCES         = NO
 STRIP_CODE_COMMENTS    = YES
 
 # If the REFERENCED_BY_RELATION tag is set to YES then for each documented
-# function all documented functions referencing it will be listed.
+# entity all documented functions referencing it will be listed.
 # The default value is: NO.
 
 REFERENCED_BY_RELATION = YES
@@ -959,7 +1266,7 @@ REFERENCED_BY_RELATION = YES
 REFERENCES_RELATION    = YES
 
 # If the REFERENCES_LINK_SOURCE tag is set to YES and SOURCE_BROWSER tag is set
-# to YES, then the hyperlinks from functions in REFERENCES_RELATION and
+# to YES then the hyperlinks from functions in REFERENCES_RELATION and
 # REFERENCED_BY_RELATION lists will link to the source code. Otherwise they will
 # link to the documentation.
 # The default value is: YES.
@@ -977,28 +1284,28 @@ REFERENCES_LINK_SOURCE = YES
 SOURCE_TOOLTIPS        = YES
 
 # If the USE_HTAGS tag is set to YES then the references to source code will
-# point to the HTML generated by the htags(1) tool instead of doxygen built-in
+# point to the HTML generated by the htags(1) tool instead of Doxygen built-in
 # source browser. The htags tool is part of GNU's global source tagging system
-# (see http://www.gnu.org/software/global/global.html). You will need version
+# (see https://www.gnu.org/software/global/global.html). You will need version
 # 4.8.6 or higher.
 #
 # To use it do the following:
 # - Install the latest version of global
-# - Enable SOURCE_BROWSER and USE_HTAGS in the config file
+# - Enable SOURCE_BROWSER and USE_HTAGS in the configuration file
 # - Make sure the INPUT points to the root of the source tree
 # - Run doxygen as normal
 #
 # Doxygen will invoke htags (and that will in turn invoke gtags), so these
 # tools must be available from the command line (i.e. in the search path).
 #
-# The result: instead of the source browser generated by doxygen, the links to
+# The result: instead of the source browser generated by Doxygen, the links to
 # source code will now point to the output of htags.
 # The default value is: NO.
 # This tag requires that the tag SOURCE_BROWSER is set to YES.
 
 USE_HTAGS              = NO
 
-# If the VERBATIM_HEADERS tag is set the YES then doxygen will generate a
+# If the VERBATIM_HEADERS tag is set the YES then Doxygen will generate a
 # verbatim copy of the header file for each class for which an include is
 # specified. Set to NO to disable this.
 # See also: Section \class.
@@ -1006,6 +1313,46 @@ USE_HTAGS              = NO
 
 VERBATIM_HEADERS       = YES
 
+# If the CLANG_ASSISTED_PARSING tag is set to YES then Doxygen will use the
+# clang parser (see:
+# http://clang.llvm.org/) for more accurate parsing at the cost of reduced
+# performance. This can be particularly helpful with template rich C++ code for
+# which Doxygen's built-in parser lacks the necessary type information.
+# Note: The availability of this option depends on whether or not Doxygen was
+# generated with the -Duse_libclang=ON option for CMake.
+# The default value is: NO.
+
+CLANG_ASSISTED_PARSING = NO
+
+# If the CLANG_ASSISTED_PARSING tag is set to YES and the CLANG_ADD_INC_PATHS
+# tag is set to YES then Doxygen will add the directory of each input to the
+# include path.
+# The default value is: YES.
+# This tag requires that the tag CLANG_ASSISTED_PARSING is set to YES.
+
+CLANG_ADD_INC_PATHS    = YES
+
+# If clang assisted parsing is enabled you can provide the compiler with command
+# line options that you would normally use when invoking the compiler. Note that
+# the include paths will already be set by Doxygen for the files and directories
+# specified with INPUT and INCLUDE_PATH.
+# This tag requires that the tag CLANG_ASSISTED_PARSING is set to YES.
+
+CLANG_OPTIONS          =
+
+# If clang assisted parsing is enabled you can provide the clang parser with the
+# path to the directory containing a file called compile_commands.json. This
+# file is the compilation database (see:
+# http://clang.llvm.org/docs/HowToSetupToolingForLLVM.html) containing the
+# options used when the source files were built. This is equivalent to
+# specifying the -p option to a clang tool, such as clang-check. These options
+# will then be passed to the parser. Any options specified with CLANG_OPTIONS
+# will be added as well.
+# Note: The availability of this option depends on whether or not Doxygen was
+# generated with the -Duse_libclang=ON option for CMake.
+
+CLANG_DATABASE_PATH    =
+
 #---------------------------------------------------------------------------
 # Configuration options related to the alphabetical class index
 #---------------------------------------------------------------------------
@@ -1017,10 +1364,11 @@ VERBATIM_HEADERS       = YES
 
 ALPHABETICAL_INDEX     = YES
 
-# In case all classes in a project start with a common prefix, all classes will
-# be put under the same header in the alphabetical index. The IGNORE_PREFIX tag
-# can be used to specify a prefix (or a list of prefixes) that should be ignored
-# while generating the index headers.
+# The IGNORE_PREFIX tag can be used to specify a prefix (or a list of prefixes)
+# that should be ignored while generating the index headers. The IGNORE_PREFIX
+# tag works for classes, function and member names. The entity will be placed in
+# the alphabetical list under the first letter of the entity name that remains
+# after removing the prefix.
 # This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
 
 IGNORE_PREFIX          =
@@ -1029,7 +1377,7 @@ IGNORE_PREFIX          =
 # Configuration options related to the HTML output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_HTML tag is set to YES doxygen will generate HTML output
+# If the GENERATE_HTML tag is set to YES, Doxygen will generate HTML output
 # The default value is: YES.
 
 GENERATE_HTML          = @GENERATE_HTML@
@@ -1050,40 +1398,40 @@ HTML_OUTPUT            = html
 HTML_FILE_EXTENSION    = .html
 
 # The HTML_HEADER tag can be used to specify a user-defined HTML header file for
-# each generated HTML page. If the tag is left blank doxygen will generate a
+# each generated HTML page. If the tag is left blank Doxygen will generate a
 # standard header.
 #
 # To get valid HTML the header file that includes any scripts and style sheets
-# that doxygen needs, which is dependent on the configuration options used (e.g.
+# that Doxygen needs, which is dependent on the configuration options used (e.g.
 # the setting GENERATE_TREEVIEW). It is highly recommended to start with a
 # default header using
 # doxygen -w html new_header.html new_footer.html new_stylesheet.css
 # YourConfigFile
 # and then modify the file new_header.html. See also section "Doxygen usage"
-# for information on how to generate the default header that doxygen normally
+# for information on how to generate the default header that Doxygen normally
 # uses.
 # Note: The header is subject to change so you typically have to regenerate the
-# default header when upgrading to a newer version of doxygen. For a description
+# default header when upgrading to a newer version of Doxygen. For a description
 # of the possible markers and block names see the documentation.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
 HTML_HEADER            =
 
 # The HTML_FOOTER tag can be used to specify a user-defined HTML footer for each
-# generated HTML page. If the tag is left blank doxygen will generate a standard
+# generated HTML page. If the tag is left blank Doxygen will generate a standard
 # footer. See HTML_HEADER for more information on how to generate a default
 # footer and what special commands can be used inside the footer. See also
 # section "Doxygen usage" for information on how to generate the default footer
-# that doxygen normally uses.
+# that Doxygen normally uses.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
 HTML_FOOTER            =
 
 # The HTML_STYLESHEET tag can be used to specify a user-defined cascading style
 # sheet that is used by each HTML page. It can be used to fine-tune the look of
-# the HTML output. If left blank doxygen will generate a default style sheet.
+# the HTML output. If left blank Doxygen will generate a default style sheet.
 # See also section "Doxygen usage" for information on how to generate the style
-# sheet that doxygen normally uses.
+# sheet that Doxygen normally uses.
 # Note: It is recommended to use HTML_EXTRA_STYLESHEET instead of this tag, as
 # it is more robust and this tag (HTML_STYLESHEET) will in the future become
 # obsolete.
@@ -1091,13 +1439,20 @@ HTML_FOOTER            =
 
 HTML_STYLESHEET        =
 
-# The HTML_EXTRA_STYLESHEET tag can be used to specify an additional user-
-# defined cascading style sheet that is included after the standard style sheets
-# created by doxygen. Using this option one can overrule certain style aspects.
+# The HTML_EXTRA_STYLESHEET tag can be used to specify additional user-defined
+# cascading style sheets that are included after the standard style sheets
+# created by Doxygen. Using this option one can overrule certain style aspects.
 # This is preferred over using HTML_STYLESHEET since it does not replace the
-# standard style sheet and is therefor more robust against future updates.
-# Doxygen will copy the style sheet file to the output directory. For an example
-# see the documentation.
+# standard style sheet and is therefore more robust against future updates.
+# Doxygen will copy the style sheet files to the output directory.
+# Note: The order of the extra style sheet files is of importance (e.g. the last
+# style sheet in the list overrules the setting of the previous ones in the
+# list).
+# Note: Since the styling of scrollbars can currently not be overruled in
+# Webkit/Chromium, the styling will be left out of the default doxygen.css if
+# one or more extra stylesheets have been specified. So if scrollbar
+# customization is desired it has to be added explicitly. For an example see the
+# documentation.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
 HTML_EXTRA_STYLESHEET  =
@@ -1112,10 +1467,23 @@ HTML_EXTRA_STYLESHEET  =
 
 HTML_EXTRA_FILES       =
 
+# The HTML_COLORSTYLE tag can be used to specify if the generated HTML output
+# should be rendered with a dark or light theme.
+# Possible values are: LIGHT always generates light mode output, DARK always
+# generates dark mode output, AUTO_LIGHT automatically sets the mode according
+# to the user preference, uses light mode if no preference is set (the default),
+# AUTO_DARK automatically sets the mode according to the user preference, uses
+# dark mode if no preference is set and TOGGLE allows a user to switch between
+# light and dark mode via a button.
+# The default value is: AUTO_LIGHT.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE        = AUTO_LIGHT
+
 # The HTML_COLORSTYLE_HUE tag controls the color of the HTML output. Doxygen
-# will adjust the colors in the stylesheet and background images according to
-# this color. Hue is specified as an angle on a colorwheel, see
-# http://en.wikipedia.org/wiki/Hue for more information. For instance the value
+# will adjust the colors in the style sheet and background images according to
+# this color. Hue is specified as an angle on a color-wheel, see
+# https://en.wikipedia.org/wiki/Hue for more information. For instance the value
 # 0 represents red, 60 is yellow, 120 is green, 180 is cyan, 240 is blue, 300
 # purple, and 360 is red again.
 # Minimum value: 0, maximum value: 359, default value: 220.
@@ -1124,7 +1492,7 @@ HTML_EXTRA_FILES       =
 HTML_COLORSTYLE_HUE    = 220
 
 # The HTML_COLORSTYLE_SAT tag controls the purity (or saturation) of the colors
-# in the HTML output. For a value of 0 the output will use grayscales only. A
+# in the HTML output. For a value of 0 the output will use gray-scales only. A
 # value of 255 will produce the most vivid colors.
 # Minimum value: 0, maximum value: 255, default value: 100.
 # This tag requires that the tag GENERATE_HTML is set to YES.
@@ -1142,13 +1510,16 @@ HTML_COLORSTYLE_SAT    = 100
 
 HTML_COLORSTYLE_GAMMA  = 80
 
-# If the HTML_TIMESTAMP tag is set to YES then the footer of each generated HTML
-# page will contain the date and time when the page was generated. Setting this
-# to NO can help when comparing the output of multiple runs.
+# If the HTML_DYNAMIC_MENUS tag is set to YES then the generated HTML
+# documentation will contain a main index with vertical navigation menus that
+# are dynamically created via JavaScript. If disabled, the navigation index will
+# consists of multiple levels of tabs that are statically embedded in every HTML
+# page. Disable this option to support browsers that do not have JavaScript,
+# like the Qt help browser.
 # The default value is: YES.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
-HTML_TIMESTAMP         = NO
+HTML_DYNAMIC_MENUS     = YES
 
 # If the HTML_DYNAMIC_SECTIONS tag is set to YES then the generated HTML
 # documentation will contain sections that can be hidden and shown after the
@@ -1158,6 +1529,33 @@ HTML_TIMESTAMP         = NO
 
 HTML_DYNAMIC_SECTIONS  = NO
 
+# If the HTML_CODE_FOLDING tag is set to YES then classes and functions can be
+# dynamically folded and expanded in the generated HTML source code.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_CODE_FOLDING      = YES
+
+# If the HTML_COPY_CLIPBOARD tag is set to YES then Doxygen will show an icon in
+# the top right corner of code and text fragments that allows the user to copy
+# its content to the clipboard. Note this only works if supported by the browser
+# and the web page is served via a secure context (see:
+# https://www.w3.org/TR/secure-contexts/), i.e. using the https: or file:
+# protocol.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COPY_CLIPBOARD    = YES
+
+# Doxygen stores a couple of settings persistently in the browser (via e.g.
+# cookies). By default these settings apply to all HTML pages generated by
+# Doxygen across all projects. The HTML_PROJECT_COOKIE tag can be used to store
+# the settings under a project specific key, such that the user preferences will
+# be stored separately.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_PROJECT_COOKIE    =
+
 # With HTML_INDEX_NUM_ENTRIES one can control the preferred number of entries
 # shown in the various tree structured indices initially; the user can expand
 # and collapse entries dynamically later on. Doxygen will expand the tree to
@@ -1173,13 +1571,14 @@ HTML_INDEX_NUM_ENTRIES = 100
 
 # If the GENERATE_DOCSET tag is set to YES, additional index files will be
 # generated that can be used as input for Apple's Xcode 3 integrated development
-# environment (see: http://developer.apple.com/tools/xcode/), introduced with
-# OSX 10.5 (Leopard). To create a documentation set, doxygen will generate a
-# Makefile in the HTML output directory. Running make will produce the docset in
-# that directory and running make install will install the docset in
+# environment (see:
+# https://developer.apple.com/xcode/), introduced with OSX 10.5 (Leopard). To
+# create a documentation set, Doxygen will generate a Makefile in the HTML
+# output directory. Running make will produce the docset in that directory and
+# running make install will install the docset in
 # ~/Library/Developer/Shared/Documentation/DocSets so that Xcode will find it at
-# startup. See http://developer.apple.com/tools/creatingdocsetswithdoxygen.html
-# for more information.
+# startup. See https://developer.apple.com/library/archive/featuredarticles/Doxy
+# genXcode/_index.html for more information.
 # The default value is: NO.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
@@ -1193,6 +1592,13 @@ GENERATE_DOCSET        = NO
 
 DOCSET_FEEDNAME        = "Doxygen generated docs"
 
+# This tag determines the URL of the docset feed. A documentation feed provides
+# an umbrella under which multiple documentation sets from a single provider
+# (such as a company or product suite) can be grouped.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_FEEDURL         =
+
 # This tag specifies a string that should uniquely identify the documentation
 # set bundle. This should be a reverse domain-name style string, e.g.
 # com.mycompany.MyDocSet. Doxygen will append .docset to the name.
@@ -1215,14 +1621,18 @@ DOCSET_PUBLISHER_ID    = org.doxygen.Publisher
 
 DOCSET_PUBLISHER_NAME  = Publisher
 
-# If the GENERATE_HTMLHELP tag is set to YES then doxygen generates three
+# If the GENERATE_HTMLHELP tag is set to YES then Doxygen generates three
 # additional HTML index files: index.hhp, index.hhc, and index.hhk. The
 # index.hhp is a project file that can be read by Microsoft's HTML Help Workshop
-# (see: http://www.microsoft.com/en-us/download/details.aspx?id=21138) on
-# Windows.
+# on Windows. In the beginning of 2021 Microsoft took the original page, with
+# a.o. the download links, offline (the HTML help workshop was already many
+# years in maintenance mode). You can download the HTML help workshop from the
+# web archives at Installation executable (see:
+# http://web.archive.org/web/20160201063255/http://download.microsoft.com/downlo
+# ad/0/A/9/0A939EF6-E31C-430F-A3DF-DFAE7960D564/htmlhelp.exe).
 #
 # The HTML Help Workshop contains a compiler that can convert all HTML output
-# generated by doxygen into a single compiled HTML file (.chm). Compiled HTML
+# generated by Doxygen into a single compiled HTML file (.chm). Compiled HTML
 # files are now used as the Windows 98 help format, and will replace the old
 # Windows help format (.hlp) on all Windows platforms in the future. Compressed
 # HTML files also contain an index, a table of contents, and you can search for
@@ -1241,28 +1651,29 @@ GENERATE_HTMLHELP      = NO
 CHM_FILE               =
 
 # The HHC_LOCATION tag can be used to specify the location (absolute path
-# including file name) of the HTML help compiler ( hhc.exe). If non-empty
-# doxygen will try to run the HTML help compiler on the generated index.hhp.
+# including file name) of the HTML help compiler (hhc.exe). If non-empty,
+# Doxygen will try to run the HTML help compiler on the generated index.hhp.
 # The file has to be specified with full path.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
 HHC_LOCATION           =
 
-# The GENERATE_CHI flag controls if a separate .chi index file is generated (
-# YES) or that it should be included in the master .chm file ( NO).
+# The GENERATE_CHI flag controls if a separate .chi index file is generated
+# (YES) or that it should be included in the main .chm file (NO).
 # The default value is: NO.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
 GENERATE_CHI           = NO
 
-# The CHM_INDEX_ENCODING is used to encode HtmlHelp index ( hhk), content ( hhc)
+# The CHM_INDEX_ENCODING is used to encode HtmlHelp index (hhk), content (hhc)
 # and project file content.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
 CHM_INDEX_ENCODING     =
 
-# The BINARY_TOC flag controls whether a binary table of contents is generated (
-# YES) or a normal table of contents ( NO) in the .chm file.
+# The BINARY_TOC flag controls whether a binary table of contents is generated
+# (YES) or a normal table of contents (NO) in the .chm file. Furthermore it
+# enables the Previous and Next buttons.
 # The default value is: NO.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
@@ -1275,6 +1686,16 @@ BINARY_TOC             = NO
 
 TOC_EXPAND             = YES
 
+# The SITEMAP_URL tag is used to specify the full URL of the place where the
+# generated documentation will be placed on the server by the user during the
+# deployment of the documentation. The generated sitemap is called sitemap.xml
+# and placed on the directory specified by HTML_OUTPUT. In case no SITEMAP_URL
+# is specified no sitemap is generated. For information about the sitemap
+# protocol see https://www.sitemaps.org
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+SITEMAP_URL            =
+
 # If the GENERATE_QHP tag is set to YES and both QHP_NAMESPACE and
 # QHP_VIRTUAL_FOLDER are set, an additional index file will be generated that
 # can be used as input for Qt's qhelpgenerator to generate a Qt Compressed Help
@@ -1293,7 +1714,8 @@ QCH_FILE               =
 
 # The QHP_NAMESPACE tag specifies the namespace to use when generating Qt Help
 # Project output. For more information please see Qt Help Project / Namespace
-# (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#namespace).
+# (see:
+# https://doc.qt.io/archives/qt-4.8/qthelpproject.html#namespace).
 # The default value is: org.doxygen.Project.
 # This tag requires that the tag GENERATE_QHP is set to YES.
 
@@ -1301,8 +1723,8 @@ QHP_NAMESPACE          = org.doxygen.Project
 
 # The QHP_VIRTUAL_FOLDER tag specifies the namespace to use when generating Qt
 # Help Project output. For more information please see Qt Help Project / Virtual
-# Folders (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#virtual-
-# folders).
+# Folders (see:
+# https://doc.qt.io/archives/qt-4.8/qthelpproject.html#virtual-folders).
 # The default value is: doc.
 # This tag requires that the tag GENERATE_QHP is set to YES.
 
@@ -1310,30 +1732,30 @@ QHP_VIRTUAL_FOLDER     = doc
 
 # If the QHP_CUST_FILTER_NAME tag is set, it specifies the name of a custom
 # filter to add. For more information please see Qt Help Project / Custom
-# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
-# filters).
+# Filters (see:
+# https://doc.qt.io/archives/qt-4.8/qthelpproject.html#custom-filters).
 # This tag requires that the tag GENERATE_QHP is set to YES.
 
 QHP_CUST_FILTER_NAME   =
 
 # The QHP_CUST_FILTER_ATTRS tag specifies the list of the attributes of the
 # custom filter to add. For more information please see Qt Help Project / Custom
-# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
-# filters).
+# Filters (see:
+# https://doc.qt.io/archives/qt-4.8/qthelpproject.html#custom-filters).
 # This tag requires that the tag GENERATE_QHP is set to YES.
 
 QHP_CUST_FILTER_ATTRS  =
 
 # The QHP_SECT_FILTER_ATTRS tag specifies the list of the attributes this
 # project's filter section matches. Qt Help Project / Filter Attributes (see:
-# http://qt-project.org/doc/qt-4.8/qthelpproject.html#filter-attributes).
+# https://doc.qt.io/archives/qt-4.8/qthelpproject.html#filter-attributes).
 # This tag requires that the tag GENERATE_QHP is set to YES.
 
 QHP_SECT_FILTER_ATTRS  =
 
-# The QHG_LOCATION tag can be used to specify the location of Qt's
-# qhelpgenerator. If non-empty doxygen will try to run qhelpgenerator on the
-# generated .qhp file.
+# The QHG_LOCATION tag can be used to specify the location (absolute path
+# including file name) of Qt's qhelpgenerator. If non-empty Doxygen will try to
+# run qhelpgenerator on the generated .qhp file.
 # This tag requires that the tag GENERATE_QHP is set to YES.
 
 QHG_LOCATION           =
@@ -1375,19 +1797,40 @@ DISABLE_INDEX          = NO
 # index structure (just like the one that is generated for HTML Help). For this
 # to work a browser that supports JavaScript, DHTML, CSS and frames is required
 # (i.e. any modern browser). Windows users are probably better off using the
-# HTML help feature. Via custom stylesheets (see HTML_EXTRA_STYLESHEET) one can
-# further fine-tune the look of the index. As an example, the default style
-# sheet generated by doxygen has an example that shows how to put an image at
-# the root of the tree instead of the PROJECT_NAME. Since the tree basically has
-# the same information as the tab index, you could consider setting
-# DISABLE_INDEX to YES when enabling this option.
-# The default value is: NO.
+# HTML help feature. Via custom style sheets (see HTML_EXTRA_STYLESHEET) one can
+# further fine tune the look of the index (see "Fine-tuning the output"). As an
+# example, the default style sheet generated by Doxygen has an example that
+# shows how to put an image at the root of the tree instead of the PROJECT_NAME.
+# Since the tree basically has more details information than the tab index, you
+# could consider setting DISABLE_INDEX to YES when enabling this option.
+# The default value is: YES.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
 GENERATE_TREEVIEW      = YES
 
+# When GENERATE_TREEVIEW is set to YES, the PAGE_OUTLINE_PANEL option determines
+# if an additional navigation panel is shown at the right hand side of the
+# screen, displaying an outline of the contents of the main page, similar to
+# e.g. https://developer.android.com/reference If GENERATE_TREEVIEW is set to
+# NO, this option has no effect.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+PAGE_OUTLINE_PANEL     = YES
+
+# When GENERATE_TREEVIEW is set to YES, the FULL_SIDEBAR option determines if
+# the side bar is limited to only the treeview area (value NO) or if it should
+# extend to the full height of the window (value YES). Setting this to YES gives
+# a layout similar to e.g. https://docs.readthedocs.io with more room for
+# contents, but less room for the project logo, title, and description. If
+# GENERATE_TREEVIEW is set to NO, this option has no effect.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FULL_SIDEBAR           = NO
+
 # The ENUM_VALUES_PER_LINE tag can be used to set the number of enum values that
-# doxygen will group on one line in the generated HTML documentation.
+# Doxygen will group on one line in the generated HTML documentation.
 #
 # Note that a value of 0 will completely suppress the enum values from appearing
 # in the overview section.
@@ -1396,6 +1839,12 @@ GENERATE_TREEVIEW      = YES
 
 ENUM_VALUES_PER_LINE   = 4
 
+# When the SHOW_ENUM_VALUES tag is set doxygen will show the specified
+# enumeration values besides the enumeration mnemonics.
+# The default value is: NO.
+
+SHOW_ENUM_VALUES       = NO
+
 # If the treeview is enabled (see GENERATE_TREEVIEW) then this tag can be used
 # to set the initial width (in pixels) of the frame in which the tree is shown.
 # Minimum value: 0, maximum value: 1500, default value: 250.
@@ -1403,36 +1852,49 @@ ENUM_VALUES_PER_LINE   = 4
 
 TREEVIEW_WIDTH         = 250
 
-# When the EXT_LINKS_IN_WINDOW option is set to YES doxygen will open links to
+# If the EXT_LINKS_IN_WINDOW option is set to YES, Doxygen will open links to
 # external symbols imported via tag files in a separate window.
 # The default value is: NO.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
 EXT_LINKS_IN_WINDOW    = NO
 
+# If the OBFUSCATE_EMAILS tag is set to YES, Doxygen will obfuscate email
+# addresses.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+OBFUSCATE_EMAILS       = YES
+
+# If the HTML_FORMULA_FORMAT option is set to svg, Doxygen will use the pdf2svg
+# tool (see https://github.com/dawbarton/pdf2svg) or inkscape (see
+# https://inkscape.org) to generate formulas as SVG images instead of PNGs for
+# the HTML output. These images will generally look nicer at scaled resolutions.
+# Possible values are: png (the default) and svg (looks nicer but requires the
+# pdf2svg or inkscape tool).
+# The default value is: png.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FORMULA_FORMAT    = png
+
 # Use this tag to change the font size of LaTeX formulas included as images in
 # the HTML documentation. When you change the font size after a successful
-# doxygen run you need to manually remove any form_*.png images from the HTML
+# Doxygen run you need to manually remove any form_*.png images from the HTML
 # output directory to force them to be regenerated.
 # Minimum value: 8, maximum value: 50, default value: 10.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
 FORMULA_FONTSIZE       = 10
 
-# Use the FORMULA_TRANPARENT tag to determine whether or not the images
-# generated for formulas are transparent PNGs. Transparent PNGs are not
-# supported properly for IE 6.0, but are supported on all modern browsers.
-#
-# Note that when changing this option you need to delete any form_*.png files in
-# the HTML output directory before the changes have effect.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_HTML is set to YES.
+# The FORMULA_MACROFILE can contain LaTeX \newcommand and \renewcommand commands
+# to create new LaTeX commands to be used in formulas as building blocks. See
+# the section "Including formulas" for details.
 
-FORMULA_TRANSPARENT    = YES
+FORMULA_MACROFILE      =
 
 # Enable the USE_MATHJAX option to render LaTeX formulas using MathJax (see
-# http://www.mathjax.org) which uses client side Javascript for the rendering
-# instead of using prerendered bitmaps. Use this if you do not have LaTeX
+# https://www.mathjax.org) which uses client side JavaScript for the rendering
+# instead of using pre-rendered bitmaps. Use this if you do not have LaTeX
 # installed or if you want to formulas look prettier in the HTML output. When
 # enabled you may also need to install MathJax separately and configure the path
 # to it using the MATHJAX_RELPATH option.
@@ -1441,50 +1903,90 @@ FORMULA_TRANSPARENT    = YES
 
 USE_MATHJAX            = NO
 
+# With MATHJAX_VERSION it is possible to specify the MathJax version to be used.
+# Note that the different versions of MathJax have different requirements with
+# regards to the different settings, so it is possible that also other MathJax
+# settings have to be changed when switching between the different MathJax
+# versions.
+# Possible values are: MathJax_2, MathJax_3 and MathJax_4.
+# The default value is: MathJax_2.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_VERSION        = MathJax_2
+
 # When MathJax is enabled you can set the default output format to be used for
-# the MathJax output. See the MathJax site (see:
-# http://docs.mathjax.org/en/latest/output.html) for more details.
+# the MathJax output. For more details about the output format see MathJax
+# version 2 (see:
+# https://docs.mathjax.org/en/v2.7/output.html), MathJax version 3 (see:
+# https://docs.mathjax.org/en/v3.2/output/index.html) and MathJax version 4
+# (see:
+# https://docs.mathjax.org/en/v4.0/output/index.htm).
 # Possible values are: HTML-CSS (which is slower, but has the best
-# compatibility), NativeMML (i.e. MathML) and SVG.
+# compatibility. This is the name for Mathjax version 2, for MathJax version 3
+# this will be translated into chtml), NativeMML (i.e. MathML. Only supported
+# for MathJax 2. For MathJax version 3 chtml will be used instead.), chtml (This
+# is the name for Mathjax version 3, for MathJax version 2 this will be
+# translated into HTML-CSS) and SVG.
 # The default value is: HTML-CSS.
 # This tag requires that the tag USE_MATHJAX is set to YES.
 
 MATHJAX_FORMAT         = HTML-CSS
 
 # When MathJax is enabled you need to specify the location relative to the HTML
-# output directory using the MATHJAX_RELPATH option. The destination directory
-# should contain the MathJax.js script. For instance, if the mathjax directory
-# is located at the same level as the HTML output directory, then
-# MATHJAX_RELPATH should be ../mathjax. The default value points to the MathJax
-# Content Delivery Network so you can quickly see the result without installing
-# MathJax. However, it is strongly recommended to install a local copy of
-# MathJax from http://www.mathjax.org before deployment.
-# The default value is: http://cdn.mathjax.org/mathjax/latest.
+# output directory using the MATHJAX_RELPATH option. For Mathjax version 2 the
+# destination directory should contain the MathJax.js script. For instance, if
+# the mathjax directory is located at the same level as the HTML output
+# directory, then MATHJAX_RELPATH should be ../mathjax.s For Mathjax versions 3
+# and 4 the destination directory should contain the tex-<format>.js script
+# (where <format> is either chtml or svg). The default value points to the
+# MathJax Content Delivery Network so you can quickly see the result without
+# installing MathJax. However, it is strongly recommended to install a local
+# copy of MathJax from https://www.mathjax.org before deployment. The default
+# value is:
+# - in case of MathJax version 2: https://cdn.jsdelivr.net/npm/mathjax@2
+# - in case of MathJax version 3: https://cdn.jsdelivr.net/npm/mathjax@3
+# - in case of MathJax version 4: https://cdn.jsdelivr.net/npm/mathjax@4
 # This tag requires that the tag USE_MATHJAX is set to YES.
 
 MATHJAX_RELPATH        = http://cdn.mathjax.org/mathjax/latest
 
 # The MATHJAX_EXTENSIONS tag can be used to specify one or more MathJax
 # extension names that should be enabled during MathJax rendering. For example
+# for MathJax version 2 (see https://docs.mathjax.org/en/v2.7/tex.html):
 # MATHJAX_EXTENSIONS = TeX/AMSmath TeX/AMSsymbols
+# For example for MathJax version 3 (see
+# https://docs.mathjax.org/en/v3.2/input/tex/extensions/):
+# MATHJAX_EXTENSIONS = ams
+# For example for MathJax version 4 (see
+# https://docs.mathjax.org/en/v4.0/input/tex/extensions/):
+# MATHJAX_EXTENSIONS = units
+# Note that for Mathjax version 4 quite a few extensions are already
+# automatically loaded. To disable a package in Mathjax version 4 one can use
+# the package name prepended with a minus sign (- like MATHJAX_EXTENSIONS +=
+# -textmacros)
 # This tag requires that the tag USE_MATHJAX is set to YES.
 
 MATHJAX_EXTENSIONS     =
 
-# The MATHJAX_CODEFILE tag can be used to specify a file with javascript pieces
-# of code that will be used on startup of the MathJax code. See the MathJax site
-# (see: http://docs.mathjax.org/en/latest/output.html) for more details. For an
-# example see the documentation.
+# The MATHJAX_CODEFILE tag can be used to specify a file with JavaScript pieces
+# of code that will be used on startup of the MathJax code. See the Mathjax site
+# for more details:
+# - MathJax version 2 (see:
+# https://docs.mathjax.org/en/v2.7/)
+# - MathJax version 3 (see:
+# https://docs.mathjax.org/en/v3.2/)
+# - MathJax version 4 (see:
+# https://docs.mathjax.org/en/v4.0/) For an example see the documentation.
 # This tag requires that the tag USE_MATHJAX is set to YES.
 
 MATHJAX_CODEFILE       =
 
-# When the SEARCHENGINE tag is enabled doxygen will generate a search box for
-# the HTML output. The underlying search engine uses javascript and DHTML and
+# When the SEARCHENGINE tag is enabled Doxygen will generate a search box for
+# the HTML output. The underlying search engine uses JavaScript and DHTML and
 # should work on any modern browser. Note that when using HTML help
 # (GENERATE_HTMLHELP), Qt help (GENERATE_QHP), or docsets (GENERATE_DOCSET)
 # there is already a search function so this one should typically be disabled.
-# For large projects the javascript based search engine can be slow, then
+# For large projects the JavaScript based search engine can be slow, then
 # enabling SERVER_BASED_SEARCH may provide a better solution. It is possible to
 # search using the keyboard; to jump to the search box use <access key> + S
 # (what the <access key> is depends on the OS and browser, but it is typically
@@ -1501,26 +2003,27 @@ MATHJAX_CODEFILE       =
 SEARCHENGINE           = NO
 
 # When the SERVER_BASED_SEARCH tag is enabled the search engine will be
-# implemented using a web server instead of a web client using Javascript. There
-# are two flavours of web server based searching depending on the
-# EXTERNAL_SEARCH setting. When disabled, doxygen will generate a PHP script for
-# searching and an index file used by the script. When EXTERNAL_SEARCH is
-# enabled the indexing and searching needs to be provided by external tools. See
-# the section "External Indexing and Searching" for details.
+# implemented using a web server instead of a web client using JavaScript. There
+# are two flavors of web server based searching depending on the EXTERNAL_SEARCH
+# setting. When disabled, Doxygen will generate a PHP script for searching and
+# an index file used by the script. When EXTERNAL_SEARCH is enabled the indexing
+# and searching needs to be provided by external tools. See the section
+# "External Indexing and Searching" for details.
 # The default value is: NO.
 # This tag requires that the tag SEARCHENGINE is set to YES.
 
 SERVER_BASED_SEARCH    = NO
 
-# When EXTERNAL_SEARCH tag is enabled doxygen will no longer generate the PHP
+# When EXTERNAL_SEARCH tag is enabled Doxygen will no longer generate the PHP
 # script for searching. Instead the search results are written to an XML file
 # which needs to be processed by an external indexer. Doxygen will invoke an
 # external search engine pointed to by the SEARCHENGINE_URL option to obtain the
 # search results.
 #
-# Doxygen ships with an example indexer ( doxyindexer) and search engine
+# Doxygen ships with an example indexer (doxyindexer) and search engine
 # (doxysearch.cgi) which are based on the open source search engine library
-# Xapian (see: http://xapian.org/).
+# Xapian (see:
+# https://xapian.org/).
 #
 # See the section "External Indexing and Searching" for details.
 # The default value is: NO.
@@ -1531,10 +2034,11 @@ EXTERNAL_SEARCH        = NO
 # The SEARCHENGINE_URL should point to a search engine hosted by a web server
 # which will return the search results when EXTERNAL_SEARCH is enabled.
 #
-# Doxygen ships with an example indexer ( doxyindexer) and search engine
+# Doxygen ships with an example indexer (doxyindexer) and search engine
 # (doxysearch.cgi) which are based on the open source search engine library
-# Xapian (see: http://xapian.org/). See the section "External Indexing and
-# Searching" for details.
+# Xapian (see:
+# https://xapian.org/). See the section "External Indexing and Searching" for
+# details.
 # This tag requires that the tag SEARCHENGINE is set to YES.
 
 SEARCHENGINE_URL       =
@@ -1555,7 +2059,7 @@ SEARCHDATA_FILE        = searchdata.xml
 
 EXTERNAL_SEARCH_ID     =
 
-# The EXTRA_SEARCH_MAPPINGS tag can be used to enable searching through doxygen
+# The EXTRA_SEARCH_MAPPINGS tag can be used to enable searching through Doxygen
 # projects other than the one defined by this configuration file, but that are
 # all added to the same external search index. Each project needs to have a
 # unique id set via EXTERNAL_SEARCH_ID. The search mapping then maps the id of
@@ -1569,7 +2073,7 @@ EXTRA_SEARCH_MAPPINGS  =
 # Configuration options related to the LaTeX output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_LATEX tag is set to YES doxygen will generate LaTeX output.
+# If the GENERATE_LATEX tag is set to YES, Doxygen will generate LaTeX output.
 # The default value is: YES.
 
 GENERATE_LATEX         = NO
@@ -1585,22 +2089,36 @@ LATEX_OUTPUT           = latex
 # The LATEX_CMD_NAME tag can be used to specify the LaTeX command name to be
 # invoked.
 #
-# Note that when enabling USE_PDFLATEX this option is only used for generating
-# bitmaps for formulas in the HTML output, but not in the Makefile that is
-# written to the output directory.
-# The default file is: latex.
+# Note that when not enabling USE_PDFLATEX the default is latex when enabling
+# USE_PDFLATEX the default is pdflatex and when in the later case latex is
+# chosen this is overwritten by pdflatex. For specific output languages the
+# default can have been set differently, this depends on the implementation of
+# the output language.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 LATEX_CMD_NAME         =
 
 # The MAKEINDEX_CMD_NAME tag can be used to specify the command name to generate
 # index for LaTeX.
+# Note: This tag is used in the Makefile / make.bat.
+# See also: LATEX_MAKEINDEX_CMD for the part in the generated output file
+# (.tex).
 # The default file is: makeindex.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 MAKEINDEX_CMD_NAME     =
 
-# If the COMPACT_LATEX tag is set to YES doxygen generates more compact LaTeX
+# The LATEX_MAKEINDEX_CMD tag can be used to specify the command name to
+# generate index for LaTeX. In case there is no backslash (\) as first character
+# it will be automatically added in the LaTeX code.
+# Note: This tag is used in the generated output file (.tex).
+# See also: MAKEINDEX_CMD_NAME for the part in the Makefile / make.bat.
+# The default value is: makeindex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_MAKEINDEX_CMD    = makeindex
+
+# If the COMPACT_LATEX tag is set to YES, Doxygen generates more compact LaTeX
 # documents. This may be useful for small projects and may help to save some
 # trees in general.
 # The default value is: NO.
@@ -1618,39 +2136,57 @@ COMPACT_LATEX          = YES
 PAPER_TYPE             = a4
 
 # The EXTRA_PACKAGES tag can be used to specify one or more LaTeX package names
-# that should be included in the LaTeX output. To get the times font for
-# instance you can specify
-# EXTRA_PACKAGES=times
+# that should be included in the LaTeX output. The package can be specified just
+# by its name or with the correct syntax as to be used with the LaTeX
+# \usepackage command. To get the times font for instance you can specify :
+# EXTRA_PACKAGES=times or EXTRA_PACKAGES={times}
+# To use the option intlimits with the amsmath package you can specify:
+# EXTRA_PACKAGES=[intlimits]{amsmath}
 # If left blank no extra packages will be included.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 EXTRA_PACKAGES         =
 
-# The LATEX_HEADER tag can be used to specify a personal LaTeX header for the
-# generated LaTeX document. The header should contain everything until the first
-# chapter. If it is left blank doxygen will generate a standard header. See
-# section "Doxygen usage" for information on how to let doxygen write the
-# default header to a separate file.
+# The LATEX_HEADER tag can be used to specify a user-defined LaTeX header for
+# the generated LaTeX document. The header should contain everything until the
+# first chapter. If it is left blank Doxygen will generate a standard header. It
+# is highly recommended to start with a default header using
+# doxygen -w latex new_header.tex new_footer.tex new_stylesheet.sty
+# and then modify the file new_header.tex. See also section "Doxygen usage" for
+# information on how to generate the default header that Doxygen normally uses.
 #
-# Note: Only use a user-defined header if you know what you are doing! The
-# following commands have a special meaning inside the header: $title,
-# $datetime, $date, $doxygenversion, $projectname, $projectnumber. Doxygen will
-# replace them by respectively the title of the page, the current date and time,
-# only the current date, the version number of doxygen, the project name (see
-# PROJECT_NAME), or the project number (see PROJECT_NUMBER).
+# Note: Only use a user-defined header if you know what you are doing!
+# Note: The header is subject to change so you typically have to regenerate the
+# default header when upgrading to a newer version of Doxygen. The following
+# commands have a special meaning inside the header (and footer): For a
+# description of the possible markers and block names see the documentation.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 LATEX_HEADER           =
 
-# The LATEX_FOOTER tag can be used to specify a personal LaTeX footer for the
-# generated LaTeX document. The footer should contain everything after the last
-# chapter. If it is left blank doxygen will generate a standard footer.
-#
-# Note: Only use a user-defined footer if you know what you are doing!
+# The LATEX_FOOTER tag can be used to specify a user-defined LaTeX footer for
+# the generated LaTeX document. The footer should contain everything after the
+# last chapter. If it is left blank Doxygen will generate a standard footer. See
+# LATEX_HEADER for more information on how to generate a default footer and what
+# special commands can be used inside the footer. See also section "Doxygen
+# usage" for information on how to generate the default footer that Doxygen
+# normally uses. Note: Only use a user-defined footer if you know what you are
+# doing!
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 LATEX_FOOTER           =
 
+# The LATEX_EXTRA_STYLESHEET tag can be used to specify additional user-defined
+# LaTeX style sheets that are included after the standard style sheets created
+# by Doxygen. Using this option one can overrule certain style aspects. Doxygen
+# will copy the style sheet files to the output directory.
+# Note: The order of the extra style sheet files is of importance (e.g. the last
+# style sheet in the list overrules the setting of the previous ones in the
+# list).
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_EXTRA_STYLESHEET =
+
 # The LATEX_EXTRA_FILES tag can be used to specify one or more extra images or
 # other source files which should be copied to the LATEX_OUTPUT output
 # directory. Note that the files will be copied as-is; there are no commands or
@@ -1668,24 +2204,32 @@ LATEX_EXTRA_FILES      =
 
 PDF_HYPERLINKS         = YES
 
-# If the LATEX_PDFLATEX tag is set to YES, doxygen will use pdflatex to generate
-# the PDF file directly from the LaTeX files. Set this option to YES to get a
-# higher quality PDF documentation.
+# If the USE_PDFLATEX tag is set to YES, Doxygen will use the engine as
+# specified with LATEX_CMD_NAME to generate the PDF file directly from the LaTeX
+# files. Set this option to YES, to get a higher quality PDF documentation.
+#
+# See also section LATEX_CMD_NAME for selecting the engine.
 # The default value is: YES.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 USE_PDFLATEX           = YES
 
-# If the LATEX_BATCHMODE tag is set to YES, doxygen will add the \batchmode
-# command to the generated LaTeX files. This will instruct LaTeX to keep running
-# if errors occur, instead of asking the user for help. This option is also used
-# when generating formulas in HTML.
+# The LATEX_BATCHMODE tag signals the behavior of LaTeX in case of an error.
+# Possible values are: NO same as ERROR_STOP, YES same as BATCH, BATCH In batch
+# mode nothing is printed on the terminal, errors are scrolled as if <return> is
+# hit at every error; missing files that TeX tries to input or request from
+# keyboard input (\read on a not open input stream) cause the job to abort,
+# NON_STOP In nonstop mode the diagnostic message will appear on the terminal,
+# but there is no possibility of user interaction just like in batch mode,
+# SCROLL In scroll mode, TeX will stop only for missing files to input or if
+# keyboard input is necessary and ERROR_STOP In errorstop mode, TeX will stop at
+# each error, asking for user intervention.
 # The default value is: NO.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 LATEX_BATCHMODE        = YES
 
-# If the LATEX_HIDE_INDICES tag is set to YES then doxygen will not include the
+# If the LATEX_HIDE_INDICES tag is set to YES then Doxygen will not include the
 # index chapters (such as File Index, Compound Index, etc.) in the output.
 # The default value is: NO.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
@@ -1694,17 +2238,25 @@ LATEX_HIDE_INDICES     = NO
 
 # The LATEX_BIB_STYLE tag can be used to specify the style to use for the
 # bibliography, e.g. plainnat, or ieeetr. See
-# http://en.wikipedia.org/wiki/BibTeX and \cite for more info.
-# The default value is: plain.
+# https://en.wikipedia.org/wiki/BibTeX and \cite for more info.
+# The default value is: plainnat.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
 LATEX_BIB_STYLE        = plain
 
+# The LATEX_EMOJI_DIRECTORY tag is used to specify the (relative or absolute)
+# path from which the emoji images will be read. If a relative path is entered,
+# it will be relative to the LATEX_OUTPUT directory. If left blank the
+# LATEX_OUTPUT directory will be used.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_EMOJI_DIRECTORY  =
+
 #---------------------------------------------------------------------------
 # Configuration options related to the RTF output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_RTF tag is set to YES doxygen will generate RTF output. The
+# If the GENERATE_RTF tag is set to YES, Doxygen will generate RTF output. The
 # RTF output is optimized for Word 97 and may not look too pretty with other RTF
 # readers/editors.
 # The default value is: NO.
@@ -1719,7 +2271,7 @@ GENERATE_RTF           = NO
 
 RTF_OUTPUT             = rtf
 
-# If the COMPACT_RTF tag is set to YES doxygen generates more compact RTF
+# If the COMPACT_RTF tag is set to YES, Doxygen generates more compact RTF
 # documents. This may be useful for small projects and may help to save some
 # trees in general.
 # The default value is: NO.
@@ -1739,28 +2291,36 @@ COMPACT_RTF            = YES
 
 RTF_HYPERLINKS         = NO
 
-# Load stylesheet definitions from file. Syntax is similar to doxygen's config
-# file, i.e. a series of assignments. You only have to provide replacements,
-# missing definitions are set to their default value.
+# Load stylesheet definitions from file. Syntax is similar to Doxygen's
+# configuration file, i.e. a series of assignments. You only have to provide
+# replacements, missing definitions are set to their default value.
 #
 # See also section "Doxygen usage" for information on how to generate the
-# default style sheet that doxygen normally uses.
+# default style sheet that Doxygen normally uses.
 # This tag requires that the tag GENERATE_RTF is set to YES.
 
 RTF_STYLESHEET_FILE    =
 
 # Set optional variables used in the generation of an RTF document. Syntax is
-# similar to doxygen's config file. A template extensions file can be generated
-# using doxygen -e rtf extensionFile.
+# similar to Doxygen's configuration file. A template extensions file can be
+# generated using doxygen -e rtf extensionFile.
 # This tag requires that the tag GENERATE_RTF is set to YES.
 
 RTF_EXTENSIONS_FILE    =
 
+# The RTF_EXTRA_FILES tag can be used to specify one or more extra images or
+# other source files which should be copied to the RTF_OUTPUT output directory.
+# Note that the files will be copied as-is; there are no commands or markers
+# available.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_EXTRA_FILES        =
+
 #---------------------------------------------------------------------------
 # Configuration options related to the man page output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_MAN tag is set to YES doxygen will generate man pages for
+# If the GENERATE_MAN tag is set to YES, Doxygen will generate man pages for
 # classes and files.
 # The default value is: NO.
 
@@ -1784,7 +2344,14 @@ MAN_OUTPUT             = man
 
 MAN_EXTENSION          = .3
 
-# If the MAN_LINKS tag is set to YES and doxygen generates man output, then it
+# The MAN_SUBDIR tag determines the name of the directory created within
+# MAN_OUTPUT in which the man pages are placed. If defaults to man followed by
+# MAN_EXTENSION with the initial . removed.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_SUBDIR             =
+
+# If the MAN_LINKS tag is set to YES and Doxygen generates man output, then it
 # will generate one additional man file for each entity documented in the real
 # man page(s). These additional files only source the real man page, but without
 # them the man command would be unable to find the correct page.
@@ -1797,7 +2364,7 @@ MAN_LINKS              = NO
 # Configuration options related to the XML output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_XML tag is set to YES doxygen will generate an XML file that
+# If the GENERATE_XML tag is set to YES, Doxygen will generate an XML file that
 # captures the structure of the code including all documentation.
 # The default value is: NO.
 
@@ -1811,7 +2378,7 @@ GENERATE_XML           = NO
 
 XML_OUTPUT             = xml
 
-# If the XML_PROGRAMLISTING tag is set to YES doxygen will dump the program
+# If the XML_PROGRAMLISTING tag is set to YES, Doxygen will dump the program
 # listings (including syntax highlighting and cross-referencing information) to
 # the XML output. Note that enabling this will significantly increase the size
 # of the XML output.
@@ -1820,11 +2387,18 @@ XML_OUTPUT             = xml
 
 XML_PROGRAMLISTING     = YES
 
+# If the XML_NS_MEMB_FILE_SCOPE tag is set to YES, Doxygen will include
+# namespace members in file scope as well, matching the HTML output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_NS_MEMB_FILE_SCOPE = NO
+
 #---------------------------------------------------------------------------
 # Configuration options related to the DOCBOOK output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_DOCBOOK tag is set to YES doxygen will generate Docbook files
+# If the GENERATE_DOCBOOK tag is set to YES, Doxygen will generate Docbook files
 # that can be used to generate PDF.
 # The default value is: NO.
 
@@ -1842,19 +2416,45 @@ DOCBOOK_OUTPUT         = docbook
 # Configuration options for the AutoGen Definitions output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_AUTOGEN_DEF tag is set to YES doxygen will generate an AutoGen
-# Definitions (see http://autogen.sf.net) file that captures the structure of
-# the code including all documentation. Note that this feature is still
-# experimental and incomplete at the moment.
+# If the GENERATE_AUTOGEN_DEF tag is set to YES, Doxygen will generate an
+# AutoGen Definitions (see https://autogen.sourceforge.net/) file that captures
+# the structure of the code including all documentation. Note that this feature
+# is still experimental and incomplete at the moment.
 # The default value is: NO.
 
 GENERATE_AUTOGEN_DEF   = NO
 
+#---------------------------------------------------------------------------
+# Configuration options related to Sqlite3 output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_SQLITE3 tag is set to YES Doxygen will generate a Sqlite3
+# database with symbols found by Doxygen stored in tables.
+# The default value is: NO.
+
+GENERATE_SQLITE3       = NO
+
+# The SQLITE3_OUTPUT tag is used to specify where the Sqlite3 database will be
+# put. If a relative path is entered the value of OUTPUT_DIRECTORY will be put
+# in front of it.
+# The default directory is: sqlite3.
+# This tag requires that the tag GENERATE_SQLITE3 is set to YES.
+
+SQLITE3_OUTPUT         = sqlite3
+
+# The SQLITE3_RECREATE_DB tag is set to YES, the existing doxygen_sqlite3.db
+# database file will be recreated with each Doxygen run. If set to NO, Doxygen
+# will warn if a database file is already found and not modify it.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_SQLITE3 is set to YES.
+
+SQLITE3_RECREATE_DB    = YES
+
 #---------------------------------------------------------------------------
 # Configuration options related to the Perl module output
 #---------------------------------------------------------------------------
 
-# If the GENERATE_PERLMOD tag is set to YES doxygen will generate a Perl module
+# If the GENERATE_PERLMOD tag is set to YES, Doxygen will generate a Perl module
 # file that captures the structure of the code including all documentation.
 #
 # Note that this feature is still experimental and incomplete at the moment.
@@ -1862,7 +2462,7 @@ GENERATE_AUTOGEN_DEF   = NO
 
 GENERATE_PERLMOD       = NO
 
-# If the PERLMOD_LATEX tag is set to YES doxygen will generate the necessary
+# If the PERLMOD_LATEX tag is set to YES, Doxygen will generate the necessary
 # Makefile rules, Perl scripts and LaTeX code to be able to generate PDF and DVI
 # output from the Perl module output.
 # The default value is: NO.
@@ -1870,9 +2470,9 @@ GENERATE_PERLMOD       = NO
 
 PERLMOD_LATEX          = NO
 
-# If the PERLMOD_PRETTY tag is set to YES the Perl module output will be nicely
+# If the PERLMOD_PRETTY tag is set to YES, the Perl module output will be nicely
 # formatted so it can be parsed by a human reader. This is useful if you want to
-# understand what is going on. On the other hand, if this tag is set to NO the
+# understand what is going on. On the other hand, if this tag is set to NO, the
 # size of the Perl module output will be much smaller and Perl will parse it
 # just the same.
 # The default value is: YES.
@@ -1892,14 +2492,14 @@ PERLMOD_MAKEVAR_PREFIX =
 # Configuration options related to the preprocessor
 #---------------------------------------------------------------------------
 
-# If the ENABLE_PREPROCESSING tag is set to YES doxygen will evaluate all
+# If the ENABLE_PREPROCESSING tag is set to YES, Doxygen will evaluate all
 # C-preprocessor directives found in the sources and include files.
 # The default value is: YES.
 
 ENABLE_PREPROCESSING   = YES
 
-# If the MACRO_EXPANSION tag is set to YES doxygen will expand all macro names
-# in the source code. If set to NO only conditional compilation will be
+# If the MACRO_EXPANSION tag is set to YES, Doxygen will expand all macro names
+# in the source code. If set to NO, only conditional compilation will be
 # performed. Macro expansion can be done in a controlled way by setting
 # EXPAND_ONLY_PREDEF to YES.
 # The default value is: NO.
@@ -1915,7 +2515,7 @@ MACRO_EXPANSION        = YES
 
 EXPAND_ONLY_PREDEF     = YES
 
-# If the SEARCH_INCLUDES tag is set to YES the includes files in the
+# If the SEARCH_INCLUDES tag is set to YES, the include files in the
 # INCLUDE_PATH will be searched if a #include is found.
 # The default value is: YES.
 # This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
@@ -1924,7 +2524,8 @@ SEARCH_INCLUDES        = YES
 
 # The INCLUDE_PATH tag can be used to specify one or more directories that
 # contain include files that are not input files but should be processed by the
-# preprocessor.
+# preprocessor. Note that the INCLUDE_PATH is not recursive, so the setting of
+# RECURSIVE has no effect here.
 # This tag requires that the tag SEARCH_INCLUDES is set to YES.
 
 INCLUDE_PATH           = .
@@ -1946,8 +2547,8 @@ INCLUDE_FILE_PATTERNS  =
 # This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
 
 PREDEFINED             = _DOXYGEN \
-			 __attribute__(x)= \
-			 __cdecl=
+                         __attribute__(x)= \
+                         __cdecl=
 
 # If the MACRO_EXPANSION and EXPAND_ONLY_PREDEF tags are set to YES then this
 # tag can be used to specify a list of macro names that should be expanded. The
@@ -1960,10 +2561,10 @@ EXPAND_AS_DEFINED      = EASY_TYPE \
                          EASY_DESTRUCTOR \
                          EASY_METHOD
 
-# If the SKIP_FUNCTION_MACROS tag is set to YES then doxygen's preprocessor will
-# remove all refrences to function-like macros that are alone on a line, have an
-# all uppercase name, and do not end with a semicolon. Such function macros are
-# typically used for boiler-plate code, and will confuse the parser if not
+# If the SKIP_FUNCTION_MACROS tag is set to YES then Doxygen's preprocessor will
+# remove all references to function-like macros that are alone on a line, have
+# an all uppercase name, and do not end with a semicolon. Such function macros
+# are typically used for boiler-plate code, and will confuse the parser if not
 # removed.
 # The default value is: YES.
 # This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
@@ -1983,32 +2584,33 @@ SKIP_FUNCTION_MACROS   = YES
 # where loc1 and loc2 can be relative or absolute paths or URLs. See the
 # section "Linking to external documentation" for more information about the use
 # of tag files.
-# Note: Each tag file must have an unique name (where the name does NOT include
-# the path). If a tag file is not located in the directory in which doxygen is
+# Note: Each tag file must have a unique name (where the name does NOT include
+# the path). If a tag file is not located in the directory in which Doxygen is
 # run, you must also specify the path to the tagfile here.
 
 TAGFILES               =
 
-# When a file name is specified after GENERATE_TAGFILE, doxygen will create a
+# When a file name is specified after GENERATE_TAGFILE, Doxygen will create a
 # tag file that is based on the input files it reads. See section "Linking to
 # external documentation" for more information about the usage of tag files.
 
 GENERATE_TAGFILE       = @DOCDIR@/@PROJECT@.tag
 
-# If the ALLEXTERNALS tag is set to YES all external class will be listed in the
-# class index. If set to NO only the inherited external classes will be listed.
+# If the ALLEXTERNALS tag is set to YES, all external classes and namespaces
+# will be listed in the class and namespace index. If set to NO, only the
+# inherited external classes will be listed.
 # The default value is: NO.
 
 ALLEXTERNALS           = NO
 
-# If the EXTERNAL_GROUPS tag is set to YES all external groups will be listed in
-# the modules index. If set to NO, only the current project's groups will be
+# If the EXTERNAL_GROUPS tag is set to YES, all external groups will be listed
+# in the topic index. If set to NO, only the current project's groups will be
 # listed.
 # The default value is: YES.
 
 EXTERNAL_GROUPS        = YES
 
-# If the EXTERNAL_PAGES tag is set to YES all external pages will be listed in
+# If the EXTERNAL_PAGES tag is set to YES, all external pages will be listed in
 # the related pages index. If set to NO, only the current project's pages will
 # be listed.
 # The default value is: YES.
@@ -2016,90 +2618,111 @@ EXTERNAL_GROUPS        = YES
 EXTERNAL_PAGES         = YES
 
 #---------------------------------------------------------------------------
-# Configuration options related to the dot tool
+# Configuration options related to diagram generator tools
 #---------------------------------------------------------------------------
 
-# You can include diagrams made with dia in doxygen documentation. Doxygen will
-# then run dia to produce the diagram and insert it in the documentation. The
-# DIA_PATH tag allows you to specify the directory where the dia binary resides.
-# If left empty dia is assumed to be found in the default search path.
-
-DIA_PATH               =
-
-# If set to YES, the inheritance and collaboration graphs will hide inheritance
+# If set to YES the inheritance and collaboration graphs will hide inheritance
 # and usage relations if the target is undocumented or is not a class.
 # The default value is: YES.
 
 HIDE_UNDOC_RELATIONS   = YES
 
-# If you set the HAVE_DOT tag to YES then doxygen will assume the dot tool is
+# If you set the HAVE_DOT tag to YES then Doxygen will assume the dot tool is
 # available from the path. This tool is part of Graphviz (see:
-# http://www.graphviz.org/), a graph visualization toolkit from AT&T and Lucent
+# https://www.graphviz.org/), a graph visualization toolkit from AT&T and Lucent
 # Bell Labs. The other options in this section have no effect if this option is
 # set to NO
-# The default value is: NO.
+# The default value is: YES.
 
 HAVE_DOT               = NO
 
-# The DOT_NUM_THREADS specifies the number of dot invocations doxygen is allowed
-# to run in parallel. When set to 0 doxygen will base this on the number of
+# The DOT_NUM_THREADS specifies the number of dot invocations Doxygen is allowed
+# to run in parallel. When set to 0 Doxygen will base this on the number of
 # processors available in the system. You can set it explicitly to a value
 # larger than 0 to get control over the balance between CPU load and processing
 # speed.
-# Minimum value: 0, maximum value: 32, default value: 0.
+# Minimum value: 0, maximum value: 512, default value: 0.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 DOT_NUM_THREADS        = 0
 
-# When you want a differently looking font n the dot files that doxygen
-# generates you can specify the font name using DOT_FONTNAME. You need to make
-# sure dot is able to find the font, which can be done by putting it in a
-# standard location or by setting the DOTFONTPATH environment variable or by
-# setting DOT_FONTPATH to the directory containing the font.
-# The default value is: Helvetica.
+# DOT_COMMON_ATTR is common attributes for nodes, edges and labels of
+# subgraphs. When you want a differently looking font in the dot files that
+# Doxygen generates you can specify fontname, fontcolor and fontsize attributes.
+# For details please see <a href=https://graphviz.org/doc/info/attrs.html>Node,
+# Edge and Graph Attributes specification</a> You need to make sure dot is able
+# to find the font, which can be done by putting it in a standard location or by
+# setting the DOTFONTPATH environment variable or by setting DOT_FONTPATH to the
+# directory containing the font. Default graphviz fontsize is 14.
+# The default value is: fontname=Helvetica,fontsize=10.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
-DOT_FONTNAME           = Helvetica
+DOT_COMMON_ATTR        = "fontname=Helvetica,fontsize=10"
 
-# The DOT_FONTSIZE tag can be used to set the size (in points) of the font of
-# dot graphs.
-# Minimum value: 4, maximum value: 24, default value: 10.
+# DOT_EDGE_ATTR is concatenated with DOT_COMMON_ATTR. For elegant style you can
+# add 'arrowhead=open, arrowtail=open, arrowsize=0.5'. <a
+# href=https://graphviz.org/doc/info/arrows.html>Complete documentation about
+# arrows shapes.</a>
+# The default value is: labelfontname=Helvetica,labelfontsize=10.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
-DOT_FONTSIZE           = 10
+DOT_EDGE_ATTR          = "labelfontname=Helvetica,labelfontsize=10"
 
-# By default doxygen will tell dot to use the default font as specified with
-# DOT_FONTNAME. If you specify a different font using DOT_FONTNAME you can set
-# the path where dot can find it using this tag.
+# DOT_NODE_ATTR is concatenated with DOT_COMMON_ATTR. For view without boxes
+# around nodes set 'shape=plain' or 'shape=plaintext' <a
+# href=https://www.graphviz.org/doc/info/shapes.html>Shapes specification</a>
+# The default value is: shape=box,height=0.2,width=0.4.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_NODE_ATTR          = "shape=box,height=0.2,width=0.4"
+
+# You can set the path where dot can find font specified with fontname in
+# DOT_COMMON_ATTR and others dot attributes.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 DOT_FONTPATH           =
 
-# If the CLASS_GRAPH tag is set to YES then doxygen will generate a graph for
-# each documented class showing the direct and indirect inheritance relations.
-# Setting this tag to YES will force the CLASS_DIAGRAMS tag to NO.
+# If the CLASS_GRAPH tag is set to YES or GRAPH or BUILTIN then Doxygen will
+# generate a graph for each documented class showing the direct and indirect
+# inheritance relations. In case the CLASS_GRAPH tag is set to YES or GRAPH and
+# HAVE_DOT is enabled as well, then dot will be used to draw the graph. In case
+# the CLASS_GRAPH tag is set to YES and HAVE_DOT is disabled or if the
+# CLASS_GRAPH tag is set to BUILTIN, then the built-in generator will be used.
+# If the CLASS_GRAPH tag is set to TEXT the direct and indirect inheritance
+# relations will be shown as texts / links. Explicit enabling an inheritance
+# graph or choosing a different representation for an inheritance graph of a
+# specific class, can be accomplished by means of the command \inheritancegraph.
+# Disabling an inheritance graph can be accomplished by means of the command
+# \hideinheritancegraph.
+# Possible values are: NO, YES, TEXT, GRAPH and BUILTIN.
 # The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
 
 CLASS_GRAPH            = YES
 
-# If the COLLABORATION_GRAPH tag is set to YES then doxygen will generate a
+# If the COLLABORATION_GRAPH tag is set to YES then Doxygen will generate a
 # graph for each documented class showing the direct and indirect implementation
 # dependencies (inheritance, containment, and class references variables) of the
-# class with other documented classes.
+# class with other documented classes. Explicit enabling a collaboration graph,
+# when COLLABORATION_GRAPH is set to NO, can be accomplished by means of the
+# command \collaborationgraph. Disabling a collaboration graph can be
+# accomplished by means of the command \hidecollaborationgraph.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 COLLABORATION_GRAPH    = YES
 
-# If the GROUP_GRAPHS tag is set to YES then doxygen will generate a graph for
-# groups, showing the direct groups dependencies.
+# If the GROUP_GRAPHS tag is set to YES then Doxygen will generate a graph for
+# groups, showing the direct groups dependencies. Explicit enabling a group
+# dependency graph, when GROUP_GRAPHS is set to NO, can be accomplished by means
+# of the command \groupgraph. Disabling a directory graph can be accomplished by
+# means of the command \hidegroupgraph. See also the chapter Grouping in the
+# manual.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 GROUP_GRAPHS           = YES
 
-# If the UML_LOOK tag is set to YES doxygen will generate inheritance and
+# If the UML_LOOK tag is set to YES, Doxygen will generate inheritance and
 # collaboration diagrams in a style similar to the OMG's Unified Modeling
 # Language.
 # The default value is: NO.
@@ -2116,10 +2739,41 @@ UML_LOOK               = NO
 # but if the number exceeds 15, the total amount of fields shown is limited to
 # 10.
 # Minimum value: 0, maximum value: 100, default value: 10.
-# This tag requires that the tag HAVE_DOT is set to YES.
+# This tag requires that the tag UML_LOOK is set to YES.
 
 UML_LIMIT_NUM_FIELDS   = 10
 
+# If the UML_LOOK tag is enabled, field labels are shown along the edge between
+# two class nodes. If there are many fields and many nodes the graph may become
+# too cluttered. The UML_MAX_EDGE_LABELS threshold limits the number of items to
+# make the size more manageable. Set this to 0 for no limit.
+# Minimum value: 0, maximum value: 100, default value: 10.
+# This tag requires that the tag UML_LOOK is set to YES.
+
+UML_MAX_EDGE_LABELS    = 10
+
+# If the DOT_UML_DETAILS tag is set to NO, Doxygen will show attributes and
+# methods without types and arguments in the UML graphs. If the DOT_UML_DETAILS
+# tag is set to YES, Doxygen will add type and arguments for attributes and
+# methods in the UML graphs. If the DOT_UML_DETAILS tag is set to NONE, Doxygen
+# will not generate fields with class member information in the UML graphs. The
+# class diagrams will look similar to the default class diagrams but using UML
+# notation for the relationships.
+# Possible values are: NO, YES and NONE.
+# The default value is: NO.
+# This tag requires that the tag UML_LOOK is set to YES.
+
+DOT_UML_DETAILS        = NO
+
+# The DOT_WRAP_THRESHOLD tag can be used to set the maximum number of characters
+# to display on a single line. If the actual line length exceeds this threshold
+# significantly it will be wrapped across multiple lines. Some heuristics are
+# applied to avoid ugly line breaks.
+# Minimum value: 0, maximum value: 1000, default value: 17.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_WRAP_THRESHOLD     = 17
+
 # If the TEMPLATE_RELATIONS tag is set to YES then the inheritance and
 # collaboration graphs will show the relations between templates and their
 # instances.
@@ -2129,79 +2783,105 @@ UML_LIMIT_NUM_FIELDS   = 10
 TEMPLATE_RELATIONS     = YES
 
 # If the INCLUDE_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are set to
-# YES then doxygen will generate a graph for each documented file showing the
+# YES then Doxygen will generate a graph for each documented file showing the
 # direct and indirect include dependencies of the file with other documented
-# files.
+# files. Explicit enabling an include graph, when INCLUDE_GRAPH is is set to NO,
+# can be accomplished by means of the command \includegraph. Disabling an
+# include graph can be accomplished by means of the command \hideincludegraph.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 INCLUDE_GRAPH          = YES
 
 # If the INCLUDED_BY_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are
-# set to YES then doxygen will generate a graph for each documented file showing
+# set to YES then Doxygen will generate a graph for each documented file showing
 # the direct and indirect include dependencies of the file with other documented
-# files.
+# files. Explicit enabling an included by graph, when INCLUDED_BY_GRAPH is set
+# to NO, can be accomplished by means of the command \includedbygraph. Disabling
+# an included by graph can be accomplished by means of the command
+# \hideincludedbygraph.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 INCLUDED_BY_GRAPH      = YES
 
-# If the CALL_GRAPH tag is set to YES then doxygen will generate a call
+# If the CALL_GRAPH tag is set to YES then Doxygen will generate a call
 # dependency graph for every global function or class method.
 #
 # Note that enabling this option will significantly increase the time of a run.
 # So in most cases it will be better to enable call graphs for selected
-# functions only using the \callgraph command.
+# functions only using the \callgraph command. Disabling a call graph can be
+# accomplished by means of the command \hidecallgraph.
 # The default value is: NO.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 CALL_GRAPH             = NO
 
-# If the CALLER_GRAPH tag is set to YES then doxygen will generate a caller
+# If the CALLER_GRAPH tag is set to YES then Doxygen will generate a caller
 # dependency graph for every global function or class method.
 #
 # Note that enabling this option will significantly increase the time of a run.
 # So in most cases it will be better to enable caller graphs for selected
-# functions only using the \callergraph command.
+# functions only using the \callergraph command. Disabling a caller graph can be
+# accomplished by means of the command \hidecallergraph.
 # The default value is: NO.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 CALLER_GRAPH           = NO
 
-# If the GRAPHICAL_HIERARCHY tag is set to YES then doxygen will graphical
+# If the GRAPHICAL_HIERARCHY tag is set to YES then Doxygen will graphical
 # hierarchy of all classes instead of a textual one.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 GRAPHICAL_HIERARCHY    = YES
 
-# If the DIRECTORY_GRAPH tag is set to YES then doxygen will show the
+# If the DIRECTORY_GRAPH tag is set to YES then Doxygen will show the
 # dependencies a directory has on other directories in a graphical way. The
 # dependency relations are determined by the #include relations between the
-# files in the directories.
+# files in the directories. Explicit enabling a directory graph, when
+# DIRECTORY_GRAPH is set to NO, can be accomplished by means of the command
+# \directorygraph. Disabling a directory graph can be accomplished by means of
+# the command \hidedirectorygraph.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 DIRECTORY_GRAPH        = YES
 
+# The DIR_GRAPH_MAX_DEPTH tag can be used to limit the maximum number of levels
+# of child directories generated in directory dependency graphs by dot.
+# Minimum value: 1, maximum value: 25, default value: 1.
+# This tag requires that the tag DIRECTORY_GRAPH is set to YES.
+
+DIR_GRAPH_MAX_DEPTH    = 1
+
 # The DOT_IMAGE_FORMAT tag can be used to set the image format of the images
-# generated by dot.
-# Note: If you choose svg you need to set HTML_FILE_EXTENSION to xhtml in order
-# to make the SVG files visible in IE 9+ (other browsers do not have this
-# requirement).
-# Possible values are: png, jpg, gif and svg.
+# generated by dot. For an explanation of the image formats see the section
+# output formats in the documentation of the dot tool (Graphviz (see:
+# https://www.graphviz.org/)).
+#
+# Note the formats svg:cairo and svg:cairo:cairo cannot be used in combination
+# with INTERACTIVE_SVG (the INTERACTIVE_SVG will be set to NO).
+# Possible values are: png, jpg, gif, svg, png:gd, png:gd:gd, png:cairo,
+# png:cairo:gd, png:cairo:cairo, png:cairo:gdiplus, png:gdiplus,
+# png:gdiplus:gdiplus, svg:cairo, svg:cairo:cairo, svg:svg, svg:svg:core,
+# gif:cairo, gif:cairo:gd, gif:cairo:gdiplus, gif:gdiplus, gif:gdiplus:gdiplus,
+# gif:gd, gif:gd:gd, jpg:cairo, jpg:cairo:gd, jpg:cairo:gdiplus, jpg:gd,
+# jpg:gd:gd, jpg:gdiplus and jpg:gdiplus:gdiplus.
 # The default value is: png.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 DOT_IMAGE_FORMAT       = png
 
-# If DOT_IMAGE_FORMAT is set to svg, then this option can be set to YES to
-# enable generation of interactive SVG images that allow zooming and panning.
+# If DOT_IMAGE_FORMAT is set to svg or svg:svg or svg:svg:core, then this option
+# can be set to YES to enable generation of interactive SVG images that allow
+# zooming and panning.
 #
 # Note that this requires a modern browser other than Internet Explorer. Tested
 # and working are Firefox, Chrome, Safari, and Opera.
-# Note: For IE 9+ you need to set HTML_FILE_EXTENSION to xhtml in order to make
-# the SVG files visible. Older versions of IE do not have SVG support.
+#
+# Note This option will be automatically disabled when DOT_IMAGE_FORMAT is set
+# to svg:cairo or svg:cairo:cairo.
 # The default value is: NO.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
@@ -2220,11 +2900,12 @@ DOT_PATH               =
 
 DOTFILE_DIRS           =
 
-# The MSCFILE_DIRS tag can be used to specify one or more directories that
-# contain msc files that are included in the documentation (see the \mscfile
-# command).
+# You can include diagrams made with dia in Doxygen documentation. Doxygen will
+# then run dia to produce the diagram and insert it in the documentation. The
+# DIA_PATH tag allows you to specify the directory where the dia binary resides.
+# If left empty dia is assumed to be found in the default search path.
 
-MSCFILE_DIRS           =
+DIA_PATH               =
 
 # The DIAFILE_DIRS tag can be used to specify one or more directories that
 # contain dia files that are included in the documentation (see the \diafile
@@ -2232,10 +2913,34 @@ MSCFILE_DIRS           =
 
 DIAFILE_DIRS           =
 
+# When using PlantUML, the PLANTUML_JAR_PATH tag should be used to specify the
+# path where java can find the plantuml.jar file or to the filename of jar file
+# to be used. If left blank, it is assumed PlantUML is not used or called during
+# a preprocessing step. Doxygen will generate a warning when it encounters a
+# \startuml command in this case and will not generate output for the diagram.
+
+PLANTUML_JAR_PATH      =
+
+# When using PlantUML, the PLANTUML_CFG_FILE tag can be used to specify a
+# configuration file for PlantUML.
+
+PLANTUML_CFG_FILE      =
+
+# When using PlantUML, the specified paths are searched for files specified by
+# the !include statement in a PlantUML block.
+
+PLANTUML_INCLUDE_PATH  =
+
+# The PLANTUMLFILE_DIRS tag can be used to specify one or more directories that
+# contain PlantUml files that are included in the documentation (see the
+# \plantumlfile command).
+
+PLANTUMLFILE_DIRS      =
+
 # The DOT_GRAPH_MAX_NODES tag can be used to set the maximum number of nodes
 # that will be shown in the graph. If the number of nodes in a graph becomes
-# larger than this value, doxygen will truncate the graph, which is visualized
-# by representing a node as a red box. Note that doxygen if the number of direct
+# larger than this value, Doxygen will truncate the graph, which is visualized
+# by representing a node as a red box. Note that if the number of direct
 # children of the root node in a graph is already larger than
 # DOT_GRAPH_MAX_NODES then the graph will not be shown at all. Also note that
 # the size of a graph can be further restricted by MAX_DOT_GRAPH_DEPTH.
@@ -2256,19 +2961,7 @@ DOT_GRAPH_MAX_NODES    = 50
 
 MAX_DOT_GRAPH_DEPTH    = 0
 
-# Set the DOT_TRANSPARENT tag to YES to generate images with a transparent
-# background. This is disabled by default, because dot on Windows does not seem
-# to support this out of the box.
-#
-# Warning: Depending on the platform used, enabling this option may lead to
-# badly anti-aliased labels on the edges of a graph (i.e. they become hard to
-# read).
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_TRANSPARENT        = NO
-
-# Set the DOT_MULTI_TARGETS tag to YES allow dot to generate multiple output
+# Set the DOT_MULTI_TARGETS tag to YES to allow dot to generate multiple output
 # files in one run (i.e. multiple -o and -T options on the command line). This
 # makes dot run faster, but since only newer versions of dot (>1.8.10) support
 # this, this feature is disabled by default.
@@ -2277,17 +2970,37 @@ DOT_TRANSPARENT        = NO
 
 DOT_MULTI_TARGETS      = NO
 
-# If the GENERATE_LEGEND tag is set to YES doxygen will generate a legend page
+# If the GENERATE_LEGEND tag is set to YES Doxygen will generate a legend page
 # explaining the meaning of the various boxes and arrows in the dot generated
 # graphs.
+# Note: This tag requires that UML_LOOK isn't set, i.e. the Doxygen internal
+# graphical representation for inheritance and collaboration diagrams is used.
 # The default value is: YES.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
 GENERATE_LEGEND        = YES
 
-# If the DOT_CLEANUP tag is set to YES doxygen will remove the intermediate dot
+# If the DOT_CLEANUP tag is set to YES, Doxygen will remove the intermediate
 # files that are used to generate the various graphs.
+#
+# Note: This setting is not only used for dot files but also for msc temporary
+# files.
 # The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
 
 DOT_CLEANUP            = YES
+
+# You can define message sequence charts within Doxygen comments using the \msc
+# command. If the MSCGEN_TOOL tag is left empty (the default), then Doxygen will
+# use a built-in version of mscgen tool to produce the charts. Alternatively,
+# the MSCGEN_TOOL tag can also specify the name an external tool. For instance,
+# specifying prog as the value, Doxygen will call the tool as prog -T
+# <outfile_format> -o <outputfile> <inputfile>. The external tool should support
+# output file formats "png", "eps", "svg", and "ismap".
+
+MSCGEN_TOOL            =
+
+# The MSCFILE_DIRS tag can be used to specify one or more directories that
+# contain msc files that are included in the documentation (see the \mscfile
+# command).
+
+MSCFILE_DIRS           =
-- 
2.48.1

