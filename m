Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008539;
	b=3BA3dnMM7zfE8wM4ldGsOg9+PZtc8K+c+O3687pXQ8L66brfi+Lovi5VaaB/br04Pd5b
	 8G4m14tGg/bXXquRzFiO9MIqjs8YI66KL1IeFCi0tqBu+AKYE+4tauYx9cXGUuJ0PUrXs
	 yrjB1izYkVcYXyNSe6AGW3NC3FKbfys+88d9zdYtx+bzPVTYQon82LKvDExXcUSRIvm/q
	 fmW8hCvb2AteSfjYU0S5nlZuTVTTls8JsHKjIRV4mgTQl9I+fuY6VVPqdkWJ/8S0h0b6A
	 AAtGIXEnWSwtqur2F/VIpHyJxra0ZKilGFxSFyEpLP4mqA972bNtbLU39mLHAzAsf/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=41M3ILGyUnuj6AomdiB3c7jiEHAWMVqEsuyVUv2MtSA=;
	b=AY7iidz/ftptv9Bs24CVOClQ+oV5vj/Tz3C1NiZQcx537suy/LQNBy5Kye19ALmEW3vj
	 lbBw0kpYKJA6bBDrHldh/rXrzoUWVjqTpws5GttcKDD0t2E9Y6eKjjRyFgCmIgTSZLX/a
	 IV0DsTqrNp1hsaHxSYmvlr6foQ3CaAluYX8cSrj189miRixhSe/NpB27qKlEF1S3MSjoi
	 w5pLQxmFc+msVbYsEcvBOdYhLsTWwvz2/MO2M5wWjhgfvmnOSWkSgP42cWUL71fTsvyZI
	 6TtbL/s109QohaLMxsDZbTxYq1sFOX0DyX/edo3qFZQ1iaDozT8jKM5cxe8LbxssroA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T989XpV4;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634060A2600
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4634060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T989XpV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008539; x=1826544539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e6xZDGa7/Vk8/Lt2JNLmd1giAJGOApvETXKV7198NPs=;
  b=T989XpV4/FK9sv+gE/KKi2T3guj1gJT4mkLo9f54rGaPEZPGx9e/8EoU
   DTV8ZLW3mfTWIRbIbHGp1AEc/AYmw4ZfapiHiVctzqs+BbkHSrwv+kmGi
   Mx5BwJjWCIy+RS/hZMv5FALFpZBMMEEKqD+aq5MAXctowDpr/ZpIQoOXI
   oKGMx1iirzMjALZp7rFJlQbuOkd1Kq6SeANMvUoIhTVa8O9ufjSaWClxl
   /dmMFwqjNFdbG97T92/jyOe7B4Eb2AAw6XVn0IoFzl098mpNQvM1H+Ijw
   hPaw3tXqB9viTo4p1Cdsz9gsYL4AXNXV3HGN/tYjTwDzDFli02nyq+JKL
   A==;
X-CSE-ConnectionGUID: TbnuAcQ/Qo+J1j9cLztIuw==
X-CSE-MsgGUID: /e9zPQOORK+8L/zfi5iKmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808692"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808692"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: FLLL7YooQbGt6a3EQS0hiA==
X-CSE-MsgGUID: dAx0iJYCQLysBVE/aiFahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376703"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6296C122F2A;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000taz-00f2;
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
Subject: [PATCH v13 21/73] media: Documentation: There are either immutable or mutable routes
Date: Wed, 18 Nov 2026 15:27:27 +0200
Message-ID: <20261118132819.213473-22-sakari.ailus@linux.intel.com>
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

Document that each sub-device may have either immutable or mutable routes,
not both of them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 4a55ba0ddfdc..aa1f1a07af17 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -614,6 +614,12 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
 called on the sub-device. Such newly created routes have the device's default
 configuration for format and selection rectangles.
 
+A sub-device may only have either static routes (routes that have
+``V4L2_SUBDEV_ROUTE_FL_STATIC`` flag set) or routes that are all user-created or
+user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_STATIC``
+flag). Mixing static and non-static routes is not allowed in the same
+sub-device. This is subject to change in the future.
+
 Configuring streams
 -------------------
 
-- 
2.47.3

