Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCAE489895
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312640; cv=none; b=p2w517Rsi9/8/KwucdMK66kBY2OpEhc8IqtL49OZpGTMJ7Ugz8eSPYXpR0/NGKdENd3lyALkkw9Hu040mjlH54rCz1h4AQ9ntIFdwz+9Zk0V+zUVWznLRJENnnKMm7B3HR44yYvZRyE0Fn33hbAYo/k3HP33ZQzsXqZ1ei7nt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312640; c=relaxed/simple;
	bh=Pp6kmGmzjk68XWpC3Ku11F9henpFYWZHL4nFqtl6Q64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPaw1RX1M0dt+wCuCcOlvHZdibNZJIhcfxzWyE2RTuBQldh9/7XPr7u4IusAtFhhl8FFAYLyCLqb+J0fWEyR9r2qwFeJVlUvW40Eep0t3XyMIvwt+8+BjeJ0wO4Sk2/vpY9gqK0TEd/Rx4gtzMGxKUk51YZ322bpp8isfsJvEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqQbQO9Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqQbQO9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312639; x=1818848639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pp6kmGmzjk68XWpC3Ku11F9henpFYWZHL4nFqtl6Q64=;
  b=PqQbQO9YeHq+YAGQfqjL35bOe757szZuGmmgmTng4TL67M8kceYTCQI8
   v4e96y1zRzLHCXw/DRYUwLOH9QXSCpU8dym33roxGt+WVSBTSzc7vIl1W
   WQgXTcwAWovUUQAFZCT/S/vESv0QiDjdVMQET/pUf9BhDbbD7ySidHnZw
   QPiS9snjofW0IlgdW0pSuZsaHnN5AYT+GczaFqGHUmGI7lus6PTxYgHfa
   m1wVeTm61ji4SBpLrp1V4CETRv0gCCy2h68ZRNVpFcnzg14WkTRuU8dUl
   R0uOhCKAZDT90+TpJP1uMUVOlmVSrTo0QkLdZH7jU4AeiIUNmmlZEIc5w
   g==;
X-CSE-ConnectionGUID: cnL/EOzoQk6W29xhSZ0kWg==
X-CSE-MsgGUID: cLxoarRbRseVj0lcg3D3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989037"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:59 -0700
X-CSE-ConnectionGUID: vgPshm+6SQeW7v7eUohfAg==
X-CSE-MsgGUID: gCOLnGj7QNeRAdTHw89stw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172204"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:56 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 08/44] media: ipu6: Add helper to identify ipu7
Date: Fri, 21 Aug 2026 14:42:26 +0300
Message-ID: <20260821114302.365532-9-antti.laakso@linux.intel.com>
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

The ipu7 comes in two flavors as of now, ipu7 and ipu7p5.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 874b377a2e9a..ebae876058ca 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -27,11 +27,17 @@ struct ipu6_bus_device;
 #define IPU_VERSION_6SE		BIT(1) /* JSL */
 #define IPU_VERSION_6EP		BIT(2) /* ADL/RPL */
 #define IPU_VERSION_6EP_MTL	BIT(3) /* MTL */
+#define IPU_VERSION_7		BIT(4) /* LNL */
+#define IPU_VERSION_7P5		BIT(5) /* PTL */
 
 #define IS_IPU6_TGL(isp)	((isp)->hw_ver & IPU_VERSION_6)
 #define IS_IPU6SE(isp)		((isp)->hw_ver & IPU_VERSION_6SE)
 #define IS_IPU6EP(isp)		((isp)->hw_ver & IPU_VERSION_6EP)
 #define IS_IPU6EP_MTL(isp)	((isp)->hw_ver & IPU_VERSION_6EP_MTL)
+#define IS_IPU7(isp)		((isp)->hw_ver & \
+				 (IPU_VERSION_7 | IPU_VERSION_7P5))
+#define IS_IPU7_MTL(isp)	((isp)->hw_ver & IPU_VERSION_7)
+#define IS_IPU7P5(isp)		((isp)->hw_ver & IPU_VERSION_7P5)
 
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
-- 
2.55.0

