Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008528;
	b=QNdERy8NHAgxi2R1PQjuWVad+pzSZtbsiCqjOoSwt3h+RxzgAfVFlvBQsp5rrVNrj5x7
	 mD2WFRZ+nGz7WMTw/uunyzPsCCb4Q/igdT3dpv6XwBNrREzbNJ+ksiZk72EOPISW4YNdw
	 sa2dR2rOfwLh/hqvbkolBTTwpIFTK7uTfgml/3GGIglOssheyQynoto4WUZiKVvYGUnYP
	 q93BwX7mVXrN1X6fkvDaiW3y2/NTVxA2AAgJR9zBOq8Cj5ofkdOSToHH1gbXzJ8e48nE6
	 mOadmPbJS7NHDovAWEJc7hJ3hToCIAmmcbv4yEG1pj3yzYXoibF35ZZp/sztLvipSjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008528;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=cqzXE2DEADlBF01AMa1pCtbMzWE0EPSnBAJUAe11q9c=;
	b=TXcto5BasCN4xj93Xw9TP7/+HLX7kSyYC6Aef54XWWFVKstAXYDwjQsCjwDW1QNhvAIw
	 +FV/LWqI1i+3maLqnPIR6E3dsXlaFngM74DRCrP6Hlef6F942lTdgvMSpKRJU79FkubVj
	 EmJnqlm5a4Y80+5ueaGs6YEiIrWZF6sg2bsNLFqGHRipedDiXWgb9NSWdg9siM9wmIn9O
	 +QyiayqaUt+lTu+wBVimdBKte3T2QVHpFA31O3v5R/rTfXp/8rCCdChZGaYiKsYefrZ3u
	 X4svlxTdjN/CdgmS0f1MrwZRV3DO5MmrM326spEtxXlG015rg8wzuNHA0W4dahkfZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dn+tt2Yk;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA93606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dn+tt2Yk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008528; x=1826544528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gd/gucxD2L5L9WWDtlBVCLXP6zDRX0vKQ64Wwb2vmgE=;
  b=Dn+tt2YkfLk7bCcGG/XA8b2UBTFwYj/A99arm2j1pLhfeUn0g/lOF4Vx
   wgPRT/J2lay1F5FKTovXjKZYlD/gt1fEPSt4vN1wnOXIVY3rT2hvIpZij
   EMqIhozPKg6C/h4agzrPI1lIFknEVlt7U2xg2nwt2jeLjWWJhpLf2W40s
   oScP04yQ7JLf4Iw35W7FwC9Y0EjbsuTlH4abmumdH5OYds0gVko/rASta
   Nw6mN0RD3+WWDbVSHSeml1KDFYqI6mdontOsJu8NrZ69OQBZIBztZC3Qh
   UY2RSVVjUfK0FOcIBuUFDFOC48Xup3pptr6mX0QRNftSD8lcArNaTfyUo
   g==;
X-CSE-ConnectionGUID: o1cE0DrcSqKd2YUApgF7ow==
X-CSE-MsgGUID: AAJ3hQsLQvalnPBLd+uAqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738774"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738774"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: C8bcooj5QdqP+aIvFmf65w==
X-CSE-MsgGUID: x2Ct5SPrTXiRoqt92gfKJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076053"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1BD1C122CE3;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teR-3Bfn;
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
Subject: [PATCH v13 70/73] media: ipu6: Add support for generic unpacked pixel and metadata formats
Date: Wed, 18 Nov 2026 15:28:16 +0200
Message-ID: <20261118132819.213473-71-sakari.ailus@linux.intel.com>
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

Add support for V4L2_PIX_FMT_RAW_10 and V4L2_PIX_FMT_RAW_12 pixelformats
as well as V4L2_META_FMT_GENERIC_16 for 10- and 12-bit depths.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 0e30725dda2f..26925331d8d5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -106,6 +106,10 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
 	{ V4L2_PIX_FMT_RAW_CSI2_12, 12, 12, MEDIA_BUS_FMT_RAW_12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+	{ V4L2_PIX_FMT_RAW_10, 16, 10, MEDIA_BUS_FMT_RAW_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
+	{ V4L2_PIX_FMT_RAW_12, 16, 12, MEDIA_BUS_FMT_RAW_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
 
 	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
@@ -113,6 +117,10 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12, true },
+	{ V4L2_META_FMT_GENERIC_16, 16, 10, MEDIA_BUS_FMT_META_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
+	{ V4L2_META_FMT_GENERIC_16, 16, 12, MEDIA_BUS_FMT_META_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 	{ V4L2_META_FMT_GENERIC_16, 16, 16, MEDIA_BUS_FMT_META_16,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 };
-- 
2.47.3

