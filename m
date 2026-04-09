Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056833F59A
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765738; cv=none; b=L9GnpuO+fSUAOR6uUqsSCruUPaYEf+cSF1b07bao9aUT0kIOljIyfWxHv934uapfF87u9/kiLGyG0ZNLIOH2wxDok/Y29g7TeObB/96/PAQTosw/Dp/d/nMC2/4SjsMpU7SMAg0aFOoulBDGLLyhK0T57jGYtrE1y9cXTPJhLYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765738; c=relaxed/simple;
	bh=Sesa5MhY6wIJI0gwTuXPS/ArP8FCpS+O40MQjpswRwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZ8zYSrLj34kl3LyjSb1OyR3lQzGi0fdnuxGPFfXIZ+cIvkWteeY1oKbIRIG+G0EUVxinvSF+BOVH/v4Ly8lZ853pvwuMNEgrWdtWlce2uyIptQ7lcP5w5Lm+SldEejYNXePZoIhOABDxJYHZqh+m7VbDPtDO9OUETRPZoInLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj9zWyKo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj9zWyKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765738; x=1807301738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sesa5MhY6wIJI0gwTuXPS/ArP8FCpS+O40MQjpswRwQ=;
  b=Mj9zWyKoFr1kwjm3EEj0GsM+X17+AoXeBrEnN8vA+LWAYa+MbKR5/FxI
   ofUPitiPJ+Km6JLdGBY0A0J3cmcpBMqvX2alXxmw/PFUqlfk0PbPzXn3o
   D+DbuQl6IKtA7jeeXU0l4Y/LsAk+1aDWXnpSoNmy7F/AHD+xKhBYK24Mj
   B9Em59bzpxsNNeMkuBSSSMJ5P3mVKNM8L/W3m+66Tk+rwU3xftedjX/SQ
   I+juNnuZsuI+Vj/jnk52gpBMs+vAgVMWzpRUYmPydDMuAL4H3KK9Z+RHs
   Fw8gFLVfQmDxCmfg5gqMgQl/kNKacIVlQmMmJo7Mggmf9VbZDy/nmkq79
   g==;
X-CSE-ConnectionGUID: TDDL3PpMSbuZmnk8hwhPoQ==
X-CSE-MsgGUID: 1xmI/zCHRW6zq5xKPiC22g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176637"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:33 -0700
X-CSE-ConnectionGUID: sMoLcnnRReGF+4KsJkDNjA==
X-CSE-MsgGUID: 0vjgg6+MTQW6h7ML3Gm2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047618"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BE5EC122902;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045n7-0rWG;
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
Subject: [PATCH v12 38/86] media: Documentation: Document streaming behaviour for common raw cameras
Date: Thu,  9 Apr 2026 23:14:13 +0300
Message-ID: <20260409201501.975242-39-sakari.ailus@linux.intel.com>
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

Document that streaming control is based on stream number 0 and additional
streams need to be started before that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/subdev-config-model.rst    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 1923ccbafdd0..3d0f14dfdded 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -99,6 +99,16 @@ following routes.
 Support for the embedded data stream is optional. Drivers supporting the
 embedded data stream may allow disabling and enabling the route.
 
+Starting and stopping streaming
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Starting and stopping streaming is controlled through the stream number 0; if
+there's a desire to capture additional streams, such streams need to be started
+before stream 0. All streams start and stop at the same moment.
+
+This is subject to change in the future through additional API elements while
+the default behaviour will be maintained.
+
 Sensor pixel array size, cropping and binning
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.47.3

