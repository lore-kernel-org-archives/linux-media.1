Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25074A0919
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419249; cv=none; b=H1187rgavL8oqrwzjd5r9hbTLESW9WlQryCJ3WLGOCdvCW+X5YS0MpsSYt2fAdzYaHcQbkACWROX6HKgauh3VaiQ/8IrPkCvDasojqcs4Jg8yRAGzTvJ7FKZKvvgYTM4khRP171QUbLfNtEfWPvwGYa3LXzKSfu+9Dk7s+zL/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419249; c=relaxed/simple;
	bh=eXdK6jJfB6ab8q0nR2nsC1g6P/2aJHyrL6sX+CJO3Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+UGFyW4KntD31b5jyxiksoNRaoboOKsZWuQg6vNajTmUdNNhTAWEo898dlx1i2Ojbi60F+IUGd51uQgA81rJScwvQTs2AOEQgYBvpHpeqathk+L6tuE9rJHwARuPTevt+kpbMaGNFiQx8w4YVn2y/tABab1h4c9LQI3QKNaP+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIPUF6Ar; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIPUF6Ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419248; x=1820955248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eXdK6jJfB6ab8q0nR2nsC1g6P/2aJHyrL6sX+CJO3Ts=;
  b=QIPUF6ArZZ/pmVE/Nu4PcDd5gR42y7eno9cZ88molg93yZUTUIlp7Yiy
   viUrRdNKaI6RJODAgF8UTElaE752YUGRbhtfIImYcIYfxpij3LtDzn8Hh
   uVeJvE4qUZ9ieYXHoIMQuf++/+e3ejNuJjvBD9951B9fRQW8k3Fn3UbJY
   P3xrfYm5Em/4eQHdB4WiY8J6NYWSh/3DAuzLS2Tpm+ssQOVLdE6KTzzzI
   CFA4D73iK1l4RsqzpolB4PVKK9I9CLaWUUo5aD6/gxKKSZKoVxy82NyGy
   5hkQzBtUEuwNMh4VfY/G9hjn0A7XIck7UvqQy+AO4FLuPKHlvAnJ458pY
   Q==;
X-CSE-ConnectionGUID: MZw9thDHQxGz1/2ray/Qhg==
X-CSE-MsgGUID: 4yOawRf3TE2Z51+NC3/LnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984134"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:03 -0700
X-CSE-ConnectionGUID: WeoVwnOaQee1a7sYtNik0g==
X-CSE-MsgGUID: DI3sWwPnQeelkX6S2+jlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760759"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:00 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 767BA121BD1;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035K2-41Gz;
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
Subject: [PATCH 18/21] media: ipu6: Serialise access to stream pointers by isys stream_lock
Date: Mon, 14 Sep 2026 23:53:55 +0300
Message-ID: <20260914205358.735307-19-sakari.ailus@linux.intel.com>
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

Re-purpose the unused stream_lock in struct ipu6_isys to serialise access
to streams_by_handle (struct ipu6_isys) and streams_by_vc (struct
ipu6_isys_csi2). Switch to scoped_guard() while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 24 ++++++++++++-------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  7 +++---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  8 ++++++-
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 5e1b57ef650f..0214d7105fbe 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -556,6 +556,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 			"FW error resp error %d, details %d\n",
 			resp->error_info.error, resp->error_info.error_details);
 
+	guard(spinlock_irqsave)(&isys->streams_lock);
+
 	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
 		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
 			resp->stream_handle);
@@ -670,17 +672,23 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
 	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
 
-	for (i = 0; i < NR_OF_CSI2_VC; i++) {
-		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
-			stream = csi2->streams_by_vc[i];
-			if (stream)
+	scoped_guard(spinlock, &csi2->isys->streams_lock) {
+		for (i = 0; i < NR_OF_CSI2_VC; i++) {
+			if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
+				stream = csi2->streams_by_vc[i];
+				if (!stream)
+					continue;
+
 				ipu6_isys_csi2_sof_event_by_stream(stream);
-		}
+			}
+
+			if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
+				stream = csi2->streams_by_vc[i];
+				if (!stream)
+					continue;
 
-		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
-			stream = csi2->streams_by_vc[i];
-			if (stream)
 				ipu6_isys_csi2_eof_event_by_stream(stream);
+			}
 		}
 	}
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index cea37442866e..feb0ad261252 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -628,7 +628,7 @@ void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
 	else
 		dev_dbg(dev, "close stream: complete\n");
 
-	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+	scoped_guard(spinlock_irqsave, &stream->isys->streams_lock) {
 		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
 		csi2->streams_by_vc[stream->vc] = NULL;
 	}
@@ -695,9 +695,8 @@ ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2 *csi2,
 	stream->asd = &csi2->asd;
 	stream->vc = vc;
 
-	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
-		stream->isys->streams_by_handle[stream->stream_handle] =
-			stream;
+	scoped_guard(spinlock_irqsave, &stream->isys->streams_lock) {
+		stream->isys->streams_by_handle[stream->stream_handle] = stream;
 		csi2->streams_by_vc[stream->vc] = stream;
 	}
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 1e29d0acddb3..96acd76dcd2e 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -550,6 +550,7 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 	struct ipu7_fw_isys_msg_err err_info;
 	struct isys_fw_msgs *isys_fw_msg;
 	struct ipu7_insys_resp *resp;
+	unsigned long flags;
 	u64 ts;
 
 	if (!isys->fwctx)
@@ -597,9 +598,11 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 	if (resp->stream_id >= IPU7_ISYS_MAX_STREAMS) {
 		dev_err(dev, "bad stream handle %u\n",
 			resp->stream_id);
-		goto leave;
+		goto leave_nounlock;
 	}
 
+	spin_lock_irqsave(&isys->streams_lock, flags);
+
 	stream = resp->stream_id < IPU6_ISYS_MAX_STREAMS ?
 		isys->streams_by_handle[resp->stream_id] : NULL;
 	if (!stream) {
@@ -682,6 +685,9 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 	}
 
 leave:
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+leave_nounlock:
 	ipu7_fw_isys_put_resp(isys);
 
 	return 0;
-- 
2.47.3

