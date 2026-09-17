Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098084DAFAF
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645186; cv=none; b=TBMow+/gWbMs01QkOjENADH6mUp/HHJrAOXy13W0FEqkdT9kFaIATdDWlOt8UBKaFztAyvGjMzJ+Y8zD0443/DF/+Kyz6p7JlWe8bgTxvkzPT5qeADiZVX8Fqc39tQCDY0sdY0NRlLUsUWopZj+/AtmXkFtT1oXhUmGf+D/IPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645186; c=relaxed/simple;
	bh=OKJSR8Mk9qvE+4ZCUVpl4dNuTkVWEu64ZpkBdW+AsYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDl5nvDzhNFv9zdDGsfNTkYuflfIGW+f2qhq/Ldw4ijS0zVfbhyVc/c27q6tc+7cpodvQi9VewPi6rUg+pC7UpfaiNcV2/x7UT16XArmEDx2+YnVuGWmXjTdY+XTNYmtKjSUXQAL+DNmOvxoBOkdZmWcNCATRZs0Ztu5Asu3WTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmOhXt4s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmOhXt4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645185; x=1821181185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OKJSR8Mk9qvE+4ZCUVpl4dNuTkVWEu64ZpkBdW+AsYA=;
  b=LmOhXt4sNQzcSntLt6KFL4icJhQ15gS21qZdBd9HV6F3eOdyNcOyc73I
   Mfsk8eBpsw4iGXvfd6S9jvAa2CjJ5epKiD5cbmQ39YIs/3d9PGtE+fLyQ
   ukeCvptAi1ddBsaJBsJM0O0CCAG8hwRa1cBZvE+9PO5JJT3WX+8/ExSrI
   XSOLQvXNNQKnwIL2atIgJSjjVQHyMrv5i4S1Jla8InJsPXePfcfmN4dDW
   oCsxTFeOzMNfQPt2jTxVZMB34RwfNapeJUFd0PKde16aTRc2ItIxstNU3
   jV+w5EjHXwmo6REkcf0w1O7E43AicCDP1V+Ocl4Yozy21PMYtMMIHICn7
   g==;
X-CSE-ConnectionGUID: qjZq8z1YQiySvmQzp8Jy0w==
X-CSE-MsgGUID: F27Hrpc5SZeav1G+NncQVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622389"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:41 -0700
X-CSE-ConnectionGUID: 2oj9qMMIRGaT89p0PdciFg==
X-CSE-MsgGUID: U5+/VM2JR+ePnAi6zVk3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097375"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1589B121CBB;
	Thu, 17 Sep 2026 14:39:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FOA-13LX;
	Thu, 17 Sep 2026 14:39:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 21/21] media: ipu6: Support upstream sub-devices without get_frame_desc()
Date: Thu, 17 Sep 2026 14:39:23 +0300
Message-ID: <20260917113923.59004-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide compatibility support for upstream sub-device drivers that do not
implement get_frame_desc() pad op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 780ac3c4d4e4..bf70482029dd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -16,6 +16,7 @@
 #include <linux/string_choices.h>
 
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -589,6 +590,29 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 	return false;
 }
 
+static int ipu6_isys_get_frame_desc(struct v4l2_subdev *remote_sd,
+				    unsigned int pad,
+				    struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_subdev_format fmt = { .which = V4L2_SUBDEV_FORMAT_ACTIVE };
+	int ret;
+
+	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, pad, desc);
+	if (!ret || ret != -ENOIOCTLCMD)
+		return ret;
+
+	ret = v4l2_subdev_call_state_active(remote_sd, pad, get_fmt, &fmt);
+	if (ret)
+		return ret;
+
+	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	desc->num_entries = 1;
+	desc->entry[0].pixelcode = fmt.format.code;
+	desc->entry[0].bus.csi2.dt = ipu6_isys_mbus_code_to_mipi(fmt.format.code);
+
+	return 0;
+}
+
 static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 					 struct v4l2_subdev_state *state,
 					 u32 pad, u64 streams_mask)
@@ -612,8 +636,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
+	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
 		return ret;
 
@@ -715,8 +738,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
+	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
 		return ret;
 
-- 
2.47.3

