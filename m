Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435BA33688B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765729; cv=none; b=Yli9DkvYMl74XY10LqwvUdn7CJde7B4Xa++I4BjHBzIyWjgNxzHDnrqwtPEgvoKSvQeWg6O0Dh6iatlcItmjBv8GaiB618zISTPK5Nzlik8wYkrZUAd5Z8AOD1GNS/XXyOVvfuienHti+HRS2gvHhkIlTd67fCY+iCFZFlydggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765729; c=relaxed/simple;
	bh=RTQXT9+wjlZch9dJxYONqRh6TVecpQKIBxQs4CysC/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O53A2u4/DVFWwbyFjNcTXt6p2PBkyeZsYLHIL6Quq2ldC2H7WGbUVbMfUK+b96PLeFrxIVy/4Arj122sFm5665AWJDb3ZzU3Fv/yxSjrEWCn11KDQppRYV00H6C8AEqyh7Nw91Q3HXNqw54A1ff1a/GjaZoJEbixw8zqOWS4JcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvLPksyg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvLPksyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765728; x=1807301728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RTQXT9+wjlZch9dJxYONqRh6TVecpQKIBxQs4CysC/g=;
  b=BvLPksygx2Wi2b4SGdNMM3z2c31ZtQhtjxC5WRPG5EJ8V5gQCrzwSeNg
   6JbEISxcFGQyNHeABffZGp3OePdIOdXWNfuTWhyK92/W9e5CmHkG2XSGT
   e1hANClxwhivGkgZWMR5ppV4tPY6ZAFgSV7SprTu3sTowf36+77r81DBu
   8CTSqTQgNDmxiWr29nBnToNV2pug1ED787+4TqxR/BWwfEIxmZ935yugQ
   h+1HDpfDZ5eZ/fqHWKe7Ompx0PzgIFQwLU7MoPEVa4wgXJQavy/jVQdJX
   ijz8FcnnBcAw50nwLR+djl9svvqaztB0djNKXLWCzO8wsKmHBb/ovUHUz
   Q==;
X-CSE-ConnectionGUID: kSplwY/aSza89iEjvBgMoA==
X-CSE-MsgGUID: TYiE1rOkT4SkeoX1S/3U5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176376"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176376"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:25 -0700
X-CSE-ConnectionGUID: /7DxWuMsSjaiohsW3JrhLw==
X-CSE-MsgGUID: H/+VEA38ROyKz97ld65ANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047512"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 769E51226F9;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lx-3pjj;
	Thu, 09 Apr 2026 23:15:01 +0300
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
Subject: [PATCH v12 20/86] media: Documentation: There are either immutable or mutable routes
Date: Thu,  9 Apr 2026 23:13:55 +0300
Message-ID: <20260409201501.975242-21-sakari.ailus@linux.intel.com>
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

Document that each sub-device may have either immutable or mutable routes,
not both of them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 78842b9fbe67..57bd44dbbeea 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -616,6 +616,12 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
 called on the sub-device. Such newly created routes have the device's default
 configuration for format and selection rectangles.
 
+A sub-device may only have either static routes (routes that have
+``V4L2_SUBDEV_ROUTE_FL_STATIC`` flag set) or routes that are all user-created or
+user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_STATIC``
+flag). Mixing static and non-static routes is not allowed in the same
+sub-device. This is subject to change in the future.
+
 Configuring streams
 -------------------
 
-- 
2.47.3

