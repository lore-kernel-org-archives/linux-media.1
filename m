Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E6439331
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423381; cv=none; b=VTg5+CjOqDctdm1uZvweFgCI1ObRK1KVw0otGvnA77VHckJilVKv5+zhRRLGi+lp5nuKNgyN/sysF7g9h+TJWsosomp0zdRzBFEYtm7mkX3ta6pmybXxdOwRZwEenPP4+pZLxZfKVmZ9ze/i8DvlPlCtQZOXNCsD0uG4Tep2fMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423381; c=relaxed/simple;
	bh=wY2sRDMZ88Doq6nGcCQyM5oIvh5FYGVdnm0Nb47sYfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYVbwBdW789xIHXh5CUVJX3AlmyB3/pbOgkUbD6J4/YgT6YTaSmR/rign+NLh3Z6K2J4xkz4PJlWzqru5v7p8Tv1N4Fmz9WQoKflZMS1QXkvIkUH6N6foZSsnD0dAaTXa5UmN6/wllmvY6pxJU8jsIoAn9oeLlRLScBJtYiBfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQMCfOR4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQMCfOR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788423379; x=1819959379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wY2sRDMZ88Doq6nGcCQyM5oIvh5FYGVdnm0Nb47sYfg=;
  b=WQMCfOR4J+GtT88IU0Cubd4J9nLn7bM+K8JzUG3QbcRhGdItViJH8xXF
   /bj9jTYcUr3Y+Vv0j2M1a/KP5zED3nol9pWVbgI2bJii9/tdIM6oNW4nB
   tNNo2XLN3IN6GbNhJLcNbhTuf3Saj9tk5IRsSvH36Vduo7BTG3DCCplus
   VcTNQOvM/GsRVsrypK17/2lwZPF2rtfo7/wtMeSiVg443RwBTAOGkQ3Ao
   PFxpr7X9QkMlMcmas9LM0N43E4Hik+Hf3hQwNsKMfwWDrihQjP9r1gdrR
   z/ygZoz0zJ4e6gKaf8oSS1kIxkwkZyHfv7jULg/lmUwCQXK0jP9rKT+26
   Q==;
X-CSE-ConnectionGUID: /Z0t14s1RxSlABgDAR34TQ==
X-CSE-MsgGUID: AMjY18ZTRoSMtHc46EbjRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92766328"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92766328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 01:16:19 -0700
X-CSE-ConnectionGUID: yQLyF6u2RNmXExQZVtkX+Q==
X-CSE-MsgGUID: 7h2iOdz7Rv+LwQ6iR7+KBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="299516698"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 01:16:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 292C712033D;
	Thu, 03 Sep 2026 11:16:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x22cI-00000007j7H-2ZRD;
	Thu, 03 Sep 2026 11:16:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	mchehab@kernel.org,
	sarang.sapre@intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH v2 1/1] media: ipu6: Add a Kconfig option for IPU 7, 7.5 support
Date: Thu,  3 Sep 2026 11:16:14 +0300
Message-ID: <20260903081614.1841716-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com, Ricardo Ribalda Delgado <ricardo@ribalda.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com, Ricardo Ribalda Delgado <ricardo@ribalda.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Kconfig option for IPU 7 and IPU 7.5 support in the IPU 6 driver.
Enabling this option adds the IPU 7 and IPU 7.5 PCI IDs to the IPU 6
driver and disables the IPU 7 staging driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Make ipu7 driver alternatively depend on COMPILE_TEST

 drivers/media/pci/intel/ipu6/Kconfig | 7 +++++++
 drivers/staging/media/ipu7/Kconfig   | 1 +
 include/media/ipu6-pci-table.h       | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 1129e2beb4be..f441ee66f151 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -16,3 +16,10 @@ config VIDEO_INTEL_IPU6
 
 	  To compile this driver, say Y here! It contains 2 modules -
 	  intel_ipu6 and intel_ipu6_isys.
+
+config VIDEO_INTEL_IPU6_IPU7
+	bool "IPU 7 and IPU 7.5 support"
+	depends on VIDEO_INTEL_IPU6
+	default y
+	help
+	  Enable support for Intel IPU 7 and IPU 7.5.
diff --git a/drivers/staging/media/ipu7/Kconfig b/drivers/staging/media/ipu7/Kconfig
index 7d831ba7501d..44e6c72d71e5 100644
--- a/drivers/staging/media/ipu7/Kconfig
+++ b/drivers/staging/media/ipu7/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_INTEL_IPU7
 	depends on X86 && HAS_DMA
 	depends on IPU_BRIDGE || !IPU_BRIDGE
 	depends on PCI
+	depends on !VIDEO_INTEL_IPU6_IPU7 || COMPILE_TEST
 	select AUXILIARY_BUS
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
index cacb8a3170d0..606bf013fbc2 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -24,8 +24,10 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+#ifdef CONFIG_VIDEO_INTEL_IPU6_IPU7
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
+#endif
 	{ }
 };
 

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: 50856908ce9badbc03765bfbb49fe67f3dffc89f
prerequisite-patch-id: 15431f165ff5c789dd0e958a228ffa1e03a3668e
prerequisite-patch-id: 734492a207870f1b6b3fb6ac882245e6a120f1c2
prerequisite-patch-id: 56223856c727d416ecf312ffe4e8b820b0c7f5ef
prerequisite-patch-id: 0a58102a63e9a66befe3ad69319506055d180ede
prerequisite-patch-id: cb34049cf2bf418106c74ab7ec41fe8022b51f5b
prerequisite-patch-id: 1fa808f0fec7ec733a8aa93f40974844d958291f
prerequisite-patch-id: ebaeb384de7f3a7f31b15d11a02415944f954a87
prerequisite-patch-id: fcf19314a683fa787aacb933e227f1cf4eba48af
prerequisite-patch-id: fbd1dca9afdf208e7a7ef171a770e6451effa67f
prerequisite-patch-id: fab2e30f46498ba4c94ebfe1148f4a113ac632a9
prerequisite-patch-id: f9d0887218781cc4750e674af791732a124dc936
prerequisite-patch-id: 7b9599d525685094d059b3ff5c07477fa5363ef0
prerequisite-patch-id: 24797d9b2413920c595560a475e105b1d537f262
prerequisite-patch-id: 68c4c8fdf97a438eb89c5c2f823604fbe90651b7
prerequisite-patch-id: 4e82f7c21c70f4b74488a56426fef7d50e293fd8
prerequisite-patch-id: 54ff13db3aecd7dd7ccf027ec929ad2f8225890e
prerequisite-patch-id: fe65b24b749f0ac7282a1af0fba14c6004c090ca
prerequisite-patch-id: d5eb002cadb3e2e760135011306f49bba3c5abe5
prerequisite-patch-id: cc13ab54bb81ff7ee1336e2941bdfa54901e765b
prerequisite-patch-id: 5709e4f4eebbaf6edf8a88695d29e8cc70a708ea
prerequisite-patch-id: ddbfc0360030ef98c21aa06f709b9ad9fbd6e8a8
prerequisite-patch-id: ef9b3e50c49a3a4144cf55e5d34a0f54c110090b
prerequisite-patch-id: d4622868e4ff1d8186c3722727530d8ee251bb68
prerequisite-patch-id: 88cdfb12109f19cc643c1037a3506f525ce5c7f8
prerequisite-patch-id: d3f0657a7fb2222a6d0de9fd9df8faefcb88c4e7
prerequisite-patch-id: 9396e2cbe6c82778e9c589ae8c4d50c68fce4a54
prerequisite-patch-id: d2d5cef88a483b1c01c26cf3cdb958920b94db52
prerequisite-patch-id: c18a0e871b6ba5f501b8615b6914f8070bc9ebeb
prerequisite-patch-id: df220b267694663be45023f499407771a1215cda
prerequisite-patch-id: a60c0bc05ae8b0eb037f3bd41b1f9d1c6c287563
prerequisite-patch-id: 3d7f821db922a869aeacf6322fde359bd0e318fb
prerequisite-patch-id: be40017296955faef77638be5f0867ea7309df82
prerequisite-patch-id: 2efcb5f489e58084c05739e860e1b47643850374
prerequisite-patch-id: 2d005004560da48e2207141c1ae85f251dc0249d
prerequisite-patch-id: b6da1454b6474b13cd89a7d7b5eef2208801e28b
prerequisite-patch-id: dddf7e938f6cc98d695a0a6047168733fe60e0d1
prerequisite-patch-id: f3a5c5f58a9fd9624fa6f3afb0747b13b98a690e
prerequisite-patch-id: ec5dbd156cf963e4d784080b28301d4434d86d80
prerequisite-patch-id: 6712d8933601fa7668c0e1d50a33b197ba4cdfde
prerequisite-patch-id: 29b4797fabd81a0c89745cc22acc8f6437ea8f4b
prerequisite-patch-id: f9a7d2468799cefd8c099b89b7e6688dd215758e
prerequisite-patch-id: 94f69f633ad2d59f85623e9869c182cdaf28e0e1
prerequisite-patch-id: 5f4e03d19f5ca1712c252a6ac0308a85bcb260e4
-- 
2.47.3

