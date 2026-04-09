Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F031AA8F
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765716; cv=none; b=Kne7uviNPq2T25uh8NuRDgDHY//M+a7zOhAhF0D5yVkkqdaakBti7s4gXtfFHvOMwH3wzu14iuHX1RUPUpGjNXQdMeZYg1rssAXvqkuQ7oRoT8VzBNzCW/haYErYz9tvVYrFKZQl3L2xn6FEtQhmumDfg3s2xIhkwlzPhdAze5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765716; c=relaxed/simple;
	bh=VIoVRQA0imQlBOmHzpuYcMEbr5Zg4mF01do5pXCarl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eb/qnBMc/zlCmul1pXhRSKTuGN3pfLJzVj4/1p0eTzLKxx1m9pLwPkSa3nxyJWQl5Uh9kD0GaCD7Bop+ceHzclte6FGkP9dMryhoyLOQxFSAbHUBXSB9AxPa9uLxQtZhPbi3Zf0Ir2Ql9F1auURrbUXh9EuoTI6PNLwM8W1IUgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMltUEnN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMltUEnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765715; x=1807301715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VIoVRQA0imQlBOmHzpuYcMEbr5Zg4mF01do5pXCarl8=;
  b=GMltUEnNVe505d/iCwzO+yA4O7LsgOfkEprHoLml4/6XF5Nt5E2WUuX8
   yOz1sWaqcV52cOALyt/B3wP3DHJd6TW6unWe1nJ6BH60t1UBtef4xekVw
   yRrZGPtE5L6bigr9YjgfOqrlM22cxh4zfyjKoV4ssHxNUURiaSqdKYOYh
   GGTvX8kdwFQab2DgyGKOSDZcI85762wDfF2/L/kXUlLuOWCs14lzGBU9l
   6VFoNklZLc2hCnBGgN4tio2U3kUlfzUxMS86+aR9gq5OjJ1a8/FIio0J1
   Ws1as05ZNSm2NAgyDNmTQJDi9wNbY39efOHfFOLS0fMjCFX/+uK1sPMy9
   g==;
X-CSE-ConnectionGUID: WuIcCin1Sl6VkDFUTqNOIA==
X-CSE-MsgGUID: sHTpneVgRWKlvQnV/bz9fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408778"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408778"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: BmlOfoQCRQioLbNflv8xCQ==
X-CSE-MsgGUID: CKoaBUrqTsiKjKHgRkRgFw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5FE121220BA;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045q7-3Y8b;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 78/86] media: ipu6: Avoid accessing av->streams before streaming
Date: Thu,  9 Apr 2026 23:14:53 +0300
Message-ID: <20260409201501.975242-79-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
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
index 9d0ed47df280..56ed1a4c45d6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -960,7 +960,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 	struct media_pad *r_pad;
 	int ret = 0;
 
-	sd = &av->stream->asd->sd;
+	sd = &av->csi2->asd.sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
 
 	if (!state) {
-- 
2.47.3

