Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008521;
	b=wHvLLQn/j93CGHhJkSnETrWri5Ej3633p/wEaqhBoZKUCuljQ1b0NKhqSeBQ7rrq8ay0
	 SW9tNJ5p1lky+bZ5Vcxw4CP8c0iF1mD5hkpjPrNSGVeoGyd60lwrSq8UP0MjgJzZ2Hriy
	 NKOyipdLVMtkZo+CtJm4xALbpfqWsf7hHZIhCGpsgDaSozm9x+2jLU2HbwPyXj4GZ4b3L
	 r2ROIecy1rNoClhfA2FZLkylW3TROgwrfvvi8JpHgkD0qIan8X4OQuBm4e0nS29Mv4k03
	 ucM2pt+oAP4znSur0JglYwJYipIOZXA1hOFsfTMJTjaejod2enGuUtIYq08xvB/5h1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008521;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=A3msdyYbMMB6GRSFD9sUSJkm7UxKjFybzcAxOic3toA=;
	b=uOQoH57sKkRODgoBA+MDPCKrJYafss0VvBnY58wJDlhmMVW8LavQARmV12m16wtkB8Tr
	 IxuaUsvaa+Ij7w0f+h/15HoJNdHu6mIM1hXO5x0JYDKsRmZkBXEOJY/tUHcmDS5SPCztR
	 1k+168ecIBdOQI23AsGUuugRHNb+UOYZSWHjy/8BbvSmJKW8ymUFyKQX2CFIZOsL1xDV6
	 T14ErzrrKZ03b7aNhVx3TmjBqFvSUFtUadZRCXt2i5JI8Mw7Ms7rJ1L7CcmKhkrWYh4x6
	 0BLNMzjoikQV+YUqIaSfL5RTnS8tDvpnqd2XxrMSoVnSvmSCZagL40uK/Q4/sN5OYNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5dGD+KH;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF43606A330
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF43606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5dGD+KH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008521; x=1826544521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=km5+tvroSmVWC+pq+MzZ3CeMRasuRVVWy/bNiAi1egA=;
  b=n5dGD+KHiMkPyTnPrnSQe7f9x13hWvn7j7v84JWkJzKayq+CUxHL1i37
   L85VjNjvg98GqCKyu++iR8FNH4zaZHxy/myi5liCxstMkQmkL8v8GIISp
   S/BX4Lvv+KP5bHpLElWI8rK0XKXsaYYuV5sDyhN+B7m+WBiRQHWlY30KN
   r6uw/9pptlzYxGB7lY/0opUl2tl0Wtv/98mZvZVKJFPh7/++wgSIp2YaP
   v9YMs4fljfdX/FgnB8zAu5F7x0Jo+q3YiXEdEPCxFMSWdQh3abH2QBdkS
   JQ+FGpWY4FTRt0PQ5AFqI/N3vARcw1xWz2ESca7wxchhA/A/xVxmeLhAl
   Q==;
X-CSE-ConnectionGUID: QxEyZU9PRLiaKxPXFdcj1A==
X-CSE-MsgGUID: Wyf07Y21QZ67X38VNaBKtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702698"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702698"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:39 -0800
X-CSE-ConnectionGUID: f3l6ItQwQoOXnqAkPfT1AA==
X-CSE-MsgGUID: mjnRSDpuTXy+UMASj7za1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678028"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EAE50122BCF;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdd-2Y2U;
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
Subject: [PATCH v13 60/73] media: imx219: Report internal routes to userspace
Date: Wed, 18 Nov 2026 15:28:06 +0200
Message-ID: <20261118132819.213473-61-sakari.ailus@linux.intel.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Usage of internal pads creates a route internal to the subdev, and the
V4L2 camera sensor API requires such routes to be reported to userspace.
Create the route in the .init_state() operation.

Internal routing support requires stream support, so set the
V4L2_SUBDEV_FL_STREAMS flag. As the route is immutable, there's no need
to implement the .set_routing() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3acccb203210..882dabe2f2d8 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1093,6 +1093,28 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
+	struct v4l2_subdev_route routes[1] = {
+		{
+			.sink_pad = IMX219_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = IMX219_STREAM_IMAGE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	if (ret)
+		return ret;
+
 	struct v4l2_mbus_framefmt *pixel_array_format =
 		v4l2_subdev_state_get_format(state, IMX219_PAD_IMAGE);
 	struct v4l2_rect *analogue_crop =
@@ -1393,7 +1415,8 @@ static int imx219_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
-	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_STREAMS;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-- 
2.47.3

