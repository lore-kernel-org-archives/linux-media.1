Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008529;
	b=Esqy58s5OlS57DggQET8QTGpwKZfwUYpbHHUc5etDiDn6fXSTqQzi4KRdNXc8iW4SkjP
	 YGK12VC/zZ7N+MCsgSDJdKT/QiZFfmUydH9SEt0a8NkEBMQhSmGNPnG5R04bp85iJLsQZ
	 e9u1uMQEcvQdNMUUuvxsuFp4aFD++KXF+w9T/OiaFFTVHKZo8ZbjiDxGUpPEabkxRt04Z
	 TwHQVRt8CrAfnYj1GnarUW1QF/3bFnZYbq+BXj3M7BKqEmxygYmNAAxTrEi46TPSJnpuc
	 seGYL0VvZUSFptXu5QiJAA2zRIBDdRhxEYRvk1P6Cyuak6te002rbynKxlx5N4UYhPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=j5Qn51PY1D9YeSiCBu26R/vAa5MfEv1/xI2O8kxcaMA=;
	b=ehj3e8GRQMiw98XVToXx8GOdjWVl62ae5Yj3wQwrnWTMzt5WbVJrn5P5Hw7MhK12eEhd
	 cju9LUJEcqeo62vHY+nfr2iE8ZdngBz0zN9mvwy3nAt+HfQYh99nXxGIrifKAAK0yXYM6
	 iJrIz3wH39Bu0K6uoS6RY7h3AlZ0pcnCZBy6UM4mAsMaM3Yr9Zn2vOh/mXNvnUtlXM0L9
	 ffRPKHsx/aBz4G+jgOXDGYx3w6kOb8pROY0tKYH6R3VZ0hKLHM5YdW/3K7e53Bayi2p2x
	 P085iTIf+7tqca25DYlek3bBy6N+OGt50xAHPK+qSVNXv1S0zqvZPQjss5ThU+h15pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Q0hTls/1";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF8606A32F
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91EF8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q0hTls/1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008529; x=1826544529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NrTy8DjM/JFnMAEx/1iun9VV07i+reAUrvjcWWZJVoY=;
  b=Q0hTls/1j9nZ9F140BaxnZ+uPtjmlxlMo43OYvtHhHWYAtozvWKRpwxg
   4mQ5gKpEGdsZRYpeADPJvYnQk/dXl96JYqKwwU3r9t9LKWonziDawc0rV
   edeYEjQS5/2YXr8ZBpKu/aoFwm7eTE1catmi0ubZ3CQ7CHK1+AN4g0ZY+
   iFsMf/FB/b/UutnQCyXd2bdbiTNENQhaZPKuzk+JOGJGyfzKlXtSCYZBG
   Wl+78wBq9Lvn9GRVP3iXYAccqdUu54gt9m42TySTtb6DdSQRDU3Hgn3Ob
   QyOxfr7eJlhRE4iP53VIwp0TOBLtR7Ed2dnakeZqdab1IZ6gEmW0b7Dc1
   Q==;
X-CSE-ConnectionGUID: FXmsvB6ST3OJsAGWNphmeg==
X-CSE-MsgGUID: GnxmmcjnRpqPwmjt2eBwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738761"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738761"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: sbPBX58RTOSV36WW8a8phg==
X-CSE-MsgGUID: cAAocbLARauuYjymF+P9Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076052"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 15270122CCE;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teH-34Cb;
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
Subject: [PATCH v13 68/73] media: bcm2835-unicam: Support generic raw formats
Date: Wed, 18 Nov 2026 15:28:14 +0200
Message-ID: <20261118132819.213473-69-sakari.ailus@linux.intel.com>
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

Add support for 8-bit unpacked and 10-, 12- and 14-bit packed generic raw
formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index e7c708cdd7f8..6b31df2adbc2 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -452,6 +452,33 @@ static const struct unicam_format_info unicam_image_formats[] = {
 		.csi_dt		= MIPI_CSI2_DT_RAW14,
 		.unpack		= UNICAM_PUM_UNPACK14,
 	}, {
+	/* Generic raw formats */
+		.fourcc		= V4L2_PIX_FMT_RAW_8,
+		.code		= MEDIA_BUS_FMT_RAW_8,
+		.depth		= 8,
+		.csi_dt		= MIPI_CSI2_DT_RAW8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RAW_CSI2_10,
+		.unpacked_fourcc = V4L2_PIX_FMT_RAW_10,
+		.code		= MEDIA_BUS_FMT_RAW_10,
+		.depth		= 10,
+		.csi_dt		= MIPI_CSI2_DT_RAW10,
+		.unpack		= UNICAM_PUM_UNPACK10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RAW_CSI2_12,
+		.unpacked_fourcc = V4L2_PIX_FMT_RAW_12,
+		.code		= MEDIA_BUS_FMT_RAW_12,
+		.depth		= 12,
+		.csi_dt		= MIPI_CSI2_DT_RAW12,
+		.unpack		= UNICAM_PUM_UNPACK12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RAW_CSI2_14,
+		.unpacked_fourcc = V4L2_PIX_FMT_RAW_14,
+		.code		= MEDIA_BUS_FMT_RAW_14,
+		.depth		= 14,
+		.csi_dt		= MIPI_CSI2_DT_RAW14,
+		.unpack		= UNICAM_PUM_UNPACK14,
+	}, {
 	/* 16 bit Bayer formats could be supported. */
 
 	/* Greyscale formats */
-- 
2.47.3

