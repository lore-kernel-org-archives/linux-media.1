Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008519;
	b=sxfu0w1J5xE0VeuCs3iKqzN/P5Eh8F7RdPVotxXdP2etOlBOneYWSbWrBVyOPZY7ZuBA
	 QgeNAv3NicJSFiR+lOvGIJRjhVkdKOtnX3MatJbVJRVmi1Q5yaKPwgqtcs21TN4IjlDxE
	 Iber9yX0jNiz4mTEPVQflZygj5rUObv5gTXk7vGK8HxbrfxSDeHLobq/WU5Iyx0YHCjJw
	 K117dzIL6YXvECue1SUzLNRPxKTTmxsXMn/VJ5c2/47vcsiksbRcu93iXK+/AWS2S4NWf
	 jyX6qspfvYtnmgBGOx9y3vJI6VHciGTnlYmCU0GuLdFqNNGbQzMRHZT5YMM/03rCZjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008519;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=U4eyfkt3Lu8vLnDpwgxDuCu0bIYeJcvXgANV/5D7v/U=;
	b=JrnJ+ur1Q7fQbcUr+XXTUEMH/q+IG5fuvZa5+fHOcDywnao7BfPxvRq2+0ruxgHfCIcW
	 5O7WEyUOyQmUJWPdnLGmXgUzXnLclSMSc0gsyZkiryT6T0/nQlzxTsTcMy+bj8JkKPyiY
	 nQ1+SXqpk3oZr2vbzZBrQHlOvBUprIgvYZzkCGaG8n4eGhq6Kk0DNLUcUSym2OFHe2bUI
	 74wBUz1NZNO47YqNm81mj/uKW+QwdT2lnyHVcJr+POteQxb1Tsua68IOMXx+shNK8fdFR
	 v8FZTEvuEDsAneO3uNTdJoq80I8Rr9yhPrP7bT1IrqogjqIa44GvRGv03NyV57MhcZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZL0FJA7b;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13215606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13215606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZL0FJA7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008519; x=1826544519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0V7JZxQdmIRgg6D4+enOyc0QnR2BdwKKJuHebveIUoI=;
  b=ZL0FJA7bU9ZJ9nlC4MJkJ+rWiIFCDstjlsvF4Tnshu1pR3oULFFP93qG
   uyc9LBKMhIcOUfhRK2Yho+84zia6ZlX4WOhsQWLOEJJv1YoKl4UyQn0xS
   +G+HU+FfQ7zdJtFjKycbLwta+v26ONFVU5fXK2cXmA1FWBA6UykdQI/No
   drsbD07xbsliHJCY77eLJm6aGNCf6co0c0Ga80otU0QiIp4G6QGsG+yRu
   vVFVsiH5Gp5RLi+k/Vct5k0/kTSBq7/Uvt2gHTW9UTQeXkXKzZaAKkR3E
   FX8hlyhhXr9HvIGk1ipG6160+dxNmHwtEiSndhuCmn4kHQX9RSuIHjt50
   Q==;
X-CSE-ConnectionGUID: JoETBP6yTDa4ViTQT2x5jg==
X-CSE-MsgGUID: mSyhkDu+QTG3I8QuDBLC2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702675"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702675"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:38 -0800
X-CSE-ConnectionGUID: 9+acno69SdqEx8mn1J4AXg==
X-CSE-MsgGUID: JLC/QlxNQ+G1yaXwtHVStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678024"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DD04D122B6B;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdJ-2Icd;
	Wed, 18 Nov 2026 15:28:20 +0200
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
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v13 56/73] media: ov2740: Signal common raw sensor model support
Date: Wed, 18 Nov 2026 15:28:02 +0200
Message-ID: <20261118132819.213473-57-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the CONFIG_MODEL control and signal support for the common
raw sensor model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index eaf6183b802d..033db55c012f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -820,7 +820,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 15);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 16);
 	if (ret)
 		return ret;
 
@@ -890,6 +890,9 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
 			  0, V4L2_METADATA_LAYOUT_OV2740,
 			  1, V4L2_METADATA_LAYOUT_OV2740);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
 
 	ret = v4l2_fwnode_device_parse(ov2740->dev, &props);
 	if (ret) {
-- 
2.47.3

