Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B427FD74
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834041; cv=none; b=CSP59sPoHXA79gBhNmYiEyMhhDa7+5/5fY4f/Ns1DkO8GIM6Lk02CnfM1D49zWCQEoheZdol1ULl3xbPToqwxgvPNXHGJBKJPT/+w3YcqfAAOO17UhEhRUfrTyUjS4s7PdiXCeU8hr87dhf/4LRs/Us/141Gkl3/rkU9BJQxyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834041; c=relaxed/simple;
	bh=97vRjpLOpS4w2Vt5FlEi4+wEL9BotAFTsZOCNNatn14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYiomhaxcJj3I/j8xvPMg6xzLHjg2kooJ830XKTj3MIJ9dOE95fj81/Stbs6Fp80kUUes17+x6/wWkyxNZJ9JQnPtM29rknoeqGQT3gEGPeUpC2qpdjp+KzzcsiLVXvluJwd423cje4gO7SxJQNuQ6dWevfES6f/l/zz+T7Zlsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfHJimKs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfHJimKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834040; x=1819370040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=97vRjpLOpS4w2Vt5FlEi4+wEL9BotAFTsZOCNNatn14=;
  b=XfHJimKs08VRArLeYSiRWw+0VDDwm6JQt3ypOkZ/nFIWLHnBnlbWWt6i
   kSJDSDf7IZ7Srl4qMMGVLBV28zzYe0OWy1y0CWi+TTFFh9QzY3yulNJYh
   p+2D4WNfaVhZ+ed5y5e87fM6peLojsZxYGpOj/84AUDhSC/N3MwDj32Hx
   eaBcjOiPFZD48MKaLN7vLWtykCszuiel8s+T0gu/cYIpYe65QnMcfcAd2
   VBlT6wtCXbWDepqGA+SVqok5arT4KhPR062puSbfJwhNRErktLSAt0DKO
   b5BwMa1q4lSyMD5VDXI93ws3/qw8wrcPQudKqjH1AO4S5irDNGEuY+ve0
   g==;
X-CSE-ConnectionGUID: /mm0O+QfRRiOrsygT6QwTA==
X-CSE-MsgGUID: MGQM4vGaQ0yj7XYtiF6Zhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188531"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:59 -0700
X-CSE-ConnectionGUID: cK1fP+90RJaK379nVUc/EA==
X-CSE-MsgGUID: wCSk4wUIR+yNQfZcWHFnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384280"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:57 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 05/44] media: ipu6: Remove unused ipu6 firmware struct
Date: Thu, 27 Aug 2026 15:32:57 +0300
Message-ID: <20260827123336.2219048-6-antti.laakso@linux.intel.com>
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

