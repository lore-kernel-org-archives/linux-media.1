Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008546;
	b=g4jswXn3PgEalsepY2k/ILhre0IZ4KPjLvqqcfxtats50Tfw1PcxWg+pCLlij4NV4QBb
	 TMd3p0QsTezD/5gVXu2K7btUONKUboE+ZLOQZP+9oWEjl0vgG+/8/+a28MbZ2OvixXx5G
	 dV7Rr4nUw9kfg+J1J5EuKicG62b4d9nJAZ1OO6Hpno5ZozOmaCHTD/BwJ6glnrJR2VpnJ
	 tnKpo4xmen0h/KLAE9InLZ4RKiWWWLW6eH/R1JBd7PC3GwcwqtCk1xR4HNWbuiBNZFIZD
	 XrhzHJmD8rCB8rPVrppr3NiDFAXHPNvO9I3gHMaM7ZyfOPC2wY0SiSlfzAQwxiu3MQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008546;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=TJIjIDksNp4KtsxsfKyLOhuntxEh7PbATaZajLZAysg=;
	b=KeYzSsaPO5Pdzq6OLMYh41ztuQWbuHTgxJmi0xEhJxwLtQ46hC9Sgx66hug3GkMxGStV
	 tsyFpXd9SCED29sM3+B/PdAKnJ0YHM3rUsnxWL5TQN93nwGb3iHYpI4Tr5Q7R4OZQtAmt
	 kJHMm8eRbsEBYmHC3PZ//NcS0qIadbeIB6WUQ4m571I9dV3E1zy4XBmdrtYhe2pqRC+sC
	 gr3OE3HotUTiBYde2AkMTkh5ZvHeA3x9yxUlcI9pIbzrWfphvv4iLHFAcetjlS+YVWgxV
	 tmL7unVOvd4a3s9lt7mN3TOOALWh3VXdlYCY/7ZJNwJTijJDjouNUk3vTX6BylMrJvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPqTDSbn;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD9606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CD9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPqTDSbn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008546; x=1826544546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e7Z8oMBgwsHsD13KnvQc+07P7I9lin3R0HBOuwssQQ4=;
  b=fPqTDSbnnzRr7uHt9u0lTWB/c+TgDoUgZ2ods8cKKL9z/6STvweQLxXK
   8z1Fi+qjd/qH9PYBBHuNBy8QJpw2uj3MYm5hbJuqPag0f5CFpqxVvorfO
   T3C6j7Tc0qUJZpVHTdOfoR+XiE+7zbCoiXgjtuLrkUiGLYNK6md13X0ed
   ZwpJAw4mRQrU1KLR3ymU8uzXPemHEPbI6QT3VLy4PU5shVz2OeQJuKsal
   CbcO5V6qe3NvRUrhXjlqCd8t7NK0Sm0R12hNhL1k4yLxKGfR3/y/2ufA6
   DtoCvQ8q8JSSx0+8STy3FSCaBL+osdT6L8gvSw68YF3rCVfH3bYo3e98j
   w==;
X-CSE-ConnectionGUID: DxrLpLkJQT+jduvrX3V+qQ==
X-CSE-MsgGUID: a8dCHFM5R1mh4ZioatLJEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808871"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808871"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:04 -0800
X-CSE-ConnectionGUID: 2X5Wno78TDC1jhsKUQh7iA==
X-CSE-MsgGUID: TL/GQKbhSSuDqjCg03TgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376774"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 91385123006;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbp-0qKh;
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
Subject: [PATCH v13 34/73] media: v4l2-subdev: Set STATIC route flag if IMMUTABLE route flag is set
Date: Wed, 18 Nov 2026 15:27:40 +0200
Message-ID: <20261118132819.213473-35-sakari.ailus@linux.intel.com>
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

As the IMMUTABLE sub-device route flag implies the STATIC flag, do set the
STATIC flag for all IMMUTABLE routes returned to the user space.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a4dfae1d7850..b0eaa59104dc 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -725,7 +725,11 @@ static void v4l2_subdev_copy_routes(struct v4l2_subdev_routing *routing,
 		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
 	u32 copy_routes = min(routing->len_routes, state->routing.num_routes);
 
-	memcpy(routes, state->routing.routes, sizeof(*routes) * copy_routes);
+	for (u32 i = 0; i < copy_routes; i++) {
+		routes[i] = state->routing.routes[i];
+		if (routes[i].flags & V4L2_SUBDEV_ROUTE_FL_IMMUTABLE)
+			routes[i].flags |= V4L2_SUBDEV_ROUTE_FL_STATIC;
+	}
 
 	routing->num_routes = state->routing.num_routes;
 }
-- 
2.47.3

