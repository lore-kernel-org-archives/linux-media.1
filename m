Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D532BF51;
	Thu,  9 Jul 2026 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585400; cv=none; b=strLS1f+6SCO03m/8aK+QFhCCERi1aT48mQ/YEiriYq1mvBfbdqkTXKicoqG1N3O/T9+EgCWIF3KMeXn4liaLrot0rPYZcYwR3T15eafxZ9iK4W3oe94W7EGJW6TvC75X0BRGMWz+aFcDRUXWKnI/eXwDUGZ0bDNh/CyPzo5wf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585400; c=relaxed/simple;
	bh=rljXwOusHTm7R7KKgsnUtuT+uPyqEiVHJDS3j6mpj6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkJjwApbnBIjeyfNumQwvsw186BN3V4bn99G6MVfScJAAyuqouAVep1gynArefIt7plyHqRmW8ORfkSNlctW3b8f9n/FOFofy0hdFk+9xewEwXr3zx3WhcmFZ/owmI/U3HJFLtK6ulf/xlI8Bvd/i4QZVuit2NUe6zlp2UBA7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQpV3yWI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQpV3yWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585399; x=1815121399;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rljXwOusHTm7R7KKgsnUtuT+uPyqEiVHJDS3j6mpj6o=;
  b=XQpV3yWIyQnBMpyrxTZTd1ygwcp0TgErhEdZEQ0bSuxmpZs5EEESiyZj
   vueDjrDAzpCdHhdPuKtCrwMv84aU03YUsRBr0OCL1CMD/f8zzaUtfSxi2
   Qg60LBpUE5Pzvn0tLFt/McNPDSrm9jlTs7MngA8sgWd1CADN2GvZTukzy
   zkYQrathOvSU3F3hKxTb8y6iOzK8NWa0iHIjbvn3gUA3Z8WqB6Mxxa8DI
   8WvG58M0il70JspzrssmMsFv7rIux7deDcK4XzYpQCtO16BjLDBeMkqiV
   oP2cNHiKaVVhQ90NwMnpZ+rAuV/8wb+l9tzgKDaypwOrBZlYGq2qRVBiY
   Q==;
X-CSE-ConnectionGUID: 43wSQDE8TZqP7GY3+g3vJA==
X-CSE-MsgGUID: VlQpMH9dRnKiDHSTZ1Qrgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107055801"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107055801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:18 -0700
X-CSE-ConnectionGUID: 7WDRKX5QTxiCdhNooyvbBA==
X-CSE-MsgGUID: JXylIt/JRxaSRKcgsq5ItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254631027"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 01:23:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 75EA495; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 0/8] media: cec: core: Ad-hoc refactoring
Date: Thu,  9 Jul 2026 10:20:52 +0200
Message-ID: <20260709082315.72685-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor cec-core to use modern headers and definitions and fix
some minor issues. No functional change intended.

Also get rid of MS_TO_US() use from "cec", leave it to be "rc"-only
custom macro, which can be dropped later on as well.

Andy Shevchenko (8):
  media: cec: core: consolidate error path in cec_allocate_adapter()
  media: cec: core: add missing mutex_destroy to error path and remove
  media: cec: core: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for debugfs
  media: cec: core: Don't use "proxy" headers
  media: cec: core: Add pr_fmt()
  media: cec: core: Consistently use CEC_NAME where it matters
  media: cec: core: Use predefined time multiplier
  media: cec: seco: Use predefined time multiplier

 drivers/media/cec/core/cec-core.c          | 92 +++++++++++++---------
 drivers/media/cec/platform/seco/seco-cec.c |  5 +-
 2 files changed, 59 insertions(+), 38 deletions(-)

-- 
2.50.1

