Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008540;
	b=lp/TXBAQ3XkFbQ31TO1lTkq5CQgxk2QR6r6N7dsBCErJTk1jSjO22+RZkbwwEE7+Vc7t
	 8GIdQCgVV/qrNnkAI3ERLud1QztxKjIydHbqrPOesO2Ykn2euEvPB8qFxZTIOX6jxcPwH
	 8C/GhgOVdWxkH6vfnl3gjc2SoOwKlg8EeCf5KVuS4UK5AOTmGMSPTiTtuy/ux8r/MxADg
	 4Hk7m7njmi5efksCpE2yHlkVSeo1l3u9MXWqhiC7R2Td29o6LYahw324A+HtkP8vZGE1h
	 OW0NWhLwffwLi3ZEU0sszGYIJCZ8fQQJuC2V3M6q9Egmr0JY6V62xTaRMCjXI//5zwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008540;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Ceeqhs73Hp1MDk5aQOdvGnSayyV3LIavTVqmXctVBVk=;
	b=xHgXEeL30ORlac1YON4hBAoC4wVbABbSZ2/dpoEzJTnM35aNbuQEifbPBN8ZYfY10764
	 8gP596CI9fw7z8ZVpDrzxg7OtQvfN+ZdhSPkYV7iUq49L/Xbjv/8yzIUPIYcjoIyiw0ka
	 h622v6DlpiIkseLy4YMvn32a0GMnSvZYCqKPWXNV/ff6fd22ZuPnJjJOy6g5/ann8kYT/
	 tIEnMPl1KFmbbQGdCXh0hrvIseFIudwlYsBikCwOGwUJWYKcujmLE0MC/pPDhLOuF+Q8t
	 eotlCAfHzvxt4/+x3dcTtNrjaEjj2tUa1V5NkABGNz1oA0HLoqTV1MxbmSQPJuNP0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7xlDZjT;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEF60A261C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EABEF60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7xlDZjT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008540; x=1826544540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OSmxAjxT0E8RtGabb4H6IpGSpf0LuKhek5dhvq6pEO4=;
  b=C7xlDZjTO/n26FdAGUEpvRj45IABDtUUWBYl/ZN2qVxjwqA0qBtX9V4j
   UVokuLR804t3dhKTlAUQk/hbDaMV5MnyT955ks9OzvLl3aRTEvwLEkS68
   UGw/oCmrHWAEnxdtUi+2Y5YVGGGpFut52X6iHWvVhW7ZNNsMjq4gvNpsY
   ytdzwRtV0bNBfxrz1ZOgDGeyIK82X+5dNbTDkPNEyqSTihrWsPputdueH
   7IaZcRVFEhVEVWignEgELA7pP4Gy7SFkJ5jM+IND13BCPo+dWCe45PlVi
   sFBwWhn0sd5eYc7fCWpIFQ078oxcjre6m+WePrJ7pWyrYbPVGkyQs/ART
   g==;
X-CSE-ConnectionGUID: 2kPRFkYURp2Ol0QqQPnqLA==
X-CSE-MsgGUID: 00ra+NmJRrWsP9z6bM2C6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808723"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: 5GMnhIg3QHSzl2Z96oTNjA==
X-CSE-MsgGUID: J/CyUGwCSHqYIpq1FK2kXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376712"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 77F6B122FE0;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbN-0P0W;
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
Subject: [PATCH v13 27/73] media: uapi: Add MIPI CCS configuration model
Date: Wed, 18 Nov 2026 15:27:33 +0200
Message-ID: <20261118132819.213473-28-sakari.ailus@linux.intel.com>
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

Add a configuration model for MIPI CCS sensors and refer to the CCS driver
documentation from it. If more drivers start implementing the CCS model
the documentation should be split into two but that appears to be unlikely
at the moment.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/subdev-config-model.rst         | 6 ++++++
 include/uapi/linux/v4l2-controls.h                          | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index a538a5c71aad..ebe1a57fc061 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -262,3 +262,9 @@ space may obtain the size of the embedded data once the image data size on the
 source pad has been configured.
 
 Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
+
+MIPI Camera Command Set (CCS) model
+-----------------------------------
+
+The MIPI Camera Command Set configuration model is implemented by the :ref:`CCS
+driver <media-ccs-uapi>`.
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 87b6286abb51..b61b047cf991 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1286,6 +1286,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
 
 #define V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR	(1U << 0)
+#define V4L2_CONFIG_MODEL_MIPI_CCS		(1U << 1)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.47.3

