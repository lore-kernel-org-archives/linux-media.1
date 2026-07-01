Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE54921BE
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908606; cv=none; b=F5v5gRm4nabKEmy8YOgfX6udfmT/sHXbhxgCZYlJb1isegfgwt3KGztpLPRTig6+2226UYlOqdNFQtSLqBRLdDvcuU5f0FA7tcnvRw+nzyAh2KriG1Y/RroDOKFaJuqGeicVar4Le1vLpbRtzoPVPL2sAtD5iE6F+h96M0ja8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908606; c=relaxed/simple;
	bh=BBFOi5uMBLpPcUTWt5xAgYchCrbxO+HiP8FtljUadYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRo5YJ4xIU/9+eezNizvWTdnajuXOEzmolpZlbxZOvMoPe0+2FZX5QOL3HOHO8sz9Wm33RfBpof5qVUYyEC0e45RTmuJHSCjtWrqpvPFFMFauITDJBJ2U659IwhiIG55GnK440XWym5L2Y1ZUITP4/0fjsIb6OAI/mVmaBbl2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dad/HDpi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dad/HDpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908605; x=1814444605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BBFOi5uMBLpPcUTWt5xAgYchCrbxO+HiP8FtljUadYI=;
  b=dad/HDpiNn8phEju7nmAxod6zbI0WX0LlgJZI/eGGKaF24ibMHuspPg4
   AIPsLWBo3fVYO98LFYlpIwBVDi6BACDxl3QNQYVrHGQOLBL6u0gPPuuLh
   zjMN5hAlISAjc9/Tf6+rNmAm4aQn6258+PqdohraD9Tdp3HRpqMmekCln
   QG4kLvtph9Ug+1npsQUAxJTJ9ijePYT0L4BdX9wygz7rcLaS26H2lzbkH
   OU1qendna2/Gzk3ApJMl3WI2OXofbk8cnWv+vE1Rd5cn600zK2CswMis7
   dXropcbjkdDLhjzROWzLBEfhrkGFUeDr8Yn3qKsQTQr5DSAMaqD3CGeH+
   w==;
X-CSE-ConnectionGUID: jrNpICDLRH6m4P5YJi+EMg==
X-CSE-MsgGUID: rfFp9ZyIQZGd79vGPmCMdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239175"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:21 -0700
X-CSE-ConnectionGUID: 6olkIP46RliNkoEAAOD0ig==
X-CSE-MsgGUID: 0gO+JyNWT2Cfvhq8GA6ATg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06C47121CFA;
	Wed, 01 Jul 2026 15:23:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007FlD-3AQP;
	Wed, 01 Jul 2026 15:26:34 +0300
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
Subject: [PATCH v6 14/16] media: mt9m001: Pass sub-device state to set_selection() callback
Date: Wed,  1 Jul 2026 15:26:31 +0300
Message-ID: <20260701122634.1728782-14-sakari.ailus@linux.intel.com>
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

When the set_selection() pad op is called from the set_fmt() pad op, pass
the sub-device state to it instead of just a NULL pointer. This does patch
not fix a bug but simply passes the expected information to the
set_selection() op.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/mt9m001.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 0ade967b357b..d8fffed0818a 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -343,6 +343,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_s_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state,
 			 const struct mt9m001_datafmt *fmt,
 			 struct v4l2_mbus_framefmt *mf)
 {
@@ -359,7 +360,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 	int ret;
 
 	/* No support for scaling so far, just crop. TODO: use skipping */
-	ret = mt9m001_set_selection(sd, NULL, &sel);
+	ret = mt9m001_set_selection(sd, state, &sel);
 	if (!ret) {
 		mf->width	= mt9m001->rect.width;
 		mf->height	= mt9m001->rect.height;
@@ -404,7 +405,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return mt9m001_s_fmt(sd, fmt, mf);
+		return mt9m001_s_fmt(sd, sd_state, fmt, mf);
 	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
 	return 0;
 }
-- 
2.47.3

