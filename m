Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D264DD3A5
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645189; cv=none; b=lly9LvS34oWizdNuh9JH/8qTYmevgtmgIK59IE1wcqFu3Ul4Otz8VNYhsuo5PLL0n66E6WFmKANEOEn7H16hXQBRVtGhuFUsj3stkZUxa+blB7NsiifasbzFupYSHCQnv8STXH10l7SO6PtUMP63b3CoT7D+Y6JIq03b2ZJ+Jg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645189; c=relaxed/simple;
	bh=X70eXJ2BcPI4f35pRXvuNyPrTlzaF7h5wGdY3yK89RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQaMM+0Q/Fjtth+eqnrXcPqwJoiFTrw/C/XyOlgVV8QN71Vf7Fbp9ombByRxdiQ/vNJRNzpc6ng8F6QuwP3/FCEZ06+4y4dq6S9KcuBZuW8RiH0Tg4n7avMwz0leZq4u4cg6OAHjuPC66P4X3YtSsIf8JjKPtWOyp+ztBaKcKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MklYJ8XM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MklYJ8XM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645187; x=1821181187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X70eXJ2BcPI4f35pRXvuNyPrTlzaF7h5wGdY3yK89RE=;
  b=MklYJ8XMxiFhTc1q6v9v+hpOcmHT9J0G6Pee7b0gQdqoHzEAB3i0JjTv
   TA08PvHLS7JKh3qdvOIpzxeDKkzdhAOpnhn3vPb81EJHJZHgjrLNOPnDL
   OM+fSeCk3f++rksBORmqUB8aEeKr4qFFISQ1EA7loWnxmndQkxavhnjN5
   LeiGI58oExqsnR3vlmSSXCaSRwGpfRtxptcvD4AikRxZESfaAOfqwlEvw
   sY8KplAaBZjupBhkzqysRtaXvaGx3HXNWwh1RBOTmXyg/SOjWWowKy0Np
   6s76nN2U2iQ6AUKFXQpbHP1uVLsVSnnp4cuZaQWwpl3lAHI5mv+q6IydM
   A==;
X-CSE-ConnectionGUID: vc6vkkcNS8yBqdPvpl2ZTw==
X-CSE-MsgGUID: vNtSYws5QaO4GJ/I8JH/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622393"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:41 -0700
X-CSE-ConnectionGUID: wATpTrUNT3S9hubtuPiSNw==
X-CSE-MsgGUID: QEF4u6COQPevPavKXKxb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097382"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 08199121C9F;
	Thu, 17 Sep 2026 14:39:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNq-0pyZ;
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
Subject: [PATCH v2 17/21] media: ipu6: Drop {get,put}_streams_opened()
Date: Thu, 17 Sep 2026 14:39:19 +0300
Message-ID: <20260917113923.59004-18-sakari.ailus@linux.intel.com>
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

{get,put}_streams_opened() aren't needed anymore. Drop them. This also
requires acquiring isys->stream_mutex for system suspend.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 37 +++----------------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  1 -
 3 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 1bb91627c7db..cea37442866e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -432,24 +432,6 @@ static int link_validate(struct media_link *link)
 	return ret;
 }
 
-static void get_stream_opened(struct ipu6_isys *isys)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	isys->stream_opened++;
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
-}
-
-static void put_stream_opened(struct ipu6_isys *isys)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	isys->stream_opened--;
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
-}
-
 int ipu6_isys_fw_pins_prepare(struct ipu6_isys_stream *stream,
 			      struct v4l2_mbus_frame_desc *desc,
 			      int (*fw_pin_cfg)(struct ipu6_isys_video *av,
@@ -527,8 +509,6 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 		return ret;
 	}
 
-	get_stream_opened(stream->isys);
-
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
@@ -536,21 +516,19 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
-		ret = -ETIMEDOUT;
-		goto out_put_stream_opened;
+		return -ETIMEDOUT;
 	}
 	if (stream->error) {
 		dev_err(dev, "stream open error: %d\n", stream->error);
-		ret = -EIO;
-		goto out_put_stream_opened;
+		return -EIO;
 	}
 	dev_dbg(dev, "start stream: open complete\n");
 
 	msg = ipu6_get_fw_msg_buf(stream);
 	if (!msg) {
-		ret = -ENOMEM;
-		goto out_put_stream_opened;
+		return -ENOMEM;
 	}
+
 	fw_ops->prepare_buf_set(msg, stream, bl);
 	ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 
@@ -585,7 +563,7 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 	retout = fw_ops->stream_close(stream->isys, stream->stream_handle);
 	if (retout < 0) {
 		dev_dbg(dev, "can't close stream (%d)\n", retout);
-		goto out_put_stream_opened;
+		return retout;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_close_completion,
@@ -597,9 +575,6 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 	else
 		dev_dbg(dev, "stream close complete\n");
 
-out_put_stream_opened:
-	put_stream_opened(stream->isys);
-
 	return ret;
 }
 
@@ -653,8 +628,6 @@ void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
 	else
 		dev_dbg(dev, "close stream: complete\n");
 
-	put_stream_opened(stream->isys);
-
 	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
 		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
 		csi2->streams_by_vc[stream->vc] = NULL;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index d7a1f89ab56c..5d220138cf37 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -814,8 +814,10 @@ static int isys_suspend(struct device *dev)
 {
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
 
+	guard(mutex)(&isys->stream_mutex);
+
 	/* If stream is open, refuse to suspend */
-	if (isys->stream_opened)
+	if (!ida_is_empty(&isys->streams))
 		return -EBUSY;
 
 	return 0;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 8a618ded1ef9..d7d211ad5a54 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -114,7 +114,6 @@ struct ipu6_isys {
 	bool csi2_cse_ipc_not_supported;
 	bool iwake_watermark_enabled;
 	unsigned int ref_count;
-	unsigned int stream_opened;
 	unsigned int sensor_type;
 
 	struct mutex mutex;
-- 
2.47.3

