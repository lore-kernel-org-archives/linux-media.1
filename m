Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E1F42902A
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105546; cv=none; b=pVVqgEoigruN1JfD/0Kh9kWE/hgiUXUS5n9qtkjtCv2XVSMTvazszBiy7s/WbAF156e7IaqNo4O+bsWJll8/lnQ06dYNBE9pRklxnlzUXAGjDBj2cPAFUs4KMbhdZK7qclNo3D3j9whTOQge8FFMS3AXSf0gi8xOZTdjFXAtqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105546; c=relaxed/simple;
	bh=mP+pU31vWmV604j8n8+fvf/g9c6lMcP0exh3bPVYUkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhoDbKhzivhTxmS6dymdpNnCFIxAIFMVJ6n32rK6mhf5xXD+0KJMPPt64Mp9cGmu3NX0BRs3rvDzRA7X3Vyk0OotggquY6kqKIUu+biiayEtQZAdbiPbx4VQ35mDAWDC0b2OFlCRJR2DPEWgxIyi+iytwF5HsvLjUi4vPOZsJps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSFbFimy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSFbFimy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105534; x=1817641534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mP+pU31vWmV604j8n8+fvf/g9c6lMcP0exh3bPVYUkk=;
  b=VSFbFimy2kZXumJ944xL3FCBUOwBjoJO1BsyISPbhpGiDitSzLRuxGDQ
   nHy/iNaio/Tki0iffOYewkB9zsw6HiMdOs0NGt+MLAGYZ9yISk33X57XN
   37ey0ORYRabNl/fwqRFU6JTfsWCE9c4j77PE1PKa5QyqEj+mF6aur97v6
   89o1EI7pbH7xFT7qXcbY1gcXUoTpiu65tBgQY5LLRep4gpB42vGWm3892
   rzkqZhSwLsdZYg8i2gWDEBU7+ZmCibqtN2HFc6mduPJp/A8Uc1SAnP6vk
   HqOG/61JbQeevuEkm/Na4+WgRyWv9AUzDyhBK1fGs+y7FDVQ1sxTrepjQ
   Q==;
X-CSE-ConnectionGUID: 6gOGz+QlTY62VKoGxolOqQ==
X-CSE-MsgGUID: xh0IvvdcQp6iusFqeft0Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90592041"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90592041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: ahIG2mHLSu2/uUAyrBl9hw==
X-CSE-MsgGUID: TTGG0UtTRsWzyKTYLO+aVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779687"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ABED8121CE2;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000BwC-3SZP;
	Fri, 07 Aug 2026 15:24:09 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v7 10/14] media: v4l2-subdev: Don't assign set_fmt where it's equivalent to get_fmt
Date: Fri,  7 Aug 2026 15:24:05 +0300
Message-ID: <20260807122409.45807-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not assign the set_fmt() pad op where it is the same as get_fmt(). The
get_fmt() pad op is called by the framework now in absence of set_fmt()
op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ak881x.c                | 1 -
 drivers/media/i2c/gc0310.c                | 1 -
 drivers/media/i2c/rdacm20.c               | 1 -
 drivers/media/i2c/rdacm21.c               | 1 -
 drivers/media/i2c/tvp5150.c               | 1 -
 drivers/staging/media/max96712/max96712.c | 1 -
 6 files changed, 6 deletions(-)

diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index cea46f01997d..4cedfc2d4136 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -216,7 +216,6 @@ static const struct v4l2_subdev_video_ops ak881x_subdev_video_ops = {
 static const struct v4l2_subdev_pad_ops ak881x_subdev_pad_ops = {
 	.enum_mbus_code = ak881x_enum_mbus_code,
 	.get_selection	= ak881x_get_selection,
-	.set_fmt	= ak881x_fill_fmt,
 	.get_fmt	= ak881x_fill_fmt,
 };
 
diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 754e82ad50ae..f2c381602d18 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -537,7 +537,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_mbus_code = gc0310_enum_mbus_code,
 	.enum_frame_size = gc0310_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_get_selection,
 	.enable_streams = gc0310_enable_streams,
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 52e8e2620b4d..0179508626b5 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -442,7 +442,6 @@ static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
 static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
 	.enum_mbus_code = rdacm20_enum_mbus_code,
 	.get_fmt	= rdacm20_get_fmt,
-	.set_fmt	= rdacm20_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index ece8a410e7ce..68d2b9d83c3c 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -322,7 +322,6 @@ static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
 static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
 	.enum_mbus_code = rdacm21_enum_mbus_code,
 	.get_fmt	= rdacm21_get_fmt,
-	.set_fmt	= rdacm21_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 9c204f38935d..5b92424a0148 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1724,7 +1724,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
 static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
 	.enum_mbus_code = tvp5150_enum_mbus_code,
 	.enum_frame_size = tvp5150_enum_frame_size,
-	.set_fmt = tvp5150_fill_fmt,
 	.get_fmt = tvp5150_fill_fmt,
 	.get_selection = tvp5150_get_selection,
 	.set_selection = tvp5150_set_selection,
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e04895..94ae304ac85f 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -264,7 +264,6 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
-- 
2.47.3

