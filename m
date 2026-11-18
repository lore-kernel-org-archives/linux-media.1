Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008539;
	b=MpctTqbhtcDE57oe3xyZQ2GgV/ZdXADDCqQolRowaGIfI7TDxTte0vmEOKIay/L76nLH
	 SBCxaiuvCsOwRGst/3xHBEurQa/Nw0ytvIJt6W78qQ0zCnt2lsZ0TZJtrR3WQ7eG1YLaF
	 /ZeMAZ55KC5YwoAuvMiYiPJVyxC53cyy8jK7fTYDRq5dSGh7X8izf/hbqpoeJlLmUEMh6
	 Eke68FRFf8ww8U2EM9mampZKBLlwT3rblGVa8AW5r1TzhnqJUtQ4XTw4bZJcU+jwHt7jx
	 90nBKwIAIgrujtOcjEoZ6Ztija/GDu4ugEWgwyNGF2dgFh0VoVIBwkDTs+fnhXPWjog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=6bVgMVRYcP4+oG1FfoP+KwHkbMLwqIUrLhfJ+HIlIU4=;
	b=0la7I0uCwzvxEaBjXXeEo6m0GQ12J7DjNbksHjDwtoWojw0BDIlaFbf9xBo7NolP7Kdw
	 SEu2J/fPxQt/TBXeyueROZWcq4QFVT8/h0DrwwfPGXkdVhlY/pPUuA9bPzzq8IajRR0yk
	 ESINnUf6btmnpUK/kALxhsIHUcoV2+5vIsphhZAxOQWPwA5Ajci7yV5EYZKXICMowwdZr
	 tPKWV7OEjt7ndd6ipbz3MdPtS87KM5XgBUSHFjKv4kl41GpAEnj8/O5JUdD1Cer93fWOH
	 eiKoVaScmRSBJhi0neN8i+G8Sp7nAsgUPy4guoX8foPu+DY7Pm6J1q3dgPPRJL3D1iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YkdctAUO;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9360A260B
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF9360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YkdctAUO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008539; x=1826544539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3WdIz9LVxXBYv8lu09hYy86WBCBxYYYgvC3dLbEoSoo=;
  b=YkdctAUOvXJH/1TLkrnhNSxfHR94FWMpaO3V4i8pO59Fe3PUf7ep7Vn1
   BN4A3nxzEYWGbPDvzsY3GfGriLL9RMYHsf0gc/+oyZV3It+7h5Sjsm3cs
   3AeGez9D3H2wyCPskVgb/EjDYOfFe9wUrz3gkGc9WLMvxPBkcFtuw7sPG
   f+OuHKtIsmDeMsaXUn8jXq4kij2O9uVFJP2i8ENgSCjWgKP4s/iRVncUW
   pyEPeYEtFxd14JvCIQ77WNx3TCz1N86UKVK08GXvgXVa5GkfzxAcW/ifR
   leaQLR4MeHmQGQ73ggQzRsMIu1FqIX1kszzrEpYxajXOU7rfd/dIU9Jtw
   Q==;
X-CSE-ConnectionGUID: egQG4aaKQfmI/B+Mrg1sQw==
X-CSE-MsgGUID: HJaC5zMeT0msuPKiNzF+pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808666"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808666"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: UM9vMktyQgSYNQZtwgRG7w==
X-CSE-MsgGUID: N9zDd467Sg2ODHr24OGUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376698"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3AA9A122E17;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taP-3Wsk;
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
Subject: [PATCH v13 12/73] media: Documentation: Document raw mbus codes and CFA for cameras
Date: Wed, 18 Nov 2026 15:27:18 +0200
Message-ID: <20261118132819.213473-13-sakari.ailus@linux.intel.com>
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

Document the use of raw mbus codes for camera sensors and how the
V4L2_CID_CFA_PATTERN and V4L2_CID_CFA_PATTERN_FLIP controls are used to
convey the color filter array pattern on UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75fd9166383f..75d783b75c48 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -39,6 +39,19 @@ format set on a source pad at the end of the device's internal pipeline.
 
 Most sensor drivers are implemented this way.
 
+V4L2_CID_CFA_PATTERN, raw mbus formats, flipping and cropping
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For raw image data originating from camera sensors, specific :ref:`raw mbus
+codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
+<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
+raw formats. The :ref:`V4L2_CID_CFA_PATTERN <image-source-control-cfa-pattern>`
+control in the same sub-device defines the native CFA pattern of the
+device. Flipping may further affect the readout pattern as indicated by the
+:ref:`V4L2_CID_CFA_PATTERN_FLIP <image-source-control-cfa-pattern-flip>`
+control. Further on, cropping also has an effect on the pattern if cropped
+amount is not divisible by the size of the pattern, horizontally and vertically.
+
 Frame interval configuration
 ----------------------------
 
-- 
2.47.3

