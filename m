Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008531;
	b=M8JgP37zs52uEWbHYLv9bTVMumID2lOCvvrB3+LsuH6rf9+cseawFpQE+E30G2UNcHti
	 At9tm4SOodXB4q4Qe3blc2ijK82O0ur8qTAxWdUJK4YhLHs2/h0FRPQ/TZ9T3+3//x1aR
	 u0Y5MiC+uJ7Pf12IrZOPK3737SX0e5TZ7w2zGHwnyV4BWA5hwMPGrXrAFosgMj5YgWtNB
	 VzVLttbAS0aEs7kH4satHE5bQJ0yGRc76vpjwPwdp6M5n2o91s9mkcQy/ZjNbBH7z1q7r
	 Aj3c/IpnKa3SKsQwMNyPba+9SBBXBQAwDKNtuLU1k1TmqzH5h8WfJVfgqlVGXLDH/RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=We2EsoMw6tGK7TUw5u5m8UKt59AUKg8FzI2Jb7dL+vI=;
	b=i2zaIYasSGm79X1YfSyQf2bzqW9NlasIG3FYELcu3TMGA75PJ3yd/GhklpBGJac9cbxk
	 4nK6woLliA0KqVXcCf8Q/XaDmiDlQplRygwXzKRYorOR7j/foHFLuC4tWiTgYBRkK79Ux
	 ABAz0uUhdU1qhmZAN/H18SnzwG/DqMAwWXVlnxquZun+DegUkwVGzegSineEQ4villdHn
	 rniO5bfEKDXVR+lvrLC3Wd64fY9e23ZO9arOqdtvavwqOfj+SqWErSuxbonCQwE28ANQD
	 n3ZmPTCqEqicDVxcXavkYl6aUm9pQJVBb//DGzzFCz9iJGGwlZM/mZQLyvRFB9Ew4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NtSIg2C5;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB17606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB17606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NtSIg2C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008530; x=1826544530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zdfkXULCb4bf7J1grwEdwZMtccxuwXZ46iZLZ7Zf8lk=;
  b=NtSIg2C5u37Iv/64FWBrPBCFOhyQ6QAXfSnmbpOVFop+ej0mCF0wzehs
   23ZbuxH8z81ek2d4nW++JYM1b9WSPlsaiCxiVKq98Z9O6Unal/Dm6MN9J
   GKpmFo5UnJ0E+UN+a0x4mzhQO+IeIOC0SvGf1S4Ssypj2mjXXH16MXSQF
   UhpmV5hPHOQGF39PtOsSG8N+x/EH1Op82HVQxgiFYdfRwST9Pfd6/JpZx
   MmbbJWogN5+CLWBBAU0Y7dJgxS1G0+yTDLL6kGh1HmLqq6POUkAtUxg5o
   hjDJiUFTne9bhLE7Nlbh7572MjG31yPfnnui9cTMhcpIJwZcETV51lMeP
   Q==;
X-CSE-ConnectionGUID: xHFyHGv6SfyLPyAWearWOQ==
X-CSE-MsgGUID: QIIQEDIGSvekbxN6vQtjgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738839"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738839"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: vUylkv+TQNOV9FOJkXKrsg==
X-CSE-MsgGUID: ot9dkZ0lQ2y3DLag10gXLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076061"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DA651201B5;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tZh-2jy4;
	Wed, 18 Nov 2026 15:28:19 +0200
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
Subject: [PATCH v13 01/73] media: uapi: Bump the STREAMS bit a little
Date: Wed, 18 Nov 2026 15:27:07 +0200
Message-ID: <20261118132819.213473-2-sakari.ailus@linux.intel.com>
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

Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, in order to avoid
confusing libcamera with streams that has moved forward from the original
libcamera implementation. The bit can presumably be taken into use but
only after the other free bits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/uapi/linux/v4l2-subdev.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 2347e266cf75..6160c3e21436 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
 /* The v4l2 sub-device video device node is registered in read-only mode. */
 #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
 
+/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
+/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
+
 /* The v4l2 sub-device supports routing and multiplexed streams. */
-#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
+#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
 
 /*
  * Is the route active? An active route will start when streaming is enabled
-- 
2.47.3

