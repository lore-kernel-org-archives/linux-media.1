Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D54F175A95
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534989; cv=none; b=P52V+q3hRx8q4wGXed/noKdNlEv2KaTE9UrO5JHaT0wu/AwFwEYCQ7r4LQZMMO5K7SvDZ+CiBGjBarjfDqOao16s0Ps9O3LiKIXGYmgq484EDNUWm23W9phlZZMORhy3OlkGbycmd4ConNmzdstKP8RLd+MVcYfefXpIBDEl9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534989; c=relaxed/simple;
	bh=wsXbwm2Sdc12zyyw1+K4Z2Nta9mTJP+aa6BPKa0on+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7geOZHqBOf/KQYyu9e+QBRINaan4jJmTBd9eVAawSH8+++n70viKuLvosCYBB85vEts/NTnVhuPjoFnFrKdje+Mkg3EtaW5bRd+67FYOgRHZ8xJRD5OfhmCcwu+Y8qX7mEXA9933LKRPiVJWJkwqXUg6QVrjdFDmOlQAHt69Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hl+G6qAN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hl+G6qAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534988; x=1823070988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wsXbwm2Sdc12zyyw1+K4Z2Nta9mTJP+aa6BPKa0on+8=;
  b=hl+G6qANGGb3UnxF1GHzP5lr9vL4LV2AEDfEZZHMBto28wrzm7qId+xx
   2OleOFU409Gxd0JrJ7r9UVvFjxhXlz2jd7Z4yxlADKvMGF2Ykj+p5LFl2
   cVaoK1eDy3Yyq/1D3oUVzr5I4eA9EV0XCAp+FpmoqACkB2fi9TGZCULXO
   1g750NmdxXXzmMYxU/Sn1yxV1hLVPmjirttgPIYbsSS8Y9y08hmnZ9Ri8
   7liPEB3ukhDcq1f2HSA+5QIqTX4xomKon6fk6Xbt3D/AY0E0gLrGXKAFl
   ssO8pREYDiLa09FeaEyDMlYnXovbcbnL32u2yPoinmEzZhna6jy2UHeIs
   g==;
X-CSE-ConnectionGUID: PG3UGVFlTES0uY6iJ581TA==
X-CSE-MsgGUID: hRYvp+FjSFiQAVxcjelNdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="232324"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="232324"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:36:25 -0700
X-CSE-ConnectionGUID: oIFiKby0Qrm6AylPBFydmA==
X-CSE-MsgGUID: +JZPUZv0T86Hv1dgsZ2FFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="379996"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:36:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 77847121BA6;
	Fri, 09 Oct 2026 11:36:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF62n-00000009FYR-3q9I;
	Fri, 09 Oct 2026 11:33:33 +0300
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
Subject: [PATCH v2 2/2] media: maxim-serdes: Disable test pattern generator for now
Date: Fri,  9 Oct 2026 11:33:33 +0300
Message-ID: <20261009083333.2204725-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009083333.2204725-1-sakari.ailus@linux.intel.com>
References: <20261009083333.2204725-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/maxim-serdes/max_des.c | 9 +++++++--
 drivers/media/i2c/maxim-serdes/max_ser.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
index 1cbe4c3a3233..6b4ffd0e2415 100644
--- a/drivers/media/i2c/maxim-serdes/max_des.c
+++ b/drivers/media/i2c/maxim-serdes/max_des.c
@@ -137,8 +137,13 @@ static inline unsigned int max_des_phy_to_pad(struct max_des *des,
 
 static inline unsigned int max_des_num_pads(struct max_des *des)
 {
-	return des->info->num_links + des->info->num_phys +
-	       (des->ops->set_tpg ? 1 : 0);
+	return des->info->num_links + des->info->num_phys;
+	/*
+	 * TODO: once MEDIA_PAD_FL_INTERNAL is enabled in the uAPI we
+	 * can add the TPG pad:
+	 *	return des->info->num_links + des->info->num_phys +
+	 *		(des->ops->set_tpg ? 1 : 0);
+	 */
 }
 
 static struct max_des_phy *max_des_pad_to_phy(struct max_des *des, u32 pad)
diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c/maxim-serdes/max_ser.c
index e9bb722ea22f..d6a17f987e46 100644
--- a/drivers/media/i2c/maxim-serdes/max_ser.c
+++ b/drivers/media/i2c/maxim-serdes/max_ser.c
@@ -90,8 +90,13 @@ static inline unsigned int max_ser_phy_to_pad(struct max_ser *ser,
 
 static inline unsigned int max_ser_num_pads(struct max_ser *ser)
 {
-	return ser->ops->num_phys + MAX_SER_NUM_LINKS +
-	       (ser->ops->set_tpg ? 1 : 0);
+	return ser->ops->num_phys + MAX_SER_NUM_LINKS;
+	/*
+	 * TODO: once MEDIA_PAD_FL_INTERNAL is enabled in the uAPI we
+	 * can add the TPG pad:
+	 *	return ser->ops->num_phys + MAX_SER_NUM_LINKS +
+	 *		(ser->ops->set_tpg ? 1 : 0);
+	 */
 }
 
 static struct max_ser_phy *max_ser_pad_to_phy(struct max_ser *ser, u32 pad)
-- 
2.47.3

