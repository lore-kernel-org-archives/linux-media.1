Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B59414A21
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419241; cv=none; b=l73n9wOsEFRO0izCKx6lm1Z9H0X6cUryXg7hOgJjyX1EswYv6tt+UMr2+PWZ+YYSvc4h9dkEmqTvQOswJFFGTB3moKXE/1+z7k7IyGfLO2jy50GZFy+qeueOi7et1wjH2TRxZ8csYJZmHLCmtKjtZY9EvvB4pJiY4XOVfDQJ8Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419241; c=relaxed/simple;
	bh=FY0Uh23gc9bebY1W+qGW0CPXaYSsj+sLoTAyysMAW5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7QIW9a/fCdWuj5fLku4QZXcVZ6VVe8kb9OWa+c9EVdB6sH5dQfyeh1i3I8oz+XvAMRZZYKl3i8zA6LsKOZmp9fCWadFRJKcsua/ZQFu7yxqmYQXygHU8YcXKVIxjVK1r7CHdkIAB8ajDfweJAjGVu8vYGi7jRWYu5GLAzJl1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8aXOQ4H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8aXOQ4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419240; x=1820955240;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FY0Uh23gc9bebY1W+qGW0CPXaYSsj+sLoTAyysMAW5I=;
  b=E8aXOQ4HUvlE29UdgdhWafxhpg2YgHOzC8SzrBUd+O5IcCUwlQozZ7eJ
   js1royBr6/amHaQLS7/krtYQ3C1ZlHV1bBJsiLMBPH+9ZM17/bs533Shm
   BO0Fp14Ks7tDCxBxs3cM38qWOkq5/pnzdpVm2fjBL+6SZ/gTriYMuUuae
   yCO31NLnxALwcG4Wcb1D+OWVt8b8a8FzWhb1U1nbhHd0t+QaFMld4+Dql
   +gE1wiaOXzDisNsvG4P8sna3kEO0+2KxznSX/m5QkGV8qbKdQe/dp88lf
   TH1m75SmxB3kP4V7D+hOHbAkjSD/gXUd5z9Ff7sxOmZDmq7vexmp6L+zG
   g==;
X-CSE-ConnectionGUID: v1dqsNt+QnGZWQpr4hnELQ==
X-CSE-MsgGUID: xFhzaSkoRFecRpPRAxhXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984116"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:55 -0700
X-CSE-ConnectionGUID: 3WawhxEfTnm+ZrF39ePZRw==
X-CSE-MsgGUID: 3b1Dan2FQN22kTRg6C8uog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760695"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 44993121BB7;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Ie-2uLa;
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
Subject: [PATCH 00/21] IPU6 multi-stream and metadata support preparation
Date: Mon, 14 Sep 2026 23:53:37 +0300
Message-ID: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
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
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  59 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 212 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  52 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  77 ++-
 12 files changed, 738 insertions(+), 952 deletions(-)


base-commit: b13e71830f090d248298922d7d2f478aa216a3a1
-- 
2.47.3

