Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44339151E
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741367; cv=none; b=dDWn8BThDD8SxalzYB6nC0oOkzgMWDsAwp52xwGXTH86z1qKa+ium4a4Dx8lt1vxBwSIBig+r+wUyLqYwahr8ZImN6scPfd15UB3ih6K4Hv7Ci61A8ll4fs9MF6r0rkR1691S3qI8mVBkAuEJutlh23C57WZaJ80axcR/IIkDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741367; c=relaxed/simple;
	bh=L+ebjQgL7oGbL7qhnePhhV3170FhCPlzRbXUV3z4YAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gn19J8z0e9FhN0TD9DQORjQjBuzmGYMnKaS3xpcdaUv93aaevmzRyrAP6oFoy4HTqitS+3tSUuns5Ym7yGrBgcxnUc0ZP0aRAnKnnc70bj9XS1+EB5sQ4rPND5T/yfKYXMZwreenHmVi7kHHlO29RsapWgcM/UxheNjyROk4L3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npe0ljJU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npe0ljJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741366; x=1805277366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L+ebjQgL7oGbL7qhnePhhV3170FhCPlzRbXUV3z4YAM=;
  b=npe0ljJUZEzSJGtHLLKEg2E4kJFKRGFpSMu2wq8nfmka0nYgtANXm8do
   W/ryzpVW4oCx8u5IyFD6VNsGWR8u+LxQAeGwY+uA1S6KJ6zEX8JQqJn3o
   ck4SSJj9Fh2BRkJpxciaTu7v1dz6uPzsJ5hiDsbc37QYN179v/GpH/85t
   RyjaDVjdWQUhtjQm9XuG7nAndJUptr39a/c6PFL9AWN8OOyUpACFjmh55
   d3XF0NBsUHKjPcwS1keLJhcEgDoRLF0zdbznGnLmB4CvOH+WeOXhWIqyD
   Eh7flQ0Mv4WaMoVtqyR1lGkf6MQiYHk5qLaiuYJB9evewpZPxHLelGNl/
   w==;
X-CSE-ConnectionGUID: Fs0KNadNQsyqwWgy96Ac7Q==
X-CSE-MsgGUID: uAwZZ7D+QS6C8WryLDkJxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335668"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:03 -0700
X-CSE-ConnectionGUID: qYC/tS8WSCixRkKcMv8gdw==
X-CSE-MsgGUID: nMHJ3ooPSoqTHI11I0hZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344877"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 68018121D5B;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000tor-1L8m;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 4/7] Constify progname
Date: Tue, 17 Mar 2026 11:57:59 +0200
Message-ID: <20260317095802.214532-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index e8d72a68be30..215decd65d93 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -43,7 +43,7 @@
 #define MAX(a,b)	((a)>(b)?(a):(b))
 #define MIN(a,b)	((a)<(b)?(a):(b))
 
-char *progname = "raw2rgbpnm";
+const char *progname = "raw2rgbpnm";
 
 static int swaprb = 0;
 static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */
-- 
2.47.3

