Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008551;
	b=0HupC8vqAv9uihASvL6JJLvzpGm3rviQRyy/3uGddCnM6Jywps8b7IWuSj2eCpi+PR+g
	 6gVfDMKeAhMTG++gMY0ctOpJMaHdTS/8R4rsfzkHNpTQpWFOSB7qLr4HFA/2nPAIvdTwy
	 hfUB0iupEN83VU9hugYiI2oGakW4737Oa0KcQuX4sveYyNXlkvSWPW3vENE1ngM+a7H2o
	 c7dQBFyWZCJUUNLASsPnGK4nhDs02NJHT8s9+JeTl+SfU5GSGe8dQIwo2LnmkjJrgE5Ct
	 WDVsFl6skg94VC/bT/juGKSx74tMHKxuMRrKuG/eFbD436Sb4cjPSOKoE8Cv1VJ2g/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008551;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=jbbBDvBn6Cr5v2JGc9J1wN/NzwhgVwDEMiYvBAPQvRY=;
	b=woyO9L6rqSTycQ/J3XdpkOm+iT1n0DOHdEUHfKr9lzOm+mzYFGHSjfMSRYIHo3Z3YgUj
	 d9YP11Y6ffj1khXYR37kGiUoROmrBWe86PBJkBGvNqNpnxp47gHzCE3u4kX56F37Qvrob
	 nq8jZOblhqbFiEziBc3qlCrtPRyR6v+4kGhrInA7t22pl/a563gZ24ieKVuUA7PUJ2hoB
	 MtrmnAUltH8xZfXWzYKK/PajK5SKuv+G7VYeFKLgsOM8mmIrJiFbS41OFcH3KxP/XSEy+
	 lsPmvk542/p5Z2SaR1GAgYJmaKQeZxBY8tuh5OHy7CLL87DYmtpHb7rwB6PH0MDWWMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nc5Bilmd;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA060A380E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AA060A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nc5Bilmd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008551; x=1826544551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aroFNLyj/NCxmKY0aT68UR/WbF4GmtnMRzDL0VlQqWk=;
  b=Nc5Bilmd0+yRd8D4Z23Rh4RzQS1auQn8/m+T3/Zdaxfkb8YhrVsBw601
   tDxDoQ3/wSEjKbqyKjJo5jMtXdkIKizxPJmgXeFCadwqmHHemyTOkvQxn
   1bvQy7GZn9TfbmaPfv0nClLmq/QNGv0SBf3fwzOZgWLfjxWc8d62tZ7a7
   pzAgtFg1mRBP3ljELijDmLMbVGOCp7qcUd1LXDpN7oTUpAT4Zt0O+KRvm
   JH7yFwKMYWFFLxQeJ+ZSmAgufqzvqLeUfyu6+zzfXwQa3HjkIqoCeEj3x
   Cuwf1y+P+XQwrM4TsaV1jRs2xEvMN/wQrL3u4paR/pSmKi+nVpA14IOLQ
   Q==;
X-CSE-ConnectionGUID: pk5G7zZnQlKA0IZ82qCpNQ==
X-CSE-MsgGUID: Wtf8Zx4YRKKe7q8yV/HcVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809073"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: /C0l/IsyT6mzCiixvWuxwg==
X-CSE-MsgGUID: e3p243ktTKqcVWjo9NaSLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376807"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C8F6712313F;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcj-1lV9;
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
Subject: [PATCH v13 48/73] media: Documentation: ccs: Document routing
Date: Wed, 18 Nov 2026 15:27:54 +0200
Message-ID: <20261118132819.213473-49-sakari.ailus@linux.intel.com>
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

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 43 ++++++++++++++++++-
 .../media/v4l/metadata-layouts.rst            |  2 +
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 03015b33d5ab..67c7d2b62ed5 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -111,4 +111,45 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if it exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (sink pad
+0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
+(internal sink pad 2/stream 0 -> source pad 1/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The metadata layout
+used for this format on the internal sink pad is :ref:`V4L2_METADATA_LAYOUT_CCS
+<media-metadata-layout-ccs>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :term:`Data Unit` for that
+particular bit depth. This is indicated by the generic metadata format on the
+source pad of the sensor's source sub-device.
+
+Devices supporting embedded data for bit depths greater than or equal to 16 may
+support more dense packing or legacy single metadata byte per data unit, or both
+of these. The supported embedded data formats can be enumerated and configured
+on stream 1 of the source pad (1) of the CCS source sub-device.
+
+The use of the denser packing results in embedded data lines being longer than
+the pixel data in data units since the data units are smaller. In bytes the
+embedded data lines are still not longer than the image data lines.
+
+The embedded data format is determined by the sub-device image data format
+configured on the source sub-device. The embedded data mbus code is only changed
+when the bit depth of the image data changes in the source pad of the source
+sub-device.
+
+**Copyright** |copy| 2020, 2024--2025 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index cd190f453994..0f8709f2e9af 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -37,3 +37,5 @@ devices that fulfill all three levels above.
 This metadata layout code is only used for "2-byte simplified tagged data
 format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.47.3

