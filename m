Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B253ECE6
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078754; cv=none; b=Bl7iSY9lbrEj99xq+NCVzOuduG3aYgGvzYYR4yOvlp8y2sn6uSvzFjbddzwrid0m1wlkjR/DA08mB9oQ7cN3yvWZB0VTVt9nc8/sRNozT9kgaRkuvZGKokLEARd8qQEDrJVhKczevYFzIgLhqtt/DKyXHnmWqiTP7QBGBMDsiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078754; c=relaxed/simple;
	bh=DZnPKwZNsG+8m+mQHUinvfWQyGn+LpxnO0KsluBUrT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+1UYkf2XOx/9mLTQDB8oQrK5AA2IMYYSmP5Mpik+ZB5DxWAVyIgcb+l464kOiDw18yE2FXw3V/lyikh2fGyEl4G6rUi5zeiUPf4jC3IMyHv9t4YHaXiCDg0Zg6khFJ9l01UyTWRDZS9pOwQIalXzGhxtFrp03ajafMstrxRDqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcXbBeVN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcXbBeVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078753; x=1821614753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZnPKwZNsG+8m+mQHUinvfWQyGn+LpxnO0KsluBUrT8=;
  b=CcXbBeVNrogp/dJTGNfynqYYoNH4OcPKostn6zMsQQ76sWjiF2LdGV/a
   EW3+O1BAvZUiNxjvFAeZbNU+gI54YH3XHGRk5O466xj//iPT/V2Rwb0OR
   XDhyyiZNR7syVLgmylwNFFPQNM99qHp9Dj3HPeoX/jfMFgVF3ZmNiq6HV
   zDa2UV7+uLPBSsN9eoXpB3FBM4Qgh0KAXYX90AC/pzinxqTo6WcBtWF87
   Bot8oF3BOWPZErcriFkJi4InATvVroQbzFeXu53ybWYoayEl3ic6c9TZX
   KLsmhIVWCkztIRvGgo+38kGuYx8hzPDiPB5KpYEsS+06dP6QH5+k49mQE
   g==;
X-CSE-ConnectionGUID: h9zYYOQGR7+B73jWBDEbfA==
X-CSE-MsgGUID: sbwin346Sx+ynpaUYMY5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227101"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:47 -0700
X-CSE-ConnectionGUID: fxMIbeEASfW/DB6GWXiIQA==
X-CSE-MsgGUID: AJgfv+lASYOi8NTAIeELFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029167"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BCF43121D29;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lIK-3u1T;
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
Subject: [PATCH v3 13/21] media: ipu6: Avoid accessing av->streams before streaming
Date: Tue, 22 Sep 2026 15:05:30 +0300
Message-ID: <20260922120538.896684-14-sakari.ailus@linux.intel.com>
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

Streams will soon be allocated just for the duration of streaming
operation. In this case, obtain the CSI-2 sub-device through av->csi2
which is set up during driver probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 5c00c98869d9..66f1a28a444e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -860,7 +860,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 	struct media_pad *r_pad;
 	int ret = 0;
 
-	sd = &av->stream->asd->sd;
+	sd = &av->csi2->asd.sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
 
 	if (!state) {
-- 
2.47.3

