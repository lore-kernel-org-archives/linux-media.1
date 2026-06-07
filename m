Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3B133A00C
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869261; cv=none; b=SwPIf06j7mmulMjPyq7+MVfR7ycQmrSQNMnBIPYa+IQ+aGkmDGA+CNCDxvLIW1yU/VhxP1lGCN77GOI5s5d7vtNAKVkEzXjl9RasoixIuOcSNTA5zqLPZ1/zs/gZrRXQ6WKUGzGDU1+CR11up6EAhW+4J3B82Ad4Db+iwTgGh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869261; c=relaxed/simple;
	bh=f7QtpHXroTWy/oihFtD3mbVvXDutMUGID4Ruv4QJsHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWodrP7mb50oLKhuPV0DSDtuYUIUVAecr+i40CAIdDPPGvXMfrGHUAvqNZ6zdb/4e14jG2b899aiuDynQndqdMofGobJhktWFf7Eko2yHUit3ThR1+FrQTRi9xPHhsam5oxd3qbqr8ETzlpKykxU+X7xV/4oVc0/hXfa/NCHwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+dd+SGc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+dd+SGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869260; x=1812405260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f7QtpHXroTWy/oihFtD3mbVvXDutMUGID4Ruv4QJsHU=;
  b=m+dd+SGcGktSjEnVUyZceAnbmyC9qVgo43p30oxoo2x1HN98WsbqqDun
   2A11YQQQ/LFcyoTSfxUiMJ1Sj7SAr+RPdf9/0IQj9O2Lnr1Xt1EunYcsM
   f5xy5QOtENQpAIB2nWzjGUtJVf3DyB3sCQ2o985mWwnAuIYwokV9aMXJ5
   E6TD9CMJfBTLhp+uwj44J+J8+0d9mnFh8l/otdNV+RS5Du651J3BVkzkP
   P9/PlqJZasI4nRu2f6Y2yt5uXkI4VBkGF1WzPhDsYpKQ+aQ2GqNDfrjgq
   hgeOHjDM3MlYERvCzSJSJnvGH6CfiH4WOYnIu3xAqLGY2m3RdFzRdqTPg
   Q==;
X-CSE-ConnectionGUID: 6W+CAVhYR3eOJnIw2lppRQ==
X-CSE-MsgGUID: cW/HnYKTTRyId6TE6WLBsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107048266"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="107048266"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:15 -0700
X-CSE-ConnectionGUID: +MaEGfMcQLaGj2PW03saUA==
X-CSE-MsgGUID: BBLXZGPJSWap3+/m6ZZy9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245490484"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A6D8911FB16;
	Mon, 08 Jun 2026 00:54:07 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wWLRM-00000003XIF-0bMg;
	Mon, 08 Jun 2026 00:53:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v5 01/10] media: Documentation: Improve pixel rate calculation documentation
Date: Mon,  8 Jun 2026 00:53:47 +0300
Message-ID: <20260607215356.842932-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve documentation on calculating the pixel rate, by adding references
to relevant functions and mentioning V4L2 fwnode endpoint instead of OF
endpoint.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/tx-rx.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 7df2407817b3..9b231fa0216a 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -104,7 +104,11 @@ where
    * - k
      - 16 for D-PHY and 7 for C-PHY.
 
-Information on whether D-PHY or C-PHY is used, and the value of ``nr_of_lanes``, can be obtained from the OF endpoint configuration.
+Information on whether D-PHY or C-PHY is used as well as the value of
+``nr_of_lanes`` can be obtained from the V4L2 endpoint configuration; see
+:c:func:`v4l2_fwnode_endpoint_alloc_parse()`,
+:c:func:`v4l2_fwnode_endpoint_parse()` and
+:c:func:`v4l2_get_active_data_lanes()`.
 
 .. note::
 
-- 
2.47.3

