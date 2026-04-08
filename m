Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EF3BD642
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662791; cv=none; b=qE646ufnJtO8dipcKOPXZcZidjpWazlIWnLiUjsx+pRquxvl7DoZwiUZEeRX41SuvW63KpIavYs/CMKCNy4Rk/zU5JVn8ADQOuZ8rI8LKHCG2/2OULLZOXBmrBKS/KrG0xndQ44QbMvnSIWAa2qfzdukEGK/hQ+hDtBFU7mUo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662791; c=relaxed/simple;
	bh=8NJhI6miJR2FOpqq6K5WVBdNqlWPzqDzEa8SU94IWHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGnGru1rOeM+b3AXwvofuOtYHPW0pPLAdigkhqrK6oDzCWINjXyo3FJ/Ory5pTMTPBlI1a1KWf5xKYmKWvtLlUq3K/rl9jtl54Vdrzfzib1PyTZvAs0WEper8hViIASWbNPp13jV9v6QlqxlrLOGPVXmS7KQDBrn1MVy4AZrHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY4yIJ6y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY4yIJ6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662788; x=1807198788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8NJhI6miJR2FOpqq6K5WVBdNqlWPzqDzEa8SU94IWHI=;
  b=KY4yIJ6yX/gooH4079n/SAd++dFUj/tC0CWW13bedujhQvFMapMpuuJm
   L7USqFNbyImyk/O9OnQMi4iIMPSAzgDfxPUGVipxm3TYjKeMO+z50IPzQ
   4B5FK/qERbu0joaYWc2xyI+BANT3EqO2D4QTrGbLYtumenidaAtoth8JQ
   60KlqqeBeL3tT5U/id93dXN4OVC1B62X0rVssEKewvu9yYzuEgWHt+AoR
   QG3uk6IrS1iR8DBD6EvFDN+8HXR4gyvHROp0BndB5U0uJo5NWO+TTbSfh
   v115uhf33WjCAQUN0syIbr6gHnrxGxXpnS6QfLviHpTUGmk20OP7mheAJ
   A==;
X-CSE-ConnectionGUID: rvwIyin0TfO9o/nQZiMdpQ==
X-CSE-MsgGUID: WePTwgyeRe+LYJrVBe8vYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80510278"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80510278"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:43 -0700
X-CSE-ConnectionGUID: ksyZoQ49QY6vNsOTcrG2Lw==
X-CSE-MsgGUID: KZS1F9oKRD6TB/9RaXxn0A==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CD43C121D01;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044CQ-11eI;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: [PATCH v4 02/29] media: imx219: Fix maximum frame length in lines
Date: Wed,  8 Apr 2026 18:39:11 +0300
Message-ID: <20260408153939.969381-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver used the maximum frame length in lines value of 0xffff, but the
maximum appears to be 0xfffe instead. Fix it.

Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index cbd151d4af5f..89061dc1842d 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -72,7 +72,7 @@
 
 /* V_TIMING internal */
 #define IMX219_REG_FRM_LENGTH_A		CCI_REG16(0x0160)
-#define IMX219_FLL_MAX			0xffff
+#define IMX219_FLL_MAX			0xfffe
 #define IMX219_VBLANK_MIN		32
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
 #define IMX219_LLP_MIN			0x0d78
-- 
2.47.3

