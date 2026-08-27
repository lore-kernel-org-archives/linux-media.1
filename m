Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9062FA0C6
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834046; cv=none; b=hkEWd8mp2RwCsy9Akj1Esp64o8PPlh3HLddIxgbiuBkD5y34NxXR6bsTvDxELNNxGqzGueQf/GzvKmor4hCAxmmp3GKiwEYNeWzMA0iajWRggbhg9JiUPGxrmfK4520I0lJlUvlyg40/fs7G1TK0euzvCX3C8NC8aX4wHAy3wJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834046; c=relaxed/simple;
	bh=Pp6kmGmzjk68XWpC3Ku11F9henpFYWZHL4nFqtl6Q64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3JQvQQscmYQlKKBiuwrz42jUs/norHZ4YDe2ODW7eEsQ7iYFj15EuxjJC3aeXtQtb8MrwFfJEmCRh+SP5K/F67pkYLrVbgD4114NNHaTIAS5NcVlIcJxbaECpJ7xi8ELQ1IDCgCOEItNK1UUII7FtSY5tdkC1YteTArvZ4PUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXUBoeB7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXUBoeB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834045; x=1819370045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pp6kmGmzjk68XWpC3Ku11F9henpFYWZHL4nFqtl6Q64=;
  b=DXUBoeB7I+PY23rCjM8k1i7yQP9TktFM2CjdBWdZgvvksEGycQ7OEnau
   FqZAiDwi3uuZMec2g6DlE+yVnzdnWAQu3fPX8s5Su+g6B7IqOqZ4tDI5/
   sjHGGe3kOWybNyBCz4zqvtTohNkgINgHx2Lt35pDWqfY0O9zxwnf11SD0
   JIEQE9K0SaPReQCrrxvCbbEKEjc5qclcPrmweSYYTvq/EfDxmnz1uglc2
   2srgX9z07N8DpzuJbRO27+MD78+/zAfqHM5JyGkc1Wi4SS4kiU5vgQivQ
   Wsd9w5tlEwNAEAdsmFuB08sNLPzJFzHoGcxLqvJUaDUpYt3D2mwWXD+ia
   g==;
X-CSE-ConnectionGUID: 4H9f2X8xTdKc71aMFMjcWg==
X-CSE-MsgGUID: SC6Vez0YRGuUvHb6OQfBag==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188558"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:05 -0700
X-CSE-ConnectionGUID: IhP/AAS/Tm63FvLeqSbXkg==
X-CSE-MsgGUID: d8QrDCA6QP27si/NY8+9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384315"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:03 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 08/44] media: ipu6: Add helper to identify ipu7
Date: Thu, 27 Aug 2026 15:33:00 +0300
Message-ID: <20260827123336.2219048-9-antti.laakso@linux.intel.com>
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

