Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAABE535FAF
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078756; cv=none; b=KxO1m7m3SOHR3NJ6wOoSFjaxtiM3QXHDAS6ttBUjYWjCGWLIinwzjpy5+qjKpz2k4jlFN/RcVdQi1/yoPUE/qonNcSfxFCqsU0zNR/aHwXA2IU4WDEopJXELeP/y8vIrkrY5Wd9AE+HIM66GUD63LalWC/DZKNRr3/MJ5rHpBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078756; c=relaxed/simple;
	bh=Fs9MxWod6Mj7c34By7gZCOyKMNMqTxwOQ4cWiAuWa3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srZcM7R9ka4fLG/tGWUpn6iRvxf+adZMnq/R7HJwfBzZK1oy0jsPAtnr9q7qGZwCan+PGkjKnYqDQ6aenrFMdmbPUtTFyN3ll8QsK3YKW8s0SSsrG+orvVzmZElYnX+ueJT88C53wVXtUldpw1L9PdNEbIXUD9eWbkB2HE4PYzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jflWquUo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jflWquUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078755; x=1821614755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fs9MxWod6Mj7c34By7gZCOyKMNMqTxwOQ4cWiAuWa3U=;
  b=jflWquUoo4CXX5tD8jkpm5hD0sADAXGPRkIQhxE0CdkGB4yMAZQ8HDt4
   o0BP/ZS9hT9h+4/qhMWaFzHDSUMMxY4i+fQccV6UJCUDF44gji4X46PsP
   U7zCHieelIBsw24KbwN+K1uSJ43c+DVd8oGOjc9PtDLUo50pl/yo9olAP
   UsnTw03DzvCAVc+bh6WiQMAKN73jsctshq6dptaBWInOCZ5dNn3N84d4I
   jcNZHbNqZyr9D0x7nhIJESfuvxnZL/ie/u9WKMDF3w74Jv8sAmjrSpD4k
   hacMQ/YnWM+Jq2SQ8WOraoKGMUGfidfezmrWhr5pkYpMiEh0Kep4Ckjlx
   A==;
X-CSE-ConnectionGUID: jmUvpX0aSamOkhDzpk3ufQ==
X-CSE-MsgGUID: lPuhGN79QjemxnT0NFNyqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227113"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:51 -0700
X-CSE-ConnectionGUID: H/MoF8XwSm+0sD+fuxaraw==
X-CSE-MsgGUID: m3la7L5dTCGb1NqCpG/wfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029186"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D8D11121E21;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFj-00000003lIq-08nc;
	Tue, 22 Sep 2026 15:05:39 +0300
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
Subject: [PATCH v3 21/21] media: ipu6: Support upstream sub-devices without get_frame_desc()
Date: Tue, 22 Sep 2026 15:05:38 +0300
Message-ID: <20260922120538.896684-22-sakari.ailus@linux.intel.com>
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

Provide compatibility support for upstream sub-device drivers that do not
implement get_frame_desc() pad op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 6cf58d8aa876..d0337957a213 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -16,6 +16,7 @@
 #include <linux/string_choices.h>
 
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -588,6 +589,29 @@ static int ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 	return 0;
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
@@ -611,8 +635,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
+	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
 		return ret;
 
@@ -719,8 +742,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
+	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
 		return ret;
 
-- 
2.47.3

