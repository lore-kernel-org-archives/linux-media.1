Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008534;
	b=iuVY1c+En/cIv/70Ltr6VJ/fkRvJAp7KcPtxzchPvoACj+cINiJWbcWijqWInVOkfSRx
	 y3cy7s+iIkUBeWesibPpbYp2fXGE5kQVw+AsfxPaZo8gjF7xX/HS0s0KNuv5pbV6HMszy
	 02KkDMM6W1pPCsOCFUz5REaYuNdsuKAsvK+HG2Pq3MclY2VD/Hf3Tn0RsxXUAFCmomgo9
	 mw+Hj6wfc+sT6T1pLHkTrygQho78Wv727Q3fSUDaf44fXNkNRdAqxtEcotBlFT8ag4s0r
	 liEAtVG49OH+Rz3taVkZ9krinuz/hdJm/v6Cx3ImimBs+QvLgYnHzHqFMEzfvBV+Ndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008534;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=HwJlaetbEQQNRmjjXQ4QWwMaCuLLObW9mH5aejm22OE=;
	b=fwazBPiVHcYZ11XfpdTtxouPPVep4QnYFCd5R0ySrkCoZZ3btG9yBk4XKlip4nxMSOqZ
	 ykELH82XBjeatIRSJiXukW2iD47w7qsIq0zbOKIre5rba29ybwtAMTm3WTkVg8TOnYTEJ
	 M4giR+0DCmFjqqHypq5Cu6PIvOrQCON1nPwxAVYGulM/qJbcgozjERfUcFi0cO+Kvfv6L
	 mRH9EXku+7vd8CGjLnuCWdSx0IJKiMLtbb48dRAVWQpIYCusBNwGpbEGfuRoGfKMR4xIH
	 oJ5u0nWNbrCaIjXcsF3bdYpSh/xNRNQHAgzhgs3LPbLj8/SdqHrn35KEdJoyK8FiUaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vb5yV63i;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A1D60A262C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A1D60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vb5yV63i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008533; x=1826544533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CZuJPWvxP7ISGVuq5l/Qhy8/s4d+xu84uhlRe2oDf0k=;
  b=Vb5yV63ioYVUnpWULtUm+JexfssIgoi9kGBShSk3Xsk59saoQzZ3EExM
   WIDTzZDMZxWXqxxE/cGuUVY8NlUVHQe4hSIjSL+GuhUGBTtYYHwCUvnHA
   VLqx871+m26ZvyUZCefylEDOFAlx4k/VAXE0V/MBuGRW5hyXLQ+qloYQg
   HhtPogOnI+XBX4UKNOgZGvn7aUGN/Nx5iNlTzdSOzircP+kW/HHi5PTMN
   mue32GOiTJ3SiadhnNqZ03iX4nV6KyYrbyc/E7fKzIjUpbB7LzdrkpTmQ
   t2/5K40+PpVI8QbjRs10Ihc5PGqugQ3/Dy7O373U3YMPEblta4hcJhosT
   g==;
X-CSE-ConnectionGUID: FqrRW6oQQhmP8TbD8EqyBA==
X-CSE-MsgGUID: LWQV81baTrKzo/wf3wAfSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738971"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738971"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: F/+s4AsMSxCTcNaVbWAOMg==
X-CSE-MsgGUID: adyRJB+3QhilBrnf8kezHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076087"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:41 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18726122D43;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tZx-31wg;
	Wed, 18 Nov 2026 15:28:19 +0200
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
Subject: [PATCH v13 05/73] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Date: Wed, 18 Nov 2026 15:27:11 +0200
Message-ID: <20261118132819.213473-6-sakari.ailus@linux.intel.com>
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

Add the V4L2_CID_CONFIG_MODEL control for the configuration model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
 include/uapi/linux/v4l2-controls.h                           | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 57c2baf34acf..15566f409ca5 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -59,3 +59,7 @@ Image Process Control IDs
     control value divided by e.g. 0x100, meaning that to get no
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
+
+``V4L2_CID_CONFIG_MODEL (bitmask)``
+    Which configuration models the sub-device supports. Please see
+    :ref:`media_subdev_config_model`. This is a read-only control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490..66ec7b911e4f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1167,6 +1167,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
 	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
 	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
+	case V4L2_CID_CONFIG_MODEL:		return "Sub-device Configuration Model";
 
 	/* DV controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1488,6 +1489,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DV_RX_POWER_PRESENT:
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
+	case V4L2_CID_CONFIG_MODEL:
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*type = V4L2_CTRL_TYPE_BITMASK;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		*type = V4L2_CTRL_TYPE_INTEGER;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..6b97ee905c43 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1269,6 +1269,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
 #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
 #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
+#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
+
+#define V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR	(1U << 0)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.47.3

