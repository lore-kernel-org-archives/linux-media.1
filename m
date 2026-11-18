Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008539;
	b=vJcAlv0+l/oPh0G9YU7rgXhIsotsAjHJvEqpptH37sJsyHBZhOn2o+3tOaOVxUCCb2UE
	 s6BMNCQ0l+V/H5tutCMze8AMfcu+KUeThX7E4x6l47ICka6YpdTuK7Uxnq34XHjyWv3Lq
	 b13D8Lx0TRE5q5Za7jSsu9loA3e4YVf+TIZXMxCvS6PslpuhuH6WfaLYmmqMJgGPgSj3A
	 Dqx84H2qT/v5buFo1K71nnorksKrY1Eb/0BEC56QZYqHNgnOp9KjGry8eeQB6NHIR3mb0
	 sPLzD8bXZ0iC8PKV2VXBCbByrdNFtPdiA1wh3vfnTWfMAUDpLItDUbNGj2NSNHe9H3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=THWfUuoClqtYzavdCAHa07PzjJVNLp7EZWQ3idcVcIA=;
	b=omx5TEBndh8gp+1aodSzn/egcJskLesNbnfJ4X85V16U+C2JYBxU7CY4CN6slCMMRIbF
	 DNUyO5TFxiqliRGncPlhStdsvlIHtAxNXrtn6fHG3L0wCWEY29uqiiuJXVhhikrR6+LIt
	 vFdQVm1/t1pDp708G6NwbEQyETDC5gbzjLGHGMrXbKMERCZ07K8j076pkfNjOszF+tIVI
	 oUskDai0uyiAjp/zHNHLlMQPzc6TiGBFTmN35GKUs6aW5l7NfaDGzD7RPMaoDiE04TZ+6
	 skZ3MRLvazJvSeYJTTDEcq65WLZhwVSEOQu1ZMVlV6djt2CuwnhDnB6ADarQegKpCpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPfFLPIW;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437860A2604
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A437860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPfFLPIW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008539; x=1826544539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CHHjFUn8264sLrYQ54VY9oxlQuKF22yKTeUU9byjMHk=;
  b=kPfFLPIW+VzMXqmXnz7bHIcM9/NYQ0WmUnHmZTdWSJZgVt9NFhqDQ0Vt
   XuOtThePiUtFJOXNl/4Cgb9Iq6UjP6lAv0rqP/V1uDlYIZOAoPlPc/xAE
   +1A7YoHqon+8a1dkEXdBLAF33U9H6KODJCh9mzxpiq8CODE1zFnwj2Qyg
   uojLZxbNH8NXSWoZlu3XIVU62b4/p3Szz/hRo9lat4sroJUE+X6T9YJ6E
   /qcUokR2xxqFmnfypkEtgFG7IZH+NzYPHWdcNpSYOdEbckWqKHfJ1d/hQ
   rxtfPmhTSjnLd0Fhuq/2kYLKYYmE7YPTCZPWIwjLp9tyN9L++xQaJ4keR
   Q==;
X-CSE-ConnectionGUID: +OchdTFLRReydRgNfdDWzw==
X-CSE-MsgGUID: +p23UnSKQry9tve7ZGhctg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808653"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808653"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: jb6fKq+DS4OjsMsaS8y3Yg==
X-CSE-MsgGUID: 5qFDDbJORL+gVTkgL28k0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376699"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 55D98122E97;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tan-41Eb;
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
Subject: [PATCH v13 18/73] Revert "media: uapi: v4l: Don't expose generic metadata formats to userspace"
Date: Wed, 18 Nov 2026 15:27:24 +0200
Message-ID: <20261118132819.213473-19-sakari.ailus@linux.intel.com>
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

This reverts commit d69c8429ea80af02e89e5b3eecb78e417ad049c8.

Now that the API has stabilised, make the generic metadata formats visible
for the userspace again.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/videodev2.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9cdb0fa3120b..c9dfd51bd328 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -899,7 +899,6 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
-#ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
  * adding new ones!
@@ -911,7 +910,6 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_GENERIC_16	v4l2_fourcc('M', 'E', 'T', 'G') /* Generic 16-bit 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_24	v4l2_fourcc('M', 'E', 'T', 'O') /* Generic 24-bit 8-bit metadata */
-#endif
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
-- 
2.47.3

