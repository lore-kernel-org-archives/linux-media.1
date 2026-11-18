Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008514;
	b=4HgLiOEzOMxIuc3ldJOVn7Q6F2XY0nYFLt0wzgaR5kdPhn2PbSnZZT0yNlpUGzvxERkg
	 3X6zXeoc1H6w2waKZxfXgWlOugG1VQ9NaKBkup6jpwpKr1Huw4EGnd2QnJlmLquq+bWCp
	 WE//D6bZsPLbqcVZWxhtJAn26Nn4HpgJYCkIG2FNqsM4/UQX8Z+Clbz483QFJvG7bFfLA
	 dkM+WNJbaU2nQB40yMKV3ijn1LCegH6LDgjzcQYj+m8yqT4NqOPJFk7Q3H1vI4S5kNHNX
	 o70ph+afhKVotvkOR7oJWDawoOAr3fbmBoXwpSUyJlDr3YwpDeJf6TBMfhafXlRwGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008514;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=xBKwTjB4CLEkx/Uyqqk3cLdzhQhbKcs9srUpo6L5mNg=;
	b=Y1Eu5NqZr/mfY5e/3En+TCMUT69UFQnhfuxHRO+YeS7fF0wn3tLlOZYUIs5LQ0xKFLOJ
	 YUNA+JZcyTcqm+EbFlUVPUpFqsq/536F2lS23I5AeDfV00PcRpyi6WyWyUX3zIKEAQRn6
	 nO5KJ4kzawHIf6VAiLOhU6tT1EA+dZaYpFZs9ahEgkAnTRj+Y6NA6iiPx5zO4mR9Rd5FF
	 lcUaC6WfHztPFlzlwnM2nDtb1PbMJ2D4EsReutR8UHBZYDCzd1iFaQqei59Rwl/2j4GJx
	 1VA1r9kruWQTPjCpsWnt8HD5eLMTWVSHb8B9C1wmZjPKCCeQyb7cNJgbp+kukA6jrKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="OIW/YjX+";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A58606A33A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A58606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIW/YjX+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008514; x=1826544514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1bpJmFfMxt3+WBsntK5+NfHkw6RxrwcFl/I/JsEmr/w=;
  b=OIW/YjX+2HpFgjZF0WAsfxUkvaHCmTAmW5sEAoZpBFf7tSbBja8PMqp6
   Dy2Lfz6DZMS6FCNYhgy5lCJyP3ffot5LFvUUxHEKWr6YImE3UTm6Br/Bi
   pLSlLlxMLeODrwK0b9o7UbPpNVU0TDwvn2EPoVqznV/RfOYLMigSDtEFW
   uVx7uUCBh5Krftm5U2lt0tzqFAiYpfFy6NaspTnFpASxMxxB+mchOh6ik
   MQm3Awe14/MUH97CD7111lC+Z3Q0ZV4CXZBHjWNpYixuLLPMmg0j5VkvJ
   pGXGppECiIvTnqw3lHwfASE17EWy+ESvkq0IWWt3QmbIMjPArKSv1RQ1P
   A==;
X-CSE-ConnectionGUID: gVahCuqlSy2/x2WK1SOlyw==
X-CSE-MsgGUID: TUmttya8R5WW/2YgapVLBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702649"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:32 -0800
X-CSE-ConnectionGUID: 5YYcBIQsRA68eh+5BIGmEg==
X-CSE-MsgGUID: 6pIIewlQS+KzHyHW9IMNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678010"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:23 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C84E51201B5;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcr-1tzq;
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
Subject: [PATCH v13 50/73] media: uapi: Add metadata layout for ov2740 embedded data
Date: Wed, 18 Nov 2026 15:27:56 +0200
Message-ID: <20261118132819.213473-51-sakari.ailus@linux.intel.com>
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

Add a metadata layout for ov2740 camera sensor embedded data and document
it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      |  3 +
 .../media/v4l/metadata-layouts.rst            | 73 +++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 77 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 335d38271d2c..b2c515e519f2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -175,6 +175,9 @@ Image Source Control IDs
     * - V4L2_METADATA_LAYOUT_CCS
       - :ref:`CCS embedded data <media-metadata-layout-ccs>`
       - 1
+    * - V4L2_METADATA_LAYOUT_OV2740
+      - :ref:`OV2740 embedded data <media-metadata-layout-ov2740>`
+      - 2
 
 .. _image_source_control_binning_factors:
 
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index 0f8709f2e9af..b4d04d82662b 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -39,3 +39,76 @@ format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
 
 Also see :ref:`CCS driver documentation <media-ccs-routes>`.
+
+.. _media-metadata-layout-ov2740:
+
+Omnivision OV2740 Embedded Data Layout (``V4L2_METADATA_LAYOUT_OV2740``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Omnivision OV2740 camera sensor produces the following embedded data layout,
+indicated by ``V4L2_METADATA_LAYOUT_OV2740`` metadata layout. The format
+conforms to :ref:`CCS embedded data layout <media-metadata-layout-ccs>` up to
+level 1.
+
+.. flat-table:: Omnivision OV2740 Embedded Data Layout. Octets at indices marked
+                reserved or unused have been omitted from the table. The values
+                are in big endian byte order.
+    :header-rows: 1
+
+    * - Offset
+      - Size in bits (active bits if not the same as size)
+      - Content description
+    * - 4
+      - 16 (10--0)
+      - Analogue gain
+    * - 6
+      - 16
+      - Coarse integration time
+    * - 10
+      - 8
+      - DPC correction threshold bits 9--2
+    * - 15
+      - 16
+      - Output image width
+    * - 17
+      - 16
+      - Output image height
+    * - 23
+      - 8
+      - MIPI header revision number (2)
+    * - 31
+      - 8
+      - Vertical (bit 1) and horizontal flip (bit 0)
+    * - 32
+      - 8
+      - Frame duration A
+    * - 33
+      - 8
+      - Frame duration B
+    * - 34
+      - 8
+      - Context count (2)
+    * - 35
+      - 8
+      - Context select
+    * - 54
+      - 8
+      - Data pedestal bits 9--2
+    * - 63
+      - 8
+      - Frame average bits 9--2
+    * - 64
+      - 16
+      - Digital gain red
+    * - 66
+      - 16
+      - Digital gain greenr
+    * - 68
+      - 16
+      - Digital gain blue
+    * - 70
+      - 16
+      - Digital gain greenb
+    * - 89
+      - 8
+      - Frame counter (starts at 1, wraps to 0 after 255)
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 66f509ad105c..b860b37e3efb 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1273,6 +1273,7 @@ enum v4l2_jpeg_chroma_subsampling {
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 #define V4L2_METADATA_LAYOUT_CCS		1U
+#define V4L2_METADATA_LAYOUT_OV2740		2U
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
 #define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\
-- 
2.47.3

