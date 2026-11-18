Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008513;
	b=X7Nu5u6fo6fnJg3BLn0JaWFWOL7X602QiIU9eaenKKozBJFLENCZ6DJVwRSy3c+DGqjQ
	 l/F5Amowq3r99PMj+VfAn3Enz9CR6K3IUwCZiTIu8+6+hXzO9XdHiD5BGf7gSgf3eGQJT
	 V/Xsb7MmL4kc9NaFxhsjqb8CyLkaJgu/5R2PlQZcc5PMqGsdUjqGzdwTzocBxwY/fasAX
	 EQ10/7FwemWjI3qTdKHQCLfAxXWwVwB4uH+sNrg4XX+3qlFZpjx1/J2F0+EWTVzSxBazo
	 IataUYMuz2hUMx1nCTdPyfFs2ZwYB7fjx3hvilaT4xWK1yByi8RrqSw2CJNZo9Qkivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008513;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=AV1cYKSlSIekIkdz10im+1br/ExZF+6McBMVz+ahJiA=;
	b=X9EU/8iUBJHJrm0iOG1u7Djwp4llcxqUsJE26ofGIpEuQytBNs3ZWaHLVNZspMIZrerK
	 M01ngHjDC41Y5XXCVXpU76Dv2NlJgl8yHuict6H1dgsBswzRFgAnFVspcFe6xCpfITeMv
	 HU+5pKz6XsfJM0vX5Jp1IVZJkcGRfErxNLcuNCpgt4eg+6zfgiu7AkSE/HcyW/mKhacti
	 e3KbYU+KnBY4pHffl7yeGQTSdw2kAlsyBArdBL9i5ErGpNQT/O8hKEyZD1zXzbxMGbTTA
	 yuoYy7WKyf7kl/caF3kkS9xNFkuPqbvllbP9K65BvBOMKNg4kgR6mX/jQ+E1QqJjRnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkP2kE0g;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE5606A330
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBE5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkP2kE0g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008513; x=1826544513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lO6UvO4D04vsvLqXPDDrGOQgjjeXxasSwNAg+poi9o8=;
  b=MkP2kE0gmr1Of2h9tXkYAKSNGsZtzP1hmqZuzgawRoSju8IdxYardVB/
   QO7eOrRzmD7gNed8ix89jFfurEfpvnHUm0dredUi6cjYyx4X8LYHwenT5
   o7uFXZztFT7vevL/TwjxC9pTvGgsewbtDeLP9a2smm4K4wBiCt+CsbQ6G
   bnpAgMVs57SiCAFtmLZkN4A4Txh3eY//v7bjX1+DdS0DBx3nTB8iACCdJ
   4zH9D1BMwwc2Ptogdpx4YM91h6/q2SzAI5mgVZCMD2NrmUlAQMrgNKwOV
   fFQR2QWa9mXr7MQmH7grNUTRI8lkAvGSVe2td7EMy5WYqVmQrsv4HwC9e
   g==;
X-CSE-ConnectionGUID: z/RSkfbGSle178Fy9QSoMw==
X-CSE-MsgGUID: KVBGB+cfRkG3sLKzPN83hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702614"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702614"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
X-CSE-ConnectionGUID: mElP3sXHR4S6jvtqsdofBQ==
X-CSE-MsgGUID: 1cg9/wuTQUCuC1LKANc3ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678005"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:23 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D53BC121E56;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000td9-2Ati;
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
Subject: [PATCH v13 54/73] media: ov2740: Add support for G_SELECTION IOCTL
Date: Wed, 18 Nov 2026 15:28:00 +0200
Message-ID: <20261118132819.213473-55-sakari.ailus@linux.intel.com>
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

Add support for the G_SELECTION IOCTL in the ov2740 driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 71b5a2fbf686..ff1f5158786b 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1131,6 +1131,32 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 				   fmt->pad, fmt->stream);
 }
 
+static int ov2740_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	if (!(ci && ci->caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
+		return -EINVAL;
+
+	if (sel->stream != OV2740_STREAM_PIXEL ||
+	    sel->pad != OV2740_PAD_PIXEL)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+		sel->r.top = OV2740_CROP_TOP;
+		sel->r.left = OV2740_CROP_LEFT;
+		sel->r.width = OV2740_ACTIVE_WIDTH - OV2740_CROP_LEFT;
+		sel->r.height = OV2740_ACTIVE_HEIGHT - OV2740_CROP_TOP;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1255,6 +1281,7 @@ static const struct v4l2_subdev_video_ops ov2740_video_ops = {
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov2740_set_format,
+	.get_selection = ov2740_get_selection,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
 	.enable_streams = ov2740_enable_streams,
-- 
2.47.3

