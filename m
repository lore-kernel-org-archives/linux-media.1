Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008548;
	b=IghuNN2QDd0ThPs9IXw592XH4+ycFA9kVJejKLQiC3OgkTKwJOYFMuj0aEwqQzP+QfsD
	 43iCbIFF99iJ3uEMpB/Zs65d8gyvEtsLQxEw5oHijW++mxFGaGug469FXFlgyFUSYmsNR
	 KQh4WFPcMT6R1UFFWdkHxFaCdBfHUzD+B2gX/h4/RrWdP44JXae7MWBpP/kGEk4CvWN/n
	 GyupZlvCcAcDdjl5zPBPrMR0Hcd1ptA2fJiYmQ+Yfl/aROXL0mBgGObLKojG/J6aTITPd
	 GEG89sCWjBo9v1O0xURn/W3zHZUaGe7+b/tyIP5jnnhhh9P7JZ1vDrnyd9w95rzi/6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=iVKpHqvPhjNWz8cGw2YlBrMWPMCieH/ktf5+/9fmSXw=;
	b=iC+TsVRwuDrpxpDK9tYrL+IPzVVJbLuQYTCTNv197ETE9lwMOj9RGfs8oC+QNZXA15cx
	 b3ZaEFKyuLQGiSv4Z5LjiLYsY8DKIhUkIt1H4uWfKYHelPqB/rYwUA3xxcT/+MHw6MlL6
	 Rx+4nZSy/+LOTCZGiQZZE+Wp6S2+aHkSP6ex7tmlEqAodaflpVAOWAbUx8L0N4SoDoJII
	 zUMnPFOVZmmqdUaI2QoSGEaqik7sMvueUeQH92dRBdDHC8pdMlfomowTQ8ux5Cy8FaGul
	 ptfDLDKxofsQjNplIeiuRrTBs79aDkEcggoEaaLkowBnF6dqVmm1jnDV5OIBShLKQrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQaBvTr7;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543E60A2614
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5543E60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQaBvTr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008548; x=1826544548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e6cd09r0Msv3gDu5j/Y8lQzKsaijNQpyuGuc80Gwgys=;
  b=GQaBvTr7o1eBjROrYJPHKaHw6BBXpM8Dul+l4YjcLRF6qvIVEBl66+/a
   2x8IepRcBN1Tzqk2zausEztBPK/NNTcrrmbC+5lRznAuoWvW1feqVIR+x
   Uj4vo/8fK8gFiLU2JYU98+cDGrwqdji3TntX9WnxUqWnsU3oM6VjdWWFw
   NW2M1jUKajkMDn61hp/MCDFwZCrRwn6RZiv3AuIPEoCHagNYLa+BzlOVo
   qZ8onFO8k+FN/d2TU7v9+OX4Z6PlE8VbB0kk4eEvnCa0ARYabG+DqNr2I
   CITjBKUf2BKm+lked5KRjSS98u8UYo4cpJyiMRu3ohIUR6zcSZGDFv/7i
   g==;
X-CSE-ConnectionGUID: cuGjuXOeQPioICMZrGS+Gg==
X-CSE-MsgGUID: 3Y8v0VHsTym0a6AYW+RmqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808945"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808945"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: zI7SqK4KSJqlrCEm2ZBO/A==
X-CSE-MsgGUID: FudlarWXTC2SrvxgUWSHYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376787"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8716F122FED;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbd-0fIo;
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
Subject: [PATCH v13 31/73] media: uapi: Add new controls for camera sensor FLL and LLP
Date: Wed, 18 Nov 2026 15:27:37 +0200
Message-ID: <20261118132819.213473-32-sakari.ailus@linux.intel.com>
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

Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analogue
crop rectangle and horizontal and vertical blanking.

The reason for adding the new controls is that they're much easier to use
as the user doesn't have to be concerned of the analogue crop in the same
context. Secondarily, the newly added common raw sensor model uses
different values for the same.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
 include/uapi/linux/v4l2-controls.h                     |  3 +++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 0613c310ad0c..4e307957c80a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -204,3 +204,13 @@ For instance, a value of ``0x0003000100030002`` indicates binning by 3
     Sub-sampling is used to downscale an image, horizontally and vertically, by
     discarding a part of the image data. Typically sub-sampling produces lower
     quality images than binning.
+
+.. _image_source_control_frame_length:
+
+``V4L2_CID_FRAME_LENGTH_LINES (integer)``
+    Frame length in lines. The value of the control is the number of lines
+    captured in the sensor's pixel array added to the vertical blanking.
+
+``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
+    Line length in pixels. The value of the control is the number of pixels per
+    line captured in the sensor's pixel array added to the horizontal blanking.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 57c928be1992..5444a6986d70 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1164,6 +1164,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
 	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
 	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
+	case V4L2_CID_FRAME_LENGTH_LINES:	return "Frame Length in Lines";
+	case V4L2_CID_LINE_LENGTH_PIXELS:	return "Line Length in Pixels";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 1ca522b1e80a..8671ac06002a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1277,6 +1277,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 14)
 #define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 15)
 
+#define V4L2_CID_FRAME_LENGTH_LINES		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 16)
+#define V4L2_CID_LINE_LENGTH_PIXELS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 17)
+
 /* Image processing controls */
 
 #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
-- 
2.47.3

