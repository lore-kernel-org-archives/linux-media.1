Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EEF45D903
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805366; cv=none; b=CNR2scW/DITg19x7A9BCy33q96URoDjJyEZ1Qbqt69vzTl0xPzblEKcl6jFPmchK+3FOlKdUpOSmhib8viAuRilNsWfL7xxFrjIdKIP0u8sXh2KIFVkBoewLgyWHeen3DqfZyKgBMikAN7NP2npgf8IGvPZ7dd4KoVx1PUoh1+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805366; c=relaxed/simple;
	bh=jv63r40vqTHsUfRse4WP6HrvB53IyipxqfunHG3jePY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLeKhSo6yWItx/JrW2VQmS4EuGAzdQiJVFbAbYVGW6WCn0kIffb5M/94IycbXQiJMlJJIgn4i5Lf9LPdWYxzohUbL4u9YGuFeBsHxhZKKzln+K8Y0h0qyaQKGCoT0chLItTXc9+excQI6DsvFQ/vJ8XGTb0R2jG2xQ0Qf59Col8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceRXQiYz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceRXQiYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791805365; x=1823341365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jv63r40vqTHsUfRse4WP6HrvB53IyipxqfunHG3jePY=;
  b=ceRXQiYzsy73aVjaToY2sjsH29QVdCxMIDJMmFXNdg8xbvtFnQUBwqIL
   I/7GMUAlefIfhBARa2ADOmWZPHzw1X0Bdtr2DZqK/VrFJd0cSBLsuryoX
   ldTtrleYHeK1n7MA/ZuZxkNiCUGhKMsGwDW755do06C+nrdgowkS3Bc38
   lUBLrXCMo1q6lKFPoDeW7AyZeiDKSO4sPne1CrZg0vAqDbdhec7gQQMWs
   VL/IMo0ShvG9ZLM9HkzfvO3zUTbxH1qOXLd95Q4JdJhgTpORh2YNv0emp
   qNKC7wG0Y4bcpi1TkYbqta6O57+qxvftAyzS2VXnjPETTjhCvdrzVrcBX
   Q==;
X-CSE-ConnectionGUID: /wKr/8wsSp6AEf0If+NqJQ==
X-CSE-MsgGUID: bYadjLRQSuS+kg1Z8SyfQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394324"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:44 -0700
X-CSE-ConnectionGUID: G84GW9gfQeqvOH33fGY7+w==
X-CSE-MsgGUID: ZXZ18KIIQKWxL39uZ+c1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="978041"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 66401121BB4;
	Mon, 12 Oct 2026 14:42:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xGENu-0000000GezU-2w4n;
	Mon, 12 Oct 2026 14:40:02 +0300
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
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: [PATCH v2 5/5] media: ipu6: Return errors from stream stop and close
Date: Mon, 12 Oct 2026 14:40:02 +0300
Message-ID: <20261012114002.3970409-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
References: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the firmware fails to start, stop or close a stream, either by telling
about it with an error or due to a timeout, it probably requires a reset
before being operational again. Mark isys needing a reset in such cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 55 ++++++++++++++-----
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 +-
 2 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 44541aff79b3..799a4be3160b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -543,25 +543,31 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 out_stream_close:
 	reinit_completion(&stream->stream_close_completion);
 
+	scoped_guard(mutex, &stream->isys->mutex)
+		stream->isys->need_reset = true;
+
 	retout = fw_ops->stream_close(stream->isys, stream->stream_handle);
 	if (retout < 0) {
 		dev_dbg(dev, "can't close stream (%d)\n", retout);
-		return retout;
+		return ret;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_close_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
-	if (!tout)
+	if (!tout) {
 		dev_err(dev, "stream close time out\n");
-	else if (stream->error)
+		ret = -ETIMEDOUT;
+	} else if (stream->error) {
 		dev_err(dev, "stream close error: %d\n", stream->error);
-	else
+		ret = -EINVAL;
+	} else {
 		dev_dbg(dev, "stream close complete\n");
+	}
 
 	return ret;
 }
 
-void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
+int ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
 {
 	struct ipu6_bus_device *adev = stream->asd->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
@@ -573,20 +579,30 @@ void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
 	ret = fw_ops->stream_flush(stream->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't stop stream (%d)\n", ret);
-		return;
+		return -EBUSY;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_stop_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
-	if (!tout)
+	if (!tout) {
 		dev_warn(dev, "stream stop time out\n");
-	else if (stream->error)
+		ret = -ETIMEDOUT;
+	} else if (stream->error) {
 		dev_warn(dev, "stream stop error: %d\n", stream->error);
-	else
+		ret = -EINVAL;
+	} else{
 		dev_dbg(dev, "stop stream: complete\n");
+	}
+
+	if (ret) {
+		scoped_guard(mutex, &stream->isys->mutex)
+			stream->isys->need_reset = true;
+	}
+
+	return ret;
 }
 
-void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
+int ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
 {
 	struct ipu6_bus_device *adev = stream->asd->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
@@ -599,22 +615,33 @@ void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
 	ret = fw_ops->stream_close(stream->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't close stream (%d)\n", ret);
-		return;
+		goto out_cleanup;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_close_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
-	if (!tout)
+	if (!tout) {
 		dev_warn(dev, "stream close time out\n");
-	else if (stream->error)
+		ret = -ETIMEDOUT;
+	} else if (stream->error) {
 		dev_warn(dev, "stream close error: %d\n", stream->error);
-	else
+		ret = -EINVAL;
+	} else {
 		dev_dbg(dev, "close stream: complete\n");
+	}
 
+out_cleanup:
 	scoped_guard(spinlock_irqsave, &stream->isys->streams_lock) {
 		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
 		csi2->streams_by_vc[stream->vc] = NULL;
 	}
+
+	if (ret) {
+		scoped_guard(mutex, &stream->isys->mutex)
+			stream->isys->need_reset = true;
+	}
+
+	return ret;
 }
 
 struct ipu6_isys_stream *
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 2821b9b1b943..2ab6f32716ad 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -99,8 +99,8 @@ int ipu6_isys_fw_pins_prepare(struct ipu6_isys_stream *stream,
 int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 				    struct ipu6_isys_buffer_list *bl,
 				    struct v4l2_mbus_frame_desc *desc);
-void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream);
-void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream);
+int ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream);
+int ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream);
 struct ipu6_isys_stream *
 ipu6_isys_find_stream_firmware(struct ipu6_isys_csi2 *csi2, u8 vc);
 void ipu6_isys_free_stream_firmware(struct ipu6_isys_stream *stream);
-- 
2.47.3

