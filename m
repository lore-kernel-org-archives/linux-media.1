Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFA31F996
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839907; cv=none; b=pf+LvMBlc4MAdUNgdSK9dZZACKjxotVIIMmh5pxMOPed1Xhis+Oul45dg4cJtG0v7ee66fwiPj5dVoZ/pIkoeWW6/FAMpxoN5MWffDxnIh7uAwCaki7YAPHQ6PGG7SWhF2N4gug/EolHBZiVkLaGC0hrHSAJxbqdX6YlVAx+dOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839907; c=relaxed/simple;
	bh=crc9UaVmLql8ukSezMFN93JJ24pHEzgBFMr4z+eHLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8Eq6q2qqQuWRURB4dQW9k2gpr3ewBl5EUO4HPqSOwKPOxrDhHc25VFKO3d2dEL6c17OTUZeqAUm3MfFWPtYuD28zAQTDOtq04wwSJ1QBDney9lHVHZgUqb6iCGJkrWfCLQ51FEUf/nAsxx2QkPz0GFAKGm7bV68FAPpPR0Ik8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2BsOirX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2BsOirX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839906; x=1822375906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=crc9UaVmLql8ukSezMFN93JJ24pHEzgBFMr4z+eHLXM=;
  b=H2BsOirX52B98WbM1y9vVq8jupOsAEwXQKMp5Qf3ni3OwmU7T+gehQmS
   QwfQ7y+Od8jRxmJwBrU8tnjMry1v/QA9ehbhkY8n6SHqxNIjMODByafC4
   VabwRAK8CDx+z3MPzayZfea4VmGRuMXNabRadUb+uYgtCsRczd595Lu8J
   xxDKxSHJGCfx1BITPX+PanC6nEPhSQVPLImy7VDhQxyy27Gg3OSeBZ5OF
   JtJJAyfsR3HWbNwYNQrwkmzcqs5SR4wioW4/WPOC17rXFyge8QvWZaFU6
   7yFWHll40mhkR8eabHIpt6w2YRktTvB0UrtJuzThsCzOl7sxooNx4cDPo
   A==;
X-CSE-ConnectionGUID: zGOW9bIxReWtCJeSWEenGw==
X-CSE-MsgGUID: 8tRsfpHyReihX6tmXmSRGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79150757"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="79150757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:31:46 -0700
X-CSE-ConnectionGUID: 1SlCZQV9QxyF4Oz+aoUoqA==
X-CSE-MsgGUID: vVRH8EEkSOy8ltNFaKPpzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279215603"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 00:31:45 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 1/7] media: ipu6: update ipu7 InSys ABI to 1.2.1.20251215_224531
Date: Thu,  1 Oct 2026 10:31:28 +0300
Message-ID: <20261001073134.4031143-2-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the retired IPU_INSYS_RESP_TYPE_PWM_IRQ response type and add the
mipi_fn field the firmware now reports in its place, matching staging
ipu7's ABI bump. The boot-ABI and psys message changes from that
commit don't apply here: this driver has no equivalents to touch.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
index d5289f6add8c..6b72560b0a15 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
@@ -4,6 +4,8 @@
 #ifndef IPU7_FW_ISYS_H
 #define IPU7_FW_ISYS_H
 
+#include <linux/limits.h>
+
 #define IPU7_FWLOG_MAX_LOGGER_SOURCES		(64U)
 #define IPU7_INSYS_MAX_OUTPUT_QUEUES		3U
 #define IPU7_INSYS_STREAM_ID_MAX		16U
@@ -24,6 +26,9 @@
 #define IPU7_ISYS_NUM_RECV_QUEUE		1U
 #define IPU7_INSYS_SEND_QUEUE_TOKEN_FLAG_NONE	0U
 
+/* Value of mipi_fn below when firmware ABI < 1.2.1 does not report it. */
+#define IPU7_INSYS_MIPI_FRAME_NUMBER_DONT_CARE	U16_MAX
+
 #define IPU7_LOGGER_CFG_CHANNEL_ENABLE_SYSCOM	BIT(1)
 
 #define IPU7_ISYS_MAX_STREAMS	16U
@@ -107,7 +112,6 @@ enum ipu7_insys_resp_type {
 	IPU7_INSYS_RESP_TYPE_FRAME_EOF = 8,
 	IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE = 9,
 	IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE = 10,
-	IPU7_INSYS_RESP_TYPE_PWM_IRQ = 11,
 	N_IPU7_INSYS_RESP_TYPE
 };
 
@@ -198,7 +202,7 @@ struct ipu7_insys_resp {
 	u8 pin_id;
 	u8 frame_id;
 	u8 skip_frame;
-	u8 pad[2];
+	u16 mipi_fn;
 };
 
 struct ipu7_insys_resp_queue_token {
-- 
2.43.0

