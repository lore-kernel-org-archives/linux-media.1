Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ADB34EF07
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765741; cv=none; b=lamj+Qs11eZi0alWPulwLYi2FjsGYz7ZirjclI+E0phxzzNxuEK0fPkWZCdiWsNct6ObmKFB4AdS0fwzP8SOWGLl1qu2g6bFRdzzhPxUCXcUbTlzFpoQ9zuTkdGE4G0XTj+jU+a8D2BwhGmDHhf8ybvdUakBdRtbRgNIdkh3LI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765741; c=relaxed/simple;
	bh=DGppIf0F3Qll8S7u/CaB4UFP0jTBjxcLUE+sCCJh66o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnlTupgzGdZEs7JLQnapJJh3mIwPwT2tmpV1Hx+4gw1wcYxHXYWgqGFsLyRmBaqOJ2F95IcMbX5GpMu1FBfddSMNO/Srzn+fvm0TgVqTfIIINGTuNkDrMBt6TSU1D/vEjMHp/u0tWFR46wkV8WaqowFsH1DjGWeCRByTESLl7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrpB/dI0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrpB/dI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765741; x=1807301741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DGppIf0F3Qll8S7u/CaB4UFP0jTBjxcLUE+sCCJh66o=;
  b=MrpB/dI0qlvevwfABBqRGMOO2wH/DhqVAH6JTUVUw1j9fhxU/cC5eFBA
   UZmfOqsl6AkmbLrb3M2dnl0YXhoBUkuFgNSNsu7eNiRJKcNy6ZONfcVJt
   EI2piOX3PnlQWXFDWTyGRJpB30tsi+jhIoxFVSB0dWKjz6dOezLBYJLAT
   C606GIoeEID+NDHl80M+/u9ZNOykd2RtRJQFBBqUqu88pARultcYiweDb
   uvXlIbkX63QVq2ew+2b+h1/S4Vmcsv/qWDzppyJUwAKAVrt8koELWJ4ZT
   gJ5oVnYOboB4ffCM6Si5Y6Sz47kGFteBL+t0RDwz4zQEbdLimQDeEBUB5
   w==;
X-CSE-ConnectionGUID: dzL7yl17SlenAcMA1rFuSQ==
X-CSE-MsgGUID: AGXe+UQXSFidSzlUfR1NvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176704"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: RiUJs7dxQgq/CYQFtXnkNg==
X-CSE-MsgGUID: /tyUmCVsR9CHK6QICiQoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047629"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C256212291F;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nB-0vBz;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 39/86] media: Documentation: Add a note on Bayer raw mbus codes
Date: Thu,  9 Apr 2026 23:14:14 +0300
Message-ID: <20260409201501.975242-40-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we do have CFA-independent raw mbus codes, document that using
them is required in sensor drivers and preferred in other drivers, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 94bd1dae82d5..5fafd874d925 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -127,6 +127,17 @@ Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
 information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
 register the appropriate controls.
 
+Media bus codes
+---------------
+
+Supporting the new :ref:`CFA-independent Media bus codes
+<v4l2-mbus-pixelcode-generic-raw>` is required in new drivers on serial
+interfaces and the old Bayer pattern specific Media bus codes are thus
+deprecated. If the rest of the pipeline does not support the new generic raw
+Media bus codes, the preference is to add support for the codes in the entire
+pipeline instead of supporting old Bayer pattern specific mbus codes in a sensor
+driver.
+
 .. _media-camera-sensor-examples:
 
 Example drivers
-- 
2.47.3

