Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B16224AFA
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834045; cv=none; b=KlKkW3UulsT0R57n8G9Gjmfxwd3k2nDIK6aCT3HkdOJ0jLgoTxiswKQOm3xGai/cq4+m2SQNZRTF0dTK2AIoGNZHeYeWTgW77CcuPha3eg/XPExaaFn+UTvtGwyQxAnZarDPik7hmTlRyD8F6KLS3y3IpheThnLEmxWoXaGt+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834045; c=relaxed/simple;
	bh=OfnoOW0PbpFT+xhqLI6Vfxu9w3vn2de7QI8eqDIbjF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb8VDGJtDr9ND+IfZRRsZYJSJLsoo2ebvHysQeqK4oWG0xDjG7LTDgIwxjrBIws8edrr6l1LMkfgW1Slxs554dH1H2Wvx50uYgtMckUSChfF5SFQYloq/giEqOBNAiKMSWJO2aif7p2rgcIMdnHEm0H4m9ke5ZO3jmPdsVdDA0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPKcMb9h; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPKcMb9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834043; x=1819370043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OfnoOW0PbpFT+xhqLI6Vfxu9w3vn2de7QI8eqDIbjF0=;
  b=lPKcMb9hqFrTv5y1mkx7c6gYJwlT43waqyJjl/ZOI6qc88ygBTrzq+Jw
   aPpvTUkWdR9pIBvPKMh3BegSKZ2p4CwTt1Z1BzMFj/aBvC1SU4Z3QlHbF
   F06TYo3man5MahMIr+r1h1/+xayy78/SHqbaxByoStn3rNBxfyzRb3ler
   o7db6RkQOG2CBGzFfmG7f1/o4O/6nUnzFxMdXbQe3WRn3Agcc9nFJUBXC
   gdy8xAM5J1rsT6wAzOMV2OKmMecYpMQFX/bRdL1n+4PSP5XtVPVVlYQ2Z
   XlfHjsIn69cpTImbWnBBGE48thbpLRHfG1qd8xdYSnBhFLSQA+TbsqUZ8
   A==;
X-CSE-ConnectionGUID: 4jjdh9GSSp6hS31Qy0ONLA==
X-CSE-MsgGUID: djudVS/RS+yPICaOcDz5Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188550"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:03 -0700
X-CSE-ConnectionGUID: eepsBZ9aSVSToWqobJ8WQg==
X-CSE-MsgGUID: IF9cRZ1PQAiHuWmp1ZIubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384308"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:01 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 07/44] media: ipu6: Simplify firmware com arguments
Date: Thu, 27 Aug 2026 15:32:59 +0300
Message-ID: <20260827123336.2219048-8-antti.laakso@linux.intel.com>
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

