Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8733B970
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765733; cv=none; b=QwcBeJJqLNXc/UIPmPK24l1Bqkx9GbIcpclS5IXxONMcWppoJWCYQo0gqwayJZ9rvFL86yzRvbmJgIgzae6H3MC9JNSJCj8lavIFPKVX+P/U0uag3cPhVssRwEU3Hw85cCrktSOznczeiD/CpPYEk5Dk/Ma/59P26P3gYgJwdpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765733; c=relaxed/simple;
	bh=G1Jq09kAIPrhLlXnBT28MIGa7AvCvLJ2b63vI4B2S/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SeuYCuZvKiEn6mx0kGQ3QP+CZyAWWVKM+7BTaC8ULq/l2Le2p8shB0XQ6zaAVJrOgkYbbxxK8swdMiyw8eyCOQRJPEhShRFUvEkYJL7bNEhbUdM7c4AsLuiyu0+fFpqfosJQFgdxCdDNC6x2S+WDKAB/rfO2horqehRfrBmMQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJMPY1Hz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJMPY1Hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765733; x=1807301733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1Jq09kAIPrhLlXnBT28MIGa7AvCvLJ2b63vI4B2S/Q=;
  b=VJMPY1Hz+P2mjkzvTqNugKFrc9f10zoo7ech9cW++2mupEO4NTBRIDz4
   jUNcv0/Xi4+2vVI4jvYpjZozsx7COiAzU4PWoWThRtz3CoKI/AEFhHTlS
   DqzfmkoXliuxsY+kjuIscl4tBYp+EIohDbBxaYp5rpLP0OR0eLCDFzMsf
   XZDMgHqQwnBobn00QrAbVKWylb+3P8iGtqmi5/Ra+8uuIHZfsSvGs+NME
   rPTbrG33kHb6LXXr4l0wiAtw7r5VzJCE1dzzN/j3GdaHY7qkdWK3OGotZ
   WNW4j5ioYRyav1J25EySakQxhzvjec867xiVBbwPASbB9oE3N/yySiQC3
   w==;
X-CSE-ConnectionGUID: O/v+rZtpSvOUiTHSv9q6Ww==
X-CSE-MsgGUID: vAApMiukSsWxvt0H18heVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176483"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176483"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: VApJF4upSgWEKC1SopS4ug==
X-CSE-MsgGUID: OsGxhZ90Syaeptz2Z187zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047536"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D64312288C;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mb-0HEP;
	Thu, 09 Apr 2026 23:15:02 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 30/86] media: Documentation: Add binning and sub-sampling controls
Date: Thu,  9 Apr 2026 23:14:05 +0300
Message-ID: <20260409201501.975242-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the binning and scaling controls (V4L2_CID_BINNING and
V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 0fb01bf6c825..fb6d8a1bcac7 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -144,8 +144,12 @@ separately horizontally and vertically.
 
 The combined effect of binning and sub-sampling is configured using the
 ``V4L2_SEL_TGT_COMPOSE`` rectangle, relative to the analogue crop rectangle, on
-(pad, stream) pair 1/0. The driver implementation determines how to configure
-binning and sub-sampling to achieve the desired size.
+(pad, stream) pair 1/0. It depends on the driver which of these operations are
+being used to achieve the resulting size. Binning and sub-sampling are also
+directly configured using :ref:`V4L2_CID_BINNING_FACTORS
+<image_source_control_binning_factors>` and
+:ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and V4L2_CID_SUBSAMPLING_VERTICAL
+<image_source_control_subsampling>` controls on drivers that support them.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
@@ -216,9 +220,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - X
       - Binning and sub-sampling. This rectangle is relative to the
-        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
-        combination of binning and sub-sampling is configured using this
-        selection target.
+        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
+        configured using the :ref:`V4L2_CID_BINNING_FACTORS
+        <image_source_control_binning_factors>` control and sub-sampling is configured
+        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+        V4L2_CID_SUBSAMPLING_VERTICAL <image_source_control_subsampling>`
+        controls on drivers that support these controls. To configure binning
+        and sub-sampling on drivers that do not support these controls, the
+        selection rectangle may be changed directly to configure the combined
+        effect on the image size.
     * - 2/0
       - Format
       - X
-- 
2.47.3

