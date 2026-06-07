Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C94033A9FC
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869262; cv=none; b=N9gRiKAbh10QOL+Ym34IVnf2NCUssFq3UPNjZQiAFBPoQbSwOe4TiqpkFtP2gz/UyoM+HdNU41gUhjLbEZVO62AVeD8I88F+eq+OxUO4mMwu+jdOIGrIeK8CUUvWBNKbIygRaeVYpJTJ/YtPS3LaiONYwVKKuX/8xlZZjLmTA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869262; c=relaxed/simple;
	bh=iAAzGYtTG2nFW1OKvg/ej53OD7wAh8uBwGNJ/a+GjCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIIlEjwh3ix59DHFtiVC7GB0IuV3btU1p122gU1qThzEDkua6/A4+DixVOyyrM+ss8bT9H8lgwTjg0HMeq6iG/QKRFbXMuUBN1pSWjjpE+iaffrRZKsuCxnAh+jx4eM7Ay31Nf1R2cw6Tz9M2/PK89ADMKfl9VPfUGZ86hbdJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZv6t1sO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZv6t1sO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869261; x=1812405261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iAAzGYtTG2nFW1OKvg/ej53OD7wAh8uBwGNJ/a+GjCI=;
  b=QZv6t1sO9NIt3XxtM9MvwyhYkTPtLDSTWtE3QNbtDkT++uWHq3hVkCwl
   /Y2tzPdXozQlbI7O3Y/dl/oUQ36RbbAreM01mSp2jeXvRLOaI5D5PVkef
   jR/qTWGUXKuCoFTgl3qH6SYi4BnnN+dXrqqTbI584iOu2r7oWmSxyjz+P
   tTGTzmGHGF8XJ+jDlAK8UtnlEoahAfliheygKUFHHYmxD+ACTrcsjdAUD
   ts6b0TjwQiEHlL49/QWF5jPL6eemKZRf0dSEvQepvjyUVu9RntmM+knDC
   2necBVwUyodxpPxhf2PyYrPAznHURymR8KlTjxks7Nz75FwUybH3In7oX
   w==;
X-CSE-ConnectionGUID: cVfgHbLoR/CzeMrETRYExg==
X-CSE-MsgGUID: X5Kmtb0/SzS7VoQHN+f3SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107048279"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="107048279"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:16 -0700
X-CSE-ConnectionGUID: CwqU/q42SC2cs8RKvDaedA==
X-CSE-MsgGUID: nPRnzosDQrWx5OZf9yCWqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245490486"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AD475121C6A;
	Mon, 08 Jun 2026 00:54:07 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wWLRM-00000003XIR-0pHq;
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
Subject: [PATCH v5 04/10] media: imx219: Make control handler ops for PIXEL_RATE NULL
Date: Mon,  8 Jun 2026 00:53:50 +0300
Message-ID: <20260607215356.842932-5-sakari.ailus@linux.intel.com>
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

The PIXEL_RATE control exists to convey the value to the userspace and has
no configuration that would need to be programmed to the sensor. Make the
control handler ops for the PIXEL_RATE control NULL and avoid a warning
(as well as returning an error) from the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e681f80f9e3e..86683fe8a79e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -556,7 +556,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 		return ret;
 
 	/* By default, PIXEL_RATE is read only */
-	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
 					       V4L2_CID_PIXEL_RATE,
 					       imx219_get_pixel_rate(imx219),
 					       imx219_get_pixel_rate(imx219), 1,
-- 
2.47.3

