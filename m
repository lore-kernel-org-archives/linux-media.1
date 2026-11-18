Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008520;
	b=tbQ0Sd0PGKvdAwArU/1IeJ6498Gp6FAEJwgPy1/d1D5hdQzJMkaW+CWXa9QD0X1O3sXH
	 VF8Kbhh3s5KOly0zBR3Q5Mf3VeZ7XC9T9eb7nIhlyGexZE37qH9CGeHeG1VxBQz6sFB+g
	 ezt/QR+ShTppqQlmPZMvO/YLgAjcikeHcPhx0qvnD0HPdw4A2S2r7XgPLWxoUWpDQrWAS
	 YDMsFLEu105oeJT2RFqQNwmO9jCVXPuRB/WnMbSzJiJLzQ49tfdcH8N6LJORQtr/B8Ygb
	 /kf2cy7RZjaOk02iH2TVobfz02LmmKzvnR63K6iK6NaIYJ9OoK1+Sv12hPv8jp7BsIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008520;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=zSfU+4E0WikbEVKGUvBbczo+cggHtaoig4HXk7Wz+KA=;
	b=EeYYPRqaMd7pRg4I5xMDGDV2Yp8HpZ54yvU9RBnZi2Uok629lqG3OqlDTnBNbB/f6Pkv
	 qU813bIu+8aZuFSuy81JVqeQMqZ2tVYoBHOHYzNsBhKgMFv5tBPT885WYDgV1+Iqti0+a
	 R1qorvgNS0YRjZSOgjaRDC9DVMUNDpWBlkwwrqsd5hAumuCHKS8VaIYgb3tpsWcanlvgk
	 BIzYsiZpcTmCM90Nc48GVcSBiTI+y0s5YAr/hlBLHJqB8cWhoumuB2QXbrBAN7o6gR4h1
	 1VjfrRGucD1m0AoUMM7xfOJeJS9PO4EmkOxuhNbiKI5k3obeofAQAyUHS4FDDI5TyXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpYckSt4;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC89606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC89606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpYckSt4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008520; x=1826544520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Xv0DTZXUmt5l+ay06+5LaxJTqQjJOfM7x+IsutuQ9c=;
  b=PpYckSt4KNMTIHHvemgE5Vkwfh/jf6o7IqRkcca2mf1m65Sv/cdRi1NQ
   fgtItH0kVxAVUGicDpV+lxvhDm9svOwYvM/STFRRAb9P7JqY6FTa7rs07
   Q36RFFooneNTkYq7X4CaP8uqufBLQnJQAuPMDLsgfzUqg3kBt1DouGe2W
   fKuzXLBo0lolyqpVFypY5Pm4QN4M6KDLRWTlG9I9OMCsqAIBDC/kPuHx4
   InjFIWywy49T+5O/7WqkIt7ywW/eqen1xK4qJ+zciAA1l3CcHZauDv3e8
   hASJcBrWZtx4dZaho3MvOcQlniY7vi2bNY7ndOUktJEVu4PmvXF75St5j
   Q==;
X-CSE-ConnectionGUID: TAAyEJtsTLeM3nd4Y5/Fpg==
X-CSE-MsgGUID: prjO6ClES6CCSmPbYs2hbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702686"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702686"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:38 -0800
X-CSE-ConnectionGUID: oaHv6sVmQ+yVAwusr1s6tw==
X-CSE-MsgGUID: +w5/8ccfQhW333iGBuKmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678026"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DFE24122B7F;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdO-2MNk;
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
Subject: [PATCH v13 57/73] media: ov2740: Add IMMUTABLE and STATIC route flags
Date: Wed, 18 Nov 2026 15:28:03 +0200
Message-ID: <20261118132819.213473-58-sakari.ailus@linux.intel.com>
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

Add immutable and static route flags to the routing table. The driver does
not support disabling the embedded data whereas the sensor itself does.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 033db55c012f..cbf47ad5f049 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1234,12 +1234,16 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 			.sink_pad = OV2740_PAD_PIXEL,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		}, {
 			.sink_pad = OV2740_PAD_META,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.47.3

