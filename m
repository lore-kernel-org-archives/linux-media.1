Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50104446F7
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386130; cv=none; b=MXLGYA1rGK5xsGnCPGR30fyvpjFhELzqllbPNV45qDkw/TxczUPwejAT3bFhqYFde3J+cSTwn2JsO0e/jKN5Tje9HhIMq9oACa73QCZ7d7thVzKAHjhIlWyN0j0pnDdh1LuAhCW5SzOdpI00UiM2jdAMjghOk1o4LKg877p/PLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386130; c=relaxed/simple;
	bh=vavXAcbvQmjLduNX5kIw4qVXAV4lQyycy7zDt2jwynI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=my7YNbYALWkorpiXmlhXwjPv+ejLx1kfFV5f3HobxmY0z2OlQPLXMl9r/NXDqjvzY8H0zvZnO4du9x1eY8yxFZDmh0qBoZi3Ni3daZwuYZHV/E7Ne8kyr5YXIdDmA7PNeJwFwXpCT1YvpfOJlPzormmPdkeiVtAfDnvHUNQTA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLT5jjTD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLT5jjTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386129; x=1820922129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vavXAcbvQmjLduNX5kIw4qVXAV4lQyycy7zDt2jwynI=;
  b=PLT5jjTDcSdKmhhW3hFIYXQLfxh6BOp2nMEAlhb+rSGbMZ02R4t0PtiF
   PXBVjeQw8iWsmxK15ukmhD84A/l6fA/PY7zfGj6060ny7lQs3b2B+TT75
   y09lCbVifZYpt7V5+/8RUcRAab5Ul17HEN7oNThnazTlDI0G8zDedneV5
   rlO+hrJlIwiUNeQfFIFhQY68LiMqpY50Z3+ytaMzP+BWUBwaVlqLtX8ln
   Fc8FOnZ3hwKvPvSQ697JoUtLRVUEYMH2/HVUp7MRjRiwgg1tzFDN3ELKj
   NlMjcxbHX6uAceGxz1S6YMiczE5D1ufXIw1Ecywlh/+vXeTIBIf/6ul0+
   A==;
X-CSE-ConnectionGUID: JjN5f+15THivqyLJIH0xdQ==
X-CSE-MsgGUID: ACA02Xi8SOeeVDxi5+Gs+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100397045"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100397045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:07 -0700
X-CSE-ConnectionGUID: HEVk9U61TdeABbMJEZTySA==
X-CSE-MsgGUID: 37/exHSiS9yTn1xLzBSB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="274538815"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CB094121BC1;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PY7-180O;
	Mon, 14 Sep 2026 14:41:45 +0300
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
Subject: [PATCH v8 11/13] media: mt9m001: Pass sub-device state to set_selection() callback
Date: Mon, 14 Sep 2026 14:41:42 +0300
Message-ID: <20260914114145.574791-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
References: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the set_selection() pad operation is called from mt9m001_s_fmt(),
it receives a NULL pointer for the state argument. As the function does
not use the state this does not cause any issue in practice, but it
could cause NULL pointer dereferences if the mt9m001_set_selection()
implementation is modified. Avoid future issues by passing the subdev
state.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m001.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 0ade967b357b..d8fffed0818a 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -343,6 +343,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_s_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state,
 			 const struct mt9m001_datafmt *fmt,
 			 struct v4l2_mbus_framefmt *mf)
 {
@@ -359,7 +360,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 	int ret;
 
 	/* No support for scaling so far, just crop. TODO: use skipping */
-	ret = mt9m001_set_selection(sd, NULL, &sel);
+	ret = mt9m001_set_selection(sd, state, &sel);
 	if (!ret) {
 		mf->width	= mt9m001->rect.width;
 		mf->height	= mt9m001->rect.height;
@@ -404,7 +405,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return mt9m001_s_fmt(sd, fmt, mf);
+		return mt9m001_s_fmt(sd, sd_state, fmt, mf);
 	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
 	return 0;
 }
-- 
2.47.3

