Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DE33C1BE
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765730; cv=none; b=pZJLrQyB+5U1D/BXBPO0y1rnCd7ATVv/GY29JzGyACEpZUgaQKPCS6vhINUH6GxbwzfTRmlNjWLt29tVFtQYBntdbnNT6/qQ/OnxWDnmEj9/EzgDu82exg5kq5pKcIbUGbBZYQam1yVG2OJXHtH21cgJbT3u1oDn5LrXqHBTINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765730; c=relaxed/simple;
	bh=OLUNrfKZ24CbwIPLs5Nas+WtkBd84fiFJTo9HMb30Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIjfiCM4h2NnHAtZH3H8nIzF1v/2adFkxV5h0cNqt9Sha8VYP71yl74gGKOeXwXDWgWfUcC6MmgK1kHilT+3cPkLsMmSKjSBW6TzrEEBSTwc4M30So6uWjFvJKtjIUXfURlg3MbT2bYlZWFnRW/1vXSuKN568dwUQI4WJfRkH24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9HIV8Fw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9HIV8Fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765729; x=1807301729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OLUNrfKZ24CbwIPLs5Nas+WtkBd84fiFJTo9HMb30Qo=;
  b=U9HIV8FwOUNFSb21rKud1+x48NlUxRNybqtt+hrvNG37gUdQLUlDXbgC
   x8bJLON7t7WroXfk6DR2qN0tM5Gq/JoYDqJEK9tHqIivgSFxBmf+6ew2U
   mSNJvWg2LHBfDHZOngnxq+i6rvtd7FolNP12hA1JZigCRknJAr9G4Ql0i
   9LWGgAme9YZ8DFwbTjIwdHpf9CFs0ejSrSaHn+lPCcjtJ4txYwkFIb9Qy
   9/jd9eK3mBIaeooJ71y4+IsIyeVYl2NI4OXGde7/lo9vsT/WTbNUK+kc1
   igO6A9mCVZSDKsasG4jFqRShDrDzYGgt6uBGzHNL9AprCVSAFqAzjEU0c
   A==;
X-CSE-ConnectionGUID: 9WA0X6xfS0GWRkblqzdqnw==
X-CSE-MsgGUID: gSgZfQKwTmeCIReuNpYIXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176407"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176407"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:25 -0700
X-CSE-ConnectionGUID: DXrEfWyrRNq8kMq9kACG8A==
X-CSE-MsgGUID: 3m9uHLfMQ0mHcpckFjTZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047518"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A0F1B1228AD;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mf-0M7p;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 31/86] media: v4l2-subdev: Set STATIC route flag if IMMUTABLE route flag is set
Date: Thu,  9 Apr 2026 23:14:06 +0300
Message-ID: <20260409201501.975242-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the IMMUTABLE sub-device route flag implies the STATIC flag, do set the
STATIC flag for all IMMUTABLE routes returned to the user space.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4b7830f705a2..3f671282ee91 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -698,8 +698,11 @@ static void copy_routes_state_to_routing(struct v4l2_subdev_routing *routing,
 		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
 	u32 copy_routes = min(routing->len_routes, state->routing.num_routes);
 
-	for (u32 i = 0; i < copy_routes; i++)
+	for (u32 i = 0; i < copy_routes; i++) {
 		routes[i] = state->routing.routes[i];
+		if (routes[i].flags & V4L2_SUBDEV_ROUTE_FL_IMMUTABLE)
+			routes[i].flags |= V4L2_SUBDEV_ROUTE_FL_STATIC;
+	}
 
 	routing->num_routes = state->routing.num_routes;
 }
-- 
2.47.3

