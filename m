Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008529;
	b=3aidr02flovcgk1uHImi7rlQAc6162t2V0hzJxLL2QT0QIbBx+aJXb563UQJpHhq8yPH
	 GmRODSmaVVZ0Nce8WmNzEkNvb/kiMBPYmgkE38fs5pdU5mjx+TmcdbCMUGNFf9kmaxvrv
	 Gk4mYriw0YoJaU+jI/VeXu63bUIpMRuV/neVgxKhiwVCJfzadmyTSUGJPMjc7wt509T6h
	 nWJbca67FXciytsu6dB0iRoYsUpIm6ORNUeNiNlwDXRH7nU+rztL2jnkCoWvegWPxBYUO
	 hkzmvvnIbqBLCRolCM97+EptL3vcO4hKuUgoRiYdmInkh35vBjwv2Hmh+OzkenDpMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=dpFrZoHexSeowY3/8hrN29JBGtTcrSEAoiQeusHojgs=;
	b=WzqUltQ1CqN/prTPUoCmwT3j4pRzhSOeEXBnALC1EWLrOPc6eLWIBEOBdnHGSsnaC2y4
	 RWOMFAxmvBUl2w5t5bi4eA34i5pjJl1hvw6jB0qacms82Oz5JfInO4415l3WoK7Ktw0Rn
	 doPRu7lH9b5KOISqK44w17Vx9u31sSrNGCZOLkGNMxG9TCIb6Q2itJaOVNoP7Gq1vQkiT
	 jqro7xsa4fQ4Vcm7ZRFFvB/HiuKkSprqomwQvqTohoSuTClT4cIqDXLtpBXC7LWSrUq/P
	 trFHbIQsWIdDNEwJAciEElYh2oTFDxGQygii1/jQ3sIhdgyWfFX5SSqLjH3NqHlHSvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKUytlw7;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F83F606A335
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F83F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKUytlw7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008529; x=1826544529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J1yCfZ75iQS4qFl+zvMZ6ws/HEOZEfXQCYc66hGbcbg=;
  b=FKUytlw7LO/MrtFf/lg4XJeECGZp6hAZUHGOrM2yZAkZKph4ARmuu6K2
   /7VOitoj3RbgTDNsNmqtoOyLRnMS8WvKyuP2vqJWcRIxaUcNm5QG18k6Q
   07e7Sn9D3j5i0VMfDTntT9RZ/ojFKeAmcTorKCeavrgSPDPmbJ57tykZ1
   JjWDvguOcDCMbraoDuHA9ae8Bcc4ewHXc4ewqD30AI5hawc53a4I2xJ+t
   WRQs2MkOMmGNZhy6bhonGJhyV65ILsTPolaGBBjloVOaCXtUkvy9fEQWa
   oys/BdxAmEAd2lGdcx67ZWa1V3v75IWIlURjoi4vyZPTge+PbI36/81PD
   g==;
X-CSE-ConnectionGUID: XrNLibNnRvuwsCENFKkCOg==
X-CSE-MsgGUID: f9de0qlpT9au6b0YtpX2LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738801"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738801"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: s5pyWgc7Qly9XgqSPU5sTg==
X-CSE-MsgGUID: SIHth/qwTNOmVxg3/fLr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076057"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 20F0C122CFE;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000teW-3Fwr;
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
Subject: [PATCH v13 71/73] Documentation: media: Reword blanking control documentation
Date: Wed, 18 Nov 2026 15:28:17 +0200
Message-ID: <20261118132819.213473-72-sakari.ailus@linux.intel.com>
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

Originally the VBLANK and HBLANK controls were intended to signify camera
sensor vertical and horizontal blanking values, respectively, and were
used with the analogue crop rectangle and the pixel rate to calculate the
frame interval. Due to various factors, namely the reference size of
output format rather than analogue crop (non-CCS sensors) and the use of
analogue binning, these values in fact have primarily served frame
interval configuration whereas they may not have reflected blanking
anymore. Take this into account in documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index b2c515e519f2..3a2dbf64fb72 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -22,16 +22,22 @@ Image Source Control IDs
     The IMAGE_SOURCE class descriptor.
 
 ``V4L2_CID_VBLANK (integer)``
-    Vertical blanking. The idle period after every frame during which no
-    image data is produced. The unit of vertical blanking is a line.
-    Every line has length of the image width plus horizontal blanking at
-    the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
-    same sub-device.
+    Difference between the reference analogue crop rectangle (CCS) height or
+    output format height and the frame length in lines. See :ref:`frame interval
+    configuration <media_camera_sensor_frame_rate_raw>`.
+
+    The primary purpose of this control is low level frame interval
+    configuration. The value may also reflect vertical blanking but this is not
+    guaranteed.
 
 ``V4L2_CID_HBLANK (integer)``
-    Horizontal blanking. The idle period after every line of image data
-    during which no image data is produced. The unit of horizontal
-    blanking is pixels.
+    Difference between the reference analogue crop rectangle (CCS) width or
+    output format width and the line length in pixels. See :ref:`frame interval
+    configuration <media_camera_sensor_frame_rate_raw>`.
+
+    The primary purpose of this control is low level frame interval
+    configuration. The value may also reflect horizontal blanking but this is
+    not guaranteed.
 
 ``V4L2_CID_ANALOGUE_GAIN (integer)``
     Analogue gain is gain affecting all colour components in the pixel
-- 
2.47.3

