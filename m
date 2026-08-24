Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC140DB28
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573688; cv=none; b=YYCroEiqmls7sjB7h3w+qjeB+5BKKA6VrDjGYN9U9icpG9eRJ1hMKdOR/e0wN5ED/Y/zsCN+XPqhl+2/UEYbevxyPor3idJH8TJqjdG9MKFWh5x6d9oDRJdANECtC+dbM2y0I7FBZyy5jIPgVq4FhE8ZlX37BkXepuqkby8Yk1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573688; c=relaxed/simple;
	bh=pf+fEmhR5PngTHaCurKQystcPJjdvEfmmxUFOEe93zA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BY8++5sezSbwSZGpqz9lNAXls0vH4Q9D5qGq/8aU1sdL+xWBLqyI8lM7Synai7F5xKDaioi5YwgOjpv6gR7ZRFjXK+lf4Xc5yU1u/GymPAF+1hdaQgpG2vlRjgb7QAntj/9ZAxuF0sSrnSC5HMQgRqVl83ZBZED3/GYAQEf3HEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlXbNrfX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlXbNrfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573687; x=1819109687;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pf+fEmhR5PngTHaCurKQystcPJjdvEfmmxUFOEe93zA=;
  b=PlXbNrfXlyQsY9VCa34wYiY5FUtmW3CVpXNlUIpYZ/SL/Jk1cnP2xorh
   W4EhMOA6r0NwGBZWVB7mOTtFCR+53JnVq1h1yidaEdXtKt1nodvKbrpPD
   z+AOsuD1qiOxnfBM65am2wSBuSGXaQmMzQe08ql1F7dk3HXJ1dO/HT966
   v/5/8XHz3smRUp9pAEHfZZz5JhEvh19dCGMyiW06aBzejARNzwWdBEqps
   5RKy5x3Elyi8NuvmWwPGZQe8EP/enLin4Vb2G7zfs2fKCRWCaJdxzTUMj
   yd9qud0XFRSJ1/1UGX3YOMKhluESKXDJrNTgLulNU3dmKX+pcssLQE96Z
   w==;
X-CSE-ConnectionGUID: YEfgauh2Tj+87qDD795z4w==
X-CSE-MsgGUID: jtrxfadIQbec3pCrJ3Pgeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036469"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:43 -0700
X-CSE-ConnectionGUID: BaOd0479QrixsGWAAjA4aA==
X-CSE-MsgGUID: LIdyGuEKT8yENiUphtSVKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787641"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 55BCB11F82E;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38X-1jln;
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
Subject: [PATCH v3 00/29] Rework frame descriptors
Date: Mon, 24 Aug 2026 15:14:22 +0300
Message-ID: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This smallish set makes frame descriptors dynamically allocated and
implements a single-entry frame descriptor based on the device's format,
using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
do not obtain their frame descriptor from upstream are converted. The
helper also obtains a frame descriptor for the desired type (parallel or
CSI-2) and checks there's at least one entry there. These checks are
removed from drivers that currently perform them. (Some drivers also check
there's exactly a single frame descriptor entry but I think in most cases
this check could be loosened. That could be done after this set.)

More formats can be added to df-to-mbus conversion as needed. These are
meant to be initial formats that are enough for typical raw sensors (and
one RGB format, too).

In the long run this information should probably reside in sub-device
state. This set however avoids having all receiver drivers to work with
sub-device drivers (~ 100 of such exist) that have a single stream and so
do not implement get_frame_desc() op.

since v2:

- Introduce v4l2_subdev_get_frame_desc_passthrough_csi2() and
  v4l2_subdev_get_frame_desc_passthrough_dvp(), which both set the
  bus_type field. Use v4l2_subdev_get_frame_desc_passthrough_csi2() in
  ds90ub913, ds90ub953, imx8-isi, rzg2l-cru and dw-mipi-csi2rx drivers.

- Remove the non-frame descriptor support upstream compatibility code in
  the unicam driver and handle errors in unicam_start_rx().

- Convert cdns-csi2rx, imx8-isi-pipe, rp1-cfe, j721e-csi2rx and ti-cal
  drivers to use v4l2_subdev_get_frame_desc().

- Add bits-per-pixel values to metadata mbus format info.

- Also allocate the streams in __v4l2_subdev_get_frame_desc_passthrough()
  if the pre-allocated array isn't large enough.

- Declare subdev_fmt in v4l2_subdev_get_frame_desc() where it is used.

- Document the get_frame_desc() op better in v4l2-subdev.h.

- Move the allocation of the frame descriptors if more than
  V4L2_FRAME_DESC_ENTRY_PREALLOC to the callee -- was in
  call_get_frame_desc() wrapper.

since v1:

- Take Frank's patch adding media bus format to dt / bpp conversion.
  Always return -EINVAL on error.

- Rework sub-device framework patch split to make the patches more
  reviewable.

- In call_get_frame_desc(), always set fd->entry to fd->entry_mem and
  fd->len_entries. Also use memset_after().

- Check for num_entries in call_get_frame_desc() first and thus remove the
  redundant else case.

- Check for validity of the returned frame descriptor type in
  call_get_frame_desc().

- Merge the patches adding v4l2_subdev_get_frame_desc() and changing the
  interface to return the frame descriptor.

- Check for descriptor type early in v4l2_subdev_get_frame_desc().

- Return 0 instead of ret in v4l2_subdev_get_frame_desc() when ret is 0.

- Check the number of returned entries in v4l2_subdev_get_frame_desc().

- Fill in the first frame descriptor entry in v4l2_subdev_get_frame_desc()
  instead of allocating one in the stack.

- Move the definition of frame descriptors to the
  v4l2_subdev_get_frame_desc() call site.

- Rework the code dealing with frame descriptor allocation.

- Move frame descriptor declaration to the location of first use in driver
  patches.

- Fix numerous bugs in driver patches.

Frank Li (1):
  media: v4l2-common: Add helper function
    media_bus_fmt_to_csi2_(bpp|dt)()

Sakari Ailus (28):
  media: v4l2-subdev: Align frame descriptor error codes with routing
  media: v4l2-subdev: Prepare for changes in getting frame descriptors
  media: v4l2-subdev: Allow releasing frame descriptors on return
  media: v4l2-subdev: Allow allocating frame descriptors based on the
    need
  media: v4l2-subdev: Change the maximum number of routes
  media: v4l2-subdev: Add frame descriptor passthrough for CSI-2 and DVP
  media: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
  media: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
  media: nxp: imx8-isi: Use
    v4l2_subdev_get_frame_desc_passthrough_csi2()
  media: rzg2l-cru: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
  media: dw-mipi-csi2rx: Use
    v4l2_subdev_get_frame_desc_passthrough_csi2()
  media: cdn-csi2rc: media: Use
    v4l2_subdev_get_frame_desc_passthrough_csi2()
  media: v4l2-subdev: Make v4l2_subdev_get_frame_desc_passthrough()
    static
  media: v4l2-subdev: Return dynamically allocated pass-through routes
  media: v4l2-subdev: Always return at least one frame descriptor
  media: bcm2835-unicam: Use v4l2_subdev_get_frame_desc()
  media: bcm2835-unicam: Remove frame descriptor workaround
  media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
  media: raspberrypi: cfe: Use v4l2_subdev_get_frame_desc()
  media: rzg2l-cru: Use v4l2_subdev_get_frame_desc()
  media: rkisp1: Use v4l2_subdev_get_frame_desc()
  media: exynos4-is: Use v4l2_subdev_get_frame_desc()
  media: ti: cal: Use v4l2_subdev_get_frame_desc()
  media: ipu6: Use v4l2_subdev_get_frame_desc()
  staging: media: ipu7: Use v4l2_subdev_get_frame_desc()
  media: cdns-csi2rc: Use v4l2_subdev_get_frame_desc()
  media: v4l2-subdev: Use v4l2_subdev_get_frame_desc() for passthrough
  media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()

 drivers/media/i2c/ds90ub913.c                 |   2 +-
 drivers/media/i2c/ds90ub953.c                 |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  22 +-
 .../media/platform/broadcom/bcm2835-unicam.c  |  48 ++--
 drivers/media/platform/cadence/cdns-csi2rx.c  |  26 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  21 +-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  23 +-
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  51 +---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  21 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  27 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  21 +-
 .../samsung/exynos4-is/fimc-capture.c         |  18 +-
 .../media/platform/synopsys/dw-mipi-csi2rx.c  |  22 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  26 +-
 drivers/media/platform/ti/cal/cal.c           |  49 ++--
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  32 +--
 drivers/media/v4l2-core/v4l2-common.c         | 183 +++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 250 ++++++++++++++----
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    |  19 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  26 +-
 include/media/mipi-csi2.h                     |  24 ++
 include/media/v4l2-subdev.h                   | 118 ++++++++-
 22 files changed, 686 insertions(+), 345 deletions(-)


base-commit: 56c29fa3ee666197516a231e75aed789ae9c530d
-- 
2.47.3

