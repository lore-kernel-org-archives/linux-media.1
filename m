Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D24D98E6
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645176; cv=none; b=rFvgzbB7rwFANlnshA6qt+IPdu5qCoF0SbBOCfJGx98PUyls44oE0lenIH4/VPyPnpRqQXZfxikt4IW12ywbIh56dqUfy7/KKMdrgGn1lNr2urmCHBYarKGB5bJhpLlK23ArSg46+m81vWlqFexzmo3W0RbXDvySz6XzWOu+738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645176; c=relaxed/simple;
	bh=2pg8h2qJdeQVmZZbREimAv+ePcqwdvaWE2Wecjr4xC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OM40BKmu79gYDmcZD0J84Ffauk5PQvt4ERDKEXfQcrn02t1jxLOxZpaWDD2Yd0renzm9aka3wHquGqEWObEbVGUMAvIuNbsz4k0xgkg51CklOy8TzYBh0KtfGQBJpdSBEOzTLh9SGigfnjaJ1o6/QebBqozn8BNtEU8gPs7Wpxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP/IyQeI; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP/IyQeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645174; x=1821181174;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2pg8h2qJdeQVmZZbREimAv+ePcqwdvaWE2Wecjr4xC0=;
  b=DP/IyQeIH6zf/TVuJEPjmmnEpmP6x1vr5ELm4EE4FpyqQeVQnW/wo057
   t6YnBFP62eoBzroCDYvJeVc69mn6J8TwT2GAeNPFFpChITytXmadayhqd
   xYx+Z7nbVnsxQHQVEC3I1eocrR2dahqpa7fgoL1HZf/jRpZUmnaXRv87U
   db4VJL7ips6b5hS88GZo1z0tQqWc3A8duUpGegkZoQCYhUXVdAAVUcCMI
   UsS0EqHyWX3o6xdV+a4y1eXfHJRUKj15pFLfSnaDX5ZCdQy18f6zKk5u9
   FVFj1Q6kOdgK737AdodoW2sANYNJ7Ro6unQvID5OZ5EARCETWfS4/lxPQ
   Q==;
X-CSE-ConnectionGUID: 8N/LMoWZTA23c0AEczoxFg==
X-CSE-MsgGUID: xVIOUzyvSByTfsLJ37haLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="561853"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="561853"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:30 -0700
X-CSE-ConnectionGUID: 9np0Gi4uT8COK29IhER0PA==
X-CSE-MsgGUID: 45tRepeISAKDuEOEoKk3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1932283"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CB7D411FB34;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASZ-00000000FMX-3szs;
	Thu, 17 Sep 2026 14:39:23 +0300
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
Subject: [PATCH v2 00/21] IPU6 multi-stream and metadata support preparation
Date: Thu, 17 Sep 2026 14:39:02 +0300
Message-ID: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

I split this set off of the metadata series as it seems it can be merged
early. Basically, it prepares the ipu6 driver for streaming multiple
streams from a single source, when the rest of the necessary patches are
merged.

All the patches in the set can be found in my metadata branch. This set
possibly depends on the metadata preparation series
<https://lore.kernel.org/linux-media/20260914114145.574791-1-sakari.ailus@linux.intel.com/T/#t>
I posted earlier today.

since v1:

- Fix intra-set use of v4l2_subdev_get_frame_desc().

- Address Antti's comment on assigning dt for a pin (fw term) from struct
  ipu6_isys_video. Remove vc and dt fields from the same struct, too; they
  were redundant.

Sakari Ailus (21):
  media: ipu6: Fix releasing resources at failing streamon
  media: ipu6: Move streaming control to CSI-2 receiver driver
  media: ipu6: Stream number on CSI-2 receiver source pads is always 0
  media: ipu6: Rename misnamed out_free_watermark label in video init
  media: ipu6: Always request a capture ack
  media: ipu6: Clean up link frequency calculation
  media: ipu6: Get watermark configuration directly from ipdata
  media: ipu6: Collect IPU streams into CSI-2 receiver sub-device
    context
  media: ipu6: Start streaming once all streams have started, stop when
    not
  media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
  media: ipu6: Remove nr_queues and nr_streaming fields in
    ipu6_isys_stream
  media: ipu6: Collect enabled stream IDs
  media: ipu6: Avoid accessing av->streams before streaming
  media: ipu6: Rework watermark calculation
  media: ipu6: Rework watermark setting
  media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
  media: ipu6: Drop {get,put}_streams_opened()
  media: ipu6: Serialise access to stream pointers by isys stream_lock
  media: ipu6: Move firmware init/cleanup to RPM callbacks
  media: ipu6: Don't track power status, rely on runtime PM
  media: ipu6: Support upstream sub-devices without get_frame_desc()

 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 103 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 374 ++++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  13 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 132 ++--
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  22 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 642 +++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  61 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 212 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  52 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  78 ++-
 12 files changed, 738 insertions(+), 955 deletions(-)


base-commit: 934ee99f5c020bf55b27edd3975f76181cecf0f4
-- 
2.47.3

