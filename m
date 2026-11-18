Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008513;
	b=eiAsuJPwSJ/zc2J7xiHoKu4OtNzYUogudchv1fkWwQnsqJ+UFyOZEahrBgxZecQGU1eu
	 MmEaE6Tp7xuXeDGm13mVitQoc82K2plllgxSRuGy6IXhr9P3slLoFKAHvqj8Q3r4i1XkK
	 mcKWLeXSCO953Me9VQmx3jKapRGVCoGYVO05R7HAFd4egKH/EmRRbLy4oWSvzxQrkuirl
	 4YNEXyigvVa+3gb9nPm6xm1yiOY1RWS7UYSRQEWvsybbllMC4yplK6XHiDeu6XComnjGz
	 8DLhScHxWJ25RtEhKqBrGfraStZiD/acKuldqIPGtkkFd0PG2QDnSudZUc1HA8dl98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008513;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=yXSBRIt+cz6dz41qP1luhcHnnuBh5JCMO75FPDuVAvA=;
	b=5GShIB5jNe7nxb9UTZ69tbIdItjiNXkXnchu/feHkK+3wG43UBB+e6ogQjd2kK3o9h2V
	 2aIN+ag+aSk5dqHaqMQUq/Bfaave89Opl7PDB0MajXZHcYpnIl8y2BfXa8o+uq6WBbp+M
	 wo4DKMA9CxSHZEq4iNvhLDa8Yh9PrJ+USkloBrmHZCgK1TAUFVTRjDTkWEKY7pjS45Ybm
	 oaGgtiNvhiqT6FSwalQSWLQhKJHmlAM8WaLyf8ollmlnFo1siQ0DItQRRPEAluqXqTR+V
	 iG0bLcitA1MmM7FD8mA6CNIX9gxHfcI/wNPi99U1O/AVNAkVAmW2cG+LZoIqnFGCLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKV0ZPv2;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD0606A331
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CD0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKV0ZPv2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008514; x=1826544514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bhdwjVt7bNh0ZhpvTsl40qr03/pIiMztGgWakwn0kc8=;
  b=cKV0ZPv2eDhP/po748EvkHcfeBPTon6D/0vjguCl7tfJD3BWcxkS+WSY
   2Gh9RLhxkDYQorQ8Nz9nteQ2TmW41jeT/rceLez2uvSMAIF5rhfOLwp8b
   1YeYgpyVxA4DIdpmrECbP9Q9UgFDRu0ahMaOVBHL2v+XVBqQDFJWFAn74
   Pv1073Vxq4Mfxz/aOJLDlb+lLCBIJ7sBQhRfaOOzNgOJtJpvFf4/8t7Mh
   PkrXMeiFe3fp0CcND1/zQjQS8LfEg+bIQPogiWlH6vx20SpufAnSTvgIw
   ozttJsva4ey6JXu+YkTDHKOnRI9onTzmQrYFeUrCf4ZbD7OkEQptkx4Vs
   A==;
X-CSE-ConnectionGUID: Lr/1dk42QRe4JHaNqALEeA==
X-CSE-MsgGUID: JvNWyPHzQaersmsrCUB7Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702629"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
X-CSE-ConnectionGUID: OYqDhixtSuiuzsvEAGnVmg==
X-CSE-MsgGUID: NRKCHTTqQT2D59Bik8zkqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678006"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:23 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D1AC0121D4C;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000td3-26wb;
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
Subject: [PATCH v13 53/73] media: ov2740: Add metadata layout control
Date: Wed, 18 Nov 2026 15:27:59 +0200
Message-ID: <20261118132819.213473-54-sakari.ailus@linux.intel.com>
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

Add the V4L2_CID_METADATA_LAYOUT control to the sub-device's control
handler, to convey the metadata layout for the sensor-generated embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fe7a8d72ac8b..71b5a2fbf686 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -804,7 +804,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -859,6 +859,9 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 			  V4L2_CID_CFA_PATTERN_FLIP,
 			  0, V4L2_CFA_PATTERN_FLIP_BOTH,
 			  0, V4L2_CFA_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_OV2740,
+			  1, V4L2_METADATA_LAYOUT_OV2740);
 
 	ret = v4l2_fwnode_device_parse(ov2740->dev, &props);
 	if (ret) {
-- 
2.47.3

