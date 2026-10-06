Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3793D8104
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279165; cv=none; b=jDOEbJj5nWy4z7V7e+PMaLEG6NGm6upUJVtoCDBP0LDwjlrkKyfugBzNI1CiMNKZb8PWASb3QadYZCKnV3ktyyh1jjnd9W7v/QWnhANn20bD2XPJkHjIQEs03D507so4djfYiP/hZx+25P16Yf6dSS+cpLCiaWeE/U5eYPBq+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279165; c=relaxed/simple;
	bh=iMvCrFBO6pZLOCFrLv788IJWzn+KiPXdAU77c1mtMjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQnlBuRRXqjV8Q9utCZBQ7pJtNEbB8NWBdBGb+0R8apv5pN/1BGVhY0+LJiuEijTSXqzb2C8xoMK4PKSi2g+ScJHXT9IHhSci5XW/2i/PIiPzlr+3772s+p2m0X/7rbwg3dR5Oov9NHc+MCrlxrJ4Le2KqCiOyU0XkxLySpn1bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=io6RgRlL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="io6RgRlL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791279163; x=1822815163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iMvCrFBO6pZLOCFrLv788IJWzn+KiPXdAU77c1mtMjc=;
  b=io6RgRlLx/RPPn/CbE0Hpzc1FHE+SPgfWtAbhMHIbefYiST+0Z65g7Ny
   L8ekgpaA0F+VF1huJWQ4vEG2+C/LZU+L4RKTOP6ptMy5ZjYgoIIHNk9oL
   BksaFDTAtO9tYhRg1Pp8CE9LBD8sqmKg9t85GYk8knqd/sIEqU89ROsrq
   85EGXv8JdLrKny9LxeDmXK96YMHo66M8UhjzwWIjUbJ+An4i+KLrxo94M
   d5odq69TTjXVP1/hN2IIDt1pDott3CBDJbONjU9jvx5V0tT2ot+fPZKkv
   bUs+0ttnUYlUqZDYwObHjVr0Im9mPL1G6kCv7+oEuiBpCEeARjUcY2HiN
   A==;
X-CSE-ConnectionGUID: jNQrFKstQi6Nyjx913nMFg==
X-CSE-MsgGUID: dU04j3EnThSQBMuLY7dPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="20356"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="20356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:32:43 -0700
X-CSE-ConnectionGUID: RWsGCPdOQLufbiU+/jDoXQ==
X-CSE-MsgGUID: caJjvMKQR8OmjglGCVlA7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280392589"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.66])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:32:36 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3323411FADC;
	Tue, 06 Oct 2026 12:32:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xE1Uc-00000002tWq-27yE;
	Tue, 06 Oct 2026 12:29:50 +0300
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
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: [PATCH 1/1] media: subdev: Make get_fmt on INTERNAL pads without STREAMS an error
Date: Tue,  6 Oct 2026 12:29:50 +0300
Message-ID: <20261006092950.690101-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal pads should only be accessible to file handles with
V4L2_SUBDEV_CLIENT_CAP_STREAMS flag set. Return an error otherwise.

Fixes: 49cdf56876d3 ("media: mc: Add INTERNAL pad flag")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a07d77e584c3..7cb5a40f0f8c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -854,8 +854,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
-		if (!client_supports_streams)
+		if (!client_supports_streams) {
+			if (format->pad < sd->entity.num_pads &&
+			    sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_INTERNAL)
+				return -EINVAL;
+
 			format->stream = 0;
+		}
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));

-- 
2.47.3

