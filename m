Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA90849EC50
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419249; cv=none; b=jGqydEwS0hqpctmVVpp32U4NKTDaBUU6HBCe23zWcbHZb0DbVAKhM8U9vaI1Lj7ar06JChZarLLRSPecqNYgedWZncIWrgN7rzULTrfG77nr0wKmHNfVgTMZkii8jai3tsBg9zkJ9/NcLtrRn6PTFmgjD8yOm3IXKptY0iZFpnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419249; c=relaxed/simple;
	bh=+0xMO+gpmqKSiSsNNFv6TD8cCF0g+qOitWpLyW4Awus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVZDfyh1qjey9kuomgIvnQNEmzKAhTeeEpKU8i7yMD4KDLc7U7P+BYBw6RJ6Q0NtC2ylkOg0WlAYhYwTp3iJEFqD3/9AZp2IVlrspXHY9d3FXP3KBswG3iVkkBi7sFACzXr0nvQNEaHUOjsNOIQrZY78VlSym43L6JpDuzhHiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEt6LovO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEt6LovO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419248; x=1820955248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+0xMO+gpmqKSiSsNNFv6TD8cCF0g+qOitWpLyW4Awus=;
  b=aEt6LovOQeDUokm+1iLSLQkCPdEAKc+njBhIBpcFzVW8DcnF7P+FCZfB
   gfTvB1tAHO2eEAc+T383g5ZsHJH1fUbNp0FAbdBzebpTCbX07+nsnRh/+
   V45o8njLHqjSqVSxEeOP26sJSyQTRg7S7BNJRtutWiAA7kUaMur5Yuu/U
   t2ifOvXB3Z0E3KRfY8rxBJE6qO+RBdbcQ8pKMgWnF3hkjrUaSdl9dxQvp
   PfgXxnCv2plGrusXOj2r8oSm1PXpz2PVZ6Tn3PMKSsw6qpz8e3z6kI+42
   JHsVRmq75aVilfTl/C7ppkXm6xuHDPcpceBvG42uAV5WoSUfccku+kP0q
   A==;
X-CSE-ConnectionGUID: VcA13oqeTESfnnA8MW6Z+Q==
X-CSE-MsgGUID: M8ESJjAKT26sKG0U2ezzYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984133"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:03 -0700
X-CSE-ConnectionGUID: A00NLiE3QkeObC6dlHpLew==
X-CSE-MsgGUID: aHledlnxTzed2ZMdTi54nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760755"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:00 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6AD2D121BC7;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Jm-3qXB;
	Mon, 14 Sep 2026 23:53:58 +0300
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
Subject: [PATCH 15/21] media: ipu6: Rework watermark setting
Date: Mon, 14 Sep 2026 23:53:52 +0300
Message-ID: <20260914205358.735307-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
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

