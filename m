Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98635959
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784591324; cv=none; b=OlfdeGist8FMjEON0axOBO/MgPOR5co8TcLBqmp2DOUBSKqTWVtFjiFtc5htUbxZWZ+SuaoZIvU6LVmI8UN/RSvfUAmf1xW412FHRN2l+3vOHAS9Yt1q1SVivafm5inPfO/MPUuGbaNqvA8GGa3iw94L5z8H6DRBTgApcHrJ5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784591324; c=relaxed/simple;
	bh=SMn1e/uuzAUDbqK+uSmhxTV8QoKb4TO5f44dfiTW1cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8qDBBybpbJkq94KBFZneqnOHQhODwK23YQr0ypSVV/GdbiR/ZIBbQTVeAfRuFKhwBWuJQ/TTlhoaIfLO2Rx5Ll1Lo8NN+/IlqvKXU19hl7iAruSHgGzfiGpOs5J3g0IsnmGmiyW1Px/jA6K/nahLny19Zh73pcCjVxLehkFRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B0ykOnut; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B0ykOnut"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C5FC838;
	Tue, 21 Jul 2026 01:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784591262;
	bh=SMn1e/uuzAUDbqK+uSmhxTV8QoKb4TO5f44dfiTW1cg=;
	h=From:To:Cc:Subject:Date:From;
	b=B0ykOnutpBrydjwaBCRVG+VV3gXIueHxP2TwNehmuIb5v28kLro07Z9E1ChxAzHFc
	 uS4Ggo44HNhV1WvNtlDiPR08aaTGFPPjcfOzsTTdfmuGuEZYutjJJMxzfqvvWo3j49
	 3Vu9CjicgYYKHgvkv7t2Sq3aZwpjmgk4sjZwqniE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org
Subject: [raw2rgbpnm] [PATCH] Add support for BGRX32, RGBX32, XBGR32 and XRGB32 formats
Date: Tue, 21 Jul 2026 02:48:39 +0300
Message-ID: <20260720234839.456275-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BGRX32 and RGBX32 formats are missing. They are easy to support as
they are just permutations of the already supported BGR32 and RGB32
formats. Add them.

The XBGR32 and XRGB32 format identifiers are also missing. They
correspond to the already supported BGR32 and RGB32 formats
respectively. Add aliases for those two formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 raw2rgbpnm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 24a88feddf00..3d70ad4c3a7a 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -67,6 +67,10 @@ static const struct format_info {
 	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_BGRX32,	32, 8,  "BGRX32 (32 XBGR-8-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_RGBX32,	32, 8,  "RGBX32 (32 RGBX-8-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_XBGR32,	32, 8,  "XBGR32 (32 BGRX-8-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_XRGB32,	32, 8,  "XRGB32 (32 XRGB-8-8-8-8)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0, 1 },
@@ -804,7 +808,38 @@ static void raw_to_rgb(const struct format_info *info,
 		}
 		break;
 
+	case V4L2_PIX_FMT_BGRX32:
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
+				r = src[dst_y*src_stride + dst_x*4 + 3];
+				g = src[dst_y*src_stride + dst_x*4 + 2];
+				b = src[dst_y*src_stride + dst_x*4 + 1];
+				rgb[src_y*rgb_stride+3*src_x+0] = swaprb ? b : r;
+				rgb[src_y*rgb_stride+3*src_x+1] = g;
+				rgb[src_y*rgb_stride+3*src_x+2] = swaprb ? r : b;
+				src_x++;
+				dst_x++;
+			}
+		}
+		break;
+
+	case V4L2_PIX_FMT_RGBX32:
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
+				r = src[dst_y*src_stride + dst_x*4 + 0];
+				g = src[dst_y*src_stride + dst_x*4 + 1];
+				b = src[dst_y*src_stride + dst_x*4 + 2];
+				rgb[src_y*rgb_stride+3*src_x+0] = swaprb ? b : r;
+				rgb[src_y*rgb_stride+3*src_x+1] = g;
+				rgb[src_y*rgb_stride+3*src_x+2] = swaprb ? r : b;
+				src_x++;
+				dst_x++;
+			}
+		}
+		break;
+
 	case V4L2_PIX_FMT_BGR32:
+	case V4L2_PIX_FMT_XBGR32:
 		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
 			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				r = src[dst_y*src_stride + dst_x*4 + 2];
@@ -820,6 +855,7 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_RGB32:
+	case V4L2_PIX_FMT_XRGB32:
 		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
 			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				r = src[dst_y*src_stride + dst_x*4 + 1];

base-commit: 43ab0bd9ab0af745c3972ef848064a0e73d44e93
-- 
Regards,

Laurent Pinchart

