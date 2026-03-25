Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AF3C6616
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436326; cv=none; b=KR2PYfCz4FcQajnOpdvxmhjPUAowHMNJVsR5CoaG+YJvC2+Yd0x9MASzUs32vrN8dh/CJzjGKxB4DXu6L1H9ZzbHoI26AEDtKusec3COHEZvKUMHO2odghKw4ysEx1/Tr/XodBt1SLnHSFKgZ8lv87/9nle4yyFOZLT2tj4188g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436326; c=relaxed/simple;
	bh=8+741WyPF7M6ISstnCoDke+c6jFXT2o32LPP66ZtgtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhZ/Tvlp/P3uoZojoQa7u9/O+AY5Sr9ie/IRYlocohT3wIiKuuEx/q4jqMMxHFISpP6XLoAzWqyS/RuGR/LNtGls/VhRj64SUWqz9R12IiLJ24AGQtQ3Nu/D/R7PLU3r+Ilhfy3lR69fLY9n3Al+gYPX8HnclHA/OeemotrOHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ag7AGJzX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ag7AGJzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436325; x=1805972325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8+741WyPF7M6ISstnCoDke+c6jFXT2o32LPP66ZtgtQ=;
  b=Ag7AGJzX1EB+IXdB/sKCsd4IkzkZW0SCvYDkwdFlfg8IET1LnOf2S6qu
   kK9zQOGSOlguYQ07Nx2T8Csil3X+VQnPem4voA/59o9D37i+hPZNC/r54
   hng+WlgoYpcXorarEilVdUZb/yd7XoNXuiAm0j2jrHmi3+968XU1N9LbW
   QayH5zHJHp1ydfrQn6k42RrCnBABjt4lheOieqJdKqTy2Ue6Bpnz7UZjZ
   eFMg8A0qPVZPPS4edMNYB4tAJGv3cOS9VmJJIDpDg2q9cNrnHkAo8zZ9k
   WD8//sBS9odu+CiIEuZdpimfZxGdL4+aBDScYHGrTMDdQJsG/DtpseXSO
   g==;
X-CSE-ConnectionGUID: 8TfSv0Q8Tj2LirPk2bAPaQ==
X-CSE-MsgGUID: 2nY7CiyqSNGGhG956JL3Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496353"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:42 -0700
X-CSE-ConnectionGUID: vuB33pzASMuUYVmEhsT1Cg==
X-CSE-MsgGUID: wTVzmPAHQ+eCl+jGPHWKNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763483"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A8281220F7;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAV-0Dyb;
	Wed, 25 Mar 2026 12:58:19 +0200
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 11/22] media: v4l2-subdev: Allow accessing routes with STREAMS client capability
Date: Wed, 25 Mar 2026 12:58:07 +0200
Message-ID: <20260325105818.1176816-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable access to routes when the STREAMS client capability bit isn't set.
Routes aren't relevant otherwise anyway.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f8fde395a53a..647587c0499a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1020,6 +1020,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
+		if (!client_supports_streams)
+			return -EINVAL;
+
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
 		copy_routes_state_to_routing(routing, state);
@@ -1041,6 +1044,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
+		if (!client_supports_streams)
+			return -EINVAL;
+
 		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
-- 
2.47.3

