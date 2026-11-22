Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397871;
	b=S+uuyoktqWSaefnISVzoAJz1C9dku8UqwkrbAfMa3JpbnWalgeBhJchfrk+oJANu/sbh
	 VUatSHAzawmq2D0c6PdFh96De3PGAaFTG4f0RI0NDf1gHBMrU16YgnR6zX0k98U6LQYQ9
	 BuTelcHyS6PuSQnv7aveZSmOBwfLvcXnXvI6b0rWannq9wQ2bqZ8g2+lY8/6VznBKpcqB
	 xWFiCcQ7WzQq79bYtr/CMeN9jjitjyjMnNlaPBFOSq8uz+ryGsWqvx2Sr4VKxbIDELJfB
	 9RfAJZNhhlz64r/24qfhA3Qs4e1mpZlfh/RBGFhSWIT4LYVCTeGUtmwD1U/myPozOHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397871;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G/7Fa2P3vyyZGVDuVelXNo5NS7E2vwdEWMnzeDRAFuw=;
	b=U5pRxAu+HsXgYA7ZM9Mkxr9z1jg8q7tE9sEb1281dJCDXYiI9gjcsOwBAA7gISnYbgZb
	 NnNXgv3SKoUBDJHPD6pPDmDewVYddBN7i5yr3U6T3r2R6dNxw9XZeZZhFTCySbfAeXRpS
	 zzM5rKUZacP04zdilZn95mbXFG/Cl9+tuy8f7IXoKvWX0bnGjoKzs7yR1xZSd7TOsJgxm
	 gD1kYgw5ExZWcTBUFnV5aYKocGp/vAC6L7tsqYGu6v49QpCWiF4CckEryCJ1nOLM+JR24
	 Np1voO3QblZ1sa6akAz6q+CxyDJ4GkyoMmqolFCB4+XEcTiXVXGnHJKvkcp8++sY+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EZPnL0Gu;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CA3606A68D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CA3606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EZPnL0Gu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795397871; x=1826933871;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fIRUsRW8cZ2xXoDF2fyI2Sxw0pKLw6qs2/3wMezJ9bY=;
  b=EZPnL0GuTXvTX3XF4b6bvjW9EeFOop04u3VFNUpMfdDowdg66iknWNAm
   w0/RVVchD+xyFs4CQhaLgM4wIYleCgBG2O2fW7S2z4ObDfePJEWNDKM7y
   imvsTYaD6JM8Ivt7iPLWzlbRC38rQvRfb/m8T7CN1DUrKi0wSC+1DCmj5
   MXsvwMLwovHsXk4JabluIgN5PT9cdonczOY2/jVCTKhB50YIBgnBVnO3k
   7ZgmTi1py6giOimrW2YvqO6DCa1Mdn0gk7vHDqhGfgQZa8ry3+9jg+dU8
   vHsC4VjS54gSQ+X0ZJ/nXC2Zsyqk0vza5XZQAhS9hKw9KosX+1oL4+iZH
   g==;
X-CSE-ConnectionGUID: 3zryVJIPS6yFSZZUyIstnQ==
X-CSE-MsgGUID: T7uX7B6mSbqVrEwl5GfjTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4091818"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4091818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:37:51 -0800
X-CSE-ConnectionGUID: 58sFFp44QNepnzDn7YE9bw==
X-CSE-MsgGUID: qxOduB09TKO/NawacfBhkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11173694"
Received: from pg12hl01tchew6.png.intel.com ([10.107.246.123])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 17:37:50 -0800
From: vunny.sodhi@intel.com
To: linux-drivers-review@eclists.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: max_serdes: fix uninitialized doubled_bpp on zero bpps
Date: Mon, 23 Nov 2026 07:43:11 +0800
Message-ID: <20261122234313.327866-2-vunny.sodhi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122234313.327866-1-vunny.sodhi@intel.com>
References: <20261122234313.327866-1-vunny.sodhi@intel.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khai Wen Ng <khai.wen.ng@intel.com>

max_serdes_process_bpps() returns early when bpps is zero, leaving the
caller's doubled_bpp uninitialized. Callers then read doubled_bpp and
may act on garbage, misconfiguring double mode and data padding.

Initialize *doubled_bpp before the early return so callers always observe a
valid value.

Signed-off-by: Khai Wen Ng <khai.wen.ng@intel.com>
Signed-off-by: Kris Pan <kris.pan@intel.com>
---
 drivers/media/i2c/maxim-serdes/max_serdes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/i2c/maxim-serdes/max_serdes.c
index 6246bc55c551..92426dd9942e 100644
--- a/drivers/media/i2c/maxim-serdes/max_serdes.c
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.c
@@ -118,11 +118,11 @@ int max_serdes_process_bpps(struct device *dev, u32 bpps,
 	unsigned int max_bpp;
 	bool doubled = false;
 
+	*doubled_bpp = 0;
+
 	if (!bpps)
 		return 0;
 
-	*doubled_bpp = 0;
-
 	/*
 	 * Hardware can double bpps 8, 10, 12, and it can pad bpps < 16
 	 * to another bpp <= 16:
-- 
2.43.0

