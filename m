Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008550;
	b=i5N8t1WL1tMlnLxTaDYVqIdJD1OUyS8eQl4fpC838jVMEtfFotAkHmrVYIvHHFWOut8H
	 0wCNgb+O83zbWqsUe2DUmMp0lnGN/bA+LCi8B8U8siXniMp7LcF7AeV/p0N6YVI+RrBq5
	 JGsUdwMZaW++S2+HVqTtZQOP9uWQfAqte92L1FU5ld1i3II09iN97dg/WFle6VgokCR7L
	 CpeJH79eCd0vMM0DrOXawt7HxILAZ8DRbKeRG4gKLo4Qfbe53sT5Z4BeRNL/70NmBGNxE
	 Q5w4kEE1PhiHuiMkSa8Fk4iNxWHNvIdKen5yKxNkhgXDgnpkKx2vhoVbzEgfWGYKPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=t/os8LzKU8MGL6l+hqSVx5LcDLDLVCabVFHqnCnV2TI=;
	b=5AYnUeDlN5EHrUoNAZYpx8uY84kmuIJGRMyO/M6cf/2PAWYx6I/zzkcrsrTHJMOPy/5b
	 9zLEAfpOdlaPMyvcnfq0paxNRk2jdM+DiFiD4ZeKx68ERIiGj/H0VIj6biYRDTOAlojpp
	 8uLO8ssjVnXUPK9LQ8oKuSTL9zJnN39pYjTZHmwxteVlSeAbw5AtpCUyXGyt61tavexWM
	 ujm1QW3hN81M6soUhjc5lt4jPACHioacEX397fa9fnV6hR8KHVFXyyFhbWzQDoT9NmolZ
	 +5yH2qhhsmeo8xplXrRj9JkzItNaEuvEAFjUwAJY/CSATyrTp7wC9+Tz97478cyKuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aLxcwffU;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41002606A33B
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41002606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aLxcwffU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008550; x=1826544550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ERvepEdQ8VoQYwYptq8vQwH0laYi1DcaspkPO2hsAjM=;
  b=aLxcwffU5FHNRPTIlNA+Muxcc/3Q31xzKQ5g4nM5r8EniHv0lsy2ZxD1
   LIenNqVWDQz5hfvrRo6MAqo4lL9p3P0dyyX8+iXeWzaIkrgWJkhYdSQUU
   Z9/ppHAopeNI95obnYXPJdlYeOgNBVbUJrb+Ub/u0RTs9Yovv+j6xv/5J
   lOABkwP0j7t3ZGUz8jinWQ5JH2Jk4bu7CNdb05avHWkEzwgwJmWzhfXJ7
   XzrPiiOvtd494FLyRV/D+d2Zq8OXMdQtn5RAHXgDCxqHs1SED6CYELBx5
   xpd00IaU97rnGtNCatAPoI7p8QfsThH8IOEE58M/5M6VvggX9nAnW8+g5
   g==;
X-CSE-ConnectionGUID: ux0O4fewTKyFbtk36mPyug==
X-CSE-MsgGUID: mrQT5+UnTuuCGnYdSFkLWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809051"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: KdO0kDi1RCGYgzCmvtvDiQ==
X-CSE-MsgGUID: X630NR2kTSKf3eIhtRPeyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376805"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CA7E9123148;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcn-1pWy;
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
Subject: [PATCH v13 49/73] media: ccs: Add IMMUTABLE and STATIC route flags
Date: Wed, 18 Nov 2026 15:27:55 +0200
Message-ID: <20261118132819.213473-50-sakari.ailus@linux.intel.com>
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

Add immutable and static route flags to the routing table. The embedded
data stream is always there.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e8706267b6e8..a799d16f1b0f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3383,12 +3383,16 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
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

