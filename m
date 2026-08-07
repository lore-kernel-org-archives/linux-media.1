Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2D472557
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105518; cv=none; b=h0zMXoLLCjL/r6V4vdmErSajEnd4EHc1B84a/wG+/AVdY3v3EMNvDZltKQasXJbLS0pVidNXD5ltyHSVsspxGzEXA+OXLEuBNCxOlTVPi7OxB4g4H0GQx2vsXlm3Kc9eiBfRK/N7REDpHYkX3kfILLreAjQUxew7bxfrCNmbQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105518; c=relaxed/simple;
	bh=p859UQvbh9NHR3T43JMLJNq95Z5SVWAasDCZX3iFL/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDmTL2VhiA4mInKKkFgZ6ibxpCrRPcBbni3U1Yq9cSfFoNoVH1r/dD3KQxOVS5Clpa32cYRv9qdFdup8eOhUQpAGJRtszwZJLSQVR+0j5uOdXreWBf3iIVwjl3Ncx/Myz6h6E7AWTiLyi+zU1CMvG3Qp0smQcEyXNBmgHkfTkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpZ0MXoK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpZ0MXoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105504; x=1817641504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p859UQvbh9NHR3T43JMLJNq95Z5SVWAasDCZX3iFL/M=;
  b=fpZ0MXoKOJYQzfsPdI8d4UQLS6ARwVt6Gwd4iJdyAGNcPqJmqpET4SuG
   rYz67Aa+S7sCqtiB7XOTQXwtuSEqzn+LWYuXpSDCfUeppxSZxBcV8Q73d
   W2FKKcG7YSEPUH2qp+oY8lwa7wG7uPMN56JpN6ztOelsMS2qRIheX3RwE
   Z+oODjmJ1wqC10jf1f+VVO++e8br9YuIKBVdQPKdGAFojX5iuDnX4Jrfr
   B1OFhcFBAMDT9dfpK8M9WMyHRCVGzOMTTq54l3oX3GEd3kcu08rHsDMbH
   PKWTcbTguVhHsg3VERm+juVKGOjOr4QYCKQWuVM9i5W3WMTXxFwPk6enq
   g==;
X-CSE-ConnectionGUID: zY7xCg14TsS8HHriaobOpg==
X-CSE-MsgGUID: jrqU6vHWQ8OtnvSfBognfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90591981"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90591981"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: YsXQuejqQSShBNaoeFtqbQ==
X-CSE-MsgGUID: cRCtzHGPTGufVjqOs3K0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779674"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D57A121CC8;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bvv-3D8o;
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
Subject: [PATCH v7 06/14] media: Improve enable_streams and disable_streams documentation
Date: Fri,  7 Aug 2026 15:24:01 +0300
Message-ID: <20260807122409.45807-7-sakari.ailus@linux.intel.com>
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

Document that enable_streams may start additional streams and
disable_streams may not disable requested streams if other related streams
are still enabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..d9dca6905b33 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -814,6 +814,11 @@ struct v4l2_subdev_state {
  *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
  *	argument.
  *
+ *	Due to device constraints, starting the requested streams may result in
+ *	additional streams also being started by the driver. Streams that are
+ *	started and stopped together due to the nature of the hardware are
+ *	called a stream group.
+ *
  * @disable_streams: Disable the streams defined in streams_mask on the given
  *	source pad. Subdevs that implement this operation must use the active
  *	state management provided by the subdev core (enabled through a call to
@@ -823,6 +828,9 @@ struct v4l2_subdev_state {
  *	Drivers that support only a single stream without setting the
  *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
  *	argument.
+ *
+ *	When the requested stream are part of a stream group, they will be
+ *	stopped once all streams in the group are stopped.
  */
 struct v4l2_subdev_pad_ops {
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-- 
2.47.3

