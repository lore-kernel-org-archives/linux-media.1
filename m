Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0C40F734
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405873; cv=none; b=AAQJZol1duMiLEUgIKuHxYMG9tkA3x5TJgdomIabDePZs0B8pDHRyN6hb977SZEOlH+7/5jp9CeSSAGuQf8zbKhJXBslaylgihQxKrRx4DRvJLic5S1Fbj5kIGVgbbx4kLpXFOA7MkyYWavOt+90dX9ECAu6x7AFTPJ1tPgIPJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405873; c=relaxed/simple;
	bh=Oh6WA+lGFSMQT54deeEWVw5ZiFa8tCBLmLnF5nJ4ZJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJ6G0JPqFoCJRhBlNhTJqmOb8C/tmeUljgStHlNJ8z6Vm14n9MKZWFPOr5UE/EgmE5IYbNeUsv4Rl4TXUhkCw6Zryfi6V7C+rz9e/TssZ14KEKKlr6qgqwwocbYhB/FLGF9d32qL6USgTjmJp3cLBRgm6DEAlYJjWBtlatPd52M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYJ/1pt+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYJ/1pt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791405873; x=1822941873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oh6WA+lGFSMQT54deeEWVw5ZiFa8tCBLmLnF5nJ4ZJs=;
  b=JYJ/1pt+8Y85cDH6BTPMOwAYyP36ZLK4T6/j39BkgoZ2FLH7g1QARLgk
   02cztBDVwxRmZ+918NZmo3YWIiGW9FZiPdOq2uZwWoqU3KuRF0ZvGTpJJ
   CdcWRZ+2olGNdrtL4zY6y7sK+Dp3BdOZbUzItlhgkoOJ8epgDs8y3Rev1
   0ceQvHM/lt6ce6KcOR6vrO5j9noe6qn/NLu0vv2fS/63zieWQ0hsiyHpx
   5XX9APFvYxN+SWzOLx6dv/XrggOAIVczSwjFqO0wlHH1m2fHd707mYem5
   LCa7f3MmqSxBUxbh5zBxGtj0N9JGqHZJNeMvBi966yKMPv4fGrfU46BHl
   g==;
X-CSE-ConnectionGUID: lpEyZk+uQmGCWRMjYuOI/w==
X-CSE-MsgGUID: Wf7ZIsdfS7iUbq8/gcDqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="81592"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="81592"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:44:30 -0700
X-CSE-ConnectionGUID: Dx2VpR9tQqOGniK3QULfcw==
X-CSE-MsgGUID: 4RQ3p915QEK0IhWa3quOZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1642450"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:44:22 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 66F84121BA5;
	Wed, 07 Oct 2026 23:44:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEYSF-00000003HXx-3XJf;
	Wed, 07 Oct 2026 23:41:35 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Dumitru Ceclan <dumitru.ceclan@analog.com>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Cory Keitz <ckeitz@amazon.com>
Subject: [PATCH 2/2] media: maxim-serdes: Disable test pattern generator for now
Date: Wed,  7 Oct 2026 23:41:35 +0300
Message-ID: <20261007204135.782415-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
References: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable the test pattern generator that uses the INTERNAL pad flags for
now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/maxim-serdes/max_des.c | 3 +--
 drivers/media/i2c/maxim-serdes/max_ser.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
index 1cbe4c3a3233..cb43edf7a9ae 100644
--- a/drivers/media/i2c/maxim-serdes/max_des.c
+++ b/drivers/media/i2c/maxim-serdes/max_des.c
@@ -137,8 +137,7 @@ static inline unsigned int max_des_phy_to_pad(struct max_des *des,
 
 static inline unsigned int max_des_num_pads(struct max_des *des)
 {
-	return des->info->num_links + des->info->num_phys +
-	       (des->ops->set_tpg ? 1 : 0);
+	return des->info->num_links + des->info->num_phys;
 }
 
 static struct max_des_phy *max_des_pad_to_phy(struct max_des *des, u32 pad)
diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c/maxim-serdes/max_ser.c
index e9bb722ea22f..c8dd5c3d352c 100644
--- a/drivers/media/i2c/maxim-serdes/max_ser.c
+++ b/drivers/media/i2c/maxim-serdes/max_ser.c
@@ -90,8 +90,7 @@ static inline unsigned int max_ser_phy_to_pad(struct max_ser *ser,
 
 static inline unsigned int max_ser_num_pads(struct max_ser *ser)
 {
-	return ser->ops->num_phys + MAX_SER_NUM_LINKS +
-	       (ser->ops->set_tpg ? 1 : 0);
+	return ser->ops->num_phys + MAX_SER_NUM_LINKS;
 }
 
 static struct max_ser_phy *max_ser_pad_to_phy(struct max_ser *ser, u32 pad)
-- 
2.47.3

