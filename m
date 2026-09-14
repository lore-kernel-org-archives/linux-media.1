Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C94A0EF1
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419250; cv=none; b=VlcLsvrP11hS18K70VMqISPs2HikZFCu2+M4bVn2Yw2uEM0eDCq4X2hbwvkssuVLaDikhFmdeGtNTe4mlPHmN5x+HCHtf7mm0HXRFqOL2Vis2slzIhiBcDEDYQPAMxu/+Lw14KVXwTQ25j04RLslnlxSL8r/Ohc1ndJlhY2UFEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419250; c=relaxed/simple;
	bh=X70eXJ2BcPI4f35pRXvuNyPrTlzaF7h5wGdY3yK89RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQvtNJuDEdqzxhTkZzkzou1VdlUNiYlXeLYP0aNBjAhtRLfo/azm2240RZCv+RLW3DilPnNW3fJomf4sx4eFp4ISIYPoYMOIw6gSNC0XUB0yAaL6Ku8OIIGEN1S2lNSI8sJoHzA7u3clqBs1XONLaZekopzRinQnSyxD2xCBSq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ik8/i8et; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik8/i8et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419249; x=1820955249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X70eXJ2BcPI4f35pRXvuNyPrTlzaF7h5wGdY3yK89RE=;
  b=ik8/i8etUr9bsRNl2RSqFC5KcySkmRs9sFsafaaQ8vxYxxVCqlFeFwQ1
   7mW8I8jaClaSS46MRNfMxojRao23r6GzRHuEYYbl5iUTl2vsIpgMyOOQK
   q3n1WKogBCB5QoWMy6m+idGY9kv8f1QstEm/kcYSDNxQn4cd9VyPh0IOf
   y116EsSMy73asHff1QUdF14s0g7D/Q9VYZ03p40kX/W+37qQR6pqzOt2v
   kYYEt36jQ90U3OFxNT01afVnC/n/jscMLJ60iVwYmni5nRqLLaOJQfbzl
   wZPb5mkJl95oOrhsO2RwelwNP6ZY+DnNKCFsNn1LcHRwzEvrSh1FmaxVH
   g==;
X-CSE-ConnectionGUID: tYgLowUDQtuForjBOpd6CQ==
X-CSE-MsgGUID: cl4QmqVlQf6A87DiyCIzGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984136"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:03 -0700
X-CSE-ConnectionGUID: By8rH5ITQPWViu+El/rS1Q==
X-CSE-MsgGUID: zplsQ82lR8GLeSxGqeFvPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760761"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:00 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71147121BD0;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Jx-3y1i;
	Mon, 14 Sep 2026 23:53:58 +0300
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
Subject: [PATCH 17/21] media: ipu6: Drop {get,put}_streams_opened()
Date: Mon, 14 Sep 2026 23:53:54 +0300
Message-ID: <20260914205358.735307-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
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

