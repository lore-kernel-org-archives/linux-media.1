Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8534DAFAF
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645189; cv=none; b=GUPUtK+oRpaswIXirp9D85TVUG/8Y0HcvfrTSSY4YtziUCgvvd9I+3cMKF6JMNQRy5eP1dIhWrXliQ2TOQ3twG7USD41RSTsj+yXBVheIrVSLoe3bQti1NzG1GV6kK0mW95IbPSxNFGV18M/u1l3o9U1n7piVnmGPxA3drDhYJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645189; c=relaxed/simple;
	bh=+0xMO+gpmqKSiSsNNFv6TD8cCF0g+qOitWpLyW4Awus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uM3Pb6j5Qik0SHFHY68Dz++ujRoGiprd18aKLcqthE6R29pFGmtO0dQXk7YbMZGri3DKGkGgxV5A5a4nJ2Nw6NVASe+Y/z1TKLwoMXd1JcX+c3GMZur7d8JpvGtL/5vy9LNoBviomLnJ+vVkrmaavZa+Qle0619QMbN0Qkcen8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7Gi5cMU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7Gi5cMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645188; x=1821181188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+0xMO+gpmqKSiSsNNFv6TD8cCF0g+qOitWpLyW4Awus=;
  b=W7Gi5cMUku3utxFuwmmpbZtb7gSOL8NRU1nqOWr0k2mDZp2P+VolclE6
   Kqn013W3/vw1B+rI21l1apkAxFivoXcr3i/34+Le8IA2YcDmFAs7znmeh
   6liwrL4++1mQaGStN5eNnKR81BNl5Jxbxx/riPt5B2Zevs3KEGAMHfAw6
   SBZ1gB4k+U1b66Rnhb3TadWezCbGt18WYOYotNFq15EScNS/Sqn6ztkTA
   OayS5Y8dYogJQ2TsstxvcbXsXuqJY/IbisMyFHWoK0y6H81eqVPf3Ly5I
   tDCZ8aUOAWEgHo4UMwP6aOpnQUq6iA1dSztOXufH9Rkzq6vEWvqEeO/TP
   Q==;
X-CSE-ConnectionGUID: yZ8zsnM6SRu0GsZTeLOb6Q==
X-CSE-MsgGUID: deF2rEl1SPKS/rh95J2qvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622394"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622394"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:41 -0700
X-CSE-ConnectionGUID: 0/Qac7mdSCq8BUIcggIyNg==
X-CSE-MsgGUID: bf27zB/PTO64c7o2zKwUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097386"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 01D1F121C8C;
	Thu, 17 Sep 2026 14:39:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNg-0hdX;
	Thu, 17 Sep 2026 14:39:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 15/21] media: ipu6: Rework watermark setting
Date: Thu, 17 Sep 2026 14:39:17 +0300
Message-ID: <20260917113923.59004-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove structs to maintain watermark related configuration, by using the
values where they're obtained, apart from keeping watermark enabled status
in struct ipu6_isys.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 76 ++++++++----------------
 drivers/media/pci/intel/ipu6/ipu6-isys.h | 34 +----------
 2 files changed, 26 insertions(+), 84 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8e5f6bbf6265..0933fb617d3b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -101,6 +101,27 @@ enum ltr_did_type {
 	LTR_TYPE_MAX
 };
 
+struct ltr_did {
+	union {
+		u32 value;
+		struct {
+			u8 val0;
+			u8 val1;
+			u8 val2;
+			u8 val3;
+		} bits;
+	} lut_ltr;
+	union {
+		u32 value;
+		struct {
+			u8 th0;
+			u8 th1;
+			u8 th2;
+			u8 th3;
+		} bits;
+	} lut_fill_time;
+};
+
 #define ISYS_PM_QOS_VALUE	300
 
 static int
@@ -347,20 +368,6 @@ static void ipu6_isys_setup_hw(struct ipu6_isys *isys)
 		writel(thd[i], base + IPU6_REG_ISYS_CDC_THRESHOLD(i));
 }
 
-static void get_lut_ltrdid(struct ipu6_isys *isys, struct ltr_did *pltr_did)
-{
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-	struct ltr_did ltrdid_default;
-
-	ltrdid_default.lut_ltr.value = LTR_DEFAULT_VALUE;
-	ltrdid_default.lut_fill_time.value = FILL_TIME_DEFAULT_VALUE;
-
-	if (iwake_watermark->ltrdid.lut_ltr.value)
-		*pltr_did = iwake_watermark->ltrdid;
-	else
-		*pltr_did = ltrdid_default;
-}
-
 static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -456,21 +463,14 @@ static void set_iwake_ltrdid(struct ipu6_isys *isys, u16 ltr, u16 did,
  */
 static void enable_iwake(struct ipu6_isys *isys, bool enable)
 {
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	int ret;
 
-	mutex_lock(&iwake_watermark->mutex);
-
-	if (iwake_watermark->iwake_enabled == enable) {
-		mutex_unlock(&iwake_watermark->mutex);
+	if (isys->iwake_watermark_enabled == enable)
 		return;
-	}
 
 	ret = set_iwake_register(isys, GDA_ENABLE_IWAKE_INDEX, enable);
 	if (!ret)
-		iwake_watermark->iwake_enabled = enable;
-
-	mutex_unlock(&iwake_watermark->mutex);
+		isys->iwake_watermark_enabled = enable;
 }
 
 void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
@@ -524,7 +524,8 @@ void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
 		did = calc_fill_time_us * DEFAULT_DID_RATIO / 100;
 		ltr_did_type = LTR_ENHANNCE_IWAKE;
 	} else {
-		get_lut_ltrdid(isys, &ltrdid);
+		ltrdid.lut_ltr.value = LTR_DEFAULT_VALUE;
+		ltrdid.lut_fill_time.value = FILL_TIME_DEFAULT_VALUE;
 
 		if (calc_fill_time_us <= ltrdid.lut_fill_time.bits.th0)
 			ltr = 0;
@@ -581,30 +582,6 @@ void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
 	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
 }
 
-static void isys_iwake_watermark_init(struct ipu6_isys *isys)
-{
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-
-	INIT_LIST_HEAD(&iwake_watermark->video_list);
-	mutex_init(&iwake_watermark->mutex);
-
-	iwake_watermark->ltrdid.lut_ltr.value = 0;
-	iwake_watermark->isys = isys;
-	iwake_watermark->iwake_enabled = false;
-	iwake_watermark->force_iwake_disable = false;
-}
-
-static void isys_iwake_watermark_cleanup(struct ipu6_isys *isys)
-{
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-
-	mutex_lock(&iwake_watermark->mutex);
-	list_del(&iwake_watermark->video_list);
-	mutex_unlock(&iwake_watermark->mutex);
-
-	mutex_destroy(&iwake_watermark->mutex);
-}
-
 /* The .bound() notifier callback when a match is found */
 static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
@@ -1037,8 +1014,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (ret < 0)
 		goto out_remove_pkg_dir_shared_buffer;
 
-	isys_iwake_watermark_init(isys);
-
 	if (IS_IPU7(adev->isp))
 		isys->phy_set_power = ipu7_isys_csi_phy_set_power;
 	else if (IS_IPU6SE(adev->isp))
@@ -1083,7 +1058,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
 
-	isys_iwake_watermark_cleanup(isys);
 	mutex_destroy(&isys->stream_mutex);
 	mutex_destroy(&isys->mutex);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index b85c216b3a46..b9239791dd5e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -62,38 +62,6 @@ struct ipu6_bus_device;
 #define IPU6EP_MTL_LTR_VALUE			1023
 #define IPU6EP_MTL_MIN_MEMOPEN_TH		0xc
 
-struct ltr_did {
-	union {
-		u32 value;
-		struct {
-			u8 val0;
-			u8 val1;
-			u8 val2;
-			u8 val3;
-		} bits;
-	} lut_ltr;
-	union {
-		u32 value;
-		struct {
-			u8 th0;
-			u8 th1;
-			u8 th2;
-			u8 th3;
-		} bits;
-	} lut_fill_time;
-};
-
-struct isys_iwake_watermark {
-	bool iwake_enabled;
-	bool force_iwake_disable;
-	u32 iwake_threshold;
-	u64 isys_pixelbuffer_datarate;
-	struct ltr_did ltrdid;
-	struct mutex mutex; /* protect whole struct */
-	struct ipu6_isys *isys;
-	struct list_head video_list;
-};
-
 struct ipu6_isys_csi2_config {
 	u32 nlanes;
 	u32 port;
@@ -144,6 +112,7 @@ struct ipu6_isys {
 	bool need_reset;
 	bool icache_prefetch;
 	bool csi2_cse_ipc_not_supported;
+	bool iwake_watermark_enabled;
 	unsigned int ref_count;
 	unsigned int stream_opened;
 	unsigned int sensor_type;
@@ -165,7 +134,6 @@ struct ipu6_isys {
 	struct list_head framebuflist;
 	struct list_head framebuflist_fw;
 	struct v4l2_async_notifier notifier;
-	struct isys_iwake_watermark iwake_watermark;
 };
 
 struct isys_fw_msgs {
-- 
2.47.3

