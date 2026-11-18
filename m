Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008537;
	b=AzcJ+T/AgOair4KMWtVWYn0/JG3Z3LSpYMKG5FRCoiIbON6wLtDrdRdO1GBJxDK9hndq
	 hZF6qlGLFHxiYEhBGTOHb3c5BatCG2syIla56OrfhpwL5raLoU8pKGTW4IS7sEwQUIOaR
	 8hQzI0OkMwjPtJEvb5lP3AGFtcKUux8ebtE8W9S0d6mWj/QTuAhLPkGqWE1Zkb2NzTsKI
	 Zcaf4aG+7ZHU6dzACTxwxYVvRae8NiPltib/3f4Z7bFvrj2dnVRK7Y7L3g0bxCYfOdjIs
	 mucuRjeFleN4H5j8j4aOPrxWHd4wiBkultilbZQZq4eEfD9TQkbsiLxo5h9Uq/5zipQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008537;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=pqxtqtDeZHPrWIJGcq/XklDmBHbmePgaeZbmW1pBVcQ=;
	b=IKunBJ5rhAAx9tno9TZWfWiYjw0xApC63DenOtxylXRQe3rgO/dkul9/v9VyDi70cytp
	 6S6WwkHIwbAGLudytr1rYJsprECmpLesFgHi4jYRg9MR0l9/9qXbp3PHCimIgDjBDctJz
	 Ab4r02Aj3kdNci3GNcJc+UVM10RLnI4qm/1+NxLBLJlXCSRxsbF4vf/Sx2rKpS75tYnK9
	 mvlAnwLsEZ2DaBkNbxe5VZNTdWsrYsH/EqRr3rfQ+GGsqWo322kFB6xRa5fIUKxMGFm/9
	 bAZjEctPs5NNKn64BIYy90gemAWYKjckxXzLm0Wvpq829DC5mA8lkiyOhvuOxeMmebQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="P/eUdrqU";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F937606A334
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F937606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P/eUdrqU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008537; x=1826544537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6faThyI5kyLQoOMRQMU3UY2LeW77J1FkbUe/Eb8W4HM=;
  b=P/eUdrqU/Xm0dw7C7uHEK/aJZ9iLcaSMuNXg5Qx3atAZ1sw8uwVLa4uy
   iItJU4ivfNthXXoW9dp2jj3cWMcmc0A/iCyHQakH4TLeDV2G1Q6S26U1C
   GpISgVBPk4ceN411Wjm7muKaMEf3BmVxna/6eW3QZbJ2ws0UoWcGH3Bvw
   RPkomzLBkac3NJMPjr50kB9X7mbd7fn0hfdpsPYTsexMawAl2tgXFTrv8
   QSq8EefPw6gklCGspC85fFWj4BXlSy/L47m+Bk+wLxeCgstlC2v9JNAvO
   TmXuqOp5UXPre/W0sOjI5Sm2IrQ6VZAMa3m9e8LQRmA7aFXYivPmMQwVx
   w==;
X-CSE-ConnectionGUID: AOz3kn0rRVaNizgKudH2ew==
X-CSE-MsgGUID: m70OQWbzRYCe/TpJENTGZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808590"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:55 -0800
X-CSE-ConnectionGUID: NhWaz2q7QNeIp50bMzOEdQ==
X-CSE-MsgGUID: MoBOCDdvRiKKos3KrXHI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376689"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 59B09122EAC;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tar-45J3;
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
Subject: [PATCH v13 19/73] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
Date: Wed, 18 Nov 2026 15:27:25 +0200
Message-ID: <20261118132819.213473-20-sakari.ailus@linux.intel.com>
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

Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
Such routes cannot be changed and they're always active.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst         | 4 +++-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
 include/uapi/linux/v4l2-subdev.h                             | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 11d49f86e353..4a55ba0ddfdc 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -569,7 +569,9 @@ internal pad always has a single stream only (0).
 Routes from an internal sink pad to an external source pad are created by the
 driver and can be activated and deactivated using the
 :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
-on the device capabilities.
+on the device capabilities. The :ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+<v4l2-subdev-routing-flags>` flag indicates that the
+``V4L2_SUBDEV_ROUTE_FLAG_ACTIVE`` of the route may not be unset.
 
 Interaction between routes, streams, formats and selections
 -----------------------------------------------------------
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 164cf0ad3593..1ef3bbf28091 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -146,6 +146,11 @@ wants to retrieve the missing routes, it can issue a new
     * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - 0x0001
       - The route is enabled. Set by applications.
+    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+      - 0x0002
+      - The route is immutable. Set by the driver. Indicates that the
+	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
+	unset.
 
 Return Value
 ============
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 6160c3e21436..2be7db814288 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -207,6 +207,11 @@ struct v4l2_subdev_capability {
  * on a video node.
  */
 #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
+/*
+ * Is the route immutable? The ACTIVE flag of an immutable route may not be
+ * unset.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
-- 
2.47.3

