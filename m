Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D13B3894
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534145; cv=none; b=XGjC361fDrDL2uZnw6/ZmEVHreJ82rST190I4TtZ/lhpmXml8QnbNNkc5cYOqBBb67ok9HndIY/zONB99wyx1dT50lVh1hqATFrxfiLnn2MMyD8lJ53WsVk2rTg/V42bjgEDKFAWgcxObmh0ulkMBO9nTzy/nnSzwtMAJ1mD5H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534145; c=relaxed/simple;
	bh=WuMlugmuJR6hQocN3wFhY2ZMfIF8/xWMmBIoHYCQLtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHh+ykkeRiXrlbRCduy34rCb3em+jOYazQc2Zoc+xeLb9/mRga5cSXTF3kL4y1c3XNYvpfBZhYi05ZCKHf3RQ0dCsv1C4ZNgNC+Fl0+HlFd4mL0jnNO97oYMSlkxj8pCLoqMTO0iH8w8VGUYlR0Q6ZPjv2fYTLRJoQfHH5/THvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVdfXnzC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVdfXnzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534144; x=1823070144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WuMlugmuJR6hQocN3wFhY2ZMfIF8/xWMmBIoHYCQLtQ=;
  b=JVdfXnzC+P9bpQLbp9Y9D/H1g4K6BkUcP9xo4XJJIHGF6UGlj4vNv4zk
   2/x8ndZuXqnndu9eZICoVzPmuHZtqwJUBwlwHu375IN2Er3sH1JaV8wxf
   u+UETrbo0TN3ElVxe5FJ81KoizTU4CPVl3ScHMp7usmrKYWEJkAL7bxEq
   7WvaSmIuIHJ17BMFeLzUKFf3ppPcZajEssT6r+jfw2YE2MM7C/Q6t+JWX
   N9Mj4SryQyE/j8uDH+WGKwkboyJpHLJLN5MvexwWjkIx/EdlZEPs9hFu8
   i7jhLL761+pDjtQtmcJWmyVDxZ2b6Uo8kDgaWQISJF8fxf75ZeHY6tyL7
   A==;
X-CSE-ConnectionGUID: JV55/j1NR7elv4Y4A/glvQ==
X-CSE-MsgGUID: hMy2itFlSVWfcL0uf4fZSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="235411"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="235411"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:22 -0700
X-CSE-ConnectionGUID: mQd/xPogSmizTafd/s7erA==
X-CSE-MsgGUID: /4qQFHYAQH2GqDXQcyFJzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2068671"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:22:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E5B1211F9E8;
	Fri, 09 Oct 2026 11:22:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF5pT-00000009FOB-1SIW;
	Fri, 09 Oct 2026 11:19:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 0/4] ov05c10 cleanups and fixes
Date: Fri,  9 Oct 2026 11:19:43 +0300
Message-ID: <20261009081947.2204092-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This small set contains a few ov05c10 driver cleanups and fixes based on
Tarang's review.

since v2:

- Also set the device's PM runtime status to suspended on sub-device
  registration failure (missed in v1).

Sakari Ailus (4):
  media: ov05c10: Small cleanups
  media: ov05c10: Set reset GPIO high when acquiring it
  media: ov05c10: Power management fixes
  media: ov05c10: Remove duplicated writes to analogue gain register

 drivers/media/i2c/ov05c10.c | 55 ++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 31 deletions(-)


-- 
2.47.3

