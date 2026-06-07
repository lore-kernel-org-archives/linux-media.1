Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D92DF3F2
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869266; cv=none; b=r8G5UJbgWuellPkISlj2WyaUGimPFcY36qFua5vYLDvftC//Jy2ZKUCb5pypK8gyYApbbYiU0TCzuz3YKihyjVF6HjOqCzEAEYD8msrjmt6MlWVq4KWtHE22XqSaUPZwxYdv1SboGB30fqXTyl566ImIcvnJGSrGDuLJf6+gj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869266; c=relaxed/simple;
	bh=+uJhgc5u9ijC/uOQzkeO9t+H6OmKVUbRXIpGQ8Mmzg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2qMIv42AC58O9GNPOI6rvg2YSXiT7xw37DwU277tz0UCcYSSA1tqbI+wQe6w9Ew3kvXcP62xfoE8Uu/OrWOwE5rWvSqgUmQeXdyJxnXcXg1nuVZtGfloKtuwqUDwokgrAku4bzEg8PJgeBlJX8/+Xh14n1BBLipoVNocdBxQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwnZykhp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwnZykhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869265; x=1812405265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+uJhgc5u9ijC/uOQzkeO9t+H6OmKVUbRXIpGQ8Mmzg4=;
  b=FwnZykhpU0BT+ntpj/mZdKWmJ1fspoS/uoUCms1uqqn5yxHsp3DwqU4P
   OIDqMjhXqzlmbBFImDeseo4XT2KRsOtpZbmrq9eYnEHzGH+EQbP9rnCdx
   AbKAB4XNvp01BWxCuOX6x1gOBteRckw99UN/aRscXe1jkLBuCeDfDZ7UB
   O6HTj0KPObFhS2ng5TxI4Vj+t8wGdnUXmJuIwPbWmpQAvqFTgsuMbvuTy
   rGubK9x4vscTF8bNfovFPFcZkUMsNHgriJVkpmhH1sDWCp4NmSmFi/YD8
   nD8J0VQZAnIfWHyoNPOS9TkbFgMENmf465dtlTlRkh/4eOfTnjKFzX5mL
   A==;
X-CSE-ConnectionGUID: xqkD2nV5SnOhhqqSeo2wYA==
X-CSE-MsgGUID: 8gUbwN7fR0qX5/BQMCHI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107048316"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="107048316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:24 -0700
X-CSE-ConnectionGUID: QG8R58AGQuiJ5LQRcXgYtg==
X-CSE-MsgGUID: pwdBvpIORtGD8So6xDbWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245490506"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AF19D121C79;
	Mon, 08 Jun 2026 00:54:07 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wWLRM-00000003XIV-0urA;
	Mon, 08 Jun 2026 00:53:56 +0300
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
Subject: [PATCH v5 05/10] media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
Date: Mon,  8 Jun 2026 00:53:51 +0300
Message-ID: <20260607215356.842932-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/i2c/imx219.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 86683fe8a79e..3aebcbaa3fcd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -837,7 +837,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	u8 bin_h, bin_v, binning;
+	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
 	format = v4l2_subdev_state_get_format(state, 0);
@@ -870,11 +870,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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

