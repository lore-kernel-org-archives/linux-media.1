Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008550;
	b=HOg4+w2wzPbWO/mCkrIst7qOYbD/UyLjnG4waFkyXr1otd5pKYrJ00ohkO5tcIs3szrQ
	 aSvCVDrN0KplTNFucLon8TLiww48TGaVwzigxZu5lXql51JItqRJHdUyjnbxUNRwi45hS
	 kxKeP3H7JhM8v0BESCxClOff7bOmT2HmjN5CxhI2SY8qOo8YmeoPfycyFzpCOk8ygYn9v
	 UmOITIjzmmM7WS6lx4urK3jUnmNtmKAHyBoNE3oNn484B06XGmvownnbuT7PkRwcFw8b4
	 XxivANhYU0KxyEb4qLg3KLhZHvPwgHkuFw+44Aw81byf8cNCOn3c1hqbIZCLUStScQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=G4DIp7VldggJDSc5+rfR3x9L6Tzm4QM48F5QcmE2Br0=;
	b=sh6zjBrv+2W0I2T6aY+bi+jFOH5GJZmJ5r+Wh+kaMb4cejbd9xw5fTyK4h90IRZpVUnv
	 ouhivWe5hNwb41t0pb4EA/R4X4zTJXVoF2DYWGJuJEejiWmgBlANsuCUQ6xr2LzAyOu+v
	 Y7DSUJcW/qHWGBEttfcAQK2eDoTZUAWVZOwW2ibAXBC8U2G8KyFD39AJwazdjSwLT51es
	 LR0FQDjqh08wC/FO2hyz/l99EGaHbBkqvD20hLb2M/83RMjXovcNKu+PRP1k4ENE1l6dW
	 X5aXhjNacQtUVacRqt+NDHciPvBk0y5qEemklxjNv0EsUeIby6MikqhiLxcYA20C2iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="OQPhYAl/";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADB360A2634
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADB360A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQPhYAl/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008550; x=1826544550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mDX7XJV9mMa0Unrp0n3FM4FhPExoZL9WBhwJkxAumpk=;
  b=OQPhYAl/rpGfwLA9axD5NuV6kM5YqtxFoHGFENZAfs47f9RkQaajCgRP
   I7ucO++Q23sib4yZksr6nUdkfpkmoGSerdM9u+q8y1kCxZ8CYuezgm3UZ
   AkfLNgudW8iFjbHmD4PUai8Vl19J9vcFHnLonY+9zl/CvKHLRoL5txs8W
   p8TmM6IroAQ3HSAsFkzmcnBYSZ6IANs/oG+RKsqedW/kqyNEGLxS9icGM
   KOQJ4Cj2IGH9h1GddwMNgrw5pTrR+iqgGvJ7GEt0HvXwnX4QWX9CvAit1
   15zWJ9Bp2o0SxtsoXJVMEuksKWrO58UXBwhXEU6eEEyY67UK1mcA5NZw3
   g==;
X-CSE-ConnectionGUID: JFpMbls3TXeExQB1Vixt2w==
X-CSE-MsgGUID: p20XIADhR4CYrnC3hxY+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809022"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: 314adFU2Td2jMax1n5L4qg==
X-CSE-MsgGUID: T9OTyy0DQQCTAUqEZlL6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376799"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BC35C123114;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcX-1ZU1;
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
Subject: [PATCH v13 45/73] media: Documentation: Document non-CCS use of CCS embedded data layout
Date: Wed, 18 Nov 2026 15:27:51 +0200
Message-ID: <20261118132819.213473-46-sakari.ailus@linux.intel.com>
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

The CCS embedded data layout has multiple aspects (packing, encoding and
the rest, including register addresses and semantics). Explicitly allow
non-compliant embedded data to use the two former to reduce redundant
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 7f762d59eaa8..8562e4144656 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -170,3 +170,16 @@ via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
 In general, changing the embedded data layout from the driver-configured values
 is not supported. The width of the metadata is device-specific and equal to or
 less than the width of the image data, as configured on the pixel data stream.
+
+CCS and non-CCS embedded data layout
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Embedded data which is fully compliant with CCS definitions uses :ref:`CCS
+embedded data layout <media-metadata-layout-ccs>` (level 3) for :ref:`the
+metadata layout control <image_source_control_metadata_layout>`. Device-specific
+embedded data compliant with either MIPI CCS embedded data levels 1 or 2 only
+shall not use CCS embedded data value ``V4L2_METADATA_LAYOUT_CCS`` for metadata
+layout, but may refer to CCS embedded data documentation with the level of
+conformance specified and omit documenting these aspects of the layout. The rest
+of the device-specific embedded data layout is documented in the context of the
+data layout itself.
-- 
2.47.3

