Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDA430B84
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132349; cv=none; b=eh6d6F78UJiTj4gNL9SEgo8yG+vDmexF3iFeiEKddittxudvoX1rlBZcB2sJMMHlMdbjnQo4Jxd+q7jBKV8X0A3x2cuE08b9IwlXCVJxMe5vUQ3KnjL/Z9GD1LEEQRf5VT4BnxF2Uy2kf0QYh6ZJ+fFM/ZUbha3SqnQislZNMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132349; c=relaxed/simple;
	bh=kVrSWROsFgqQjmtx1BMU2g65ibjSS4GXam+fZfraPmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qscYoXaUaAEVG6CBgdLB52ocXShQlVV1sJsmb1XsKFfD3qtW+w2VDuL+7bgAcwaOt44I0Tamy5vytiBm7kO1HmXsqtMZXTx/O72qiTljJwbjTuE1vbqRNWdP1Ulgd2RibCiiT9IVeqfEsPAlbHY2+36Xcyk3+0Kx3JzqryH4bTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=au6gAaol; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="au6gAaol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132348; x=1804668348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kVrSWROsFgqQjmtx1BMU2g65ibjSS4GXam+fZfraPmE=;
  b=au6gAaolEFvEw0+ZYQ/et4Yy1ZJhYkyEEhQG1cyAxan8C4/cIf44mIAV
   WDmCX+Rrm2bIX5Hxk5s6iNvnORBns2qORL4gAFQ9Sw7HUnPI3tOtaC66q
   BgZSodAbbG306XWuHsd/vj0uRpa1Pfhg6KoKUT7piLkCRR8u2LG61Owmn
   dEs2L4MLMWgWdK3Abmsxmp3FHV1mT0GBxnu9hLn8dmZkQ2QIAdFsU2GV1
   o4rdPYhMSjCDf//FFoYaLpnYjZefPOHaYGGIh/KDQklLqI8t8HpLCD2Fg
   0EpIgDHDL4b7dIaRGl9s+eKLF21WfAYCCkz2n1nyqoCRaKs2KREUoRW85
   Q==;
X-CSE-ConnectionGUID: l5VaQILPQF6RPbLUvHCuAw==
X-CSE-MsgGUID: 8RdvIZUjQoSj/6GXV4hZcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501748"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501748"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:45 -0700
X-CSE-ConnectionGUID: jO/sDMWdTVaLgc6hv/XAeQ==
X-CSE-MsgGUID: wqtvGi6oRc2Z1YbD3qVglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727686"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:44 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CC05121D86;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xna-1Dtr;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 03/11] Add 10-bit CSI-2 packed format support
Date: Tue, 10 Mar 2026 10:46:09 +0200
Message-ID: <20260310084615.1183141-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the 10-bit CSI-2 packed raw formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 5df3ff7ab31d..14cfa7e7a46c 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -25,6 +25,7 @@
 
 #include <ctype.h>
 #include <stdio.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <string.h>
@@ -56,6 +57,7 @@ static const struct format_info {
 	unsigned int cb_pos;
 	unsigned int cr_pos;
 	unsigned int planes;
+	__u32 compat_fmt;
 } v4l2_pix_fmt_str[] = {
 	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0, 1 },
@@ -98,6 +100,10 @@ static const struct format_info {
 	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, 1, V4L2_PIX_FMT_SBGGR10 },
+	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGBRG10 },
+	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGRBG10 },
+	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, 1, V4L2_PIX_FMT_SRGGB10 },
 	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0, 1 },
@@ -186,6 +192,45 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
 	return b;
 }
 
+static inline uint16_t raw_get(uint8_t bpp, unsigned char *ptr,
+			       unsigned int stride, unsigned int x,
+			       unsigned int y)
+{
+	switch (bpp) {
+	case 10: {
+		unsigned char *base = ptr + y * stride + x / 4 * 5;
+		unsigned int idx = x & 3U;
+
+		return (base[idx] << 2) | ((base[4] >> (idx << 1)) & 3U);
+	}
+	default:
+		error("getting raw %u not supported", bpp);
+	}
+
+	return 0;
+}
+
+static inline void raw_put(uint8_t bpp, unsigned char *ptr, unsigned int stride,
+			   unsigned int x, unsigned int y, uint16_t value)
+{
+	switch (bpp) {
+	case 10: {
+		unsigned char *base = ptr + y * stride + x / 4 * 5;
+		unsigned int idx = x & 3U;
+
+		base[idx] = value >> 2;
+		base[4] &= ~(3U << (idx << 1));
+		base[4] |= (value & 3U) << (idx << 1);
+		break;
+	}
+	case 16:
+		*(uint16_t *)&ptr[y * stride + x * 2] = value;
+		break;
+	default:
+		error("putting raw %u not supported", bpp);
+	}
+}
+
 static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
 			      int src_width, int src_height, unsigned int src_stride)
 {
@@ -283,6 +328,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 static void raw_to_rgb(const struct format_info *info,
 		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
 {
+	unsigned char *tmp_src = NULL;
 	unsigned int src_stride = src_width * info->bpp / 8;
 	unsigned int rgb_stride = src_width * 3;
 	unsigned char *src_luma, *src_chroma;
@@ -298,6 +344,40 @@ static void raw_to_rgb(const struct format_info *info,
 	int cr_pos;
 	int shift;
 
+	switch (info->fmt) {
+	case V4L2_PIX_FMT_SBGGR10P:
+	case V4L2_PIX_FMT_SGBRG10P:
+	case V4L2_PIX_FMT_SRGGB10P:
+	case V4L2_PIX_FMT_SGRBG10P: {
+		const struct format_info *old_info = info;
+		unsigned int new_stride = src_width * 2;
+
+		tmp_src = malloc(new_stride * src_height);
+		if (!tmp_src)
+			error("can't allocate memory for the temporary buffer");
+
+		for (src_y = 0; src_y < src_height; src_y++)
+			for (src_x = 0; src_x < src_width; src_x++)
+				raw_put(16, tmp_src, new_stride, src_x, src_y,
+					raw_get(info->bpp, src, src_stride,
+						src_x, src_y));
+
+		src_stride = new_stride;
+		src = tmp_src;
+
+		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
+			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
+				info = &v4l2_pix_fmt_str[i];
+				break;
+			}
+		}
+
+		if (info == old_info)
+			error("no supported format found for %s",
+			      old_info->name);
+	}
+	}
+
 	switch (info->fmt) {
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YVYU:
@@ -734,6 +814,8 @@ static void raw_to_rgb(const struct format_info *info,
 		}
 		break;
 	}
+
+	free(tmp_src);
 }
 
 static int parse_format(const char *p, int *w, int *h)
-- 
2.47.3

