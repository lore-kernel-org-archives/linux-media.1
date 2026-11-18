Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008547;
	b=CYXdQlOx8qNaXzgkzGV/zUfCiNpwuswkdE4ILPu0zQE6OdWYbq9ZiyTkwLaiLDij8iBe
	 vSgOLmBvvxn4XTRslfTO9uIlWPxcq5ACdU9zGCxqeGEJfm2tqV5V/ol18dLNCgDkhDBFc
	 UfgHtTU/oGjXnE2+DtEFy3bc+CehCqz5PjDwhiBs9obEfM1VV1u67tbE9W6VrDD2unGif
	 90lkxNuuzZ0bfQx6lgbH4vrRWTy6VzZrih7YBdmRme2pR/ZNhDKUAYXzF/yD4bSXbVHZk
	 nLlZJowMpihnL8zWFrdDpiQ9klxLj1vgGpoCHxthnVsc7i6y0/u40eVin/fFoYOYFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=UGdpKCsLNGzzLE4PtH1fVpm7t3CaA02h+viz9YBi2U0=;
	b=NizAubi8tTp8k/DzZOhoSy73iZe8mDs5/0NUEy19mG6LNhysoJaPrFfj2dtAkPHg9DDa
	 x2oQdNAr4WRAW0ukTtH6F7IGWB6zlQ6ywwoKl6Pr8vS0B6FVXwFWHb8yC2xGm8UCzUSEb
	 kBDk3aZMfdI28dM2XP0wbLJtXHKR1YtZlnz3KfIDc47CSYDwpNT8pAd2wviexhLb8gj4m
	 W7ljQkxAgzKOyQIrOzt9xJaWIBiS4VbCHViRTPHc4D0Clm9DqGuqsqTlCAYPkHObQl9OO
	 FgHW0awl3LQLxsLAtElJFAm8DhrODmdgNPx9+on/7L6fYkxu/QMBcA/CDua7l3rNE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="YP6Xi/v0";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A3606A32C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F2A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YP6Xi/v0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008547; x=1826544547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z2xK3WfBVOPlcgtCVCKNAg38LngsE8KyWKghcKvgjSs=;
  b=YP6Xi/v0lNzoJZgSnffumYJVQdRXkj8tOZ5GugnjEvl2tWmOosr/GMsY
   Mz/DFx0y2ZUlTTvWUeT5pgXTrrddCsflovwVNxN7Zt5rzkh6UH9ZPH9Nn
   0vYrjMkELBqEIVs5YoZbGsZnL7klhcY7rAbM5UBwxyRlZjwBFM4aDUsqi
   fgZdIb/+OcsLlqUQUORZNAU/2zdwSyHPrhpYmkq8kAs8nIzNyFOzci1SE
   QVg61llhgH+yd19FKkTSHbQab9rnEeBODzOiFYFBi3YVJ9Fv11jP8poBN
   f/FA08EwetqLWiN3iPh7ExqIWHKWW30Oie42yO87qwcsINGDHSnd7VEAB
   Q==;
X-CSE-ConnectionGUID: luk2Fp8kR1iDruoZWcYCkA==
X-CSE-MsgGUID: rllOVR/uRtCJrGQ9NXEDiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808858"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:04 -0800
X-CSE-ConnectionGUID: OOq2HAMmRi2S6CYeUa0+6w==
X-CSE-MsgGUID: epCCc/w6Slegii/grtJacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376773"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A9F2122FF7;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbl-0mfs;
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
Subject: [PATCH v13 33/73] media: Documentation: Add binning and sub-sampling controls
Date: Wed, 18 Nov 2026 15:27:39 +0200
Message-ID: <20261118132819.213473-34-sakari.ailus@linux.intel.com>
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

Document the binning and sub-sampling controls (V4L2_CID_BINNING_FACTORS
and V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst          | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index ff02761726f3..0acb48a0bcce 100644
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
@@ -216,9 +220,13 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - \-
       - Binning and sub-sampling. This rectangle is relative to the
-        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
-        combination of binning and sub-sampling is expressed with this selection
-        target.
+        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
+        configured using the :ref:`V4L2_CID_BINNING_FACTORS
+        <image_source_control_binning_factors>` control and sub-sampling is
+        configured using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+        V4L2_CID_SUBSAMPLING_VERTICAL <image_source_control_subsampling>`
+        controls. The width and the height of this selection rectangle reflect
+        the combined effect of binning and subsampling.
     * - 2/0
       - Format
       - X
-- 
2.47.3

