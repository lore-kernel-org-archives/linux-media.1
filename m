Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D323E325
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834065; cv=none; b=g/j53VeDM4mTXvFtJcNlfqVa0KVsfKFQIWuFoBbzkg0DWkwhKogjdggoF/4ZivYTZIU33/NJ1wO8QyfhQdUVI2xBBPK1Gj7/9ALci1G3wz2fk/kqtzTSNuIRBzX57yde8o//NH+4WtSCOZN3a4NmHoOwStA32FZcUHOGT0o1MAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834065; c=relaxed/simple;
	bh=lGBFWUvumgv7qiTBm2/G9dt386z7ODZ/bFwZpVLibqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCImDo2dxUHQtjluN8K19sXpze6beT2oO38yNEvP/LvxpAo/zC6Uw381WdCF4WBsOAb4O+i44z5XG5fG2fimUiNxrjYJAzxKJ+CI6146MOTNUdutj7nLGOh3EZdjoj9oz+pUvib7qfGocP1IFBuza9Q5icWjgj5VkKo1WEIh2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZX+Cxz2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZX+Cxz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834064; x=1819370064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lGBFWUvumgv7qiTBm2/G9dt386z7ODZ/bFwZpVLibqw=;
  b=nZX+Cxz27Bf/vr+O3oyTaDG+w+VF2t1AyvccrbLQ5btYhrPX1ct0fReN
   OFETglSKCDsxuxxRZhHAvYLve1cFtYi1hI6c4cQ8XIn2EeQeBD5zjPWga
   ciDr4pTg5Y2D8FR8v99r6YGXIZWw+XYAY42jhKLY2gLt1Lre0qhaRD8Fr
   eRHvWSRDl+X5yOOc1dwNIi20F2+Vfd0pFBqQMZbkXlnNhMpR/UiGMLaMP
   KDH67O/Ireu8XPF3RKgCpJMkjquJC6GlMso+cFTjEi/8rOcXwWv/IinS/
   RHOukd3ctRCHokRA0oB4DFrJDWB3BU2egr9saL28XxvvNNUZG8kbQ8jph
   w==;
X-CSE-ConnectionGUID: nTvaVTAgTySi+fbYX38zPg==
X-CSE-MsgGUID: DKgsPABrSbm4rX8mmCJy+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188613"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:24 -0700
X-CSE-ConnectionGUID: 7Z6nVhoTTfCeFZKeHjpb1A==
X-CSE-MsgGUID: F7WhZPHdSJeG+MjBvwJ6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384420"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:22 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 17/44] media: ipu6: Rename isys fw msg union
Date: Thu, 27 Aug 2026 15:33:09 +0300
Message-ID: <20260827123336.2219048-18-antti.laakso@linux.intel.com>
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

Later we need to abstract ipu7 firmware abi structs same way
we have it now for ipu6. Renaming union per ipu helps to make
the split more clear.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h       | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index fabaed63df0c..529973860e9e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -316,7 +316,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 		if (!msg)
 			return -ENOMEM;
 
-		buf = &msg->fw_msg.frame;
+		buf = &msg->ipu6.frame;
 		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
 		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
 						 stream->nr_output_pins);
@@ -396,7 +396,7 @@ static void buf_queue(struct vb2_buffer *vb)
 		goto out;
 	}
 
-	buf = &msg->fw_msg.frame;
+	buf = &msg->ipu6.frame;
 	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 89eb265737d7..c925386a1e98 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -533,7 +533,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	if (!msg)
 		return -ENOMEM;
 
-	stream_cfg = &msg->fw_msg.stream;
+	stream_cfg = &msg->ipu6.stream;
 	stream_cfg->src = stream->stream_source;
 	stream_cfg->vc = stream->vc;
 	stream_cfg->isl_use = 0;
@@ -590,7 +590,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 			ret = -ENOMEM;
 			goto out_put_stream_opened;
 		}
-		buf = &msg->fw_msg.frame;
+		buf = &msg->ipu6.frame;
 		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
 		ipu6_isys_buffer_list_queue(bl,
 					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8af891081bd3..8f2d361b89f6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1003,7 +1003,7 @@ struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream)
 	msg = list_last_entry(&isys->framebuflist, struct isys_fw_msgs, head);
 	list_move(&msg->head, &isys->framebuflist_fw);
 	spin_unlock_irqrestore(&isys->listlock, flags);
-	memset(&msg->fw_msg, 0, sizeof(msg->fw_msg));
+	memset(&msg->ipu6, 0, sizeof(msg->ipu6));
 
 	return msg;
 }
@@ -1029,7 +1029,7 @@ void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data)
 		return;
 
 	spin_lock_irqsave(&isys->listlock, flags);
-	msg = container_of(ptr, struct isys_fw_msgs, fw_msg.dummy);
+	msg = container_of(ptr, struct isys_fw_msgs, ipu6.dummy);
 	list_move(&msg->head, &isys->framebuflist);
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 0b139ab24431..abcd5e1cbc2c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -169,7 +169,7 @@ struct isys_fw_msgs {
 		u64 dummy;
 		struct ipu6_fw_isys_frame_buff_set_abi frame;
 		struct ipu6_fw_isys_stream_cfg_data_abi stream;
-	} fw_msg;
+	} ipu6;
 	struct list_head head;
 	dma_addr_t dma_addr;
 };
-- 
2.55.0

