Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B64477F4
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386121; cv=none; b=cOgbr32SnPShTywbwgZMGmDfLS0iK7Xe5KBvvRu0KzdvrY/YbqP5yzdO2FNFcUbmQS6a8Aq6zchwcccC/S5m7rfXOjbmxJwhb4SG88mnmqcsCLdrFPDUYeurXVeiVRFpCtfaUnwIyosTGhrvtJKx79ZdY4pxnKFQeaRehLRvw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386121; c=relaxed/simple;
	bh=f7QtpHXroTWy/oihFtD3mbVvXDutMUGID4Ruv4QJsHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5kLfozebpAzoN+JmVKcLYuuCb8l8Sx8p+ZHy4Ru76vP1j7sH6x35m1SsbH/6OEA9nRxglGztieRHMlgmGTTcp8pMePqbWdTS/AmwZSFq7nIuCWxw1vCtRj7X3wTnAaal+BuS3+v3canERUvzQpXWTPn02Vo38TomaEwctpbZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gS+EBvhK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gS+EBvhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386120; x=1820922120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f7QtpHXroTWy/oihFtD3mbVvXDutMUGID4Ruv4QJsHU=;
  b=gS+EBvhKv4ItDDxuVPtHzeA6FxAomee0Mne279Fa5WXR+7tL10JqOih+
   wSXhZJc+HcvAJyZkz/qeMKaAB9Gf2LO3kfExP1qnTaawT6rU7gQrRU08c
   0PqgpTZwQw3OLJ8cV0FuABjLOGpWNDvMTZHXWbSpttuZXTxQEutd6d7VL
   7IHTeVN5gQq88zCGibi76o4BdWfP80kq3sxPlMeB+g2ITQbKgL5U0hVJF
   n6fukdeXqLbl20e60qTWLv9XKZM0MMf9OSeuhG7EKtiIGMtZWVYv6EKHa
   jMmPH8BHpstr0aEBwu3sC1jSG1a79Idp8bAIzhImM96WZ6uFT4Nlqs10e
   A==;
X-CSE-ConnectionGUID: TeGSBbLeQkWbFZP+puEtaQ==
X-CSE-MsgGUID: 3MDh28JhRAi0+zguRSNsKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93431877"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93431877"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:58 -0700
X-CSE-ConnectionGUID: QkUXA95tQoOWtLY/MglFvw==
X-CSE-MsgGUID: fTeHgP+4SMeBYkPIOtjfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270812718"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A9DFD121BB5;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PXT-0OxW;
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
Subject: [PATCH v8 01/13] media: Documentation: Improve pixel rate calculation documentation
Date: Mon, 14 Sep 2026 14:41:32 +0300
Message-ID: <20260914114145.574791-2-sakari.ailus@linux.intel.com>
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

Improve documentation on calculating the pixel rate, by adding references
to relevant functions and mentioning V4L2 fwnode endpoint instead of OF
endpoint.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/tx-rx.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 7df2407817b3..9b231fa0216a 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -104,7 +104,11 @@ where
    * - k
      - 16 for D-PHY and 7 for C-PHY.
 
-Information on whether D-PHY or C-PHY is used, and the value of ``nr_of_lanes``, can be obtained from the OF endpoint configuration.
+Information on whether D-PHY or C-PHY is used as well as the value of
+``nr_of_lanes`` can be obtained from the V4L2 endpoint configuration; see
+:c:func:`v4l2_fwnode_endpoint_alloc_parse()`,
+:c:func:`v4l2_fwnode_endpoint_parse()` and
+:c:func:`v4l2_get_active_data_lanes()`.
 
 .. note::
 
-- 
2.47.3

