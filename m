Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBA448D00
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386131; cv=none; b=iGcn7wLOSQo2RL3jhEiI3CGyALgfWmOKYiCZig8Hp8HVn50xbKL5TODRtBcIvGhOuZJ6JMJtIZ6sGQ/Aq//z8lb6/ggWtqyAKFXEzO/KM5ew2oMj0TJim5RIQXE6B5nPYGQaTBm1RfkXtjxA+TcdXCooJg80DZOpgAIe5Ja3bIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386131; c=relaxed/simple;
	bh=7kE2NDWak7SqvnSKrbejO1SifsBvS6klxeOBvaDKiIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvTMDtR7VBFwIogec3CzwJJtZnH+x3PbdJGVjbhy3xlp5AVcxiR/g1RXlIR7BXk3pla1alj5zQv0jrZkLyO2EHEmok9l+y06JEr7S+zBmS99/vXE/m9GqbMl1+YivBlZY7lgBgStkYZLIpCmIrvoW7T9rnZUslp7iVk2CCFixhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5Z+GLS4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5Z+GLS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386130; x=1820922130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kE2NDWak7SqvnSKrbejO1SifsBvS6klxeOBvaDKiIU=;
  b=j5Z+GLS4f7yIJy4v7bT/MqOeXQc3P4MuzvGjB2FXYR67EG8F8f3pMInG
   v82l1CEvmToA3bOhhoiUy+moO8Byx2qj4+F0h7TsEJTnSU2ZwSgV5rwR9
   n1WVwICjdn5uDmA83AHh5K1B5gpnMAtQYu3G1/61A0sB01Aj0n2fL3BjB
   ZPXx7FTGrRH6iOivPd7oQtjwoZeN7Mf3SmfnqEfCunaNbHX4GQ8RwwINU
   EFDxNJuH7JrN6zejojcVpb5kNGQrL189wiPn6qwoGj0eKVhcjiPfQj2Hf
   gpLkpHk9T5nfKnyzHBYUZ9EnVO6NfVi5AC/wTVSLfB1zV0PrZI+gmw4ny
   w==;
X-CSE-ConnectionGUID: yc8gtMHQRxi/0LmUSnuLWg==
X-CSE-MsgGUID: 3352w0gGTNmEUXQRti0ScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100397062"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100397062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:07 -0700
X-CSE-ConnectionGUID: r8sHpketQDSc7FdnpAu7Xg==
X-CSE-MsgGUID: YN+Y/7OWRkOW+HpzW7pb2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="274538817"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6C24121BBF;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PY3-13Zo;
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
Subject: [PATCH v8 10/13] media: v4l2-subdev: Don't assign set_fmt where it's equivalent to get_fmt
Date: Mon, 14 Sep 2026 14:41:41 +0300
Message-ID: <20260914114145.574791-11-sakari.ailus@linux.intel.com>
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

Do not assign the set_fmt() pad op where it is the same as get_fmt(). The
get_fmt() pad op is called by the framework now in absence of set_fmt()
op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ak881x.c                | 1 -
 drivers/media/i2c/gc0310.c                | 1 -
 drivers/media/i2c/imx678.c                | 1 -
 drivers/media/i2c/ml86v7667.c             | 1 -
 drivers/media/i2c/rdacm20.c               | 1 -
 drivers/media/i2c/rdacm21.c               | 1 -
 drivers/media/i2c/tvp5150.c               | 1 -
 drivers/staging/media/max96712/max96712.c | 1 -
 8 files changed, 8 deletions(-)

diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index cea46f01997d..4cedfc2d4136 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -216,7 +216,6 @@ static const struct v4l2_subdev_video_ops ak881x_subdev_video_ops = {
 static const struct v4l2_subdev_pad_ops ak881x_subdev_pad_ops = {
 	.enum_mbus_code = ak881x_enum_mbus_code,
 	.get_selection	= ak881x_get_selection,
-	.set_fmt	= ak881x_fill_fmt,
 	.get_fmt	= ak881x_fill_fmt,
 };
 
diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 754e82ad50ae..f2c381602d18 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -537,7 +537,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_mbus_code = gc0310_enum_mbus_code,
 	.enum_frame_size = gc0310_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_get_selection,
 	.enable_streams = gc0310_enable_streams,
diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 0efbf43d2fe6..9aa04c2fcb4e 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -1130,7 +1130,6 @@ static const struct v4l2_subdev_video_ops imx678_video_ops = {
 static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
 	.enum_mbus_code = imx678_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
 	.get_selection = imx678_get_selection,
 	.enum_frame_size = imx678_enum_frame_size,
 	.enable_streams = imx678_enable_streams,
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index 48b7d589df31..eda41a80d20c 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -298,7 +298,6 @@ static const struct v4l2_subdev_video_ops ml86v7667_subdev_video_ops = {
 static const struct v4l2_subdev_pad_ops ml86v7667_subdev_pad_ops = {
 	.enum_mbus_code = ml86v7667_enum_mbus_code,
 	.get_fmt = ml86v7667_fill_fmt,
-	.set_fmt = ml86v7667_fill_fmt,
 	.get_mbus_config = ml86v7667_get_mbus_config,
 };
 
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 52e8e2620b4d..0179508626b5 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -442,7 +442,6 @@ static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
 static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
 	.enum_mbus_code = rdacm20_enum_mbus_code,
 	.get_fmt	= rdacm20_get_fmt,
-	.set_fmt	= rdacm20_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index ece8a410e7ce..68d2b9d83c3c 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -322,7 +322,6 @@ static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
 static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
 	.enum_mbus_code = rdacm21_enum_mbus_code,
 	.get_fmt	= rdacm21_get_fmt,
-	.set_fmt	= rdacm21_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 9c204f38935d..5b92424a0148 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1724,7 +1724,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
 static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
 	.enum_mbus_code = tvp5150_enum_mbus_code,
 	.enum_frame_size = tvp5150_enum_frame_size,
-	.set_fmt = tvp5150_fill_fmt,
 	.get_fmt = tvp5150_fill_fmt,
 	.get_selection = tvp5150_get_selection,
 	.set_selection = tvp5150_set_selection,
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e04895..94ae304ac85f 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -264,7 +264,6 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
-- 
2.47.3

