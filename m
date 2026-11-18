Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008530;
	b=spSxREuHooPNlG/LQjWJ4r0NlSUahAnpTeYJK9JhrGcs6nbkG/0maZEs6LPc4jn2as4V
	 5O55OuLmCSmPHpGh+6+SfW8ZggIsPOcSlGvqSDDtpziQ6db12CwcJ7KbM6m1gltEndm/E
	 WLiJCKox+T/HNukE8oKMGs4WDIMgFycOwVMgHSTyPhvz2n1U/kPAp6MmDDNFq6/f0QSpv
	 +YGyPH56GzEAYbx7pPFHl7J6WVUIiTUGVoJ3KrldGJg7UM/MZOoh1bEU0ef8vWQKRocY3
	 5KrgmQJ1O1USS5+s/uRJ6xSBXo8ngkRK/e20gcEwj0eOKle0l6fv8G/4/rLE64N8SDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=dMcGCY4KL9VE3KkjGRk5zLIb7SArI8uuxoVnIEDssr8=;
	b=gRwpuplpQRTDPzXOFSFpPXeWI7Wz7N26WpD/SDuDvRI0s9lGmy2Bd4eVtuuRwtumPBLq
	 CBU/8LWRly/PhMkWhea2zcpZtI4WQh1V3/fEZk9lk82Ar/sR1aIF3nb94LVzhnCWTE9aN
	 y9WHCy5CthFIwbL4dOVuID5Rgc8ljNg9RpiuIIohglgWXj9P7H3oxJJMhun1XQv0FhBMh
	 ykSG38nLx+gcIhOFBFxktLB3i1fZCjTeWy+KoWZi75OcHDa0ea2WEPe1MWKP8sXRPP1qZ
	 DAPLctQnpR111DmRlte7lh5pMtZQTrKXQdYV8ZzcRx6dnPdnDLT3dge0/rY4D9nDWSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0ddML2y;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B760A260E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7B760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0ddML2y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008531; x=1826544531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FamP04/RqVdu56kY9frHn7pKQWFGaHMB/rh3QVLs3w8=;
  b=f0ddML2y3lOweeX0ijctcprH47qNMjxdXQD3nd8Z1iP8gS7I8LcEt7Qu
   A+T81C1442B9lA3WuT/bWzgTg4wjFa+eG0xlEPar/B/0FHkOzkZ4I/jHM
   NxuUqiDImCf8S8edMs/SS8IIAWfyfbhDYDmO7Vu+XkRVcDyiBT8D1u4wG
   /wxTop0AlXWV8vxo++tdLLr4xZvqHodz6UOtKCgXiw0A9xQKmR7X6sxUD
   l09rR+4zaETs2CrFz5WRGp16pZkBGNtIFfCKSNJ4j8Npn3boseKp5vDnV
   WJuLuiv1M7Fcq0+Wh+PmxwrJIKFAWK5BO7lm0IQMQsuKB+L2GosRL5xl/
   A==;
X-CSE-ConnectionGUID: NQiAtp12SISpBoS1tAG/+w==
X-CSE-MsgGUID: gMuP8L7vQe6Nzofkknirpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738863"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738863"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: +f+szGDlSySLJPCBnFDpgg==
X-CSE-MsgGUID: thuHUHgVRZeD7dizEPbRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076067"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1660B121E56;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tZt-2yFB;
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
Subject: [PATCH v13 04/73] media: uapi: Add new media bus codes for generic raw formats
Date: Wed, 18 Nov 2026 15:27:10 +0200
Message-ID: <20261118132819.213473-5-sakari.ailus@linux.intel.com>
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

Add new media bus codes for generic raw formats that are not specific to
the colour filter array but that simply specify the bit depth. The layout
(packing) of the data is interface specific.

The rest of the properties of the format are specified with controls in
the image source.

The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  6 +++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c9999b929773..fecb786cb8af 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3855,6 +3855,33 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+Generic raw formats on serial interfaces
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Those formats transfer raw pixel data typically from raw camera sensors using
+Bayer and other Colour Filter Arrays (CFAs) on serial interfaces. The packing of
+the data on the bus is determined by the hardware, however the bit depth is
+still specific to the format.
+
+.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: Generic raw formats on serial buses
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 1
+
+    * - Format name
+      - Bit depth
+    * - MEDIA_BUS_FMT_RAW_8
+      - 8
+    * - MEDIA_BUS_FMT_RAW_10
+      - 10
+    * - MEDIA_BUS_FMT_RAW_12
+      - 12
+    * - MEDIA_BUS_FMT_RAW_14
+      - 14
 
 Packed YUV Formats
 ^^^^^^^^^^^^^^^^^^
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 6005f033e62c..83feeae6a31e 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -190,4 +190,10 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Generic (CFA independent) pixel data formats. Next is 0x9005. */
+#define MEDIA_BUS_FMT_RAW_8			0x9001
+#define MEDIA_BUS_FMT_RAW_10			0x9002
+#define MEDIA_BUS_FMT_RAW_12			0x9003
+#define MEDIA_BUS_FMT_RAW_14			0x9004
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.47.3

