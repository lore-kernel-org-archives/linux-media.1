Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EE2C08BB
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312634; cv=none; b=C2yMq6Hggm8JzznLGfCTxyGZdwxMZ0jF827TprpXwh9S9OLedmX/tGA65Gz5crY9c4u+Y15mRBsovU3nywsz3ZAHQeGK7tFP+ceauFOpkROSym6Cyb9MR6LmVZ/wJXfxnXpwnlR69yLKOooLZ+S6pyG9CKGbP4kwh7umm6xpcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312634; c=relaxed/simple;
	bh=97vRjpLOpS4w2Vt5FlEi4+wEL9BotAFTsZOCNNatn14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMB/8sduqkbO61jny7kH9AiobD/8tdF+GNBNbsyoXTo8MetNImQJT85eFR9QcIfhp5uCa14X8eOHOvEKCsLpVsYe+YUB83txpxKDiLUWTYk8uR/it/BjKqeXWhRlamvpZNxZXvBVTJ0JcTaGDLY/hnM00hh15RCMmXXZq3bCnRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kt5s68o2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt5s68o2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312633; x=1818848633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=97vRjpLOpS4w2Vt5FlEi4+wEL9BotAFTsZOCNNatn14=;
  b=Kt5s68o252sYY/8KojN7ztblFbjtjxMVRx3QNKbXqz3gYPy6IJNIXRmS
   8uaQK0cX/S9R4JoV6f7M0VNbIP7/pLHJk4xcREpn/wgFI+75YvehUK63v
   MwBSeKnwFzYxJIWdfWyFoWL2HtYlvAbfEK7RyzEukxIr0IluhAvOaW3ti
   fMNbclVeCqabuTX2spQlFUBeMJm7T5MBaN8a7mri84rLMMcle9S542Bo0
   mBI1wJ3L1kgbG2y+dLx/GEQ0YOfln1BOBJjdv80omlW69CcHr3HH9S7m/
   B6DesEpjdKJJEHL/kDVPnzdwN/T2dRDiPMH7yXOryo9I2ZHvmp66tickM
   w==;
X-CSE-ConnectionGUID: c+KKgZfnQi+u93OBdOVeNQ==
X-CSE-MsgGUID: SQ9J7JQETJimigbQpDzcqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989023"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989023"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:52 -0700
X-CSE-ConnectionGUID: N8PIaDaJS4OWsGBLCsH+JA==
X-CSE-MsgGUID: 8dSw1XGzQGG5BkOlCw4cVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172172"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:50 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 05/44] media: ipu6: Remove unused ipu6 firmware struct
Date: Fri, 21 Aug 2026 14:42:23 +0300
Message-ID: <20260821114302.365532-6-antti.laakso@linux.intel.com>
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

The struct ipu6_fw_proxy_write_queue_token is not used anywhere,
remove it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index b60f02076d8a..393245a633f4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -511,21 +511,6 @@ struct ipu6_fw_isys_proxy_resp_info_abi {
 	struct ipu6_fw_isys_proxy_error_info_abi error_info;
 };
 
-/**
- * struct ipu6_fw_proxy_write_queue_token - ISYS proxy write queue token
- * @request_id: update id for the specific proxy write request
- * @region_index: Region id for the proxy write request
- * @offset: Offset of the write request according to the base address
- *	    of the region
- * @value: Value that is requested to be written with the proxy write request
- */
-struct ipu6_fw_proxy_write_queue_token {
-	u32 request_id;
-	u32 region_index;
-	u32 offset;
-	u32 value;
-};
-
 /**
  * struct ipu6_fw_resp_queue_token - ISYS response queue token
  * @resp_info: response info
-- 
2.55.0

