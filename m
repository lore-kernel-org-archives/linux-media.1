Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008533;
	b=K9Emr7csI2HGk0X3JEHFKF4F2azZmzTTPICpxhuhUHybGUgPaaoZogmmq4wgBwWMKKLn
	 cMmDccckZ3rf+3M2K2+5xBUAvMGcxkj4CLLpN6Vpc8iv4tDxl7cCeKcjakbSSZOq2ZjgJ
	 lKFl6deLnhMPCyTHpAv6quLLPcOFZbQGt5qN+y0D1R6Qbw1ShjKxw+M+gRm6sR3FVJoR+
	 ITLk41tggu722HXHAyxiIUKCw2TFGlawaApXB3MKyaki4LtPQqS+iws/XCvUK9qYfc5Fj
	 RG35NZ1HdXerUi5LEh90FnIMwpqX7mUU3tPEeYzVLkkRdw7qtaKuF5pAQhoDkVWvPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008533;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=+JS5NfiZzDD7y8/f6PFoZ7uT1cp0SObc0Ans0fYkiFg=;
	b=cfNipBWk3wECDjto+J1wSn5JkMiuxU/VbQv/IuX/H6mVAb0chiPv4H5WxG48R59K6lE3
	 1727fFsnAMufewz+L7hReNP4SRdsYfR/23XC2j5AkyMHK3fBZYqUwnm/XdGkUQMaMNLlK
	 2cib77dVMfuY3FR9sf0XYelx9Car0PjOlssHgMedqarWdH2MYzAPYP3qbEWSoSx/R5Xx4
	 aRIhVgCiy9EBixVHEZnEBou4+DZ+DcDSLO9fC+b82FSdXN77IufnHpQba3y8ayU1GYgbO
	 a+sbmCzPLhgsAmQ9hsbsrjDWyhJ89kqK3oRbR7WjGzYHzGHjohjdFbElJTYwKt2EbMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RLTsya2A;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E0060A2606
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E0060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RLTsya2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008533; x=1826544533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hUJEvGGezlhJ1vY9jKF3ClIKi9FUNzgHpmPrUiJVaho=;
  b=RLTsya2AXiCYCSkazNUrX8cpMyJoGI1oirjCyD5TnV/5l61kvuk0OW70
   Kk5BpHiqYSL62hnimjL1u4ZxJ+/2a/lhcTuMx1tA2M/l1QFHfOKIuXcJb
   eMd/BrU91COD0mfqyZLgok3ROWxXch0lpGFHocuvnru3CdZNza/y8AmVI
   iCMXdqSvUHgoDGR8zRY582WJz7x4D1vimY26PSgB8xxjpHteSaCjO9yhH
   NywEYmksTDL952rFFtihrjoQ3fdvFSeHsy4pRXYFdRooejaGQGenk8BPZ
   Oeqo9w0PL2UqwBdBA0kJeEhvybGUUUT32sYMG0Ji+15bQ4DBIvk//S00N
   g==;
X-CSE-ConnectionGUID: sygEsk1IRPynPBj9ML1aAA==
X-CSE-MsgGUID: 8ttAUwwKRb+l55SMZItp1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738964"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738964"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: E4TvYZW+RC+p26c/89kPZw==
X-CSE-MsgGUID: lmrjEf/UTdqpZrFZtQLuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076083"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:41 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2CE39122DA2;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taD-3Js4;
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
Subject: [PATCH v13 09/73] media: Documentation: Reference CFA_PATTERN control in raw mbus docs
Date: Wed, 18 Nov 2026 15:27:15 +0200
Message-ID: <20261118132819.213473-10-sakari.ailus@linux.intel.com>
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

Add a reference to the V4L2_CID_CFA_PATTERN control in the generic raw
media bus code documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 7d34c2991f81..3aa5bfdd5175 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3865,6 +3865,9 @@ Bayer and other Colour Filter Arrays (CFAs) on serial interfaces. The packing of
 the data on the bus is determined by the hardware, however the bit depth is
 still specific to the format.
 
+The native Colour Filter Array (CFA) pattern is determined by the
+:ref:`V4L2_CID_CFA_PATTERN <image-source-control-cfa-pattern>` control.
+
 .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
 
 .. cssclass:: longtable
-- 
2.47.3

