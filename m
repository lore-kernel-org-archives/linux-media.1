Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008549;
	b=xJna1jNxbPAMj1ZyaK85K3NJYSvvI9VlFQ0OGrG4BWiJS2uilDmsICXrFCNd0s+TP2An
	 rjoM/i2w0rkDeXhtpsAANM2Ouz/yHCMY8XUYo+/FE1095VRgyItkzovR8Ii8FqZImb7zl
	 SOa9UJSr9xLyMQUTOUzMmT7oIHNMrSFbm7vKB2zZaPzlXx9ZhZvG0cqXi7yrrimzTNxYj
	 tYXlx/r1urPtqW8JbyYesWU+rgWzeZ8x+kGhch5jwqL+LXpniK3oFZvvBIWp1ZE/mUgaG
	 ZBiu4ANiExchn8wUuZGggH4QOhaOlHDuUwnv2cJZRn7DYw47ISuQV03unRD5KLSWYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=UG+c71sUB3X8qrqgKtVoo9AYZdIWRxSPGy2MuyTSow0=;
	b=Fez7YP3ES0mDJ+NZhfRQX6+WfuNwTN5XcjxBCSiTconSez9MaxU9FxBsCJRqpIiz2t5A
	 FFvhqsgX6EmPri6kf/Xcp8eRA6WRvmFX6XThk7WmPxj5Uc7/qQZQwVdIAaWT3Bi0+vYgo
	 N4gE8SynNcxq13fLWajSk1L/lPZk2/nqOOO9Sv8gHvhZrZe+YIIeRG6CT5rK/g+WQBtrK
	 JxJ6G/bmu1Vgu8Y87bc5c/39bcxib/qkPeCnxBoeEYHl+mYrQSIao+Kp90rpcJdpv/jKT
	 5sApa5MhcUNeENvyc7G0LArjm2LV/DOALQNVWDwxUPwCOfcGRQY6QBBMXKouEU7rc4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVEpDR36;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308460A2602
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D308460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVEpDR36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008549; x=1826544549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q7W5XNGRrqp/xJt1JOGpuOgVjWqeKUKheBtQt8hxHD8=;
  b=ZVEpDR36dqWH18Lrsnrb6fcxVcn8CciQa9+MzuQJRGHeyTrYOHwiSY1v
   dMDm2t1091fwgGbK8raceH24jeShwfSN2hG0302HM6dMknlG/GZjsAqlJ
   Psgl+FGye5qyXD+Egw6OgYf+jbbnIQi1w/1X51ZIopuRgTPyWkIv9Jtf6
   N5LhJ2LyMRC8wziCrw7WrSzE+/X+TkVlr1xsMU2rGT7Pqui9mnoPbmchN
   S4jbCJJvh9kRhS9Ngb7387JoNbaxs5FpjJCqrWOcrA8GM4jo304ip0ogM
   k899uaoTjuNRJVkvDx/0YuQXdAuZLKqN1D0pLdvgdGjfDTL28WYxJ+dpY
   A==;
X-CSE-ConnectionGUID: wyf3t57iRmu8bqz/vwtEmA==
X-CSE-MsgGUID: XuAtvX6gRjWy/SDqR2q1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808968"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: jXvWYNZ6Qnah87PykfcQGg==
X-CSE-MsgGUID: bhcMHbA7T6+0rqjC0j7PpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376791"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ADCE61230D9;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcH-1IP6;
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
Subject: [PATCH v13 41/73] media: Documentation: Add a note on Bayer raw mbus codes
Date: Wed, 18 Nov 2026 15:27:47 +0200
Message-ID: <20261118132819.213473-42-sakari.ailus@linux.intel.com>
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

Now that we do have CFA-independent raw mbus codes, document that using
them is required in sensor drivers and preferred in other drivers, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c8552f70f496..27ea5055b3e8 100644
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

