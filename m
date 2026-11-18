Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008541;
	b=udSCHTMRdIMaq13vAGQSp4UpkRXsuN3OKr47zfT2Ot6shb84SsT1NZ2fY/OrWkINsfDl
	 8+wPjj8rzqHLjur3PCUH+ux+eMcF4uG5UDxpiCyqv1H5//2fstR6Pzyh4iOF3fOimAtaC
	 JHoiyIedLa+dtQSEi/CAjkNsF++hWrdprdYAwWo+CFXIG3R7RXczU6mFXqqk99JXp5s5q
	 Z3ZudWZFXD40//2ThdzIuKl63u3DmzPCdD3Z1PcKyEzLHPLarIdKeaS9AYO1cwGupjzAr
	 kY2+5crjygouuKAxk3WDV9RoIRxD6tc4O0Ez2pjzpueONkmONV7bitv37juOlV/3Zuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=wq7nL6bGf8IOjyNowBvNcQudQCZjcd2p+/ZOFOWilO8=;
	b=wkTfJRpsAaC1ayGZruP9piJQu3QcVrtUxBns04nNxliREsdWML2ay3yRB55xdUPivljb
	 jnxcm60hyvS2GOdUFO+iBJWsZ8L7PG7my9JQcQq/RXWprnR1phOimNan16KAPiaP1fPj6
	 KnyyZURUJPNQtDzVV7XegSN3Zv45XRgClRoz4p4KUED1iNQY9XfBAYyrFPOa+9w2I/RnO
	 y2I8Tu4sJaLEfYeBlSKz+4RF+LQpWmAz7qDJdzqsaJaNDEHcWQpD34IGXXP3DhKRkHFR0
	 DlFTgUwADZ58s6waVTH0e0WdGcq75qnn3CfC23PWofz3WcNtKO1ZThG/E4YHUsg1D4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juYW6mUt;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E2B606A33B
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E2B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juYW6mUt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008541; x=1826544541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=seFJq9O4Bfj98CA/DI8q1jpi9y+wadehNd6F0wmQZB4=;
  b=juYW6mUtbVbjVN+sJi+uSvhCHUdZLdIHvMQBf4I2l1Y/FQD0ujPJY4Dd
   CFLOuv9F0LXXUYaCujfOt61TK+k8JjuxYhnsPT8XR2xFsb88ynE+8nSjC
   ubdoz+eHihlFobnBJHW25HAUCTSLK1HSa7ETegXxvEzw7Hx/0/e/lHgZU
   Upwb4DPkhyCtSapHLOCIAH+9fgvXevQyQPQLyvKgWToNM5UmkRFKG6sTw
   sK2nnBtqcASEwBcNJZ2iUuVzmlQC5IrI5TY2ON2+HXmKxk71Znbaf8am4
   CenuWOWmDmfz6Pqb+32BpdL+/wPPUjrU7qOz7EueZ1mIVy5KBCLja+PQl
   w==;
X-CSE-ConnectionGUID: hphISg84QbKEmF5dbOhkag==
X-CSE-MsgGUID: z3S0pLzmRFW15k75y9vk2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808782"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:57 -0800
X-CSE-ConnectionGUID: ijq1lXPxTYyM3focKt7MNw==
X-CSE-MsgGUID: O0yNhLagQUqWU8JBwif5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376726"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:50 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8088B122FEA;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbZ-0ai2;
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
Subject: [PATCH v13 30/73] media: uapi: Add controls for sub-sampling configuration
Date: Wed, 18 Nov 2026 15:27:36 +0200
Message-ID: <20261118132819.213473-31-sakari.ailus@linux.intel.com>
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

Sub-sampling is a way to decrease the data rates after the pixel array by
systematically discarding some samples, either vertically or horizontally
or both. Add two controls for the purpose and document them. The
sub-sampling configuration is taken into account in the compose rectangle.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
 .../media/v4l/ext-ctrls-image-source.rst         | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
 include/uapi/linux/v4l2-controls.h               |  2 ++
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 893aec08afab..316d14437658 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
 
-Binning
--------
+Binning and sub-sampling
+------------------------
 
 Binning has traditionally been configured using :ref:`the compose selection
 rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING_FACTORS
@@ -130,7 +130,17 @@ configuration and users should use it when it's available. Drivers supporting
 the control shall also support the compose rectangle, albeit the rectangle may
 be read-only when the control is present.
 
-Binning isn't affected by flipping.
+Sub-sampling is often supported as part of a camera sensor's binning
+functionality and performed after the binning operation. Sub-sampling typically
+produces quality-wise worse results than binning. Sub-sampling factors are
+independent horizontally and vertically and they are controlled using two
+controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+V4L2_CID_SUBSAMPLING_VERTICAL <image_source_control_subsampling>`. In
+sub-sampling, the image size before sub-sampling is horizontally and vertically
+divided by the respective sub-sampling factors. Drivers supporting the control shall
+also reflect the sub-sampling configuration in the compose rectangle.
+
+Binning and sub-sampling aren't affected by flipping.
 
 .. _media_using_camera_sensor_drivers_embedded_data:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index d4f33e50ef97..0613c310ad0c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -193,3 +193,14 @@ Image Source Control IDs
 
 For instance, a value of ``0x0003000100030002`` indicates binning by 3
 (horizontally) * 3/2 (vertically).
+
+.. _image_source_control_subsampling:
+
+``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
+(integer)
+
+    Horizontal and vertical subsampling factors.
+
+    Sub-sampling is used to downscale an image, horizontally and vertically, by
+    discarding a part of the image data. Typically sub-sampling produces lower
+    quality images than binning.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index b1b852884545..57c928be1992 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1162,6 +1162,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
 	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
 	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
+	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
+	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 235a7e2b005f..1ca522b1e80a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1274,6 +1274,8 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
+#define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 14)
+#define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 15)
 
 /* Image processing controls */
 
-- 
2.47.3

