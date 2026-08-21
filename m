Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE647126E
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312638; cv=none; b=Hup/GdQvbmaTydxDb5eQCXEEMVlGbTKglZ5nuilc/wRANw8GRtd5pSpHQDUGomDFiKYCaPBrG5AY33PqKqc+D7Fc9mDRTKRYVsxy3I8cHJbZHdY068fTCL5jeR1z2j3BZi60edsA4MKQ3q7zGJA/Y2zyNijly/zgJBk3KZyhHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312638; c=relaxed/simple;
	bh=OfnoOW0PbpFT+xhqLI6Vfxu9w3vn2de7QI8eqDIbjF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHalFRLiH3WoE/vGK1ZAkrx4cgKvs+64uweOL3zRj37/CQo/Y3wrziuV9K02pYTbAQa93Aw9EzfBn/6ZKw47tW++ThUgU+yZsXSkkOzAJXm9av7LjJLI4FlrxYEiKaRXsWpxQK67jE2ppg04vuRT4Vwxv+LEBUZ6abPrIzihrZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRq+YWds; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRq+YWds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312637; x=1818848637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OfnoOW0PbpFT+xhqLI6Vfxu9w3vn2de7QI8eqDIbjF0=;
  b=mRq+YWds9OwmcYxM76amXJoh/u8JanH1XrpwrbvjD7p+W2i3PhvYySOX
   gasrI/V7Ob3JE6MGPq+7VXVLQW9EG4RWzeZGmrrGCuDkkhZfRcmJMAEWB
   7KCqxXJrwtKHfQBE0/+VXE0bzuFxYnTR9RH5pIEtRZYSBvHaeAM94JW8Z
   6ydTlal7gSvp3+19FVwqZh0QOYAeXUUG4K7J3KIw0mVr0mVzjTmMhJ+8i
   bKl4+DtVT3gTNaheUYPvwtobB/pDhwdDaS3tILGaMwklVoFKNIUrzioEY
   JOfTL2C00SeuS4tETu9hBT31nzIzxq5y5wxDU8xxW8eYgwpWRg4sRmx0R
   Q==;
X-CSE-ConnectionGUID: bLt2h0FHTRaswJ/szd++gQ==
X-CSE-MsgGUID: XKbJ7PprQneYKgJFti/7tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989032"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:56 -0700
X-CSE-ConnectionGUID: NCgnXFKDREyGssakQAYlEA==
X-CSE-MsgGUID: O0z1CCWQRtu1DVUHYa3G7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172194"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:54 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 07/44] media: ipu6: Simplify firmware com arguments
Date: Fri, 21 Aug 2026 14:42:25 +0300
Message-ID: <20260821114302.365532-8-antti.laakso@linux.intel.com>
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

We need only pointer to ipu6_isys struct, and queue number
can be removed as it is always the same.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.c    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index a65e9f1aa104..fc2f24c05de7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -366,14 +366,14 @@ int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 }
 
 struct ipu6_fw_isys_resp_info_abi *
-ipu6_fw_isys_get_resp(void *context, unsigned int queue)
+ipu6_fw_isys_get_resp(struct ipu6_isys *isys)
 {
-	return ipu6_recv_get_token(context, queue);
+	return ipu6_recv_get_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
-void ipu6_fw_isys_put_resp(void *context, unsigned int queue)
+void ipu6_fw_isys_put_resp(struct ipu6_isys *isys)
 {
-	ipu6_recv_put_token(context, queue);
+	ipu6_recv_put_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
 void ipu6_fw_isys_dump_stream_cfg(struct device *dev,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index 393245a633f4..15d4ae355f28 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -576,6 +576,6 @@ int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
 				  unsigned int offset, u32 value);
 void ipu6_fw_isys_cleanup(struct ipu6_isys *isys);
 struct ipu6_fw_isys_resp_info_abi *
-ipu6_fw_isys_get_resp(void *context, unsigned int queue);
-void ipu6_fw_isys_put_resp(void *context, unsigned int queue);
+ipu6_fw_isys_get_resp(struct ipu6_isys *isys);
+void ipu6_fw_isys_put_resp(struct ipu6_isys *isys);
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 180a53f3d7ab..8af891081bd3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1215,7 +1215,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 	if (!isys->fwctx)
 		return 1;
 
-	resp = ipu6_fw_isys_get_resp(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
+	resp = ipu6_fw_isys_get_resp(isys);
 	if (!resp)
 		return 1;
 
@@ -1324,7 +1324,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 
 	ipu6_isys_put_stream(stream);
 leave:
-	ipu6_fw_isys_put_resp(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
+	ipu6_fw_isys_put_resp(isys);
 	return 0;
 }
 
-- 
2.55.0

