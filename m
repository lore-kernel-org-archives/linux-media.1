Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008547;
	b=NBpuWcluVucfuIgv4v++dkiDr6Ld6VTpfiktyojyGkve8ldimo+np/db/CKbDort5vwr
	 2K1BqnY2LOBjKQRUFGv8m2yYqzr/dtQxyTy6iGPn6uTcFXD3o5BIg+Xb5hWVai5qQ58IW
	 VPu8C4UgItoNagvK2Vi7ZxC8QyxpSq2DpHNXTrMXbICxu7DlasiGeVyQ0SP/aTVnxLXap
	 Lr22EiuGVro7vPsd9x00mfiu0a7r7BEW28pi36SO7n+IxoOoOob2bk6NWg7wpi6CVWS+i
	 45Qj8uMnfGbaqBPrTdzt2s2Tz1BLjnui5wGvntA7nEIQm6IZxXwrDffYh43Ibehq4xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=G/GNX2+V9nbyWNR+00jmgCILOMXa3eiyG8jaPILcwW0=;
	b=WyDkbIdzyABzoTc07muo9OHcGtlNY+xzREoFjRPl4ui55odo+HqiXadAhKv30nAecFL8
	 cBiZIqZV5R28l37SClZgTKK7PYRLWlTRKmcyIbXIWPiR4grPl67fZNTUqZkyEnVWq5MGF
	 1dx6sen4wqhZhRJ5fKYWrme2+lU+RN51iRQN2eSC/bbAd4tv4PtKWSjPz896j/VW2Z5jr
	 hKDplcGlX6aieh01a6/irqEpb8L0/ojVXFX2jtqE9BlhRKBW7d9AqEME4lWa+FNBsP7UF
	 u3Q+d2vyVGv4O/RL7DNvk/zhuNZMG6VsY368PsIqm0mr54zv2OSXysXk8KlFT0ybVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6r8gMbl;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA311606A331
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA311606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6r8gMbl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008547; x=1826544547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L/MnQrv3ioGeWL0swcOG3uo+Mjujlaww18J3u/23Qfc=;
  b=b6r8gMbl9jc7a51os43LzkEZAx8OfVBgiH6BSvPHt9A/BxqaAMon12pw
   wQ6RPj/2WDmdItHKhShs19wq95ANLKMGSTLKdpRn+gpIjSNHAZouDs/G1
   Kok6JXV1Ntg+99SPrIMJW+9fvbNRdPZKUSjKl7oI+lkEPJ49AhU+M5bN4
   7M76ymSdMMvbOMbBWzXvReebtury0yZ1pmcgnm/TCu8puWxyhs63J8Z57
   XOedVAtO7G6lfCL7ixrtL2B41jh5zaO2M9r10A7jBb63maAsWKOFC0ffk
   l9PMOqhC76ItwjenZ0+lqOZQTVepHffbQri+JVG1VXIsYrgW781JrNxgh
   Q==;
X-CSE-ConnectionGUID: GOP/LIFYTHK22ditzJ5EVA==
X-CSE-MsgGUID: TemNMCnHRMuSgaUjFjWPjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808898"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808898"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:04 -0800
X-CSE-ConnectionGUID: QzgjKGcbQPqewy+AKdr8vQ==
X-CSE-MsgGUID: ZRm5cl44TjSEDgb59VfR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376776"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A27B1230B0;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tc1-11VB;
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
Subject: [PATCH v13 37/73] media: Documentation: Document frame controls for common raw sensor model
Date: Wed, 18 Nov 2026 15:27:43 +0200
Message-ID: <20261118132819.213473-38-sakari.ailus@linux.intel.com>
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

Document that V4L2_CID_LINE_LENGTH_PIXELS V4L2_CID_FRAME_LENGTH_LINES are
used to configure frame rate in common raw camera sensor model. Also
mention the controls in camera sensor documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst         | 8 ++++++++
 .../userspace-api/media/v4l/subdev-config-model.rst       | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 316d14437658..7f762d59eaa8 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -61,6 +61,8 @@ There are two different methods for obtaining possibilities for different frame
 intervals as well as configuring the frame interval. Which one to implement
 depends on the type of the device.
 
+.. _media_camera_sensor_frame_rate_raw:
+
 Raw camera sensors
 ~~~~~~~~~~~~~~~~~~
 
@@ -78,6 +80,12 @@ The formula is bus independent and is applicable for raw timing parameters on
 large variety of devices beyond camera sensors. Devices that have no analogue
 crop, use the full source image size, i.e. pixel array size.
 
+The combined *analogue crop width + horizontal blanking* and *analogue crop
+height + vertical blanking* can be controlled directly using the
+:ref:`V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
+<image_source_control_frame_length>` controls, respectively, should the driver
+support them.
+
 Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
 ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
 is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 0acb48a0bcce..46248c9d50ad 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -260,6 +260,14 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - Embedded data source format.
 
+Frame rate
+^^^^^^^^^^
+
+Drivers supporting the Common raw camera sensor model support
+:ref:`V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
+<image_source_control_frame_length>` controls for :ref:`frame rate configuration
+<media_camera_sensor_frame_rate_raw>`.
+
 Embedded data
 ^^^^^^^^^^^^^
 
-- 
2.47.3

