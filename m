Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008540;
	b=4cvDLYh1FmNXsriPAO0KkVO3G1dQ9Fs6bstVP4L5NAvehayoEIogdtUDCrfNqkQ9ehae
	 AijGw+kwDTgfT2a0h1opaSm4MGivr8qlcJQJUm61YnWpMy7Ez+9DEYRM3/s66sALb5atf
	 ksecQ4SH2Z/nY5lOcetUM7TZn3U+Dn9qJPsbGnAafPyeBO6ToOVk7TYAW1z2EDFL8xjOr
	 7/Oh05M8Agm8/MAt/LnnFDilBSoSJoF2TA2L8MS8o5OMVpogYVtaK+zMS1m5Ky5aMU6L8
	 xALkm1kdlbYeFDb9tnuGkSfqbJl5KQsiUAtUdNDcUQ0PbQDJqhPDlf2ZwD/Qe7BmYWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008540;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=gI2pKve7MTovv66kXdlCjmQI+UVPLTbu5+29soz3UyA=;
	b=yUFYPqgjvsJl0iplJ0tz/Tkf6IJgSQ24MZvA1uWMI8eVBlNal8FjkFALfUckR5Kin9J6
	 EeaZ+cZp4TAIBnA07HwNDMjShMoQBRlniyX/arV+BxGpB2UW1uZ5d5a5t43XPrFH+vws9
	 lKF0qdHngbqrCv2AmCtVe8XPPwJVeOOI7uTF/Ox3uDD21HWMs0u565/0H3p6etj9VOij0
	 f3PQZyUjQmaLCB3t8cDR41YAyrQ0VhArv6ClWAoNf4TuO42IyrObmjoNuhLeZ+ZPAtxuB
	 If29Q2sElpFFTZ1nYTDqK6tHMfOzOR0Mx/bIdGevYr8BRDOAVQWoiqII3tFXXH1+dmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EHPhuatB;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797060A2606
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A797060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EHPhuatB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008540; x=1826544540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EAYHSiyQF/c5t1xq3NUMGrSU1asf93Ih6i8GSUaz4TA=;
  b=EHPhuatB+l91LEZcIxp0nBQLbOK9YnZJyoLFa4TWkWAkAdq3OLltZZIo
   ByNkxvXHhygw1JXCd+6b2W4BncvAPKx/TjMYlIR1nt8PDE/cWul5Z5Tia
   RpNpIoKmAHs3YWz4uNjo3s+Yh2vwodfu+kRD8M542sFTLaiaYl0+J7h8i
   DgFIkp2cZ/FgqS+weaZFLcvkY61Fq8/MjxzhYDcG65nf19X9FEPU7r2R+
   ToWG7ZoQzIRWNUr5vdLqk8iT4v7C+YU5PCiic5ues4XGOY9kGBMXVsU4Z
   iJcgSdXGGA7eYcqD8KiaidWXJ/2eYgMr1jzRdPAnQYJgKpLyxB9+bdqrR
   g==;
X-CSE-ConnectionGUID: q66IUYTBRc+luXTJyLNuCg==
X-CSE-MsgGUID: 3F3agP6+Qzyl804WQYPsGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808711"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: CL9i3c51RHmI5lffW/1p5w==
X-CSE-MsgGUID: Ikqw94b6TN2TO2vkhtp4+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376707"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6F51F122F6D;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbF-0GlH;
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
Subject: [PATCH v13 25/73] media: subdev: Make get_fmt on INTERNAL pads without STREAMS an error
Date: Wed, 18 Nov 2026 15:27:31 +0200
Message-ID: <20261118132819.213473-26-sakari.ailus@linux.intel.com>
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

Internal pads should only be accessible to file handles with
V4L2_SUBDEV_CLIENT_CAP_STREAMS flag set. Return an error otherwise.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 92664f859369..4a7982e47575 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -887,8 +887,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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

