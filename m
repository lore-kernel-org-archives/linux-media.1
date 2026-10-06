Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E113A9631
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272432; cv=none; b=XHtrO6GlOVx3zunGTDt+FPkKovFv0UpON8RpM8isfPAVoFTXqCgi3VQ/nxkJsvv5KfPonJzg0Ir2dzX6KKiP3z7IRzgScDmZHSu859YfBLa9FIxaIM/bmgKqGiHI5tDXWKAPJv8/ayJvEppBveR2cI5+30duU66B5r85UNKsNCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272432; c=relaxed/simple;
	bh=GlDZ0w/agTMRQclFsGuR8bdnYzC+ZOYJELYbx7ntI84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsL5oMT/Od+O85dEQ32QKYJnXD9US1YXHHiFf6R+Oy11H/bdSwjJw47BOo9Suqj+HlkOqrd94WCTVOmKqki1AqdWZk80fltdjMXELDZT2Nuwc8Bwv4Rs9Y1AK+BYviRFd7NL3d1lTCLca0AotDMm9AZRJtBoJDzOYwmvxz/gNPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dC6H+/52; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC6H+/52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791272430; x=1822808430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GlDZ0w/agTMRQclFsGuR8bdnYzC+ZOYJELYbx7ntI84=;
  b=dC6H+/52RdaFzZg3f1fphIDg572eGILYtQAuYbJVo2CNy9/QPnTybfgq
   DlrHPylff9lI61GNrWYgYiDvcMn4iSGgoWkAF1V/2q5bHqNG/Cfl49w/S
   ZGOMD22db5sxMYFN986zpHW90W/FzP/0yPhOSzHsKhQyQND71EpBi4NXm
   PQyWvsO54Eg0JwzG5N+ySts8Z+cdIe1oQ+CDQsP8tDrni3SkBt40KkBzs
   QKKaTFi4KAQHWyTuDVaEg4fy3ax7p7S296+aRnEBMkT5ZCAvkNfPdUncx
   vOQMA8/fc8xKrrIMkMCRqnMcyLyGricU5H1thMnjolIBr+3EtTvVxIbb/
   Q==;
X-CSE-ConnectionGUID: w8jBLoEoQFibVmnAMrRTzw==
X-CSE-MsgGUID: jWU9c5JJRPqyClL0kYyzww==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102114866"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102114866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:40:30 -0700
X-CSE-ConnectionGUID: sEj6X5q+QMeipyrNHFWphA==
X-CSE-MsgGUID: d6vgrH+UQDyeCpG0ERQhRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276203370"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.66])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:40:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D695F121BCD;
	Tue, 06 Oct 2026 10:40:29 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xDzkI-00000002aGf-19De;
	Tue, 06 Oct 2026 10:37:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/1] media: Documentation: mc: Fix Stream reference
Date: Tue,  6 Oct 2026 10:37:54 +0300
Message-ID: <20261006073754.616062-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix referencing Stream in glossary.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/mediactl/media-types.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 200c37a1da26..4f6d1ecf2853 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -388,8 +388,7 @@ Types and flags used to represent the media graph elements
 	  be connected with links.
 
 	  The internal flag may currently be present only in a sink pad where it
-	  indicates that the :ref:``stream <media-glossary-stream>`` originates
-	  from within the entity.
+	  indicates that the :term:`Stream` originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.

base-commit: 3e76f0787c1605aa921efd2d4eb3d4e87814ce3c
-- 
2.47.3

