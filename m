Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874B51C073
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078748; cv=none; b=LcpCSerYV619+YD6DDsK5lLduNY10IHh2hzCqieNHppzq0qZ3luaO8h4ck1U3LQ6KaMMw1OKkvYreDGJRwagqZTI7B+jPzwzebUeqGagKrmaKRvNZYIH2olllzzSAX4VHXdDW/kR4I4wnBp43hbQ8VhyRAOPLr/EvOiyINhQjZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078748; c=relaxed/simple;
	bh=vh6syyg1ybLG6UD4vZTrvN2dypLSEnvoEQFmCWaNTvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fz9HjtK33J5kCPAOtZF1LYn+eAR7dGtI3KDpJDK7111kfSPEFnBBm3oDNrw8FNOWhMjoHULXE4p6jZaz2HJpGkfeMKbD0J/zBe4GPD5f84WT9DDMckVi2ZhW9Itc0GmvI6SMywzs6jmTJQ6ynIbTNjDDbZAhFDlOCnElL6w6b2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqWtpGDG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqWtpGDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078746; x=1821614746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vh6syyg1ybLG6UD4vZTrvN2dypLSEnvoEQFmCWaNTvU=;
  b=JqWtpGDGiCGTn/Dd60JxHXMCOiJRYVSYeVhaz57q6PQDqJ3258Aj+2Sx
   YZ4cdKIKdLiGm5RgROgNSjWW9aHHw5wt+R2Cr2iD0xaQ8jUvR0MPxFgFG
   uDJ4bsc7yW03cCdcUi9Q7lgbF9er2ZmEYUW9x3XAUt82z74YDEoLVbnhv
   BlRFrwuiewkNV2qSJHK3MLmVhe9ayq9Ka7eRoFbmwAAlSfhk6ceb36g+e
   meOGsu4TfQ0npOkrDmM0OKq15nsRgx7Njza5birtF5aowNfqd724yYeIU
   QsizaHgLMCUKhPd4e+9A7jP6dHXX7tNYLXyCWRfq1AbCL8pKrgU0kWBOv
   Q==;
X-CSE-ConnectionGUID: ZFSo1bOYT3ywyKeBhJro1A==
X-CSE-MsgGUID: hbqtlmX8Q2+G8EqGVspyDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227074"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:43 -0700
X-CSE-ConnectionGUID: H5JDhDLCSu6/nxcQHVf4gg==
X-CSE-MsgGUID: Be3k24aMT8a1QTzRBCkz7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029125"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9864B121B9F;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lHV-2wyZ;
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
Subject: [PATCH v3 00/21] IPU6 multi-stream and metadata support preparation
Date: Tue, 22 Sep 2026 15:05:17 +0300
Message-ID: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
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

since v2:

- Fixed handling failed streamon, i.e. propagate the error in that case.

- Rework return values for ipu6_isys_csi2_streaming_change() in patch 9.

- Fix inner loop stream check in ipu6_isys_csi2_streaming_change(), in the
  same patch.

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
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 380 +++++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  13 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 130 +---
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  22 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 642 +++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  61 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 212 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  52 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  78 ++-
 12 files changed, 743 insertions(+), 954 deletions(-)


base-commit: aedd77ea8168f00687c1248cdf115071e869cf93
-- 
2.47.3

