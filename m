Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B644825C3
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078751; cv=none; b=e6UrHKTzpQEvn22bsQI3TcBvvb/9y008I15hdWRXbWezNlkrSAwXqyIeEi47ZaMedTHAmluKFSJrQ7oTsguWR2RJh5+Grsjw3ixMFGJxyAysQmB6RVwAYXFczzdxXKm0g3rrOyVEFn1cTiYSQJ4Uvc1HGtw5ngHnGPueA6iG0LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078751; c=relaxed/simple;
	bh=ZBc74N57Ra7Mdbx5Z0Noqj8xfQ2T+MfYl59qhpIWKtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIeIsEdrUdoqTP5l6K9MY/lIqTdDImIhwjeA+KLmFfB9eGggcGNVANlgxy7/MdM2nKWCfMtQbfTUYUte37avyCkAAkiZ4laVVXQNHg3TCk4itjypZuZ3zR2T/dvA7kBU+K2DyVDFsU22TfRBiqtZ38+lWu+aTjWgaxRHR6256NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDwlrJaB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDwlrJaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078750; x=1821614750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZBc74N57Ra7Mdbx5Z0Noqj8xfQ2T+MfYl59qhpIWKtM=;
  b=UDwlrJaBZG/PNF7Hj6l5f3C5WtJ1Z/JXkF4cWylvFKx6itx2d950FyIt
   H168IRXjKeHV5WHOykVAuFXMR5AHz4XMODqkrZZ9/Mu8QtlqOGV4bpiD5
   O69F+mJ01T+KGEmrr9NN0zigBWDX8u2KY4Q4l8wROkdn4DXfifhKJR8Ap
   3p22lxv0ja4vW6qalG7q7xxf+tZGacv8L7Tj4zRDCsQXbi7HRIiCj1c7u
   eAMdxVR4gFmFkvkAPkzrMCZhCgTT2Jd9g8H0uaLDuaeqsbMYxmliPdI5B
   yMz9IGiRqFIcV3J3f45U6oOBTh8mx9hhLQymuLshAz0K/Ol28WAqhOhhN
   w==;
X-CSE-ConnectionGUID: EryA33GNTlGffp2WMqqhuw==
X-CSE-MsgGUID: c8nPQOwgQheHt263X0b8iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227087"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:47 -0700
X-CSE-ConnectionGUID: PKNDt76QRIKNBmzR++wjeQ==
X-CSE-MsgGUID: AcRWdDSpQ52QCqqo5+hKeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029155"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A8CE0121C9F;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lHs-3Uxp;
	Tue, 22 Sep 2026 15:05:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v3 06/21] media: ipu6: Clean up link frequency calculation
Date: Tue, 22 Sep 2026 15:05:23 +0300
Message-ID: <20260922120538.896684-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle link_freq <= as a special case and continue calculating the pixel
rate otherwise.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 37 ++++++++-----------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 781fc0e88417..3d455872f29a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -648,12 +648,9 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	struct ipu6_isys_csi2 *csi2 = NULL;
 	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	struct device *dev = &isys->adev->auxdev.dev;
-	struct v4l2_mbus_framefmt format;
 	struct v4l2_subdev *esd;
 	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
-	unsigned int bpp, lanes;
-	s64 link_freq = 0;
-	u64 pixel_rate = 0;
+	s64 link_freq;
 	int ret;
 
 	esd = media_entity_to_v4l2_subdev(source);
@@ -671,28 +668,26 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 
 	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
-	if (link_freq > 0) {
-		struct v4l2_subdev_state *state =
-			v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
-
-		lanes = csi2->nlanes;
-		format = *v4l2_subdev_state_get_format(state, 0,
-						       av->source_stream);
-		bpp = ipu6_isys_mbus_code_to_bpp(format.code);
-		pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
-
-		v4l2_subdev_unlock_state(state);
-	}
-
-	av->watermark.pixel_rate = pixel_rate;
-
-	if (!pixel_rate) {
+	if (link_freq <= 0) {
 		mutex_lock(&iwake_watermark->mutex);
 		iwake_watermark->force_iwake_disable = true;
 		mutex_unlock(&iwake_watermark->mutex);
-		dev_warn(dev, "unexpected pixel_rate from %s, disable iwake.\n",
+		dev_warn(dev, "unexpected link_freq from %s, disable iwake\n",
 			 source->name);
+		return;
 	}
+
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+	unsigned int bpp;
+
+	state = v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
+	format = v4l2_subdev_state_get_format(state, 0, av->source_stream);
+	bpp = ipu6_isys_mbus_code_to_bpp(format->code);
+	v4l2_subdev_unlock_state(state);
+
+	av->watermark.pixel_rate = mul_u64_u32_div(link_freq, csi2->nlanes * 2,
+						   bpp);
 }
 
 static void calculate_stream_datarate(struct ipu6_isys_video *av)
-- 
2.47.3

