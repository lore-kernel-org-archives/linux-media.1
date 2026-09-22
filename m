Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560353E306
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078753; cv=none; b=CKv1Qqfu2X0+VwySktW5/3BkemTF4WUA0kf39wr8TPOCBL2ZMpuH/Ik2WkJN0yw2iCFmLPf8f8XiczAoph4Na94qg0w3Shql+jySbljoeC1oFAK1vuO6adbmuJew7i/Wqw/xh9KK6Sr9DODHdGDoY7OOUyA7wVB24UIdduoeT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078753; c=relaxed/simple;
	bh=BRoIhn/58Ks/qPoAj0VWbIEEd10amkVeklLbasWhiTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaQrlvlOWnbt0BjnKR8Od25DkNgcAKKup7iUZ1RvmSfCGVWqIXts0uiG9So6m3JsIuRptycQ2NSnfwU37eW6USpATB74CAfXhOzIC2p6IRPmpGxi++S+CHscX7YEjsjMOp3kxQaEA3CodC152/dTsjhfJQOm6BqrYJV6VoiumdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGWrxw7L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGWrxw7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078752; x=1821614752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BRoIhn/58Ks/qPoAj0VWbIEEd10amkVeklLbasWhiTo=;
  b=IGWrxw7LCblFSC3+55/EKaIBk3xnz45dRHnYvwGdZV2i1e2Rpw3bcpS3
   xaIjRGq/amtZn8sQIw16vPWoddi4iUTHAlwQNUDj0l6KG27FDtDc+QzA4
   8jpzouP2bxx5XcM+wqIUvzG1bVXxanKQBh0+O3dDEJ51nWikPRAiUFN/T
   YbVM/ahOhibA5nsQOfHx79D0G/L6IQYOk2OMGzrxkFHf4agOgfR2JR2Vf
   A3WjAtgKz2kYG/0Zzf5D/QdaMRmTG/CR2OXcPa7FuU8qkzDcU5WmEgh8d
   DQ09NMKe0XdKBUcYzpvKIhDDJ8S1xxkWio48P/QogvetMhR//YVTMtl/L
   A==;
X-CSE-ConnectionGUID: bl1vFQfMTGmM9KTumo2AxA==
X-CSE-MsgGUID: hULGTckJTS+MZ52kJ2Kj3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227095"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227095"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:47 -0700
X-CSE-ConnectionGUID: GpJv900hQ8S13QeS+UXyqQ==
X-CSE-MsgGUID: ZSf31meUQEC38Eu2Vt3YEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029163"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BB731121D21;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lIG-3qSN;
	Tue, 22 Sep 2026 15:05:38 +0300
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
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v3 12/21] media: ipu6: Collect enabled stream IDs
Date: Tue, 22 Sep 2026 15:05:29 +0300
Message-ID: <20260922120538.896684-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collect enable stream IDs as streaming is enabled on video nodes. These
values will be needed once streaming actually starts. This is required for
multiple streams from a single source.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 25 ++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  1 +
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 9c42f353f9f1..01dd30af08ad 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -515,6 +515,10 @@ static int ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 		return 1;
 	}
 
+	dev_dbg(asd->sd.dev, "not setting streaming %s %s (%u/%u)\n",
+		str_enabled_disabled(enable), enable ? "yet" : "anymore",
+		nodes_streaming, streams_enabled);
+
 	return 0;
 }
 
@@ -545,6 +549,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	list_add(&av->csi2_entry, &csi2->av_head);
 
+	sink_streams =
+		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
+						&streams_mask);
+	csi2->stream_ids |= sink_streams;
+
 	ret = ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, true);
 	if (ret <= 0)
 		return ret;
@@ -555,13 +564,6 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		goto err_return_buffers;
 	}
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	sink_streams =
-		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
-						&streams_mask);
-
 	if (!csi2->streaming_vc) {
 		ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
 				     ipu6_isys_csi2_stream_enable(csi2);
@@ -569,8 +571,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 			goto err_stop_stream_firmware;
 	}
 
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
-					 sink_streams);
+					 csi2->stream_ids);
 	if (ret)
 		goto err_stop_stream_csi2;
 
@@ -589,6 +594,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streaming_firmware(av);
 
 err_return_buffers:
+	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
 
@@ -633,7 +639,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	else
 		ipu6_isys_csi2_stream_disable(csi2);
 
-	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
+				    csi2->stream_ids);
 
 	ipu6_isys_close_streaming_firmware(av);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index a98a60e443c6..4d84899fde4c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -50,6 +50,7 @@ struct ipu6_isys_csi2 {
 	u32 legacy_irq_mask;
 	unsigned int phy_mode;
 	u32 streaming_vc;
+	u64 stream_ids;
 };
 
 struct ipu6_isys_csi2_timing {
-- 
2.47.3

