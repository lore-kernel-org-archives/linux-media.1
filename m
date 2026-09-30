Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007BC28B4E2
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761029; cv=none; b=CdWujbd63y232hGRYSb8mdoItZF7w26xX5aEq/dMrrx0JhQqj66TSrwaBIBWx8CL/PeC1D0yWd8jbrnq56NX+J84f/fmLy4Ecbe90CPvtPlFgu1Qs1xjQaezdmRNJBGhteS6XDYXqNh2cCstMS3moW1sOly0MwXjIQ/RDFAlXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761029; c=relaxed/simple;
	bh=1XjTOGGr1Aee5mRlY6jFoNlU44abhKhzO5lgxARWP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHo6vKZOQj/viQw4Ya1ucFhC9+GI5kOsaVbGIcQx14IYjn8huWi2ElWd5V7pqBYzPT0BczrmZX1+zzSWpSmBfP9O8Moqi655z1gItbpUojbyqXY05COgcwl9dRIZfRJJjeMSXlta64EgrHIvKERU60juLrs3X9P6lAZ7w14iNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHFrgGBl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHFrgGBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761028; x=1822297028;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1XjTOGGr1Aee5mRlY6jFoNlU44abhKhzO5lgxARWP+0=;
  b=KHFrgGBlUo4izxHgYVQ6v2SbIhGk6oGCrh1eByEHQX7uAyZfWI23Gogy
   CWkoUuADhA+e4fZNn70MSuuc2NjfpqImDJuTHDrax4YXkIkrAlMjG9KZl
   tlma9GfBtjTSV1QIm2doExZKBYzDQ45hV34NfVTtwyxU+HdSaQAPcuXsN
   CQPVQgjf7TlfTU6U/6416eIMohY7J8uaizCVGTDVom4tIczc6xzZ/YDFN
   z88tRQ0JPXpqfNZh20m5e4VoaS+lVQ5b5/Pfl57jHB+HTemRoDQtNKEIL
   kh81223bVA+5vvjPWR5tbdE3YetMxg9bJUb9a8UuO4f2cN01aAnW+zN7j
   A==;
X-CSE-ConnectionGUID: WQ5m2+WQRwizeXwXZUwfoQ==
X-CSE-MsgGUID: YfPJym35QzaynEyUAHhXUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90394168"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90394168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:37:07 -0700
X-CSE-ConnectionGUID: tLxH2dkHQC2FwP98bkKTBQ==
X-CSE-MsgGUID: sX8qyuIrRbiFd1pTXlwVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279442919"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:37:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0931111F925;
	Wed, 30 Sep 2026 12:37:10 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBqkP-0000000B13c-0ZYq;
	Wed, 30 Sep 2026 12:37:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 0/2] IPU6 fixes following multi-stream support
Date: Wed, 30 Sep 2026 12:37:07 +0300
Message-ID: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

There's a small but important fix for the ipu6 driver's ipu7 support -- on
ipu7 streaming works only once, and apparently this is because the ISYS
needs a power reset between streaming instances. The patch addresses
detecting this, which got broken in the multi-stream support set.

The second patch adds a warning on needing a reset.

Addressing why the reset is needed is out of scope of this set.

since v1:

- Just print the message when setting need_reset to true.

Sakari Ailus (2):
  media: ipu6: Reset need_reset in ISYS suspend
  media: ipu6: Warn if the active list isn't empty when returning
    buffers

 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 2 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 4 ++++
 2 files changed, 6 insertions(+)


base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
-- 
2.47.3

