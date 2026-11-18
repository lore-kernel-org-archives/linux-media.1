Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008532;
	b=tkdoJFHBL0ovtHN+M/tRiTbhJgCF7s6xK1TlvFD5nP3ZLOJTSH3WmZrZBkcAdwuGZYIh
	 h034393298Dkg/tph6fEiGFt6nOvaBZODe64RDeqpuFGd3IY4DmSufJRJj4RN6130qPFd
	 YKJExugJJTJcPUGZAHKnOFFf2Ki3RE+XzTQLvVXtAdawynCu5TobA2XR2XLj28beE2Eoa
	 T7lfx/M8SWjCd4jCknaF33xnpYuAoK+NtvJ6MtEJK754M4kXZy9yLAnjvbXLWc03RlLUt
	 c+grc8Y/Dnl5FeoCXOg5HMxTwunM3U8wE93bhm6KcDaxSlitMtApeg8gxH/9vV6JN7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008532;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=oS92D+WOScUkqWP7/hDHpC7wEjAM5NjQGJXWMKMad2o=;
	b=uico7vOqchqA/uZ363I2lmPThTi1GNfPAqQho5cZw7uXdOJOW1yZKrLItNbR3SH1nbU0
	 E9EzitGql4rro2r6VNJPmVGhIMjqj0/ocNCN6ROgW6kTRKwkws75clH4QjsRdPmAoreuP
	 xSChmfa1KetBjyByNmgklZ2gns9jE1xCgP11aJTWYnkWbJQYjxiT+R4PzkJ0MpqBspI2n
	 PPDRBSLsrmlVEKmCWHnNOGFJE5J940wATGJhfizyvjNPTu7tt0FL3pMMOrp0bu/144UX5
	 F2VJjoSniRW0spbCpLmECq8dB3DQFQKtXmA3nV0sBxe3HF7wz3IqbKkO41kv0DpJeFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="J/RJXRf4";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29AD60A2620
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29AD60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J/RJXRf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008532; x=1826544532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JSmxTcsjOZ+9AmNZQnBB6J1UGnKQzCxhz/NyG9pNxnE=;
  b=J/RJXRf4qf3AYjAJiXge3ArbM4zzVK3BtO1tP4/xSFMA+aj7U+bkZxsm
   81fv/fqx8IEf61Kyo47yeylw19Lrd569Lu3y0G7yD2Y7XvTVsUIsEacor
   lTqrsPPJX/8vLIR+7Dn8jzqr0nJjgZVKPyviCCUbGxCrQsUIaWuWnGLdq
   z9+Bf22ZF3TsxapNNwFwrDxy96TPs2otYw0F6ZMkKYSUOhVHZlqAn/M/M
   PZZsF604T5FTzaAFLNJDzq/nqw9XSCNy0fGhFdhXzIXr0scCbJiwIsQeO
   vm3QbtYrNYLi6tBm2UOg85mIfYn3hEQGOlKNvu3DkFETpl7BlSW90P1Oh
   Q==;
X-CSE-ConnectionGUID: aagfLNKZTES+ehOuDcrteA==
X-CSE-MsgGUID: 9k8bYqJYQfaWZFyR4L55Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738913"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738913"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: Pos2eeG2SCCy6ZvM3FO8uA==
X-CSE-MsgGUID: vAhSnccER+2OIeFXJfaArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076073"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:41 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 24BBA122D92;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000ta5-3ASo;
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
Subject: [PATCH v13 07/73] media: uapi: Add monochromatic CFA pattern
Date: Wed, 18 Nov 2026 15:27:13 +0200
Message-ID: <20261118132819.213473-8-sakari.ailus@linux.intel.com>
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

Add monochromatic CFA pattern to the V4L2_CID_CFA_PATTERN control.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 3 +++
 include/uapi/linux/v4l2-controls.h                             | 1 +
 2 files changed, 4 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index d4ba8bd066f3..e1ca45a9b577 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -136,3 +136,6 @@ Image Source Control IDs
         the top-left and bottom-right pixels, a blue filter in the top-right
         pixel, and a red filter in the bottom-left pixel.
       - 0x00000003
+    * - V4L2_CFA_PATTERN_MONO
+      - Monochromatic sensor, no CFA pattern.
+      - 0x00010000
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d948b2c0cf41..c4dbc12609b3 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1263,6 +1263,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CFA_PATTERN_RGGB			0x00000001
 #define V4L2_CFA_PATTERN_BGGR			0x00000002
 #define V4L2_CFA_PATTERN_GBRG			0x00000003
+#define V4L2_CFA_PATTERN_MONO			0x00010000
 
 
 /* Image processing controls */
-- 
2.47.3

