Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71DF444705
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386129; cv=none; b=ugffLoDMmppWTgaPF3gRk+5Ls++/kI5X1J335fQptCzYFPjx167gY3PcEwk3EPyLWTTWczt7qoQZ8dQ/95t47Mt+Zc9WvZsPrS/Pg9+H8lJw3+sf7+2yUz9rJSCwkMYGFXwibq26iu9uMbzG55Cmr1chp2D/x60hfE9vw8wcf2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386129; c=relaxed/simple;
	bh=HNllAwcnKsnMoguhOBdvPnymUj8B9LGxWkQjfbwmgmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EosFRrFNzBpuPJDEMP6RBkN67mq5mhUJuc0/qH4/g1/al5VGe/YIrQExYZYi5KsMUNnokbM/kgXSRzHtQtHqo5KYysSiPLdbZBcypZu5aP60ZLJNdP+93CWDccIER5Ex8PKeFCeahKsd9ofL+iAH6jjNLBEkE4MTBZqMOWc6AKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b544nzk4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b544nzk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386128; x=1820922128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNllAwcnKsnMoguhOBdvPnymUj8B9LGxWkQjfbwmgmA=;
  b=b544nzk4+heEdM3kIIctlqrJ+hwgR2rW1MOCfbmXUNXXsnTedRqCy54V
   nfxzeK0Jrhux1Pb5MGgKfmvUUh7thzCzJ1XZpvYzrBnKUS29+rC18Xsl1
   qhHWTM2O+q7zj46ItbV9zlqadekqE9fihpoFgnYwGszqVadqDBLu7vsue
   zrbYMosfM87/7fEHgcQq6u+7M2kNJVllzi80PnevFFRevuuVIPBTXz6nM
   jtGDw/5zEQtVv29Qln+EQzTv418P9WAwyEzJxT92qom8IQDYp4uQ+nuAK
   R73LBAv3lHsgCwPg7jA9ESr6GJZg3yKSbNEQh242teDSOn51n6BiR5ted
   Q==;
X-CSE-ConnectionGUID: Wy+/U1oXQSGU4ztLuXdMPQ==
X-CSE-MsgGUID: qUnWQDdHS46XZEaSkI5I+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100397031"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100397031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:07 -0700
X-CSE-ConnectionGUID: W9EJEiW5Si+Fjcja7fdAGQ==
X-CSE-MsgGUID: hE2oWc2uRMGq7Vbp3RE5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="274538814"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:42:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C3E22121BBE;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PXz-0z8e;
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
Subject: [PATCH v8 09/13] media: v4l2-subdev: Always call get_fmt() if set_fmt() is unavailable
Date: Mon, 14 Sep 2026 14:41:40 +0300
Message-ID: <20260914114145.574791-10-sakari.ailus@linux.intel.com>
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

Many drivers implement set_fmt() pad op that simply returns the format
just as get_fmt() would do, usually because the driver only supports a
single one. As a driver should always implement set_fmt() either on its
own or via get_fmt(), call get_fmt() in case set_fmt() isn't implemented
by the driver. This allows removing a fair amount of boilerplate code as
well as ensures that set_fmt() works whenever get_fmt() does.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f53bac995822..58e50d9442e7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -260,8 +260,19 @@ static int call_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
-			      state, format);
+	int ret;
+
+	if (!sd->ops->pad->set_fmt && !sd->ops->pad->get_fmt)
+		return -ENOIOCTLCMD;
+
+	ret = check_format(sd, state, format);
+	if (ret)
+		return ret;
+
+	if (sd->ops->pad->set_fmt)
+		return sd->ops->pad->set_fmt(sd, state, format);
+
+	return sd->ops->pad->get_fmt(sd, state, format);
 }
 
 static int check_which_pad_state(struct v4l2_subdev *sd,
-- 
2.47.3

