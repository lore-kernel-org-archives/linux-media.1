Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989254746A5
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105526; cv=none; b=R0Ckw5HtKF9knwyGqHerH4v8cX/Pb351GWPj5HGTAR69KBKHXYEoha4GlhGaGNsoHGE5a09EENlNosPkT/FWaSKOhNKqhD9wNIFMNhWbXQCbKIjsb+tTW+Noqpx1QpM2p/m493gMXTSXYXtIC+thxKD5hMmxjfzf9/v6dL31TCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105526; c=relaxed/simple;
	bh=j+dQ/HpulIFKD7Je7/r6fw95S72ONPsoCrihx7FaGpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftTNjeGaqGrh+MKohRhSYo8f9J98U6OlwEbZ/SqGNQ15psmmDXQ6TvszUrNoQsKgGS8mbEPpjs0fgb4zEuAbdBSGzF706fphJXIFakFLHJcRD9G7icIIb3nn125J8gYsixvMOqf/FBbhfnOPr6GVb1sTBCeAoYuxTm+RsAx1LNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJ6wvpKK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJ6wvpKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105514; x=1817641514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j+dQ/HpulIFKD7Je7/r6fw95S72ONPsoCrihx7FaGpc=;
  b=LJ6wvpKKPG3wy/3anUntEiVzikMUcPK8M4X29Cbq7Yz55rhZVqYTtzUK
   ilQr+9tkEy/HhZmvv/XrrXCNI/TlDJiCDlwJhru9XPB5sqLTlMqsijdRb
   Xo/igVK9Gw6UhaH+U0nhUTq7d49TWE1XLZV3ypwFYLzgkcWI8pzUbtojM
   7p1OFzidGSHQ+ViC+KOBoPrUsOeewZHsy3Tb0zs3J1TV55fAXRT6HsUTy
   W/vV+5unyEAKB/or9FvVdHhK9d77/2EeqNfiqk8vg3c3d6gi7+AJue9ga
   f1GVzAV47xNkDQcNbNsQJMJc4TOqQjPaiHw5DS82OZjq/wTIKGdlQ8vI0
   A==;
X-CSE-ConnectionGUID: h4qfRLEGTfuRf9isff9XPA==
X-CSE-MsgGUID: ZGDW3on/SJmgQm1dOBv8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90592001"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90592001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: 4m7n5pm7SBWc+G5+82b5NQ==
X-CSE-MsgGUID: rNbyUtgKTpW9wWsmjInf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779678"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A9350121CDC;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bw8-3OzX;
	Fri, 07 Aug 2026 15:24:09 +0300
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
Subject: [PATCH v7 09/14] media: v4l2-subdev: Always call get_fmt() if set_fmt() is unavailable
Date: Fri,  7 Aug 2026 15:24:04 +0300
Message-ID: <20260807122409.45807-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
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

