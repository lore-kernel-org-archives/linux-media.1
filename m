Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008549;
	b=vPnLmRuCRQ3yzQt7/TmB7Ef7M7kgDVzJP3tVDWrb9bkmEgrf1k+w8nQx+MS5BDYKG+BR
	 NNgGlvdNV6ybTd1Q+XRMikioN2/1c4rPTplSJy4Ns3xWI7PLiY6nNKJUk8GtTnYvx3/yr
	 vlzhnWmCKi4RtX4hH+Bri9+3K1HdgGTrYofZzdvnBbRMJ/o/4qtQmTOMxlEYAzNKSLaxK
	 88xGuo1xJWrKKasc1Qa7tRpzogPrNZtqICp5OYpJxA2B531PE7r0EcscS/LbHCujkknA0
	 Tv18Hf6MYxJefBrm+pHdzKyDno99mBzjlQmWypAqFbuF9yPXDhEa75AKfhxbfXDFk5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=J7tG2C4OcgQa1LvnsL0HzgjQx6or2Jn7zUUD/ZqA7K4=;
	b=Zy21uVshl7OapEIJ2wuBmK8JR3Tf7wVuDEt4hQw8DdWt05iBW6VFSyrOM3KivznkndNW
	 0eB3T8ENbj78grqsWlcv7aQskAMoXDoUnsx1+rEjV8hJ6yLPjpXmZaj0+AB+Y8fFRt8vz
	 c2RuskV/qJv1IXKcnhDaC1KabS6C+jAnPhsZA/DblZsuyBC3eANyVSOHeqkssR3Wn8fwY
	 kJdNbCF15zFPoF74Fo/3dAT3PeH+jyxMLjlQ3ABhRZsEXIVbbWkUv8C0Y4QZgFjoysnHB
	 7Zg/FknFZFN55pH1BLy9Jpo6qr3R8d0f+eDtQUk6gQ4zZBzBbVV6tWa/HeBq5dEd/Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6CAncRo;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD360A2620
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AD360A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6CAncRo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008549; x=1826544549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qk7CVBVb3LS0lU4NZN8YuHaMlfgyPB1H27eQWu3N+/Q=;
  b=d6CAncRo9d1pgdzPG+Wy+EIcu2PLwVggeCcFSfZX6Dnrfq8F3gs60Dl8
   UQegGk3hxEloxBqEe/HaUFLG9qO4FGulhB226p5TOxl63zs/D7lvD4lEc
   5BKTPdXjja5xkGJzDqNwhGs8Ncsi5VyE6s38nN3C1/yegwYviIrP94zsk
   Z58izTVhb7njrnFGM4ytiWmztRErr5w9q/jw0X3BWHcXFy3iJKPmikIwk
   uGsj+WoR+4FK2DUIJ+5ZaT3Otze6CO7pRXi8y4V1tFAfOAK3Qk0Xuk9ed
   BEzgfrL361Q0AtRaDOwd3xLV/xFseCQIFVG+vAfHrQ0yEVQmIJLwSTsjb
   g==;
X-CSE-ConnectionGUID: QEK4JekQTj+KvQzfTTerOw==
X-CSE-MsgGUID: NrUcsuHDS1Gn7PXNiJLKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808981"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808981"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: EUI3+DEoQuqmlPOaLPLf4Q==
X-CSE-MsgGUID: p67Ub0BcQ0S8E1igsiWaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376793"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B47441230EB;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcP-1RHY;
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
Subject: [PATCH v13 43/73] media: uapi: Add more media bus codes for generic raw formats
Date: Wed, 18 Nov 2026 15:27:49 +0200
Message-ID: <20261118132819.213473-44-sakari.ailus@linux.intel.com>
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

Add new generic raw media bus codes for serial buses at bit depths or 16,
20, 24 and 28.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 8 ++++++++
 include/uapi/linux/media-bus-format.h                    | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index b207119415f1..4b832118060a 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3890,6 +3890,14 @@ affect the pattern is conveyed via the :ref:`V4L2_CID_CFA_PATTERN_FLIP
       - 12
     * - MEDIA_BUS_FMT_RAW_14
       - 14
+    * - MEDIA_BUS_FMT_RAW_16
+      - 16
+    * - MEDIA_BUS_FMT_RAW_20
+      - 20
+    * - MEDIA_BUS_FMT_RAW_24
+      - 24
+    * - MEDIA_BUS_FMT_RAW_28
+      - 28
 
 Packed YUV Formats
 ^^^^^^^^^^^^^^^^^^
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 83feeae6a31e..40912155c741 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -190,10 +190,14 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
-/* Generic (CFA independent) pixel data formats. Next is 0x9005. */
+/* Generic (CFA independent) pixel data formats. Next is 0x9009. */
 #define MEDIA_BUS_FMT_RAW_8			0x9001
 #define MEDIA_BUS_FMT_RAW_10			0x9002
 #define MEDIA_BUS_FMT_RAW_12			0x9003
 #define MEDIA_BUS_FMT_RAW_14			0x9004
+#define MEDIA_BUS_FMT_RAW_16			0x9005
+#define MEDIA_BUS_FMT_RAW_20			0x9006
+#define MEDIA_BUS_FMT_RAW_24			0x9007
+#define MEDIA_BUS_FMT_RAW_28			0x9008
 
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.47.3

