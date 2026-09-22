Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1A53E2F6
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078752; cv=none; b=M0OV9MzNdEJYuG2gRH84aAIeo2hZ6z2d9s93sgNvZ6qOLdslkF0EIhKPD+YkozEtYwZBa4BEj5pBu7wMQwEystaf2muktbIGHt8UtyGglAsfENz5i00A2RFaqIZphP3Nk8pqvwy56rTfUS0QctJMmLSCjnwGuNwcgg/FE1tLX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078752; c=relaxed/simple;
	bh=WshjZOiNH6cts9g1rdGYDggif+wmBcGXpZe0yAc6bN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAdyF3h48BI2Z9CykvruoRXA52BUsSa3/T18unSvHiFWXjFnMARx/CSeR/0bUPAdaFVWzVd68l3SwDvcANaaGBSlfomf8EPGjLZglpNipYzY054x88b15PprDKVSQRAmbp0y8fUV3W+DxtaSV7mTXTF7AQntD3gazEE6haPvQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBdsC0IG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBdsC0IG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078751; x=1821614751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WshjZOiNH6cts9g1rdGYDggif+wmBcGXpZe0yAc6bN0=;
  b=hBdsC0IGfG+HN6cIDT2LeScPzjVrlhRtNtrF3wHh9KuuBuMcwUtW1l/x
   wobK2jlDEOZuKcPAp8+GorwmnSPnQxRd77pwpRsawITmXl0SeVD32tPF+
   Q19j9yHGFSxjl5tZO3zL3YWreJRWqJR8LVnCVt3dx7zjCVeeBkpU+vxCF
   u8pMIXxizNOrukMF2vTL6k6U1Pj0e/sQx2x8os2bGcAs63nBvUS2xwBj9
   VH/x7HCRUC+Aw2iN+QCIqk/EeOEnZ6oAbKO4pcjSBOtU45ccxZnmw/XLM
   +ol9wiHT4K9mxGM15jgnHCxKc8NXXqRUMQMSkFGOLLVC4ZQEgcJTwwPhK
   A==;
X-CSE-ConnectionGUID: drFBu3PPQKOqrcFFEVveFA==
X-CSE-MsgGUID: WJx8QrwtRueoZS7sbBO9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227094"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:47 -0700
X-CSE-ConnectionGUID: LgsZN+e6QgiIirjRoqI/eQ==
X-CSE-MsgGUID: CO11as3pTY2o3SEN70UA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029161"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B48C4121D0C;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lI8-3k6y;
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
Subject: [PATCH v3 10/21] media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
Date: Tue, 22 Sep 2026 15:05:27 +0300
Message-ID: <20260922120538.896684-11-sakari.ailus@linux.intel.com>
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

The callbacks for enabling and disabling streams access data serialised
using the isys stream_mutex; add lockdep checks for this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index e2d367b38d4b..9c42f353f9f1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -535,6 +535,8 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 	u8 vc;
 
+	lockdep_assert_held(&csi2->isys->stream_mutex);
+
 	ret = ipu6_isys_buffer_list_get(av->stream, &bl);
 	if (ret < 0) {
 		dev_warn(sd->dev, "no buffer available, DRIVER BUG?\n");
@@ -609,6 +611,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	int ret;
 	u8 vc;
 
+	lockdep_assert_held(&csi2->isys->stream_mutex);
+
 	ret = ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, false);
 	if (ret <= 0)
 		goto out_del_csi2_entry;
-- 
2.47.3

