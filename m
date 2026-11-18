Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008548;
	b=EO7RvyTltRVO83/arPX7RlYV/triA39XREZiLiImGt12r16fHAc7l0HxrrnsUUGxxpvU
	 D8tRWSMp/jZ5X7iDhiMQ636EcWg5UlshUMu5eJdVl7xl+TYTFmlUK8st+zsmges36fKUk
	 Dahe91YzrJF3DYAgYabAnAQzaF1TpOg5W4fJnB1DodjeeFhZCk5utLC1HYUTXtoEuSp2s
	 PHoeY+G+t57LeCMT3scJrtDqgXsm/0X6F0SarRZ19g8t2C5grIdW2rd+pkAWq+TjRXuH3
	 7GypgIViYzqLLHBZ7jKVu3G/h1mRMB9L+LWxPe5vZn3MEMaJay500KNPKFy+07XlwbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=kDHXPfhiqStEAhBhHodHOeHXKe4vRtDCxVfYu/4W6zE=;
	b=rL3S0H7CoBWmacXsl8wlJlEnaoIOkrBqHzCajgW21pDnhy82ZzOwo9KOuDNfLoi3N2mN
	 +AYjhBy5XGxmYVpzhOIlwC54FtDgXvLWt6Vabpq1ewizICYS5/z9KNfV+gqYLUA6XRtNy
	 2Cdu//ftee5vUMpCdXMuzsA6kq0Kas+8/6fLAv5Qhwl8FqlINFkbXKDmgVhH5kUvNQlpO
	 TmejjRlAQYujIFDjTCIFhA8ivYz18/61XzFXju3u3hEajC/zF6+Ud1oG3gX3N9EBp4BDn
	 EhOqVXqyucGBeQK5ydQvdaaNmFXOLcuj0S22ADrQ0HClcj293FGW6+eH7bll5Q7y9CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P8fMipVm;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8E60A2612
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D8E60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P8fMipVm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008548; x=1826544548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KT+9saEK4P1RPw70hn4RS3EbpehcYziuDrs8Lwu6nWc=;
  b=P8fMipVmjE51VQUC/aKfR6qUE6qcZ1I4lytkrHYD38tWw/cg7z7txgP9
   OBgrEHq7jw0EnS7KW/0OesuoNhtcLxKfx49xUJe+UHiKyIQelOKXKnK6P
   do1l6+6IPCDjgxxQsocz6ZiIXZG77tn98W84vyC9+tn7C3mCf7RkTaD3b
   ttvZjTH8+ZbuEP8yO0X1C864ILy+nT+5gVHWtdh5EFT/khR9m5cpa69jV
   m47bsRXq20p/I+/dcdELeobAZfv1YDKaDo4LNq1CaOvLEfYuVr2DrHJdS
   DgWkR+d4M8HbIHBtONuXcqU3uBLtXsVWNW0JZ1PNNx6H/S8ocVwxLBPnK
   w==;
X-CSE-ConnectionGUID: kO/uQz0OSOiSctgg+/t0OQ==
X-CSE-MsgGUID: Hv8oxgb/SL6yALyaeSBw2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808931"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:04 -0800
X-CSE-ConnectionGUID: insAvpWETvG5nH9R+YYJhA==
X-CSE-MsgGUID: eXCvxA7mTumDQABzq3KhYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376785"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A42E11230C8;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcD-1Dwf;
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
Subject: [PATCH v13 40/73] media: Documentation: Document streaming behaviour for common raw cameras
Date: Wed, 18 Nov 2026 15:27:46 +0200
Message-ID: <20261118132819.213473-41-sakari.ailus@linux.intel.com>
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

Document that streaming control is based on stream number 0 and additional
streams need to be started before that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/subdev-config-model.rst    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 46248c9d50ad..f606cd22a1a3 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -99,6 +99,16 @@ following routes.
 Support for the embedded data stream is optional. Drivers supporting the
 embedded data stream may allow disabling and enabling the route.
 
+Starting and stopping streaming
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Starting and stopping streaming is controlled through the stream number 0; if
+there's a desire to capture additional streams, such streams need to be started
+before stream 0. All streams start and stop at the same moment.
+
+This is subject to change in the future through additional API elements while
+the default behaviour will be maintained.
+
 Sensor pixel array size, cropping and binning
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.47.3

