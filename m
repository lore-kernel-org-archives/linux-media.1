Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF1748C406
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312694; cv=none; b=WJ9Lt9phK1DTjByqmCIv3MiUXb/2kaGCoap+7uY9hg6n90Rr+4pzgyA1ye5W8hWM0Vn3gJTZePCOQpOxCQUqScR4cBYu/n2rtFnP6fAins6DoO1nsAlteREyzn6PHzXQteXyR/AT1jPX2aGdMEk6hAJ51outil6BPvbK3WwsJck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312694; c=relaxed/simple;
	bh=q65LVmviV9uFnuJGNj5LBnmggZ9pNeWeFjOsxdFYOe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la+0jkjD2gUE+tz/lbgkvz0V7iNyIHePFA94nuaUFTC7KPWkWWA+Kql44hW6WulflMzaOMfAqm9bFWwh7mid50819UsfRFsx9bMAzrGyEtdjQCZjmygsGYA2lTrRSdTGAIatArnx/RFgEW8HIWFLJShkDjR/+XAPLmZUx7dRdGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ki9FM60I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ki9FM60I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312692; x=1818848692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q65LVmviV9uFnuJGNj5LBnmggZ9pNeWeFjOsxdFYOe8=;
  b=Ki9FM60I4fh1gmk+PPT7fnxpy8xpR1KK8xKlaO0u6l9d+smY30JuRr6D
   p9K1T9qj+0yJErIa4pPsYhVnoJse/xbFTnv2ZHqsbsS3XLTKgZ3Nd6ajF
   Ya8VaOU0cHvNljs4Xhx7/XLssEqV77BascaNdThut19cXC13MVMcDUU7P
   nv6Q+crVnrnE8jDKvLw8HGJ0B+TZT5CdOAETI/7rwRzOLsegZr7FsULJR
   XoUVjmJuMkRNawe7h5+FDJJ2YZ5ffFB4ZzUK5ifNJp0EI8SrWZ6FDX971
   DOOwQ+GDxCi1zcDpgUlR0Q4bQwCgTNNXOa/+xJ+CWFlWxRDay6/elLara
   A==;
X-CSE-ConnectionGUID: WXdjb1JnQue8tMhXHyqHYQ==
X-CSE-MsgGUID: MjzscFHKSRWjxOOoV34+9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989114"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989114"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:52 -0700
X-CSE-ConnectionGUID: LRduiKNySbO9uAXLhDDbww==
X-CSE-MsgGUID: Q5nNz//fQ+afPr4uhFOuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172375"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:50 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 32/44] media: ipu6: Skip watermark configuration for ipu7
Date: Fri, 21 Aug 2026 14:42:50 +0300
Message-ID: <20260821114302.365532-33-antti.laakso@linux.intel.com>
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

