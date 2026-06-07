Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FB033ADBF
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869261; cv=none; b=XPxImlbXvUxS1Sbyi85fKu3V8t+DU6cAxbX0mokWDp8MI1L3fS7OrkaFJy8LOFLaYJGtAMseoX/921je9cptPkaFAZw3WTQIH9gCjUtDa36uAM1tFTgpakQHiOU1Ie1XVKMJleeMGIocq8kpL9MqZMImFRPRTShhMKLuNQk809g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869261; c=relaxed/simple;
	bh=cD2jIr2We6QNbnHhGCnADuZWA0xtl/wO3yv02oTb6uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCuwJFnM7acZNnloiDkksk1rMY+Xv/hgJ6bPQVWuZyYiY6nLFCHVy1PKKm77Y5V9V/7jyHhvZWHp9EDZXZAVKWDVF3StxDnO6PqDinDST9KsRqYmTgBAiJ4MZ3U0U5aN6zZimWvjOhhL99HhLvOtimx1KELBDPGPeswCTEREdCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTzZoSKn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTzZoSKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869259; x=1812405259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cD2jIr2We6QNbnHhGCnADuZWA0xtl/wO3yv02oTb6uA=;
  b=fTzZoSKnnFScz6fVRqu2NJzUONQ21PcZFQadXbTa+3Qspa2C2WTLChnt
   AJNNkupvmmuC95zNHt03GXjhiM5E9NGRnyPPvTVbI6mmGXPGCEhPK7VgU
   ubMHbX8GDlT19DFThU/DUWS1fcY22rI+OGK3GBGpCi7L6XpNyiwohDydO
   KBkhrIk7ZnmSrp7WCXCe4TB6ZLsWa78a5nYTAMJ0q3zlJM+EDdV/veAs/
   cMQ46eek9NEeY/H3rL/uW6owIIf1rpY7b9uem5jKYz6i9DrA5ohMtez77
   X2kdYQtw5NJBVUTQ/ArKaMowE552vxSmBgemopbF8fdOCpesWm1cIR/OA
   A==;
X-CSE-ConnectionGUID: igbMbQHoTMG3mxz/H2VD1Q==
X-CSE-MsgGUID: Sh8U1esLRG6/1Dms9fmZIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107048254"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="107048254"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:15 -0700
X-CSE-ConnectionGUID: 2NVq1tbrSfKzuXSCyLxMQg==
X-CSE-MsgGUID: 33eSQwfMQAyf01iioqeDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245490482"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A80A0121855;
	Mon, 08 Jun 2026 00:54:07 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wWLRM-00000003XIN-0jKS;
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
Subject: [PATCH v5 03/10] media: imx219: Account rate_factor in setting upper exposure limit
Date: Mon,  8 Jun 2026 00:53:49 +0300
Message-ID: <20260607215356.842932-4-sakari.ailus@linux.intel.com>
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

The rate_factor multiplier is used to multiply a few values in the
sensor's timing configuration and the exposure time is one of them. This
also needs to be taken into account in exposure time margin: multiply it
by rate_factor so that sensor's exposure time margin is respected.

Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d8fe7db18b6c..e681f80f9e3e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		int exposure_max, exposure_def;
 
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
+		exposure_max = format->height + ctrl->val -
+			IMX219_EXPOSURE_OFFSET * rate_factor;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 				exposure_max : IMX219_EXPOSURE_DEFAULT;
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
-- 
2.47.3

