Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008540;
	b=szG9Rumq0IO5ZINF2CUpUsegVL60zGbNzSR0wTW7wSt+ue6y4EPMagHbocdRPaTW0IZM
	 ZCmrpCUsxFSipHCB3cZl1/SKGxp8THzAIUx7oRQA6btIxjsYFRcCdmulLS6wSlyppizzR
	 EYPHZH0mAL8dzmF7WBjHnK0KQa43h+gSwF3jAX2YHiLlS6VH0qT6Mxr8wht8fPHaTkNoG
	 9//Rkkl1Izghm9PAFrwgBTG+siHkftN+Sm9+5qC6efbIqUOLnplqTW66jHxIhttqfmWQD
	 B5xdiiuVhbnttqXx13EKS28oKecfmYllqpSViHFn4KH4RDm94u7c5g1Xas5hvGdUfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008540;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=N2bkpjTDezrYYInhq2PXXXcnqBJfEuRdL5tHR/VD1t0=;
	b=qLVy1/3Y6RNnD7bj5HQg9orB88fSrA/Bv2Y9kr+33FqoZSuZU3u/DRxbgvnT8RXbnyUw
	 lWklkeygylIGoV/GtkUYWwyo/v4iKcJ3GcWeiTNrY8MY0iCMRbvXwPZOXFD55MsRNt3wm
	 mgZATA/Vrfljz9FBkVNwiWeZxWTf5O6MZoGGwk/s8neNZz45OOq7BWm97qBg+baJGv+dN
	 YzEz3W/qhDfyZweCvzpwC3PwpDgTHsjCGZP8rlbdqKpnJkSO6bGkVwunPcFr8aXeCsDlr
	 NWs+BaR/uGu3hii62CPMPXgscHctKyzrp+XkEBeH6XuzsViQ4cDXfSu9ccRe3c6DT8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHOclJCM;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2460A261F
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC2460A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHOclJCM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008540; x=1826544540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vBr0n88OAUNlviy1/+boJoFxeyN0nSyWM7xLGXDqlxM=;
  b=MHOclJCM/sOiMbEAYCpDEzHySQmvPi40sAOHcrygvxjnzpKWuTz9SUbD
   XwHTI3MM+VqNMuKUtSjQ6F3N4VDnlHh4+dVMMUlXLU9IbTiZdz8ilKRfL
   JFmTP9ay1FAdMqcd1p6WfyoHkxTSa3CrETw5eli5X9Q+hp1M3uLqsBZsb
   gbqwAORRw+15quBvhgrtelUULLPxQrYE2de/YT3RLFJgAPU/8LNlWffmP
   RXAranCV2xzW1oU8lCojkeDhk2y6d6x6Qm8BAnx6sBf/q7VTLxKvLOo3C
   md1x+dJRGDox/nHzcodMIWX+g4O6giWSuYmjoDhHQ9rI52dC1nKjVo6/j
   Q==;
X-CSE-ConnectionGUID: MB4mNdgSQAGV9lE5E7ZteQ==
X-CSE-MsgGUID: g888jxfaQVC71b90Uj6WnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808736"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808736"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: BOF/+OYETUGTwf4/vs9wIg==
X-CSE-MsgGUID: S4a3lxBkRR6Pv77Oj5rNxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376710"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 498D3122E47;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tab-3nUj;
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
Subject: [PATCH v13 15/73] media: Documentation: v4l: Document internal sink pads
Date: Wed, 18 Nov 2026 15:27:21 +0200
Message-ID: <20261118132819.213473-16-sakari.ailus@linux.intel.com>
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

Document internal sink pads, pads that have both SINK and INTERNAL flags
set. Use the IMX219 camera sensor as an example.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 22 +++++++++++++++++++
 .../media/v4l/ext-ctrls-image-source.rst      |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 142e2cd95062..11d49f86e353 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -554,6 +554,23 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+Internal sink pads and routing
+------------------------------
+
+Internal sink pads are used to denote sources of routes that originate from
+within a sub-device itself. No external sink pads exist for such routes.
+Internal sink pads have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
+pad flag set.
+
+Internal pads have all the properties of an external pad, including formats and
+selections. The format in this case is the source format of the stream. An
+internal pad always has a single stream only (0).
+
+Routes from an internal sink pad to an external source pad are created by the
+driver and can be activated and deactivated using the
+:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
+on the device capabilities.
+
 Interaction between routes, streams, formats and selections
 -----------------------------------------------------------
 
@@ -691,3 +708,8 @@ To configure this pipeline, the userspace must take the following steps:
    the configurations along the stream towards the receiver, using
    :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
    stream endpoint in each sub-device.
+
+   In case generic raw and metadata formats are used, :ref:`V4L2_CID_CFA_PATTERN
+   <image-source-control-cfa-pattern>` and :ref:`V4L2_CID_METADATA_LAYOUT
+   <image_source_control_metadata_layout>` controls are present on the source
+   sub-device to obtain the pixel array CFA pattern and metadata layout.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index bdb5ddc257d5..a9fd1458e391 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -156,6 +156,8 @@ Image Source Control IDs
 
     This is a read-only control.
 
+.. _image_source_control_metadata_layout:
+
 ``V4L2_CID_METADATA_LAYOUT (integer)``
     The metadata layout control defines the metadata layout on the device's data
     interface for metadata streams. The control is used in conjunction with
-- 
2.47.3

