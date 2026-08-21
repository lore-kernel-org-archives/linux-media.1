Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59F48BD2B
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312665; cv=none; b=dSmf0NxUgGqYM6S8fg7r11VrZo92emEQqXjr226cbykLssM2HrowSZQ61zU9xIywUB1fiOYFDeLxqM/hl93XymVgucbG1F+M40y2SuRyyNAzqYmjFIELn+p8+mMjKPpk0ys5Qxtt4pAhHu8CxKSoWtdhlkGWPE+9RaKcFPdxSCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312665; c=relaxed/simple;
	bh=TZIOcGmXxRGxieoTVv3TInFDozx/wfWrKDsDVV6QU88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9YsVO+pLgykxyM197ezaRmxLuGxVlFPaqJ0eM9OJdT4GoLh4rZKKA5oNThNAepuxo9JFRG3PgjQZ4E5TFLCKad+KQPP7JsiHkjGS9MOgSI0DvuH5gvmyEm96wQsP6jqqXmUvraaGeZbGpmXhsNffBeLL62p+WHAXjo3+KjHsXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwV0Vm+/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwV0Vm+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312663; x=1818848663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZIOcGmXxRGxieoTVv3TInFDozx/wfWrKDsDVV6QU88=;
  b=OwV0Vm+/gxACvmkJArivDxyaT+VihSxKt1U1lYDbCl1BDQd3ihWGymaa
   UTXvfWHpKt0h3360wUr0loJyVwP1mg1DAneoMpNwjZ8Wy4Qyg0/aR4jO9
   N4fbqOfPR6xuSzE9lk4BP3Qud5U+BxGXeDsvk5KzjahOgMMZ5y7LDKyTo
   OThjcWxdkhzGkhyqrSKcGaSGm//u8dMo9ngTCuBNJS0/doQCHAVUa0yzv
   UQ0PnosNJbXmeQMyIVARwZAXX+IAYsEChyfcWRpXe7c9nIPJxLSYZJix+
   k8sbbe+byx0xYTTRvjRUgNdwRSBW6CzdJSRQbAR5qhU1kMLD34w8SJcYS
   A==;
X-CSE-ConnectionGUID: 9lkewi01RN6EP4T8FWxCGw==
X-CSE-MsgGUID: cjZhVA9iTGKc+kEJc5hGVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989078"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:23 -0700
X-CSE-ConnectionGUID: 2ytbTO0pT6CGIN8HT56FZQ==
X-CSE-MsgGUID: X1ongQ4qS0ydxBkDGCQQhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172305"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:21 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 19/44] media: ipu6: Move hw specific buffer handling down
Date: Fri, 21 Aug 2026 14:42:37 +0300
Message-ID: <20260821114302.365532-20-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move handling of hardware specific buffers out of common code, like
ipu6-isys-video.c. Now the ipu6_put_fw_msg_buf() works with fw_msg_bufs,
like its counterpart ipu6_get_fw_msg_buf().

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c    | 11 ++++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  6 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c       |  7 ++-----
 drivers/media/pci/intel/ipu6/ipu6-isys.h       |  2 +-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 7f7125202ffd..8906727ca84b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -530,6 +530,7 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 	struct ipu6_fw_isys_resp_info_abi *resp;
 	struct ipu6_isys_stream *stream;
 	struct ipu6_isys_csi2 *csi2 = NULL;
+	struct isys_fw_msgs *isys_fw_msg = NULL;
 	u32 index;
 	u64 ts;
 
@@ -598,7 +599,15 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 		 * firmware only release the capture msg until software
 		 * get pin_data_ready event
 		 */
-		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
+		if (!resp->buf_id)
+			dev_warn(&adev->auxdev.dev, "%d: Invalid buf ID\n",
+				 resp->stream_handle);
+		else
+			isys_fw_msg =
+				container_of((void *)(uintptr_t)resp->buf_id,
+					     struct isys_fw_msgs, ipu6.dummy);
+
+		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
 		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
 		    stream->output_pins_queue[resp->pin_id])
 			ipu6_isys_queue_buf_ready(stream, resp);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index c925386a1e98..fabea6a75d7d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -544,7 +544,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 
 		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
 		if (ret < 0) {
-			ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+			ipu6_put_fw_msg_buf(av->isys, msg);
 			return ret;
 		}
 	}
@@ -561,7 +561,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
-		ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+		ipu6_put_fw_msg_buf(av->isys, msg);
 		return ret;
 	}
 
@@ -570,7 +570,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
-	ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+	ipu6_put_fw_msg_buf(av->isys, msg);
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index a58a35112ebd..bb3c0d6bc6c9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -919,17 +919,14 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys)
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
 
-void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data)
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struct isys_fw_msgs *msg)
 {
-	struct isys_fw_msgs *msg;
 	unsigned long flags;
-	void *ptr = (void *)data;
 
-	if (!ptr)
+	if (!msg)
 		return;
 
 	spin_lock_irqsave(&isys->listlock, flags);
-	msg = container_of(ptr, struct isys_fw_msgs, ipu6.dummy);
 	list_move(&msg->head, &isys->framebuflist);
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index abcd5e1cbc2c..f39566513a87 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -175,7 +175,7 @@ struct isys_fw_msgs {
 };
 
 struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream);
-void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data);
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struct isys_fw_msgs *msg);
 void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
 extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
-- 
2.55.0

