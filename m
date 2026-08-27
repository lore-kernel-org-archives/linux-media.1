Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9512D662F
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834069; cv=none; b=HABOAGYv6EN4o1h5Jbdw1KOb246fGzvp03FRQvWiuHbFGbkbB7yrc2aSYhXPs53r0itFw5yp76+c+QHH5STnB+zrOF7YEF5/QmE9AUhSbQaWZq/iZLLZQoUttB9CqEITC3uBoVvLmYGlRF7lbJ8bh/39K3XNWHEBa4YyRmVSmOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834069; c=relaxed/simple;
	bh=TZIOcGmXxRGxieoTVv3TInFDozx/wfWrKDsDVV6QU88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWqhKfxr66x8eLNi5k0ZCSZ3D3Iu1ak96iVC1sAhv+YK67cPav9yWNmmTfQZ3yLGSPfy5AjXVb/JrxH8ohDVzkw4zSKSugm1fv6XmRcqEt+I//rQHPz5pEGcO8cZYuc71PFMbXFKoGKmkAzecrNwtAD5otDfjLZCKpHw1AFFiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S20ZaZaT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S20ZaZaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834068; x=1819370068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZIOcGmXxRGxieoTVv3TInFDozx/wfWrKDsDVV6QU88=;
  b=S20ZaZaTAUT3s5+r7vlfeU3OGhopGD8VVVH/BHNQj5s+ak9DUjd8rBp5
   eWYk1L+oAeIRRWPKXiukrBiblrXSYHAptFw99itEB2DVj1wqm1ZQuUsKv
   l2XohEbyc+tmUm3nTmksswF7Le2TJxj+NELrtaje06gvWcqsv56f++/l5
   LUu3SyUQe68MlSxo4GKe/7nNWGhxXyXa2j6p1Jt8a4vj1tjTcYSyxF+/o
   sdMdwBunl/hFZxDJMf2zP0nB9PtsypEz+9bJnUEzgRTKQdDvBmKxATfAh
   ogLh/vjdvbr79teeQX0Xcw/XCalfYSIBFmNNCsMwd3M6hynyOOse3FipO
   g==;
X-CSE-ConnectionGUID: 4h4vH+BuTXutkmR8MCF75Q==
X-CSE-MsgGUID: 32mEAp4HQFmk2U630eGFlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188621"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188621"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:28 -0700
X-CSE-ConnectionGUID: K0YngC3TQeK2uvMuMnk2LA==
X-CSE-MsgGUID: ouwrLpGdTcSx3J01jVOOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384433"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:26 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 19/44] media: ipu6: Move hw specific buffer handling down
Date: Thu, 27 Aug 2026 15:33:11 +0300
Message-ID: <20260827123336.2219048-20-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
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

