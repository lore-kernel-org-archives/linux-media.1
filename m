Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1C553D0C4
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078749; cv=none; b=GocyxyB444FRyKf3nuCElEWfG9rHiRH5ikYYAOuq+LsshIPFcaJEntBBl5DDfk249vjPr9KndotHtWjgJ0IVwC+V5KrNTAcR/6mC6H52aD+31WcwCXG+jRNzf6GfKc/nEpAAqDX4Mnsebp6N2co1mnH7TA/d3tFMNJFGGUhVCxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078749; c=relaxed/simple;
	bh=myul2k7iqXXwkC+SXchK0yw2GdQw69X76IcwPdYJNts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cs+HYp69XElWm5Oz6uDK8yq5rkAPlT2WNQ0R533AJ8/vxbdJJEzm0dL4Qlwz4bCFaZxdHuH1XPJeEcynfa1pTcCBh7zbtcUsYxPk7RRvskm+Nl6wsLAGXwf+3BA8n79r2Dmft7jZc+lbf/ncoObVQRJ+R9MDYllymq0OmBAr+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nxpb9XXW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nxpb9XXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078748; x=1821614748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=myul2k7iqXXwkC+SXchK0yw2GdQw69X76IcwPdYJNts=;
  b=Nxpb9XXWlsG3OKuyojeVD40pL59IGqsAp2RM+wGDYyX3eXKScRo0tbbi
   wxEWwAjk3ELGVCZDBWdYaupzxIXdSpNTY1EAxftJ+rQzhcrl54wqiQbbj
   DZzkp5u4mpVB8PX3w+HVctl8/vGI53R4utST/Gt9c5jxjdrUXKaOFAlcY
   xcZkYT4ZHZ+I3Agx7MIu2vIXVrO8r7kuVW5t3/H+kE/Yfk8uo3WqmwUsK
   21eS/9750bciMxmRSdXPUprsDVQY5uOe65jkThIqRiSyMwfSIKMGJkEh7
   AepTlcDlSlniyLsZ57jaAKaS+vp9d4hCZZUcqV14ZVf8kkBt1gUqfU0yx
   g==;
X-CSE-ConnectionGUID: Po00j+tsRkS3ajw2FKDNKQ==
X-CSE-MsgGUID: QAoIiRSFQ4WPdDKxA2Ok3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227080"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227080"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:43 -0700
X-CSE-ConnectionGUID: IaKcnQ+SSoCfnplCEgejuQ==
X-CSE-MsgGUID: CrJ8087pQpeHv0LMfdU+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029132"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A0E00121C7B;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lHk-3LEA;
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
Subject: [PATCH v3 04/21] media: ipu6: Rename misnamed out_free_watermark label in video init
Date: Tue, 22 Sep 2026 15:05:21 +0300
Message-ID: <20260922120538.896684-5-sakari.ailus@linux.intel.com>
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

