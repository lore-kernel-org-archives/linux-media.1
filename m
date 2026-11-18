Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008548;
	b=Q/h/qqZ7/cgoXsThUKgsFh2qCyNyE9MET69bBc3cdoXGBmaTTPdFOErNIopy/fy8kW5a
	 +rFda4Piae9RjnkEJhAD8K9naXk1VUSc/rKa7++eNHejqGDq67UZjGdPoDW52HmlJH6Ph
	 VfnD+BpUVL0hF+M05sNQfi03i+lJxG0HBZNb6pkZyRQgbQOnsYhEAudPjd3lclx6nc5Sy
	 /TvRHe1cGNzvU71CdRfGl8YxGSct+w82K44/ON+odAmQdyuiSAdLrCejDXsFEHdacUrzg
	 E76Ymlq5poIVEOr0f2Ljz06Jp4dbsy65L+D8ecS5iyJmxstWoGY3Owp03URLKnzVo4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Dr72xfA+m4T52wDu7cEKY+Pm7QeEhIvZfdfzQ1cwhLo=;
	b=amFxOOeuaqAvXhXGIXhY8BVKoqfrw1vORnaMyCAp6WqJqGewELrFQl65Jz/8kaC+aBKg
	 vRxWwMAZtRaTvewVOvK8WP5G5/TSdBPe8Kq8LfLkJi7ZI6XyxBAH6c2y9G1pkgZmhB3C9
	 6D6o2q3kAyuUGbE5szVKLxqM51h7gbix2Hb9GOukE4NUWyDCMF3LUyQuuYNfBiGdF0SdU
	 iQ8EDpyhuzDOng4dStlrbu9X92SO8DnqmUXIeHkZSccm7jo3Z056X1aP9NgB43HV+ruI2
	 WiUb/ogrxf9QEKh7ZSTP/I7ArUQHI/BkpJ906NrSdz4/tc4LPz97LKhr0B3wnGDJgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cP1HBS6f;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798C7606A334
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 798C7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cP1HBS6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008548; x=1826544548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rcJAPHtwQQZ8+JoD8pI0x/wqjLUl3QEpjjUnTFtpgIg=;
  b=cP1HBS6f6IsnUrGIO4aDsI7O/vF9nUNAAvFhrXLwTY5nEzyGllDodNce
   HQ/qrLf52O9wF9t+WQBPZZnhhaLd64DQyPFr7Xp7WcpZukTPLJhXxb+p8
   RwU6+R43z96128h2IsMB+pw5lU92K5BTpKUrT0RuUEcUpdXoLzyIuCvLj
   rjf1Xqd13fBlWmfoU78koO0K8DVlAUB26Tg1JzThw28Zb+xy0PpNpUk5b
   mUD+B70hzYPuOodFFAxNWU+U2g61O3tizC67UVWn6/6OPIYVZF33Lpj0z
   sIjAQYdkB4eBRprdd1/poQIRxvTaR/qTDKeubHRQPMjhfvH0+F+FPh4GF
   w==;
X-CSE-ConnectionGUID: AgUMFg1MSzecHkmnr4AmlA==
X-CSE-MsgGUID: 9jQWW2nIQfGs9xLRrrHrEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808958"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: N/rz40MTQ7S9hYhBUsdQ5A==
X-CSE-MsgGUID: 3OfnVud1SG+AYfMTILBeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376789"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 89D0E122FF5;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbh-0iyB;
	Wed, 18 Nov 2026 15:28:20 +0200
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
Subject: [PATCH v13 32/73] media: v4l2-common: Add v4l2_sensor_fll_llp_set()
Date: Wed, 18 Nov 2026 15:27:38 +0200
Message-ID: <20261118132819.213473-33-sakari.ailus@linux.intel.com>
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

Add v4l2_sensor_fll_llp_set() to facilitate driver implementation of both
blanking and line and frame lenght controls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 66 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 28 ++++++++++++
 include/media/v4l2-mc.h               |  1 +
 3 files changed, 95 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 11ab684024c5..35eafde9d73b 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -862,3 +862,69 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	return clk_hw->clk;
 }
 EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
+
+int v4l2_sensor_fll_llp_set(struct v4l2_ctrl *fll, struct v4l2_ctrl *vblank,
+			    struct v4l2_ctrl *llp, struct v4l2_ctrl *hblank,
+			    struct v4l2_ctrl *exposure,
+			    const struct v4l2_mbus_framefmt *format,
+			    struct v4l2_ctrl *src, bool *setting_ctrl,
+			    int exposure_margin)
+{
+	struct v4l2_ctrl *dest;
+	s32 val;
+	int ret;
+
+	/* Was setting the control user-initiated or were we called again? */
+	if (*setting_ctrl) {
+		*setting_ctrl = false;
+		return 0;
+	}
+
+	/* Are we being called for writing a value to a register? */
+	if (src->val == src->cur.val)
+		return 0;
+
+	switch (src->id) {
+	case V4L2_CID_FRAME_LENGTH_LINES:
+		dest = vblank;
+		val = src->val - format->height;
+		break;
+	case V4L2_CID_VBLANK:
+		dest = fll;
+		val = src->val + format->height;
+		break;
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+		dest = hblank;
+		val = src->val - format->width;
+		break;
+	case V4L2_CID_HBLANK:
+		dest = llp;
+		val = src->val + format->width;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (val == dest->val)
+		return 0;
+
+	*setting_ctrl = true;
+
+	ret = __v4l2_ctrl_s_ctrl(dest, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Only modify exposure range when setting fll, directly or via vblank.
+	 */
+	if (src->id != V4L2_CID_FRAME_LENGTH_LINES &&
+	    dest->id != V4L2_CID_FRAME_LENGTH_LINES)
+		return 0;
+
+	int exposure_max = fll->val - exposure_margin;
+
+	return __v4l2_ctrl_modify_range(exposure, exposure->minimum,
+					exposure_max, exposure->step,
+					exposure_max);
+}
+EXPORT_SYMBOL_GPL(v4l2_sensor_fll_llp_set);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 33f5713734cb..d29575a9f137 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -98,7 +98,9 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
 /* ------------------------------------------------------------------------- */
 
 struct clk;
+struct v4l2_ctrl;
 struct v4l2_device;
+struct v4l2_mbus_framefmt;
 struct v4l2_subdev;
 struct v4l2_subdev_ops;
 
@@ -825,4 +827,30 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
 	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
 }
 
+/**
+ * v4l2_sensor_fll_llp_set - Compatibility support for hblank and vblank
+ *			     controls
+ *
+ * @fll: Frame length in lines control
+ * @vblank: Vertical blanking control
+ * @llp: Line length in pixels control
+ * @hblank: Horizontal blanking control
+ * @exposure: Exposure control
+ * @format: Source pad format
+ * @src: The control being set -- one of the other four controls
+ * @setting_ctrl: Pointer to the sensor's setting_ctrl variable; false in
+ *		  initialisation
+ * @exposure_margin: The exposure margin of the sensor
+ *
+ * Compatiblity helper for handling frame time related controls for sensor
+ * drivers that support both the Common Raw Sensor Model and the legacy
+ * interface.
+ */
+int v4l2_sensor_fll_llp_set(struct v4l2_ctrl *fll, struct v4l2_ctrl *vblank,
+			    struct v4l2_ctrl *llp, struct v4l2_ctrl *hblank,
+			    struct v4l2_ctrl *exposure,
+			    const struct v4l2_mbus_framefmt *format,
+			    struct v4l2_ctrl *src, bool *setting_ctrl,
+			    int exposure_margin);
+
 #endif /* V4L2_COMMON_H_ */
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index 1837c9fd78cf..63030baee819 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -18,6 +18,7 @@
 /* We don't need to include pci.h or usb.h here */
 struct pci_dev;
 struct usb_device;
+struct v4l2_ctrl;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 /**
-- 
2.47.3

