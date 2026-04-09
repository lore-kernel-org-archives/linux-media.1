Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4A33C192
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765729; cv=none; b=QABBnYNIy+dRxThpxalS7L+tmnoNrufypJ3/8KxdsaExJ4cNhvp5RHMV1JrMBiKZO67mIQiobE/RRKOEa3on5ZBObpSis2pwDraem6BQhlk4GiQTKbxxBr9mmydQ8gkE1nXwoD5HhVQw387MJih4yBLvXrvwLoYbJMcfpUcaTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765729; c=relaxed/simple;
	bh=ts8udkfQv9yW6T/Sl3NCznW4VkiG38g+VCHnxTNIGtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0bIifTGkYNxWC3rBSgY4VoQ+y5RSdTquWEEMmqzra15wrCZrQKp9sytLySVEcajSsn02LndarSDl5G5Wl0zP8tybTse/qFu7kRMcDk66L3WPRtFMk+yvskLS4KokHI7zivW4ZYcFf9xHkvvWiLntpDkwjpq0FzhSQVf3mK9yjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cH2LCcPd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cH2LCcPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765727; x=1807301727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ts8udkfQv9yW6T/Sl3NCznW4VkiG38g+VCHnxTNIGtc=;
  b=cH2LCcPdjjQwnEHyYQI3wnFeFZrHhkUD5Up4Ffa4E0VqYnjPgmSz6S90
   gzg5Oz1DgfOQ0wUaKZG8xt7/qNx2KUcdNNRBVW/q/6QVGKK5TUrOLPUIf
   j/Aekal4po7MoAmW12TDe0C1YXxnqvxpmlKPwooZt5yl2qDnFL+5WUxeq
   Jy/bfmelprbUC534nSfXp48N8tnJBKHSz6pUBLb5lcvehS+gvX82f7VM1
   iTVRibbdbn/CA/ZAZ2D7NaoviqhPbwXNHSKDq010lJrkQEu094g7ao1n7
   13QVDNYv+TTFBYI8yGzT0ygndTIuN/oTW3s3BPGdVhgvNY2PgY9K3B0Rb
   w==;
X-CSE-ConnectionGUID: ZPoe2eIPTXOHKDVh+x1Y+A==
X-CSE-MsgGUID: 1MkCYhtUQfC9+opvR93VOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409046"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409046"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: pLbnEOOdTJGHAesZW/e5MA==
X-CSE-MsgGUID: KvweV1pySyWDAyOG/6oWKA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 48E841223DC;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lF-33uP;
	Thu, 09 Apr 2026 23:15:01 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 09/86] media: Documentation: Reference flipping controls in raw format docs
Date: Thu,  9 Apr 2026 23:13:44 +0300
Message-ID: <20260409201501.975242-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
index f3e4428c4bf1..e1f96987ad59 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -139,6 +139,8 @@ Image Source Control IDs
         pixel, and a red filter in the bottom-left pixel.
       - 3
 
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

