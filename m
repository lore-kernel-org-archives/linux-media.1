Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008537;
	b=NXnFspYAIOgCbS5uRVK2JYZm5aYeVVhT9wGe1pfSEvlXT0PNa3o5fGG4IIlrs1lXapwq
	 iu+z2KaXRdev06B0b+USyJIrZnxUo1/OcP5AXTEtfhg9Jg4Jg/9Bhk+fw1uwab6DBrfNj
	 vMakUXKBpzJb4iLnteysn6PZDUoV7Bc9u3dssLhkQKTIVLMIt4SiWynRmjDAlT4x/czu7
	 2ePYG4ZjSXHmZibXYATJceaJd+LOf3iVDfAWqgHgNvvngS80toeiLMd9isXOU9Tjh23J3
	 C1t06XCEVMHbEXElNXpv8RZ7PrriPnLpMM9ymPU/++EfEzA5YJsrHbsehZD5fNau56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008537;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Q08nzDiWqzjdNZ9YfiB+k5AE5IaB9f9Ag3XNSMWg5P0=;
	b=3ft6PisiYAFsEArKJ5F7IryJOfgDo8LMjvGx15/EFr67wYAXpVjCML1eBUsNQ9yFzXuG
	 LS7XnJd+YP4KeU8DPyVOUtDGauL4yjBMqQsDBgpjGpuZqST5ILG6kyJ1ASGuoQ1BnXL9r
	 xWfYo5+fepeZW8EQjjLE0VLYnwDGKlzWwmGw8eo4lsSaQ9YbL1wiodLnBdP/oL1Obdixb
	 rK2/kG4W5SoyBbc7PdREbo8X3UjM7GUOj5N/TD8nzwUz9myRurUs71Pr0A5S7MZRiv/xy
	 AReXcFwTzPEBtW3YaY6IEZdAo0/Z7LtEOaRTVqX9iyOe4dxjla4zZ+1o7KwmyhQaeTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ok+Vjsj2;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F917606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F917606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ok+Vjsj2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008537; x=1826544537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9lTkq5JbjlrnDSxD6aD4+/fe3irug5WamAkIz1kFSZI=;
  b=Ok+Vjsj2rz+GNPs0d83Bzg76Nl6ZCXSmFmVC3uE7A4Fa+PiVLdfUysec
   AiJNN+fQG2kgk/zDP2yMj7jnEZyXLCs5/boOIoHlkaPoxjMo6/u97TvmM
   aPd55i9sYUBvbDEMtu2cfE7qAcTCpPQYd11jGjituJmBQsEmxneilarsu
   pdNqvcZFnjzlJmVXf/RpWMgQqrqjRyRAxjY7b+KlLbU/VfUsIpZwVN46X
   wCl4H7O2A773rmSnlalIurB+dwmQqrs7EuOUKhCRHstUF8uMsrMXt2RYK
   0+G1yct/IznT0QvMM43XNUq7n8zXHMlHB2tMsFq8nzvyQwoUAw4mY4xBx
   g==;
X-CSE-ConnectionGUID: e8t8IeXYRheF8y6JN+YW4A==
X-CSE-MsgGUID: FAwcXU33R5akvmkO/64bPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808603"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: zd87Ou7+TsGz/z0hrhrRUw==
X-CSE-MsgGUID: Tc9/SrAMR6yftf45soJHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376687"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 35951122E05;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taL-3Sum;
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
Subject: [PATCH v13 11/73] media: Documentation: Reference flipping controls in raw format docs
Date: Wed, 18 Nov 2026 15:27:17 +0200
Message-ID: <20261118132819.213473-12-sakari.ailus@linux.intel.com>
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

Add a reference to the flipping related controls (V4L2_CID_HFLIP,
V4L2_CID_VFLIP and V4L2_CID_COLOR_PATTERN_FLIP) to the generic raw format
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
 Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 68ac4a2facfd..74d4f182222d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -142,6 +142,8 @@ Image Source Control IDs
       - Monochromatic sensor, no CFA pattern.
       - 0x00010000
 
+.. _image-source-control-cfa-pattern-flip:
+
 ``V4L2_CID_CFA_PATTERN_FLIP (bitmask)``
     This control determines whether the horizontal or vertical flipping controls
     (V4L2_CID_HFLIP and V4L2_CID_VFLIP) have an effect on the pixel order of the
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 3aa5bfdd5175..b207119415f1 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3867,6 +3867,9 @@ still specific to the format.
 
 The native Colour Filter Array (CFA) pattern is determined by the
 :ref:`V4L2_CID_CFA_PATTERN <image-source-control-cfa-pattern>` control.
+Whether or not flipping controls (``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``)
+affect the pattern is conveyed via the :ref:`V4L2_CID_CFA_PATTERN_FLIP
+<image-source-control-cfa-pattern-flip>` control.
 
 .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
 
-- 
2.47.3

