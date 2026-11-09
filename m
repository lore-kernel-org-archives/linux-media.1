Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218229;
	b=mnlGyz/GE+RAFc5esOS2+1odUOeNlHNRP6/MW44dDdZsqnqclSso1FHD2Un/zSp4C7+w
	 2S/Qtx2cMqpQIYPp6HXEqeaAzf3nGIDpgCfq36aFCUOn0u3rQtsD1fX1BB23lCn74/qkh
	 8vOVDGwpgPqO6blEnzqrHGfPw39ZwKKpfC3VU+CkAbvUnNrtubulT+wyMd2N2D/Dca4Aa
	 MqmXVAT332kQEbi9MBzdNF+UsK98PkU7+pGU8VOtWGYPSJf0XX1U9KUPwaaaFaFBmu+VK
	 n6WJFKbykapKtb2W0dNtw1+1Ubuw1yJQMTdGiucsB5D751EOBeMSp9WtCHvrFayjWVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218229;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aUFr/c1qd/gyjhyRwvMTVUr5+EN5ndIWZXacg+nV7Qc=;
	b=R7+sfoFxg5FS40QykPQCikXdlNs/FCGnjwpqcoJos2gAYY9e7YbtZ2cGIrwAhD3+KSpj
	 TtRmZhIbAHnSNwS5nyBDySqgvhTeW2lbiq0RlDJtv5v9uW1Y9EBEBj90mMml9sR+NP5bM
	 I9Ou/25zwRHZ6hgstSjI1T+WTF8dHXsFq9obawGr1ZWLSIVe1amAU67zEW3rb1/Y4oGbX
	 6nTLpazvhmBfxLI3nLfLbcDZoX/4+otrkaFqEvi544+cCNTlShMwWzU4dc1ezhPjIXUl7
	 Ff4PzTBXEK/ZaZw9FMs887qhPbCE1TU8VDz1VgJphAZV75LucH/Hu56QVWJ9WDoewJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gt0X7Y5f;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC7606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 09:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gt0X7Y5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794218228; x=1825754228;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=96ASaGZD6cWoi6jm3WnZAk7689jj427rCM/6w5rY4tU=;
  b=gt0X7Y5fzgjl/TBnIBJeWeKp67eK+9ifG6a5piUe+hiUkbsXmYQnZ9B4
   JcBXcCCHdxvQcEdcclcV57UQc2wovzYgouvju3zAWj9U2xYLZm1Sc+vup
   ptlqMe/ckdf5mUXES4gTc3aNbkyBxWMIdBzORZ68L8D2Emc7uYNfBPO1a
   kABuy4BtN3qg6gjVGbM7qJ5vCuGT5TQrFCCIxgcqFGdUbd/c5wveEfMQ5
   ZXYlq8mnRxdLGPT9C4QsNO4CFNfK9HfXVXUyUMQhDfs23gzdzyC1uNyUe
   QbE9VvAw42GQROi7znJyNS5qTYtqP5j8jA0okejg/G0eh6EXtXwQgLABa
   g==;
X-CSE-ConnectionGUID: qduYt7o1QCy2d6Bchr3YUQ==
X-CSE-MsgGUID: cff+w6iOQ76u7z4ybMI3Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2931345"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2931345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:57:06 -0800
X-CSE-ConnectionGUID: xk5x8NlQRWSfQPME1lJ1PA==
X-CSE-MsgGUID: hBEWqyiSS5eZEG/Riws+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8175408"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:57:03 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D1A8121B96;
	Mon, 09 Nov 2026 11:57:01 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xQM7U-000000000VS-0Gao;
	Mon, 09 Nov 2026 11:56:56 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v2 1/1] media: ipu6: Improve Kconfig help text
Date: Mon,  9 Nov 2026 11:56:56 +0200
Message-ID: <20261109095656.1939-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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

Add IPU 7.5 to the menu item name and list the supported variants and the
SoCs they're found in.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
since v1:

- Add Oxford comma. :-)

 drivers/media/pci/intel/ipu6/Kconfig | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 3d3c7778be38..721597bfce2a 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -1,5 +1,5 @@
 config VIDEO_INTEL_IPU6
-	tristate "Intel IPU 6/7/8 driver"
+	tristate "Intel IPU 6/7/7.5/8 driver"
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on X86 && HAS_DMA
@@ -11,9 +11,18 @@ config VIDEO_INTEL_IPU6
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	help
-	  This is the driver for 6th, 7th and 8th Gen Intel Image
-	  Processing Units, found in Intel SoCs since Tiger lake and used
-	  for capturing images and video from camera sensors.
+	  This is the driver for 6th generation and newer Intel IPUs (Image
+	  Processing Units). The following IPU variants, found in SoCs listed
+	  below, are supported:
+
+	  - IPU 6 (Tiger Lake)
+	  - IPU 6 SE (Jasper Lake)
+	  - IPU 6 EP (Alder Lake, Raptor Lake, and Meteor Lake)
+	  - IPU 7 (Lunar Lake)
+	  - IPU 7.5 (Panther Lake)
+	  - IPU 8 (Nova Lake)
+
+	  Currently the CSI-2 receiver functionality is supported.
 
 	  To compile this driver, say Y here! The two modules will be
 	  called intel_ipu6 and intel_ipu6_isys.

base-commit: 06d48a18b0ef9f24e79a668b4f864734eefd2ba6
-- 
2.47.3

