Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008542;
	b=4ql+Dxh1pBm1SwrQrGQHZsurZxWl4gCzHrrEddL4RVdzdXLU57EO3x/V7UwUWReB8KDC
	 hTdreHQ2wfQFqf97iNqP/5aDDfIYB1TaRkzzzFIFv9dn1XJAgu60aFfS59zqHtjp4q9BB
	 PfGGXoGm7NRaZ5j1sCAKc0rLP+6gz/WOYEOhXN4xxrZL0ahmHgicQMh8O8kGy4HHCFsIH
	 FHwUy9PWtvuME+Ok3xftVEpTPwR5UqmNQ9NvqoSCmIJJ73S7HhpOgyBwjkH9iZ2ssDOhy
	 RRIebO5bRM/BWoQFz/ooMW/DJCJw7KN3DyO5sZhha58QSSE3e9hae2aXC3+4Gt3ATYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008542;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=iQz2zZY5+Syd+1MwpVT7oES5a+DZi6aMLRjozsDto8Q=;
	b=iNzn4PLJW14caclMNIpZdO56t5zuy3AfiZyjqB+RY2SwfTSeAuDGd7GOwmxmDrM4RX5O
	 3zKwe3lHx0mzl/751T+t/gL4+CTPCxKKZogi3NHRwHy+d5B25o+6hYx5xUIjFPhYsk7Ii
	 inQs4bp/0V4wmyyXL/V3FuLr7KRgJJAQNmxEWUgXsvTvI4dH4J2ATQKBRXKcxy56yUDtO
	 tH9B8Bba0DEFSMKBk7xO0Z3bfYPd6nue0c/8f8z7bXMcwV7cC+fV5fsHxh8xpedV62rIa
	 UzkGI0jFmu0ZezYK2x7zqo73VscVjPslIVsA7BMESCz7fYSaKa+CIEP5g9WILnIBFSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mM+1fVJT;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB0E60A2611
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB0E60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mM+1fVJT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008542; x=1826544542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MLyKKGado24TFehko3mEqr0FcC5p6QGRe3hPS3pgFM=;
  b=mM+1fVJTzcJ3XD49dXvsdJ7BXJVlPWCZSIu/ifP0ge10v//dQso49IsP
   akZp9L0znSfIkHfQdvr6FlLx8YM9Vv+Fik70sqqMhzzrIvI/2n5smw+0l
   X14cHU76BYQ1i3Ft2Sf6hAtGYumlPRf3ocbtyfN1qzJEV8dVZ9XgBB6Cz
   G/2gYQefq/R3xkJBwi6I17Vj088dnb4C+2eHOLXsFqSyQWKjGV/oyNIQy
   B7C2gbSFIXQOcAuBWJbbBTJ/+pzCsjNb9T5ppwlhib+5Eq3ZVaqXTav1c
   C8GimyATRKSP67TM9xEX0ucazhq1KQhpb1iFhcrdkEouOo4OI44/YabXT
   g==;
X-CSE-ConnectionGUID: U5rJ1HTBTQqkBW+B4hsyUA==
X-CSE-MsgGUID: i0hhuSgpSqeFrCfsGzyUFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808806"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:57 -0800
X-CSE-ConnectionGUID: HGduot7PRLavlqP4PM9FWA==
X-CSE-MsgGUID: CiGtYH+DQdieVBP/0J5ZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376723"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:50 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7A515122FE2;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbR-0Sq3;
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
Subject: [PATCH v13 28/73] media: uapi: Add V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR
Date: Wed, 18 Nov 2026 15:27:34 +0200
Message-ID: <20261118132819.213473-29-sakari.ailus@linux.intel.com>
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

Add V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR client capability bit to
signal the userspace's support for the common raw sensor model and
document it. A specific capability bit is required for the purpose of
adding support for the common raw sensor model to existing drivers that
already have a well-established UAPI that cannot be modified without
breaking the userspace.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst     | 2 ++
 .../userspace-api/media/v4l/subdev-config-model.rst         | 5 ++++-
 .../userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst  | 6 ++++++
 drivers/media/v4l2-core/v4l2-subdev.c                       | 3 ++-
 include/uapi/linux/v4l2-subdev.h                            | 6 ++++++
 5 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 15566f409ca5..be212eb80c78 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -60,6 +60,8 @@ Image Process Control IDs
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
 
+.. _v4l2-cid-config-model:
+
 ``V4L2_CID_CONFIG_MODEL (bitmask)``
     Which configuration models the sub-device supports. Please see
     :ref:`media_subdev_config_model`. This is a read-only control.
diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index ebe1a57fc061..ff02761726f3 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -41,7 +41,10 @@ necessarily offered by all drivers.
 
 A sub-device complies with the common raw sensor model if the
 ``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR`` bit is set in the
-``V4L2_CID_CONFIG_MODEL`` control of the sub-device.
+``V4L2_CID_CONFIG_MODEL`` control of the sub-device. A client supporting the
+common raw sensor model shall set the
+``V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR`` :ref:`sub-device client capability
+<VIDIOC_SUBDEV_G_CLIENT_CAP>` bit.
 
 The common raw camera sensor model is aligned with
 :ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
index da4a358ce762..50ac223e10db 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
@@ -91,6 +91,12 @@ is unknown to the kernel.
         ``which`` field. If this is not set (which is the default), the
         ``which`` field is forced to ``V4L2_SUBDEV_FORMAT_ACTIVE`` by the
         kernel.
+    * - ``V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR``
+      - The client is aware of the :ref:`common raw sensor model
+        <media_subdev_config_model_common_raw_sensor>` and expects it where it
+        is supported, as indicated by the :ref:`V4L2_CID_CONFIG_MODEL
+        <v4l2-cid-config-model>` control bit
+        ``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR``.
 
 Return Value
 ============
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4a7982e47575..a4dfae1d7850 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1230,7 +1230,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
-					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
+					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH |
+					     V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR);
 
 		subdev_fh->ci.caps = client_cap->capabilities;
 
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 477d3ce3ddb4..9d5ba062be19 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -270,6 +270,12 @@ struct v4l2_subdev_routing {
  */
 #define V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH	(1ULL << 1)
 
+/*
+ * The client is aware of the common raw sensor model and expects that on camera
+ * sensor UAPI where supported.
+ */
+#define V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR	(1ULL << 2)
+
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
  *					  the subdev
-- 
2.47.3

