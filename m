Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED074D9F8C
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645179; cv=none; b=o3Szhf/STOjxCOa3yqVJ3X6hFvfQc3cZcOsotaDEgSV+dlwG17iL0yIqnysxGWZPFm7oTlRA7EBBoM/CD0KqSuFlRDNyV30FIzyg1j4qFPmGUw29MKul25kCeaoJYCR1HYS8msIwrz76MYXHdXOPtXOIIvn3FC2jODic7ZhaUT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645179; c=relaxed/simple;
	bh=myul2k7iqXXwkC+SXchK0yw2GdQw69X76IcwPdYJNts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaeWJeE49aSZ5Zk9qd5V6hVJGCzSjqFx++yvV1fmtUGRwo6tO7zCdfDVmxsD4Qu87l/2GGIX1P7xScf/TmWXX/4TmASXX/L5M9/+nML45vwp0qtPB7/INOhtrRYq2yu8ZUmZnvMhqjpPVq6mc8/+sGxSGM/XaIXlBuguBKtrPto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuordVdb; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuordVdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645176; x=1821181176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=myul2k7iqXXwkC+SXchK0yw2GdQw69X76IcwPdYJNts=;
  b=UuordVdb+X156YEeWUBc9voY3zqZ1MEDcUqtrMuC395AqKjbB4OTjX6V
   6YAXq+7IxKUyzxaAadXHd/M6fvlaWzSU+KJsStokx378cpJPvMZzIWzho
   /+2w4tu9WIci8VBiYpfSigCKYxJtq6OjzddnJFQ4gA4uVnSfVFx+b6WA0
   JUwfHpHH3VJvDPjqbZ+h4Aotl2BpNuJTneEF3gBAEFnxLSuAiNix5h6X8
   LfA6h5fW0cBvz34lsatLQfySnyIpbCnmRs0wMrzb3AGCCnoNT9xkQCNuQ
   P40VCsGC+uASLClsDnzwQDaid0NiP1X98Dg7DMyeH3dwWLHUwHHN1CDFz
   Q==;
X-CSE-ConnectionGUID: p79J2y5qR4WtnRflHQXlWw==
X-CSE-MsgGUID: xjpgFrkGQEeAPTU96mBDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="561850"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="561850"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:30 -0700
X-CSE-ConnectionGUID: RiBPLwyUQd+/gv63EwLhdQ==
X-CSE-MsgGUID: EASquKKjQdaj0PwaQtfMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1932277"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D1AA7121C6D;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FMm-01VC;
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
Subject: [PATCH v2 04/21] media: ipu6: Rename misnamed out_free_watermark label in video init
Date: Thu, 17 Sep 2026 14:39:06 +0300
Message-ID: <20260917113923.59004-5-sakari.ailus@linux.intel.com>
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

ipu6_isys_video_init() has a label in the error path where it is used to
destroy a mutex. Rename the label as err_mutex_destroy.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index b15c24b1b710..781fc0e88417 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1107,7 +1107,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 
 	ret = ipu6_isys_queue_init(&av->aq);
 	if (ret)
-		goto out_free_watermark;
+		goto out_mutex_destroy;
 
 	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
@@ -1144,7 +1144,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 out_vb2_queue_release:
 	vb2_queue_release(&av->aq.vbq);
 
-out_free_watermark:
+out_mutex_destroy:
 	mutex_destroy(&av->mutex);
 
 	return ret;
-- 
2.47.3

