Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CB53F68D
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078759; cv=none; b=gMEhPaUGmNwgvVI5NIrtHOmrARfe4S/tugXHXxXjuMoyVZP7SLxkzeIMX+6fNvC2EYgYQ0tv9y2Su28eZromaDXl7MRQXbPYCqCzZA6jInREe0gRVBjBzkxRb01okWx8As8rPttViBapy1zjqLvRKGf15BHIvHXWQazl4XE7Nwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078759; c=relaxed/simple;
	bh=7+gP5SH+ZGZTEHaxfJqMEoUD5tFtZViaOzunycIsvFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdzVKqmQMtFsouobKG1+Z3ANTDbI+0mXgu1uY8/h/FPwgC0crg6JaJlFgR7lyh327OyARAh6oogSUnGQFpxkEWiG07+G69T5NqTjW29llaSWm2LxxJnqv3CSUJSlgHcGkgSH+bMEBoqi4hgHeU+SeFgaXnvTipRJgC2ZMSZIW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heFSWdxv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heFSWdxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078758; x=1821614758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+gP5SH+ZGZTEHaxfJqMEoUD5tFtZViaOzunycIsvFA=;
  b=heFSWdxvXzb2dsO4VV9QN++GpSMHfrcxPX19a2vZ8QTDTcukwBh2937r
   z8oiolarIeq14bYrpHmAbbesTG+gdfBEXraqdDCi2VO1H6VanBVHivw3T
   E9E1c9RGjKhxBvCCulGsjeza3QyRmdB52Bi7Z9y3Z5Sc3S4Bm2oNb8FWU
   Mhvi3C5D9KEVJeZ+mtwWwsXAK572nrdRFg0Cm2HkW4H5gerlHdWDEglil
   bQdclYh996fXF3PYBddbk3MScDGHozqNa/MKncRzBrfK/SPpRl/aQv11/
   kwoifPZL6ne1Q7Oc1Q8ae5eGBZOrZ/xeivI6fLAYlgz/cHI/NcacxdR3e
   A==;
X-CSE-ConnectionGUID: OKyiiRuHRmO3/vUyhA6doQ==
X-CSE-MsgGUID: MxX9o4ltSQu4OD874RupFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227121"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:51 -0700
X-CSE-ConnectionGUID: srt0mlqTTuKHK2pDNjR4xA==
X-CSE-MsgGUID: siHNhAYoTzGqlwvI51Gp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029195"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CD554121D69;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lIe-4BIO;
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
Subject: [PATCH v3 18/21] media: ipu6: Serialise access to stream pointers by isys stream_lock
Date: Tue, 22 Sep 2026 15:05:35 +0300
Message-ID: <20260922120538.896684-19-sakari.ailus@linux.intel.com>
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
index 1cfd7b8ee2b3..50219b210ae9 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -549,6 +549,7 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 	struct ipu7_fw_isys_msg_err err_info;
 	struct isys_fw_msgs *isys_fw_msg;
 	struct ipu7_insys_resp *resp;
+	unsigned long flags;
 	u64 ts;
 
 	if (!isys->fwctx)
@@ -596,9 +597,11 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
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
@@ -681,6 +684,9 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 	}
 
 leave:
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+leave_nounlock:
 	ipu7_fw_isys_put_resp(isys);
 
 	return 0;
-- 
2.47.3

