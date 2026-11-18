Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008541;
	b=oqJmkt13lsIlxef6whDBuu6N2L/CGYaSfYxvK5/FciWudYJB+PqoESaI2AZuhFTgmVoI
	 zkoQoE3nhO6xidpXCB7JKt47cGyWW01A6rn/L0UYQ05rQrdhXAEiah8Xh6XYtTNP01foM
	 POsX2xsidf9iOpWN04l6Es8DzEYN3SovdjMRUnLmoEkkMh8qdQQarByFTpXokjUBElFac
	 ZRlY3Myr638FGDxHivw6S2G4am7hh10tyY1TbRshwqyQ8HLygzWVoep5SM4aXvY7j6n4c
	 WQEjh9vKRr+UIPXAZ9ori7fktMlt0zN2qTF+sd/Y2StpQedwEaeQDpbQkodacyMDUoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=2XZ56nDOiTMrPhhf2lZ/xc4U5GW+wcJC2GFfLmJCcYE=;
	b=b+wqeGwg5VbQPhUMbfxPoTIO/tpPVfCJMRfQeA3JhfRRDFlezmmj+MoNjZhhSEAm62r4
	 psu/wa/P4yOtP0XUg6CZrgjpn2TjXw/g3/49bqMEPyD7X5avkbV9zek2Ek8G58LUgqlbG
	 5OSqM3nqs/LAmGReoHDSBmNvpFVpEp7JI8JPySz/wlQKYb2bYlVxxhc7TQwDcgGYJ3qYW
	 tOqmyM7V05cw+Lb9e/IUeoVPhPlDmh6ZQqU39NjsEuwFrYYlfa/MYgqITm716iYDpSoyV
	 LBQmq0/raH374oqTOrn8vGZoJbFdr1Cq1wEJ2MtTA7V62Lg2H56R6F90tHl5c++dPPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CU81xCfK;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0828606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0828606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CU81xCfK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008541; x=1826544541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fl2Yt+fP0aO6J4lfIVlE134siR6lbSsp2zcpq1nSTas=;
  b=CU81xCfKxEWkgIycFRZurW4/gSHTBjKr2BxcEMIzy9euwAVJjMu5gf0i
   RCH0Q0eqhRKuj5M2rOcP2nA3fMI+gJiBMSfu/tVjyvqHUr82Jga/VGkdC
   U6oGP+PhmrwVqfJrQmEwH8jJxCKaYalzRr+zmTK8cA3WQ70uo7off9PiB
   lafZcRCb4lueN82MoJauwSpZgl24IB3Ch8fB7cA1yd9rDutkt8P1nDXDv
   z3l4oHPSp1gluXqggpdS295UqjSqJYR+VTGZW7/zfXRz3iLL83bYGl09G
   hCMo6yT32vIB/gtRp+LFVl4DJh1mv09DFBlH9rxn7I2JEmCsm5vIoUo9R
   g==;
X-CSE-ConnectionGUID: yoYJXxPoRESQ6wWehAxWQw==
X-CSE-MsgGUID: fCIwmaVCSlOe8Pi9CbC8UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808774"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808774"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:57 -0800
X-CSE-ConnectionGUID: QnCUJYxwTuWdScyA9b4zRg==
X-CSE-MsgGUID: kgMaoOBFQnKyIRt3OEE/VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376717"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 767EA122F6E;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbJ-0Ku9;
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
Subject: [PATCH v13 26/73] media: Documentation: Add scaling and post-scaler crop for common raw
Date: Wed, 18 Nov 2026 15:27:32 +0200
Message-ID: <20261118132819.213473-27-sakari.ailus@linux.intel.com>
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

Document scaling and post-scaler digital crop operations for the common
raw sensor model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst         | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index cbd12986b977..a538a5c71aad 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -146,12 +146,19 @@ binning and sub-sampling to achieve the desired size.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
-0/0. The resulting image size is further output by the sensor on the sensor's
-data interface.
+0/0.
+
+The scaling operation is performed after the digital crop. It is configured by
+setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
+relative to the digital crop. The resulting image size is further output by the
+sensor on the sensor's data interface.
 
 The sensor's output mbus code is configured by setting the format on the (pad,
-stream) pair 0/0. When setting the format, always use the same width and height
-as for the digital crop setting.
+stream) pair 0/0. The width and height fields are used to configure post-scaler
+digital crop if supported by the driver, affecting the right and bottom edges of
+the frame. If post-scaler digital crop is not supported, the width and height
+fields of the format will match the compose rectangle sizes applied on the same
+0/0 (pad, stream) pair.
 
 Drivers may only support some or even none of these configurations, in which
 case they do not expose the corresponding selection rectangles. If any selection
@@ -220,12 +227,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - X
       - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 1/0.
+    * - 0/0
+      - ``V4L2_SEL_TGT_COMPOSE``
+      - \-
+      - X
+      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
+        rectangle on (pad, stream) pair 0/0.
     * - 0/0
       - Format
       - X
       - X
-      - Image data source format. Always assign the width and height fields of
-        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
+      - Image data source format and post-scaler crop. The width and height
+        fields of the format, used to configure post-scaler crop on the right
+        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 0/0. The media bus code reflects the
         pixel data output of the sensor. Setting the media bus code on this pad
         configures the output format.
-- 
2.47.3

