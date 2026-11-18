Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008547;
	b=Wpz+ZxNmW9XrqjJQNj53gKr5GSmGoBcgsG/MEp+lq9y6QWv0MLWBDqSrmqOQHN8YkkCi
	 FMmR+PSq/vYuXBBidbB44Bx72tn+YB4fddjRqtwbRFKKu518lxC4NuVOY3wTpff7sHZyE
	 BhGusmNnIxH23oHR5uRjCRURnYc95DL/3gGc/A9NmJCb/0FDt121SUm/MC72DTBMDqsv5
	 dkmyr6GkebDjBoz1VtNhZ4ZEZZgNOSZ5U6q+aZjlR1DXRtO7i9iRBaHq8jyYYiz/B04EP
	 BCLYp1359TQ/IOhuRbLcdvwukZn0I9YfW+ZhrZ09ndGFWsp1xmPf7lw9zyxY8bdf7QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=49VN5f23SOoMXIVMmWRh2XH/UtZMarM8f1wQhB0JSRc=;
	b=QDXr+fdI45Rg9iXHI4WBgB/FSph9Iq9++SOCkXw18jYrzzQFnzOZAE3xcxN4Ju2zG+C/
	 YoX46JTtpgHqCkUn2ZaLcnV0Kw8EJc/CJmY3mWaUBuMf5OYXks4QBbBDWg0DqxNcCbg80
	 CTCrxFTLAfwaQZTXo5NUXjnH7BJ7pfPvhFo9d5BMnr2+Tz11PjjcdUGXVvoHupV54YtBG
	 u70lkENIehunqO2nTb7EFlVvq87jc8qzPAwZuOVcKO95R6OGw2k7cUw3RBdkZE1Xn1ehf
	 XVX6j3XzUHywPlqq1ztxwKn3PIH6lMQLk4PsrCB/t6AlLyJ2jGQltAHesYoLgusxFRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g0XE42fx;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD3606A338
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AD3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g0XE42fx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008547; x=1826544547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W1B2Ydfa02ClugQuRI9K16t48HzNHviQfN27S5SNy48=;
  b=g0XE42fxOciLYzJcxK2XuS3usmfz0Q8eBqOVMNV+lC+ATBeJdO1K8b1u
   aVRgZqn2O8K8amOMikBt35o+0SNwcxQfcYBEx1TKsa7qsYkDH6/KnH+1d
   OKq9G4LO1Ax7hEdIX6psrj99k2WBQcg/FjC3fAggNIhML/9gL/lUQs1Az
   6pR29sJ7tCtcCUojJfdb6M4eIKtVOWTtZn+kTzX0+4SkaSR88N9Bq6mL5
   DOpK4gBtLQcQiug2qCnSq8+maGl6Oyp0Gh2Fug4FatLsVbHQ3Og5lp7yy
   Zxpyr3OesARb9MctmtfNfUYvn5Y3rO2i6ZMRSNKxpcTU0MymB0gUnO321
   w==;
X-CSE-ConnectionGUID: dlwIEkwjQfOin6Z+0byG2A==
X-CSE-MsgGUID: 9oijK/A/TSebMtkoo4KCfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808885"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:04 -0800
X-CSE-ConnectionGUID: NlZgH6B3QcycG5zkyxq9jA==
X-CSE-MsgGUID: OhDGz106S9Gnk8zDHbj1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376780"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 984DD12309A;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbx-0xsx;
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
Subject: [PATCH v13 36/73] media: uapi: Add binning factor helper macros
Date: Wed, 18 Nov 2026 15:27:42 +0200
Message-ID: <20261118132819.213473-37-sakari.ailus@linux.intel.com>
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

Add helper macros for handling binning factor integer control menu items.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/v4l2-controls.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 8671ac06002a..da0123259b25 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1274,6 +1274,13 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
+#define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\
+	(((__u64)(0xffff & hnum) << 48) | ((__u64)(0xffff & hdem) << 32) | \
+	 ((__u64)(0xffff & vnum) << 16) | (__u64)(0xffff & vdem))
+#define V4L2_BINNING_FACTORS_HNUM(binning)	(__u16)((binning >> 48) & 0xffff)
+#define V4L2_BINNING_FACTORS_HDEM(binning)	(__u16)((binning >> 32) & 0xffff)
+#define V4L2_BINNING_FACTORS_VNUM(binning)	(__u16)((binning >> 16) & 0xffff)
+#define V4L2_BINNING_FACTORS_VDEM(binning)	(__u16)(binning & 0xffff)
 #define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 14)
 #define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 15)
 
-- 
2.47.3

