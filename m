Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008534;
	b=c3/1UQrjLluFYRHY9y0/DEPT5x+4wF8SxuPMZeGb20O8RK19WHQumXapJrGTiKydB+gG
	 TJVv0uYIbSZEZibWUP+8fK2O65N9Lynqqzs0dG4lcpDUk0UFmb7+9hYEjW70kAWdeK8i5
	 SKvhX1/Rg9h5xw3UZOmYl3g3l5nkRFn9SVKmi5UDcjq8JOh5b3Vc+fYLgRz8Pr/eRDft4
	 fpQK+i4Ki/hF7A56/VbD2Zl2DW0hW6iWV2L2ZVn4vpnrYxdWQo8crdBRq05LsQxCYyaxl
	 bbLJfeFw12SOD6l8/yGNW5r5T9AV+VcJFOSCoJTUHaPfU9UIYlFazCEAJTI1ZFNGW8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008534;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=u43BXSk0SL0L4DYIzBgh+V6bFo9xwQv6wMKokT2vzEc=;
	b=orqB0lKQmerwz+9alOZZy3oN0HiV6WHODs971ZxNmj9VFQCygZGHjzLzs14SODZdOqYp
	 XWZnov5aeC7zHfMieYb+CCC0L2lgQWf2U5gQ7P/sIVN2cNo2t4hq62gui+HRx6bLmJ4Kz
	 s3KypAwB+ID91m3SFkirAesyUVVHwtFBMxQI2Vrv0KfYtgRUd74dHD2ktHgdUFc9vd+KO
	 YLVvRGajz115vvauwCCj58fSxI1iv79LB+bdCPYiPIvY65f89s2zup5PsUM1j+ILLuJUs
	 K7GDecC11sp4rfUEivVajwRQIaVsbeq87dfvgi91CsVP1J0g/x4c3tYBUwn/qmurLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTnzOW1h;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB31B60A2619
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB31B60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTnzOW1h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008534; x=1826544534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xl0ACEJiYHYqpKTV+DC/ffMVEXzY6dvs/BmgPGDcXe4=;
  b=WTnzOW1hgTQYusokgqUYQUWtiFnODgB9xPz/Ne18cxvyOOAg2MUTjeyl
   U6kuXbKoxKBpT9+JWhknmKc5BnzGeb/a7idZOOFpYL7Hbsohpg2WA8erF
   HplTuYFu/a2bUkg02dqUfawDU8AnEg89cEsC5cKQ99Bs4xjVt02T9gRtk
   NOlQaTxrU5AMufcwS6RoKwGbb+gNrSvqDx1qPfSM/zEtjyWpm9XHEHHFe
   z3O5VY4McANDO7izdA/RZ8kSTLQSeEMrKugrm4SRyt80f7dzryAtIT/D4
   iCe6Xbdm/gQLo/UddyTFVJA9LrahdF/hRXJYlQR7vQjJBxFZV58mLyuqP
   w==;
X-CSE-ConnectionGUID: DK0t1gtgT1C4cO8N++MMpg==
X-CSE-MsgGUID: D8S+PhlVTuGlNCgwH73VaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738993"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738993"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: Q40y9WU1TRKWAokyKDCf5w==
X-CSE-MsgGUID: vLfYrqk5T1e7YosNthNM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076090"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:41 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 34C0B122DA4;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taH-3Ohc;
	Wed, 18 Nov 2026 15:28:19 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v13 10/73] media: v4l: uapi: Add a control for color pattern flipping effect
Date: Wed, 18 Nov 2026 15:27:16 +0200
Message-ID: <20261118132819.213473-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
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

Add a bitmask control (V4L2_CID_CFA_PATTERN_FLIP) to tell whether flipping
results in a change in the sensor's Color Filter Array (CFA) pattern,
separately horizontally and vertically. The information is essential for
raw formats when using generic raw mbus codes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  2 ++
 include/uapi/linux/v4l2-controls.h                   |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 97ff8a321849..68ac4a2facfd 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -141,3 +141,15 @@ Image Source Control IDs
     * - V4L2_CFA_PATTERN_MONO
       - Monochromatic sensor, no CFA pattern.
       - 0x00010000
+
+``V4L2_CID_CFA_PATTERN_FLIP (bitmask)``
+    This control determines whether the horizontal or vertical flipping controls
+    (V4L2_CID_HFLIP and V4L2_CID_VFLIP) have an effect on the pixel order of the
+    output color pattern. Macros ``V4L2_CFA_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_CFA_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If either
+    horizontal or vertical bit is set, the readout pattern order is that of the
+    reversed readout. ``V4L2_CFA_PATTERN_FLIP_BOTH`` for setting both
+    ``V4L2_CFA_PATTERN_FLIP_HORIZONTAL`` and ``V4L2_CFA_PATTERN_FLIP_VERTICAL``
+    is provided as well.
+
+    This is a read-only control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 85ebd025c630..8656fe3144c1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1159,6 +1159,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
+	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1491,6 +1492,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
 	case V4L2_CID_CONFIG_MODEL:
+	case V4L2_CID_CFA_PATTERN_FLIP:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c4dbc12609b3..b45a42d9442e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1265,6 +1265,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CFA_PATTERN_GBRG			0x00000003
 #define V4L2_CFA_PATTERN_MONO			0x00010000
 
+#define V4L2_CID_CFA_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_CFA_PATTERN_FLIP_HORIZONTAL	(1U << 0)
+#define V4L2_CFA_PATTERN_FLIP_VERTICAL		(1U << 1)
+#define V4L2_CFA_PATTERN_FLIP_BOTH \
+	(V4L2_CFA_PATTERN_FLIP_HORIZONTAL | V4L2_CFA_PATTERN_FLIP_VERTICAL)
+
 
 /* Image processing controls */
 
-- 
2.47.3

