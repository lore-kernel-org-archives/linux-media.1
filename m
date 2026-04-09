Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731203624B7
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765742; cv=none; b=ZDTJFS25IEE6mLjMF86wn7O5T/ZwaW4hIiwalLTZA3emeapfhrVP/BVKFxALVvsN7n/+nNEInCeGDRA2uqV8wL8aBmtmSvOVz/WYjspyJEIn7zuEyL1Zwi1bWKSMmgJtao+qA9MjKiaDagauIH/F8vgZ3DP8LLILbIoWPZfLA8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765742; c=relaxed/simple;
	bh=px+cDRuLsWl+ObaXs+aYYd2oJB1nucq/U/6hURCtrxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBpKjpSFp6b7yr0qSFUT7+utOMvqh2jIIUSuNHdYu0nmtyTokPUbgrzqcpQh1ZS6K5ZE2FPLafP668wuTsW+sbgKuqj0c5ORLh5JD7Xtb1zV0V52VXn0jDgmQ9JCo2LWOALh9ba4gysB1NjmhJxxSjP2nb6qxrU8fmmjwCpQprA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKDC2jSw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKDC2jSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765742; x=1807301742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=px+cDRuLsWl+ObaXs+aYYd2oJB1nucq/U/6hURCtrxU=;
  b=BKDC2jSw6QYBSXzfr0o0yoGg2fnsHhtPAVXwPYmTEonCnc3XVN/G+bku
   /j7+lViLwDMYSqaKwFs8j+KiadfUv8zcEVlNd6yAZ4SGYC8JXQUIPorH5
   1R5e8LS1zoPSHm5bJ76yh21YZXLnLPqS3eEglY1ZusOLZuIQ1xMwDWMNT
   TShwyhsJFU7a8y2zoXNTh12Wg1myZnk0wx9Z0fNWn8OqwHnS+Q3Jq2hGV
   i5Wb/ggqmuseH1RzaEqQNq2gEgki2tMLTC6z4xq7oy5VKtjpQamJbLRre
   J9Y5O/axBhyZAkQJWrOaQ5jhZiwE3QXpBWfIX3S1DN4oNtxP51o5KcuRY
   g==;
X-CSE-ConnectionGUID: xzdCRY0tSYWGlYi7P0l+Dg==
X-CSE-MsgGUID: ksXS06q0Tm2f6iOQj3QdNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176729"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: vKXEQ5LgTCejjDKki24FvA==
X-CSE-MsgGUID: B0hBPz+ZRqKvakfFHUI04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047633"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E63D6122954;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045ni-1TBj;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 47/86] media: ccs: Add IMMUTABLE and STATIC route flags
Date: Thu,  9 Apr 2026 23:14:22 +0300
Message-ID: <20260409201501.975242-48-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add immutable and static route flags to the routing table. The embedded
data stream is always there.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c4fe400d1cef..af68aa68897c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3386,12 +3386,16 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
 			.sink_pad = CCS_PAD_SINK,
 			.source_pad = CCS_PAD_SRC,
 			.source_stream = CCS_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE	|
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		}, {
 			.sink_pad = CCS_PAD_META,
 			.source_pad = CCS_PAD_SRC,
 			.source_stream = CCS_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE	|
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		}
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.47.3

