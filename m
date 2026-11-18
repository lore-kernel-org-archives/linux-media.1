Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008538;
	b=zDYVZpaqYg8Gr+Dis3yaOqt3EVuKDAvmVNLVKR0LpN2lKJzvieFByfgJal3wQobWyDlt
	 xx8ni2PKHFk+xezmxI41cGdRrKhGogvLYna+3wKBb9eiRBgKT1TPW5XSmvRYQq/41jOJ/
	 jd1TNpnMpn9C0Fb6Lj0ZzOeLjXrnNatpajnztfGsf2qk9hwls7LotNXZYr7JVVkv/C/vN
	 tUAGV1uIFTnYOYutEB0Cl8O9OUnpuCsxbg/9+hWa7eN+KC20ATJ4XzaKJrCYVEY1F2Gmt
	 j1YguRLZ7xC1wl6+RDFTukjwdeGt/l8akLJ/nNIGyQnP4vR7XSirVnwXBASFgujhQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ya8fszmXadZ1ZkPfkdsdl+uPDUM7OZ6frL2GTwOZ2Hc=;
	b=WC0FIRXQFL1OH0BP+0DUShRbjXq0nGmROxcRelXU/1kw52utMIDGPPRz5FvOaECEQz43
	 gx6bkklaJecjWsD/T6t7N85Z6toMEbjwgUcJRU2r8k8KAa0ViWUSxZru0cWucN4tTFfN8
	 3jtt9S+RQ6xjXwqH+qiZ9yCiDpuQiH8nDdzKK2ZJkZgGtafTMqOZIRQ0VMiBd2dRXgRIq
	 bCHFT1580FMArRUZpTm0lbinvqktv3WPTtE5II/wLu8L7MRp0ihaQQHPcIPwDPVlpE49t
	 DoVi57g9di4LH6q+XBYbwZ1feuLuitBZAoLex19tCvyg38Go/JbTWhnN+FQ7ddqUmpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXIyCVSR;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436F606A33F
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5436F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXIyCVSR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008538; x=1826544538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L5c4oIUvm/3JzV3/sSGK5EH65oBbXnEfhkEglXcvHtI=;
  b=RXIyCVSRQTb2qT5weiQLdbJqappI/LofF1pdL0KIay6YTzi01eSYlsoo
   sm0FyUbkF6DRWFGr/AS8P0da13kNPC3tgihrBU9rC1P6Or5x1WAZuIQdX
   lJ6n+ShTabzfsxRh1q0eodp1Is5TJqhwRqOd9cf8VaCcBilVVsxZs4q0o
   gXavmE/1M2qmXwG+Yq7Wkxxbs/CnB29hWr4BsJ15kkUKFj2OTevBV1i6c
   XpAXKKnvliqn7db67Mlpuqpe2q2HODoTK6wZPu9IcDqQ6xSdeu8Ydra1S
   QhcCKPWpVgTyqKYwKIiRGRNe/haWsYyRGXI0lPBU9sEpD3qcNu8yonh3o
   g==;
X-CSE-ConnectionGUID: nTTQg5NLT12TuJSC+/RakA==
X-CSE-MsgGUID: PcmQtKhdSL2exc8WFBimcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808643"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: bx4Qemn0Sbu0pQFJIjeRdg==
X-CSE-MsgGUID: FIsIgBY+RZyDxUEiwxNP6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376697"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 50E49122E51;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taf-3s8c;
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
Subject: [PATCH v13 16/73] media: Documentation: Document embedded data guidelines for camera sensors
Date: Wed, 18 Nov 2026 15:27:22 +0200
Message-ID: <20261118132819.213473-17-sakari.ailus@linux.intel.com>
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

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data layout should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/drivers/camera-sensor.rst           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75d783b75c48..87f86a2f6cc5 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -117,3 +117,22 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
 values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
+
+Embedded data
+-------------
+
+Many sensors, mostly raw sensors, support embedded data which is used to convey
+the sensor configuration for the captured frame back to the host. While CSI-2 is
+the most common data interface used by such sensors, embedded data can be
+available on other interfaces as well.
+
+Embedded data support is indicated by the presence of an internal sink pad (pad
+that has both the :ref:`MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>` and
+:ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` flags set) with a metadata
+format to model the embedded data stream. If the sub-device driver supports
+disabling embedded data, this can be done by disabling the embedded data route
+via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
+
+In general, changing the embedded data layout from the driver-configured values
+is not supported. The width of the metadata is device-specific and equal to or
+less than the width of the image data, as configured on the pixel data stream.
-- 
2.47.3

