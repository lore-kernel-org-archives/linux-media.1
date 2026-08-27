Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB7F33D6ED
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834097; cv=none; b=feK9o5YMYi4cSB5/uSJ7i/zPO23YOBtk7nXKEi3DXJN1yoWcCsc4IJU+T54tPjt/o+aOIf2Uaht6rLqUyvrBijYyfyIOb16lVCO+bvuSZM00dJ8+Wvq1Dw7PI2DcW5IeDwyBNPJE3zn8X9HyzzzvkHovQEZJ5Er51/DJNS2ugTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834097; c=relaxed/simple;
	bh=q65LVmviV9uFnuJGNj5LBnmggZ9pNeWeFjOsxdFYOe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+xK2ICQYubUHGayt+CTuWkXw3wQvFNdv9k9Tb1W8/jHwkSV92aXXsM5jqVPuAEoHuz2fRiUT3bP04LO53zTPFCv3i3Jtyc+g68uc3QHLguPOLNsRXHS7oSGpT2t1xdjLgSlG3vDeHUfH8p+5fKxDVhTU+lUi8mWsMEgDsnomW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeJnVQCE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeJnVQCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834094; x=1819370094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q65LVmviV9uFnuJGNj5LBnmggZ9pNeWeFjOsxdFYOe8=;
  b=VeJnVQCEmLMGgWrgbdkr5F3hEcHvWM7s6GFHZh9Phu79BH4AJWL6cxby
   +UeDPoa7Q+cVqAeeFADNkfd6eg9+K6L2oECcorfoH8A4cxxfgKgiXX15z
   2Z6VLXelGji74i1iaKEk7IRk+zrLX0nvRkk+YrfERzKCTNWtXyWtj5RKe
   Y78i/b3qXKUO5dZ3d/RBAtUuuUysCAJoPzY6TurodHZVqmNf78jvjh21w
   IythK90x5EacLESCCtS17/S0etI47tbusFfaZNXojJFsC9oTNxGLyjdBA
   jQNMeYJS5sN+PUCwUpaGIKdy/dHQKU90O3Y3ELE+9qMQu8K7m+e8Dtnze
   g==;
X-CSE-ConnectionGUID: +q7sxG8URAC/7r8Buqtf9w==
X-CSE-MsgGUID: 70Guo5CUTuSx2PBpwykoPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188656"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188656"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:53 -0700
X-CSE-ConnectionGUID: X+CxnbJ0RTaksVWE/5M2MA==
X-CSE-MsgGUID: 9cl0nRYNQUedfyNH7nWECg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384501"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:52 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 32/44] media: ipu6: Skip watermark configuration for ipu7
Date: Thu, 27 Aug 2026 15:33:24 +0300
Message-ID: <20260827123336.2219048-33-antti.laakso@linux.intel.com>
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

The ipu7 don't have watermark nor LTR support, skip it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  4 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 12 +++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 560524e6e624..9634b4f232bd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -727,8 +727,10 @@ void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
 {
 	struct isys_iwake_watermark *iwake_watermark =
 		&av->isys->iwake_watermark;
+	struct ipu6_device *isp = av->isys->adev->isp;
 
-	if (!av->watermark.pixel_rate)
+	if (IS_IPU7(isp) ||
+	    !av->watermark.pixel_rate)
 		return;
 
 	if (state) {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 622f74021f6d..5a3ba5007249 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -822,12 +822,12 @@ static int isys_runtime_pm_resume(struct device *dev)
 	isys->power = 1;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 
-	if (IS_IPU7(isp))
+	if (IS_IPU7(isp)) {
 		ipu7_isys_setup_hw(isys);
-	else
+	} else {
 		ipu6_isys_setup_hw(isys);
-
-	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
+		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
+	}
 
 	return 0;
 }
@@ -836,6 +836,7 @@ static int isys_runtime_pm_suspend(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
+	struct ipu6_device *isp = adev->isp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&isys->power_lock, flags);
@@ -849,7 +850,8 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
+	if (!IS_IPU7(isp))
+		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
 
-- 
2.55.0

