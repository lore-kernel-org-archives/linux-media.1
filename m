Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5E473C98
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105513; cv=none; b=WDer5Leh4urShbS5vlZA9ryZa7TNCuko+J1Q3LcCiGozi1Z5eqRZgLPXDf5UJeGLJyONx5qlDxDfUxwXHLj+8BLBCfEXbI7fwOMALEfAUuWQo4beqrG1WgKFGSFRM2Jre58QirxpGbZDkMvE3OKlE+jQQzg1cUhYBp+beoAlLh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105513; c=relaxed/simple;
	bh=KsLBAmSHqTLTWdBxR0AVMAMGeYmES0KMVhPGVoSEMlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHbmSdlD/vJIuihLAEjixYzKXNofIivwk8Lbo5JlzWYKFtD75oRJOP5j73ARyvf3CK9QcGdFToi9FAB3sovPiKtS7SclYQBem76SBTheRH2gRXGyPFR01UWd2EzYk9DpBAiit2174WhCNK2UuQS6I4H6vKoFA/wMQHDnQlBgG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6KtuHXr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6KtuHXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105500; x=1817641500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KsLBAmSHqTLTWdBxR0AVMAMGeYmES0KMVhPGVoSEMlE=;
  b=l6KtuHXrkiHAMkF7gyZmZuTiCY/va5xWCVeS/WNr5NxtuI1o89jwDj9B
   4Uwp9bImDrWhf7t0egG1yVT7Am1K+hYQueNCqSJLpkRMELAda9QCjz1np
   s3owbrIP5YNCnvLC4soN8npHOOUxIz5kGLJgeR3M5/+lACs+bcueQSllF
   +tnd6TzVklLDgqhMetarza1GfCIWJxl77yeYlE02YDtoUVo+8MRtvldC6
   yL3Y4QuXesSkVRGHI9xbD0r5oHSURReUj8zbc27N9qPEXm74vAK6kE0qy
   6xhjVWlig0DK/G5cOnWoGmB/CnrLVaNhwDBxf7l62ILkCQz0kBduScRsn
   Q==;
X-CSE-ConnectionGUID: A84x1SxhT12wsW2bJyF4iQ==
X-CSE-MsgGUID: +k5T0iSKQ26FNTtefwc+Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90591968"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90591968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:36 -0700
X-CSE-ConnectionGUID: 723lMdFyTu6FqKfy+uftAA==
X-CSE-MsgGUID: FNsrntorSGWx6lMP16bORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779672"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A011121CBF;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bvq-39I9;
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
Subject: [PATCH v7 05/14] media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
Date: Fri,  7 Aug 2026 15:24:00 +0300
Message-ID: <20260807122409.45807-6-sakari.ailus@linux.intel.com>
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

Rename "binning" as "bin_hv" in anticipation of having a variable called
"binning" for another purpose.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 05717b1e3224..f1e10b13abda 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -853,7 +853,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	u8 bin_h, bin_v, binning;
+	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
 	format = v4l2_subdev_state_get_format(state, 0);
@@ -886,11 +886,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	bin_v = min(IMX219_ACTIVE_AREA_HEIGHT / format->height, 2U);
 
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
-	binning = min(bin_h, bin_v);
+	bin_hv = min(bin_h, bin_v);
 
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	crop->width = format->width * binning;
-	crop->height = format->height * binning;
+	crop->width = format->width * bin_hv;
+	crop->height = format->height * bin_hv;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
-- 
2.47.3

