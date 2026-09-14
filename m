Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14BA49EC51
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419243; cv=none; b=bx3TdXpB7toT+xcy4iabt7NglUBQpRvXKhs+e0A8AvFyR5/kRABkNhn35AJsi8NaRie2aLCidxsbbWFZa4CXuA+fePm4j2PoQLGAfMcjTKNqgDR8qQVfb/GEnZSqMqrgIH0uiruAzurTb1HqbOBneTQguGcIZpn57OQJBN/UaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419243; c=relaxed/simple;
	bh=dyFop+GWK8kPwETce6O6U3jKi8pEOcQXQbDk8OF3Fhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGLLa1+jMYKwwnTW7RdA7I/bGvGxM8vrKErarPAHDzflGXHeua35k2LV6mGYJnOmvby48yE/mypv3BSxyuFX9+ul6O2KFKgvismDoUhSfE3JssdG92fjBN2j5ZEMjbRrlzKXmw4hyqdzJi4sUO0ikhYzuWCdS+k8pkk0ePa3v2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO6Lg3Rg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO6Lg3Rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419242; x=1820955242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dyFop+GWK8kPwETce6O6U3jKi8pEOcQXQbDk8OF3Fhg=;
  b=gO6Lg3RgmzRf3LGuSApyTtlLQ7p2++BXRTTJoYKNit5EL3s0kblM6qj0
   kPn4Ni7XO+BmS26Iix2yuYrfCw/uSPsE6fhtsVfXu32onjB4rliR5Po/y
   0Xyp81MIhWicy7uYBFuDr6UjOrOX7cVw0Zz7y0mL6rjf52rn0RqyaO4xK
   HtaUoKoh7DNpXtnVXV5dBgUoG3lNGnJr4LFfCyq1wZrUiTziNRqCCVaQM
   g5E4pYnR1NjutK3ahhrOQxfpNkgI8a/N/J6gxJ2qzCx+wqiMgbI+fSEbO
   srQVqsl1AyQHCodikPKL0hfXUaABJRVV9088VlQrhv+8B6gQI4RL+zKO0
   A==;
X-CSE-ConnectionGUID: vP0CcFspRPGmJw/lCqf9MQ==
X-CSE-MsgGUID: I4ex1tnhTgK2W2kOP9aQww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984120"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:59 -0700
X-CSE-ConnectionGUID: 3jHqmvnTQbOI1nrzrQRP3w==
X-CSE-MsgGUID: /mM185jnT6mytQL7458r6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760725"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 511C2121BBD;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035J5-3Nk2;
	Mon, 14 Sep 2026 23:53:58 +0300
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
Subject: [PATCH 07/21] media: ipu6: Get watermark configuration directly from ipdata
Date: Mon, 14 Sep 2026 23:53:44 +0300
Message-ID: <20260914205358.735307-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
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

