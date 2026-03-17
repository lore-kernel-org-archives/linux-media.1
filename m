Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A635F19F
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741364; cv=none; b=P1Cp4aGUNSZie7q9Ko3j1kMhzlt8eqt/OPg9MRGK7xck6Hu+scCk84or7wCZGOQhhgfhc4jFOdbN1C1YoRrIc+XRKyQQzQW1q1F+bCXWTDacq11qZvMtaf7kBuML1YcqhS1X1dZ44Cxc/28+WEALFtpQ3DrTosy5/qFFb743DN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741364; c=relaxed/simple;
	bh=Gy6hFXZtAhx2vgShAiVxwaPY/msYuc67X+hMw6Zsfa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSWYsCzLOvk+cMTLMoGp0ZTWh3SCZjB2sdnwi9mYT/oDyOufbsen0UDRqRg+m8PR5hM1vG6GZbeS7h1jZL9OA3UUmNLCSZ6u1/EGN3+2tHbVIv2NLAsUgIKKvfRF4+x12SI16xSFHsYWltGlxY2HATZAT4IBWVQ2JMJ953oesVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nu7p1YZG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nu7p1YZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741364; x=1805277364;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gy6hFXZtAhx2vgShAiVxwaPY/msYuc67X+hMw6Zsfa8=;
  b=Nu7p1YZGae2o3pqItWsVvjb42n9drDEqNMMOrAGPZ/eUcWWApV422ArZ
   SDfbbUVnmtkx4ZZdnWok63KNz6zOlKwTv84xmk+DaqFNmxz+6vFFhjLR5
   WvCpT82WXVxjEEF3xRHm9NREHkLIOLprVzyUzqcko4jlc5B/hLKAw0eZi
   2ymntP4fGr1nR7SXW6Y9GKclLBbc+K3HtTRWPkG4Q2lcK7SIOCbm8/qgS
   Y+WHz/SXbAlYM04ZGyeC+037SyoYzvm68Y/AVENKQksXozqyylExoSfSp
   y/84f74GzZQA4IIrhFHkUiq11Xu68HONKkrjJonzK0DChWUMs+pf8rHrx
   g==;
X-CSE-ConnectionGUID: fKz6C/cuTzuYRrKkWUznVg==
X-CSE-MsgGUID: sUiESCk5RDmwPTq+OVQlFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335663"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:03 -0700
X-CSE-ConnectionGUID: 1TQ9peW+Queyzs+mvHE2vA==
X-CSE-MsgGUID: QACOZogYQ7mc1UL30Jebgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344873"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64B31121D4F;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000toc-0xvb;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/7] raw2rgbpnm cleanups and a fix
Date: Tue, 17 Mar 2026 11:57:55 +0200
Message-ID: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are a few cleanups and fixes found in Laurent's review.

Sakari Ailus (7):
  Reorder headers alphabetically
  Check we have a supported format first before allocating memory
  Add quotes for "-f help" in help text and do a line wrap
  Constify progname
  More header sorting
  Use "stride" in a stride-related error message instead of an internal
    name
  Fix file size check

 raw2rgbpnm.c | 47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

-- 
2.47.3

