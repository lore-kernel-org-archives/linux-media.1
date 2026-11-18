Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008533;
	b=BQhFSthoQetYJe4yFfoGeNARbTcX0jPsoV1fovs4/7bopRS+c0p2g4vwEue1S/NtPYxM
	 WZTdXQyDBuEa7eKztODCb66FO9vHL2DWq46Wd2f2KL0yPtXQzGogEDRqlo7gTar7xtlNZ
	 /FtS8hywWrhejgxY7z4pg/uY/GK1cLaeZiVAVunQwHM17QbGHFwr4Xf+lxpchSa3OW6Zh
	 6RouOccmNtWPm6/Ed+2ECTcfk+NEmfrtztTfuGbFUUBs3TJLeA/RtGJ+fJ8HPaNupIfp0
	 dXtq7SypL9i16vrbLoviCP3whbuzsokG5KhyEjCpkd+2AOkut3AsI/MFP0ZCaaADbUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008533;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=s26qgJ6S/yg1N262SnN/FZC/X+gzqB5fAAPiHdhSOEA=;
	b=oCnGVtwRAzIFtxgCnQWuK6ZZFk1x1xFXLZJotSQQ/DT0xVbscI6HBbyezzWjC41GS/iV
	 UO5R4Tw0YALPNs7m17hrv7FItzW/2qv1eGPPzPYyJu1WPn6JwUpVhNSO57lTbwji0cATC
	 tPHqvBe5mJDdvakIgxPW0b6eqQ2kCjDQZzOgdK9jRoET5CyESkrNI/PoB7+oDmEZUDxjk
	 4RpcA/Bxin/uudzZxtdDi8K0OkTT3jYQq1CcLkim4ekceNdmD67jWktRgYHhPetoZI9Ky
	 1iMv0H+4WDghPIHsxJeBDgtTfByhbvc1ivwR0Jd4euRavD+DnOe0CDLg0WW3wV3SM2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PCitqHZN;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5292F60A2614
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5292F60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PCitqHZN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008533; x=1826544533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h5X4mBp8ekghAYb+MkQQUxbvUTRhMuJzFDWSrS3hQ8M=;
  b=PCitqHZNtdRiSlpMgXbTJ8IRrHvqYsOO23GHgWYOIuxjZqeK6Jf7gwdP
   RieByhMtOqSjkkNivBEX0MekZg/hBogvWmuu4nEggwEZNVsuPpJCxlGg1
   BIBir1IUJVWekavHJWbBfhl5WCS/tuLyPHbgdQHwy6EhJBHPXtjGPr7n8
   bTpDp6Owsv9agH+V0fb77bBgMoaBY/e2YnzY149ZsMJAEjnOIxzpdIyNZ
   hyVEtRCWvQVRjtbPEhGX1atfGmJO60Dzwbq+t9CclLcCd3aP8oAfVMX9F
   UqAra1AqclJ+FSrNcKBspZchpu9GKYK79uVnIxR1CoL+uRr+brM7GAeOA
   g==;
X-CSE-ConnectionGUID: TJhMu0okR5O/LlUpklB+EQ==
X-CSE-MsgGUID: 0ak33oWZSg2S7an+hp4wZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738940"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738940"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:48 -0800
X-CSE-ConnectionGUID: iXIx5234Q1qwa+Xy5ch/cA==
X-CSE-MsgGUID: YnYIdaSPRASeOl8keaO87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076079"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:41 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2640C122DA0;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000ta9-3Eun;
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
Subject: [PATCH v13 08/73] media: Documentation: Reference CFA pattern control in pixelformat docs
Date: Wed, 18 Nov 2026 15:27:14 +0200
Message-ID: <20261118132819.213473-9-sakari.ailus@linux.intel.com>
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

Refer to the CFA pattern control in the generic raw pixelformat
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst        | 2 ++
 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst  | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index e1ca45a9b577..97ff8a321849 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -94,6 +94,8 @@ Image Source Control IDs
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
 
+.. _image-source-control-cfa-pattern:
+
 ``V4L2_CID_CFA_PATTERN (integer)``
     This control determines the color components and native pixel order in the
     sensor's CFA (Color Filter Array) when used in conjunction with
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 254f8f18c7c5..708aa17b80b0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -13,7 +13,9 @@ Description
 
 These generic raw image data formats define the memory layout of the data without
 defining the order of the colour components or even the colour components
-themselves.
+themselves. These formats may only be used with a Media Controller pipeline where
+the more specific format is reported by the :ref:`V4L2_CID_CFA_PATTERN
+<image-source-control-cfa-pattern>` control on the source sub-device.
 
 .. _v4l2-pix-fmt-raw-8:
 
-- 
2.47.3

