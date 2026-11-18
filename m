Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008529;
	b=S+gPNV/Th34aEkSA6h8RaDGqKenYobR5VvUqieFwzP2hCHDadHzPztPX4F2Ma5FTNJAY
	 Y+hFMqeEnxKrY5XOycevVmEnQLSVgcYQ0LtWc0Ns0nQik2qq7gQGyy22TUQrsn1KaebRb
	 f58iTYMoCFiRRh6QSzJ472WbbcbaK7teruM/oqPylDRkIzRlHARV1xuzCJmF5qL9YfhQF
	 IApDQSnrpizGVzbOMHwRse8F6hSZ4uUSYzpLm2OryKoynHkCd5EmfuGHpgA5ChtuhbDMa
	 5YdzWC2OWasj3rPRd7+Ef4DAChatiS5/UkC/9Fqj/DRO05Ra7XzM9j4/qo11YGdjBug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=CuL8GU6SlYj7FoIvrXoWq5i6D3y2cN19E4Fy8NNv3EI=;
	b=JzF/F3ZXXTnBwCcOz6jGC7mjiIUcREGvvvqu7qLoX/mLqL6VJRCsA8nlUavgOBmdBD+S
	 wiM1gZwmpLKtW8ClqrBDByy8N1tcyHldxBuXb9P7erZdkB96KZrb+2SZMkXFdPxKh1uVY
	 /bRhHQMTikEemDqnZHf8v+q3iBKiumdQYob2Gz8Dd06WRkya2aIUzbJ0YDvxFJ/zq1fpD
	 x7nu2cHsrjx5jggtcTybMN0MgihuchVwVGLEWfgT03ea+TCCVV6ao6jyz0arK++kbso3K
	 JxnjNc3ZciMEmGAols03Nl+37AISLBiy5dGJ8zRU6ArQnn+oEhjYrzIuhj4dO7ucBAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="n/h1N0A6";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F771606A333
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F771606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n/h1N0A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008529; x=1826544529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4rgdW5uzaR1QMGj/Zb3Y9UAm81DcYtufok1ojK5yVr4=;
  b=n/h1N0A6qWER1VqtXeGrYhGEmsEhYJ0gnn5yDFwO3XiQ0y6iV54byIbe
   p335k0qYFNOsTQX2NFr2tmE5YcuBsF8IUrT52t5sxeqxaCYaNKNscKH8C
   h0ECu7HvBGXs2FP9cxgEN8nqc0S9UvT/xsEuZjPC7tx7h/wBuFrH4T6nJ
   OkkjdWqfj+3tSyl57drIZHYrQGwzpkoWxX5Bgf8kVkP+PexWlOCl4ZXR8
   B5lnV9LR0w4/YdgNnD9+DC32vIIZadkPRLQ/N+j3U7sXj00P7j08l2wFd
   aHrqJUQc/3KPz2eWZlABB0zw17gEVIZu3rfVi26F6HP3fV3zgSqcUuH9G
   w==;
X-CSE-ConnectionGUID: oQyUe0wURPiX5A+4U3g5ow==
X-CSE-MsgGUID: 2hd+bzXzQCyg4DhE4B4W0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738787"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738787"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: 8fjo03jESbGM7PPHK3NvqA==
X-CSE-MsgGUID: ucpjPYD9T4GcvdffUcAQqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076055"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18DFA122CD2;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teM-37zG;
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
Subject: [PATCH v13 69/73] media: ipu6: Add support for raw CFA-agnostic formats
Date: Wed, 18 Nov 2026 15:28:15 +0200
Message-ID: <20261118132819.213473-70-sakari.ailus@linux.intel.com>
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

Add support for CFA-agnostic mbus codes and V4L2 pixelformats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 3 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 3 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c  | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 152545427930..b24c89bba579 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -51,6 +51,9 @@ static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_Y10_1X10,
 	MEDIA_BUS_FMT_Y12_1X12,
 	MEDIA_BUS_FMT_Y16_1X16,
+	MEDIA_BUS_FMT_RAW_8,
+	MEDIA_BUS_FMT_RAW_10,
+	MEDIA_BUS_FMT_RAW_12,
 	MEDIA_BUS_FMT_META_8,
 	MEDIA_BUS_FMT_META_10,
 	MEDIA_BUS_FMT_META_12,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 60070842ee68..0a15763d11df 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -33,6 +33,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_RAW_12:
 	case MEDIA_BUS_FMT_META_12:
 		return 12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
@@ -40,6 +41,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	case MEDIA_BUS_FMT_META_10:
 		return 10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
@@ -47,6 +49,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 	case MEDIA_BUS_FMT_META_8:
 		return 8;
 	default:
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 165c840e92a3..0e30725dda2f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -99,6 +99,14 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGB565 },
 	{ V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGBA888 },
+
+	{ V4L2_PIX_FMT_RAW_8, 8, 8, MEDIA_BUS_FMT_RAW_8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_PIX_FMT_RAW_CSI2_10, 10, 10, MEDIA_BUS_FMT_RAW_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_PIX_FMT_RAW_CSI2_12, 12, 12, MEDIA_BUS_FMT_RAW_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+
 	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
-- 
2.47.3

