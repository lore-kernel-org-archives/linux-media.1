Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02016415B76
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573690; cv=none; b=F37kUAnTTt58Q1rBnPszPHhnqKMUqZ9Xm0x+v+BlscNVrHz4r32Pw8qDtgr03xlX1RBWFDTQ5gcuDFJRnGcVgAPdlznkWO27vCoyc9Xa29K5EnCEtSSrLXkhzurgtel4+Gh1QibNIpX/k4UaDfGDpK7KXTiqb8mDsLkl0OZVURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573690; c=relaxed/simple;
	bh=vYogwT2KVjw39R3M4iWb6ct9wy/uUYEcXNi2I/7dqSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9fxX4bq+ivawnfdJOVpT426hIZxy3mNaZfsBb3CcffpsysBnDds1AE0fHOUhnlWkJxgYIXN7rj6GoGTaVOIBn6NQvLfnygRh/iCLl5z/l8P/+oE6efIgt0njFbHWWtxhXVINxBcUn6caGT4U/QhN9B4cKl75eEJQbp49N+Mgmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me7vm++g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me7vm++g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573689; x=1819109689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vYogwT2KVjw39R3M4iWb6ct9wy/uUYEcXNi2I/7dqSc=;
  b=Me7vm++g88fAZAhR4I0daNmvkfp+7Kbt6kavlvZyItLojJbFTrFkRztd
   shrDDYuHIraVFzE5uixeUgbxbcM6CFjJPUJZkhFTOE9UxqukYuVezjZaD
   U2r6piMHfLRmlgmyfFL5XeqB0xWQAb9ZsF58qk682S8MmVfU4US8y8LNv
   j9W6LAK95UYUdczo7ixa+VTywCMXjlEkgpdfsYTqEuccj3ZRgOy5zpLHP
   yZIksXJoSqOyLSImDoDCoT6wlHsCdW0my5bTRTvf1aGO4D9YbxGHmo6x1
   DIxnTa9nWMk8L9zC9ps6aIJeUfsbKyioT8uku/4Kw2wO18f25IeZn8OkI
   g==;
X-CSE-ConnectionGUID: Dqzw6lcZTbaxESXEssk2yg==
X-CSE-MsgGUID: Jit3Yq8cRJ6UzRXyGxqcvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036498"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036498"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: 4mbVbDjvQt6Df8MK+CJyig==
X-CSE-MsgGUID: TPL4Lh9kS6S9NSW09nPKmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787651"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CC74121E39;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39G-2R8s;
	Mon, 24 Aug 2026 15:14:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 10/29] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
Date: Mon, 24 Aug 2026 15:14:32 +0300
Message-ID: <20260824121451.3348583-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
the frame descriptor type in the get_frame_desc() callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 7bb1335f2110..e6c38a769205 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -462,7 +462,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
 	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mxc_isi_crossbar_set_fmt,
-	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
 	.set_routing = mxc_isi_crossbar_set_routing,
 	.enable_streams = mxc_isi_crossbar_enable_streams,
 	.disable_streams = mxc_isi_crossbar_disable_streams,
-- 
2.47.3

