Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216053CB2DB
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753380; cv=none; b=TitmuI+8NgLFw0eSY1eu/TGRz6WxOAgXlEaU3is8QYIcAhF3HUL4IUn2czDkPdaWB9noKz+AO2qRJs2ztkewnFoC3loK5I7elY/KkRor5DtTZ+cMom08KWwsz97869wVOtJrBDzlS8xKNN+yWjx2DiPd7J+OyNH484WIBoqhWRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753380; c=relaxed/simple;
	bh=BIl9Bz/AuPvM0Up3mdZTgo22obPbB1iVKfL9STrcDe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTsCMcEjPnQrHVWr8jux7Ls6IUSEzR8dP7TTlmn4RhT47XugGBDxjMrsNTl/K4kdUwdzX/Z4BdDMSgLrM39uKc0RgSEqOj9hEDGA05WBhBEUtxSQG+XUlAxmOPQg4n5GhjwQARj6x6bccRouB5ToG5cVOR481TRVaoX/JFql2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhNv1p3l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhNv1p3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753379; x=1805289379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BIl9Bz/AuPvM0Up3mdZTgo22obPbB1iVKfL9STrcDe8=;
  b=BhNv1p3lIfT9K9qZsC7vB1CGmHSVWeKeM0Iil5Gi2iX5Xu8qwgakgFR2
   yLIsj5sVdijj55dZlB9399B9zfo9Yf3dbQtD25gFpknTFhU6Ks/EV5yZ9
   p9xcJQHM5SlgOrhWIl0+xDkeVJjkYAtTBzNfJgcUD+19o5UJ4tc3m6doq
   dZksNsCjvLzJqP1S2rgrSPxJRWRQ/Jpk8PEGyUMCCbBViW9Mgm5UMD/GU
   cukON3UiveVjR7SXh7x/5u3PZlHpS3dU+wUXRf/bxX7CKj4niUjVV48P7
   EdPP4tlLC8weBsW1y6qGN3Se/PkfL/Ssz9psdvdHiMz8/nbQz8ysoiVMu
   A==;
X-CSE-ConnectionGUID: Vwc1USyaQ9eVoK9U1hebuQ==
X-CSE-MsgGUID: J6ceksZGRU++6XV1vpwgRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411105"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:18 -0700
X-CSE-ConnectionGUID: XopnObZ9TS2Ysyja1zlXng==
X-CSE-MsgGUID: D9FjuT3UTr2+TSjxg253Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733229"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ED3F8121D88;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000u0D-3hEe;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 6/6] Fix file size check
Date: Tue, 17 Mar 2026 15:18:13 +0200
Message-ID: <20260317131813.215230-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
References: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file size was unintentionally multiplied by 8 and that's not right
anymore due to changes elsewhere.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: 578f7012a851 ("Improve input validation")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index ce02c0ec011f..afbe47764de4 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -187,7 +187,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	if (file_size % *height == 0) {
 		padding = file_size / *height - line_length;
 		printf("%u padding bytes detected at end of line\n", padding);
-	} else if ((file_size * 8) % (line_length * *height) != 0) {
+	} else if (file_size % (line_length * *height) != 0) {
 		printf("warning: input size not multiple of frame size\n");
 	}
 
-- 
2.47.3

