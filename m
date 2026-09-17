Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1A4DAF85
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645182; cv=none; b=SCtJZVUE+EjhnUGtDMrRxbRgOG9QTuIkE5hB2twwEqVTpv7Rv/j7AxEHKoAIqRNbSUhkNrRjeFlvvt2bC1ZDwRIA+rsCRlV0NyoNOHkchiDbzC4lIwJFr+ijnL/7OJM8bveuNXU/p7Wto/FObqJHGgO/3jqBpy0nDaz2m9nKD+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645182; c=relaxed/simple;
	bh=JGCHCPPdQaakfn0aYQL9dybqmmp7+siBaWXaH1ZCUyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3u/KxbdPh34agf3JBPItjdHlxFuW4N7C3ETlf3g4uxM0MIw3uikLBH2vV37UglBkBUc4DsGo84pWqZ6DA3P9nrg76yXvHYc+AfmHdx0ij3uK0GPZa0Umj9Q3UtFKwWUSKjrsbMi2WRY1deWoW2UTvjZnNMWr8r3VyJB/Va1gL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntqFzbTW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntqFzbTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645180; x=1821181180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JGCHCPPdQaakfn0aYQL9dybqmmp7+siBaWXaH1ZCUyc=;
  b=ntqFzbTWERwm9f3blamUrGCTFwnn6lbQVrljuozxcNTv/rm6c0BXyMbk
   RZQldJ/FVPyISG/Lcro0MzPdaoJhl5A8L5RZ6elyk8blGIf2Yiqd8iWdN
   Hedb+zDxhvJBwQXUvN2JlwRsDfA3fnro/rMC77DwPGWqQr/VmGUSniA/L
   za61T35uPxF+Tk7+EHeDjBn5dcSZTP8l1/h/aBpGPAazS0CV0grIcL6fY
   ZhfFs0rqUW0+HIFuGoXYTfSXJ7aeO81V2PKVuZVmzv7aBfxjOMywlNAkG
   jfcOC/cKtwOY9fgJwApUuwf/UQJgd2fZxFo42D/Gf5JwZhxOkxBg9mcnW
   A==;
X-CSE-ConnectionGUID: LPHPi1BzSROwmzIYfQUpfQ==
X-CSE-MsgGUID: h41zQks0Rgi8awyw6bQyFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622375"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: r1wQYCuMQbCoayUTjTZisg==
X-CSE-MsgGUID: AiGg45moToumE/ovt2+8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097343"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DE92F121C77;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FN7-0JV9;
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
Subject: [PATCH v2 08/21] media: ipu6: Collect IPU streams into CSI-2 receiver sub-device context
Date: Thu, 17 Sep 2026 14:39:10 +0300
Message-ID: <20260917113923.59004-9-sakari.ailus@linux.intel.com>
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

Collect the IPU streams to the CSI-2 receiver sub-device's context.

The background is that an IPU stream is bound to a CSI-2 virtual channel
but in a V4L2 pipeline there's no such assumption. Therefore a pipeline
may contain multiple virtual channels and so multiple IPU streams, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  | 6 ++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h  | 1 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 0fd4171b50ac..f92577054d89 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -457,6 +457,8 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 	}
 
+	list_add(&av->csi2_entry, &csi2->av_head);
+
 	ret = ipu6_isys_start_stream_firmware(av, &bl);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
@@ -493,6 +495,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streaming_firmware(av);
 
 err_return_buffers:
+	list_del(&av->csi2_entry);
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
 
 	return ret;
@@ -530,6 +533,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_close_streaming_firmware(av);
 
+	list_del(&av->csi2_entry);
+
 	return 0;
 }
 
@@ -675,6 +680,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 	if (ret)
 		goto fail;
 
+	INIT_LIST_HEAD(&csi2->av_head);
 	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 	csi2->asd.supported_codes = csi2_supported_codes;
 	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index dbaaf00af623..7c936154691e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -41,6 +41,7 @@ struct ipu6_isys_csi2 {
 	struct ipu6_isys_subdev asd;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
+	struct list_head av_head;
 
 	void __iomem *base;
 	u32 receiver_errors;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 4c890c6af8f5..cb4b45f0dae2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -78,6 +78,7 @@ struct video_stream_watermark {
 
 struct ipu6_isys_video {
 	struct ipu6_isys_queue aq;
+	struct list_head csi2_entry;
 	/* Serialise access to other fields in the struct. */
 	struct mutex mutex;
 	struct media_pad pad;
-- 
2.47.3

