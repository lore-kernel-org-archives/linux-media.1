Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4941A921
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805362; cv=none; b=nQHmFiRApPh5jDUPk5tOB6SogjlT8FoEnJFjLacVvrka9lM/0mf4ik6WOoNB1WtKRKiw9+W4ow/yO0cK82gY2KC64pWmfP/gzD0XGQnT1csiNgokTVLPorDll+3htl05LzY6AdKKGZX8xpkMRH+RnaNcEg2BdFriYHPMFi+C+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805362; c=relaxed/simple;
	bh=xqfXTpCg7V2CPn/iDGX+WMU4QS2WxiEtCb1iT7AuKhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqS+w88GDqZ8klQU0GxY808DDDBY75vIjzD+NfY9p/GNlP4YjfFV0o1s9nD+ZAMZ4nfNefu8MA+PSfh5iD8nply1LXkIRaLVLRHJs7Tdcu2JXoxSMebuKdoKAPdr6y7hCDNFcfURBdVavdU9ixBpZRdTgbAnXQ1shgDI/DRY+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOqviX+J; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOqviX+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791805360; x=1823341360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xqfXTpCg7V2CPn/iDGX+WMU4QS2WxiEtCb1iT7AuKhQ=;
  b=eOqviX+JuZIkfHoN7EmyCnrs7QQH02cAp+LQBSF5kTEI/Lkg59FEGOjk
   KokM/xAU81lvTkNoaRJU3eYpa0c/KiLiElN9HM8TBVcHSbCTBJEeNXKFO
   r6VlWn+Ir7SjrcoINX54q3BfxOPKL1Q516ESKnIFkC0vt4jIP2rY+vOOr
   iPo4bJZ7dasawKIBxvfpSJiX7LKLf2rw87MG+WOwe54qpiDF36+tLKuVG
   hHREbtmBRGcZYA0COjB1Kx5DkpJUyc5r9gsjp8I4uKyet9/75ljnTRX+6
   sFFOurXVkJR5dZrnHZMdG/3F2vZWKyIPVJImwdGSEhShStsFH8dgEhNsD
   g==;
X-CSE-ConnectionGUID: 8BpT1mJWR/+OJWBb7rHPmg==
X-CSE-MsgGUID: V8sgTd82QLibXYMJWwP/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394318"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394318"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:40 -0700
X-CSE-ConnectionGUID: yMYVygLfTOaFuoD013Hljw==
X-CSE-MsgGUID: h+MI6oxfTEGa3QsH1d9kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="978023"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:36 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5854B121BA6;
	Mon, 12 Oct 2026 14:42:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xGENu-0000000Geyp-2aFU;
	Mon, 12 Oct 2026 14:40:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: [PATCH v2 4/5] media: ipu6: Remove need_reset check from video device open
Date: Mon, 12 Oct 2026 14:40:01 +0300
Message-ID: <20261012114002.3970409-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
References: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISYS requires power reset in some cases. Opening a video node is
however independent of that; allow opening it even if reset is needed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 19 +------------------
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index d637b428b0f5..74e39dc98ddb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -483,7 +483,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 
 	scoped_guard(mutex, &av->isys->mutex) {
 		if (av->isys->need_reset) {
-			ret = -EBUSY;
+			ret = -EIO;
 			goto out_return_buffers;
 		}
 	}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 129016e57446..44541aff79b3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -109,23 +109,6 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 };
 
-static int video_open(struct file *file)
-{
-	struct ipu6_isys_video *av = video_drvdata(file);
-	struct ipu6_isys *isys = av->isys;
-	struct ipu6_bus_device *adev = isys->adev;
-
-	mutex_lock(&isys->mutex);
-	if (isys->need_reset) {
-		mutex_unlock(&isys->mutex);
-		dev_warn(&adev->auxdev.dev, "isys power cycle required\n");
-		return -EIO;
-	}
-	mutex_unlock(&isys->mutex);
-
-	return v4l2_fh_open(file);
-}
-
 const struct ipu6_isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 type)
 {
@@ -809,7 +792,7 @@ static const struct v4l2_file_operations isys_fops = {
 	.poll = vb2_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = vb2_fop_mmap,
-	.open = video_open,
+	.open = v4l2_fh_open,
 	.release = vb2_fop_release,
 };
 
-- 
2.47.3

