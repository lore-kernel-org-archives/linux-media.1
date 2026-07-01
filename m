Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69858481FC6
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908605; cv=none; b=UW7kMDhwu35CnRSJsVK4VYFTzy8Mw9rWuErLMTdqS8fc1hWwdiB1MfxTxM0Xf0THehxPxZxDN1QoFRt8j3Y34990Xt4SMqIIZVq3/AnwTEsykr3+eunVz14g083KdSTlc5DJhnZWbmyw+zFlaf7IsIF1h3OJUjXhkEctCemiDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908605; c=relaxed/simple;
	bh=fzwFDLeXW4HeYfOs/Li6+l70HDgMuwwuEAWigh4JnFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sdat3GK8icINL8KOXHelrg3s5WXrGSVfDCfU5FkprT+EnGNdDM9Wv65a/P8tMrIuXRJpIE/lQgiOPOcVAnJcpUJmfF5srCAK4z1e9xuqOQDqO7q21QwyAahbtKSTJ/jCK0TViC6LbtC3M8Nz5AlsVwvw0x/RbMZJ68gGEaEZjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/ntTnQ8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/ntTnQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908604; x=1814444604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzwFDLeXW4HeYfOs/Li6+l70HDgMuwwuEAWigh4JnFA=;
  b=P/ntTnQ8v/aJ9HmmNXc0d2dx7MdW9bdjJYN8libjukIJ3vdinqyKxAJf
   jAqdTq29TbfXHQjKwZw0NiulGkPbnUr2OJ+juabVku7+qTyaosFo+FG23
   1he//PXDGs3mwCYVXl/Dl1ovGjK+VRsKmB0MYiHAnQOrjzw7Zue4KRjrv
   gP2InEds/F4aDjBu0ofA6NHzd02zZXHgrbO53TMVfa+xzNmqrfF2pPOW2
   Yx3auApoawMhAJym41g8L3k+sOSNg30YicpyNnMSwr4kw5KUS/i+Av2AA
   XZfzCRAx8HQrjq6K2Wn+zJbx2C/P46CWV8jMKWrqZroPTedHDa4ffE/1N
   w==;
X-CSE-ConnectionGUID: kh+piPHTS2yc0pFYvQseXQ==
X-CSE-MsgGUID: Q0PA7aHDRmm4YksS/Qtzbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239159"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:21 -0700
X-CSE-ConnectionGUID: W41Cnc5NQkaUtevx+jhToQ==
X-CSE-MsgGUID: WhsFEeU9QnKDWXk/Up6lOQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EF5E3121C68;
	Wed, 01 Jul 2026 15:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007Fl5-32bz;
	Wed, 01 Jul 2026 15:26:34 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v6 12/16] media: gc0310: Don't assign set_fmt()
Date: Wed,  1 Jul 2026 15:26:29 +0300
Message-ID: <20260701122634.1728782-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not assign set_fmt() as it is the same as get_fmt(), which will be
called by the framework now in absence of set_fmt() op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/gc0310.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 7af4d66f42a0..19458eebfde2 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -534,7 +534,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_mbus_code = gc0310_enum_mbus_code,
 	.enum_frame_size = gc0310_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_get_selection,
 	.enable_streams = gc0310_enable_streams,
-- 
2.47.3

