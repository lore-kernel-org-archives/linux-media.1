Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59B4DA9C2
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645180; cv=none; b=FRQEZFk4+/XbehVwkByN9ZycpQhACuLeqBX17yv6DbbUxprfNQlw1hom3FsxnsMfGhPBGqWmeV15irLnGymGwyYLvXhMYKkHq004ambstzNqsWDE4pQzOiDZWpkvSkgwrQFETGaph++1WTwoyYgwJ0sUtu9YQeVaOnsVUMuj774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645180; c=relaxed/simple;
	bh=dyFop+GWK8kPwETce6O6U3jKi8pEOcQXQbDk8OF3Fhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2ar8zPfoT8alo/69u3zQ9oHAK23ejBenU/ZIJ225fi819yrNODP5Z2JNRu8C2nSJWc3YLyUqJdbbbRN9XRaeGU/olvZu7lCSTBz0v58SWIgiiX97D+Ue+oemIR9sQ3IOgoLvNye7cXtGHEyhbeKXSyqD7gfTgh0dAT5MjybLsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iujOjN04; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iujOjN04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645178; x=1821181178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dyFop+GWK8kPwETce6O6U3jKi8pEOcQXQbDk8OF3Fhg=;
  b=iujOjN04Hlu6alz1kvpWmKBmOU8A0mZiU0rTN4JQNUaIumTrq7wbyZUb
   TE9SH3NytVOU5EeoIBrPCyvwAIicbAlJddEA3NmQTTtpFUy1ph/Frt+GV
   JvvDI6CX6OYNl/WAObNlkVUJcruM7JnCMx3NJHEcN08j/4HrfxiwqDRla
   Wo/h/WZo5tRT1wzTWkfGxlYvjl5nnOG268Xfky9rFEkDCvYXwtRu23ktG
   aiqgwr9dor3+9UP7HZl6MCWgNFg5lxPms4tDHynfS6pRIhK7BKUz/PvZR
   1yAGWbtBNbEuLjemRzK7+ry77vkHguV7aXH5QRNaUJMCub7Rx6bmz87SP
   g==;
X-CSE-ConnectionGUID: oSRS4TliR3uJ/wKAaeaUJw==
X-CSE-MsgGUID: sKJQcOqpRjeMuM2JQed6rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622374"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622374"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: 1PS98aMYQP6LKKGJI4MsIA==
X-CSE-MsgGUID: DFA0OFlVQWSBRDKfU7XnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097342"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB92E121C76;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FN2-0FuI;
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
Subject: [PATCH v2 07/21] media: ipu6: Get watermark configuration directly from ipdata
Date: Thu, 17 Sep 2026 14:39:09 +0300
Message-ID: <20260917113923.59004-8-sakari.ailus@linux.intel.com>
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

Instead of passing watermark configuration data around, get it directly
from IPU variant specific static data structure.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 12 ++++--------
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h |  2 --
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 3d455872f29a..b3cbd4266da1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -657,8 +657,6 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 
 	av->watermark.width = ipu6_isys_get_frame_width(av);
 	av->watermark.height = ipu6_isys_get_frame_height(av);
-	av->watermark.sram_gran_shift = isys->pdata->ipdata->sram_gran_shift;
-	av->watermark.sram_gran_size = isys->pdata->ipdata->sram_gran_size;
 
 	ret = v4l2_g_ctrl(esd->ctrl_handler, &hb);
 	if (!ret && hb.value >= 0)
@@ -697,17 +695,15 @@ static void calculate_stream_datarate(struct ipu6_isys_video *av)
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
 	u64 line_time_ns, stream_data_rate;
-	u16 shift, size;
-
-	shift = watermark->sram_gran_shift;
-	size = watermark->sram_gran_size;
 
 	pixels_per_line = watermark->width + watermark->hblank;
 	line_time_ns =  div_u64(pixels_per_line * NSEC_PER_SEC,
 				watermark->pixel_rate);
 	bytes_per_line = watermark->width * pfmt->bpp / 8;
-	pages_per_line = DIV_ROUND_UP(bytes_per_line, size);
-	pb_bytes_per_line = pages_per_line << shift;
+	pages_per_line = DIV_ROUND_UP(bytes_per_line,
+				      av->isys->pdata->ipdata->sram_gran_size);
+	pb_bytes_per_line =
+		pages_per_line << av->isys->pdata->ipdata->sram_gran_shift;
 	stream_data_rate = div64_u64(pb_bytes_per_line * 1000, line_time_ns);
 
 	watermark->stream_data_rate = stream_data_rate;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 5e522686135f..4c890c6af8f5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -73,8 +73,6 @@ struct video_stream_watermark {
 	u32 frame_rate;
 	u64 pixel_rate;
 	u64 stream_data_rate;
-	u16 sram_gran_shift;
-	u16 sram_gran_size;
 	struct list_head stream_node;
 };
 
-- 
2.47.3

