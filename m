Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339247045C
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449729; cv=none; b=HDUKR86iufmHD7BspKWRYf2+BvunSr7bVtJJjwIQ8vzF165zoqxTXBBwdmB5CJfhiRgeghjSVTfn+uk7I8H/URKDwd8eRIld7UoXfBVTo76YusPnI0i53JdiD/+QGoJlUUfY+UMA3FPKy+kxeBEVijk66nlmYGKO9byYtTBHq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449729; c=relaxed/simple;
	bh=pBAV65lGGWjOFTQiRUQ46xyGdaz5OglkdOZuWdbZgrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atF/Dz42JcJPxi4AQsVlFdndH7k9FvoYXlJULteoa/W1qQ3akzALR2LBh0FZeSdSfItQ/c4kwnE1K19q2EUW6WEc65rba4k9yDl8ArdVNZcumL5ngMHRu7aVapetjs1H7QqxZukOToXe3vA8cvpyRGEbIwsdlDtXbNkVMd2EBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmYU4uSS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmYU4uSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791449728; x=1822985728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pBAV65lGGWjOFTQiRUQ46xyGdaz5OglkdOZuWdbZgrk=;
  b=AmYU4uSSNyG8bT2VFHlYx5KPdU8FWKsCUg4wsOItnBHph9EzHjxPOYkA
   jFfpvHDwLbmoNMiGdgvh0BfBoQxm8cMk97Mwywu5o5OYrJky80kOxorpG
   UzgiwpEzQ0Yp1b5mnqpjueEpAaYX8bgR11QZgSKFy7iIcKDiLKWmCIfyZ
   qc/ScX7CU1rOJb+9JFHpsBIIJ3cBkMH8m/qQ703NQ3RjZCj2qYTo8tcRq
   MyqVFgMzohy5AULgwQkwsV4nD7V16gw1Fxx2OFnnQDgerLw2sh6KTDwiL
   9HyD8CADFDO1S3/+gi+HhhEm15sMVASxypmijEzc4Rs8WoDYArBzZVsBS
   A==;
X-CSE-ConnectionGUID: FkRoH4X9Qpahgr9scYF65g==
X-CSE-MsgGUID: U4pD1+n/Ty2eAAN1+le4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="233670"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="233670"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:26 -0700
X-CSE-ConnectionGUID: 92TalLwOT1SZbdY9WP64GA==
X-CSE-MsgGUID: 6su6idO9QEitoxfOUr4LwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="86308"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 563F9121BD3;
	Thu, 08 Oct 2026 11:55:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEjrr-00000003Le4-3Lqz;
	Thu, 08 Oct 2026 11:52:47 +0300
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
Subject: [PATCH 4/5] media: ipu6: Remove need_reset check from video device open
Date: Thu,  8 Oct 2026 11:52:46 +0300
Message-ID: <20261008085247.798156-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
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
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

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

