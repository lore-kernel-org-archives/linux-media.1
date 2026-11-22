Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397875;
	b=RrE7e7Q2rIeJwjpQEnoN6o8w1nV++CmIJpkP+nAVowJg1G79WSEq3erwOolY2RRGOWWZ
	 fqG/KDXFevn1gmg3gW7XITPzrtY8kiyYhvN5pLm2V3Z4px6OLzI8UBspaxdvbi00N7H7u
	 kHXkWhb7pFr0D4MW0XuYaVBH6D2iZyacmJ6gB89557172IUCRe6o0TVwfAB+gl3qCfmTL
	 IQ2Ff62hB51zQfeuCk7yhJw8PwBOLx+k/axLhrJfvf31+j/w+LwzPEV5BR1uWAP4HP7J9
	 JTWDB/T/ExHrJB0V+Vr0RGI+fx0ZpvXoBBPXs1K6IjLCGR2ysU4MIZzrjVi0EUAnVww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7HP89qCv4f0VaWU6luj6srJ1B6pPh3Y7K09RSutBYE=;
	b=EoXZLb/XQJfx3uOsVr9BqcBU1T+Gd0OHssTfIUTP3MBj22PL7okvtTsOyk0apusUEOOt
	 nwmdiDFZ0f5jSR3ziBlQpXSzz4YOE5DtNFqUu5ZBdqzs2xox3H+b7yBopadRKk08MtMZ/
	 kYOIFiiGGpWA6wa6pGZkF16xnIeTVR759RzHH5rd8S9t3vqt+3HdBc6JYpZGDijvArORm
	 QRFCRTPu2YMFSlNXiyF8t9HehNA1p/1tlRkI0KiEr8gjEf+hL/mkq1PQzz3l1j6Yn4Ahu
	 j3vA6A5uRaQfO7LJDtUqvNqPJ2435PXBGNX1PV4t5exS6U4e6SIjfW4P7Sf+3zWzy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K51SsqtW;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C0606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K51SsqtW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795397875; x=1826933875;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UvRPTgRa9MLmLa1gBhWTvCbSseQQhPyMH8R6KgnjI/8=;
  b=K51SsqtWv3D4nYkm9Msq8012lf0PCKU9C0PHF8z4DD6RAYQNY0axH/8+
   hSS/36L11hTg6HuvgwDvCEN17f+cCSXR9YQjCMzgSEjTVaEXlhrADUxmi
   MDFn9it+Or6xNiybqsVFxmNjRrzqM/IW83+TR2PSUQww+nkbj7or4Uss+
   nWrxtMDcKWqMxjWxXtk2D9irlQNz7Tb7aIfqjIIh6aVewaBxH7hPlufSJ
   XS+yWXpQ45V8z+f9eIhEVh+9asri6Gjr8Zrhtn1+MuFfx9xmDw26WzNEu
   MLZBncgJ9DSvhmQhyZs9Y6jqsJlCaMRi9QgXmhxsJZPTqcGJ2hs6ifEUi
   A==;
X-CSE-ConnectionGUID: ZFhzTev6SbO75KxNF5EfqA==
X-CSE-MsgGUID: nMIcm605S7mX/xUTxzinEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4091831"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4091831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:37:55 -0800
X-CSE-ConnectionGUID: vVQcmdQAT8akzZTVYbTtbw==
X-CSE-MsgGUID: iJgZH0PhSa2lANrj6xXkqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11173703"
Received: from pg12hl01tchew6.png.intel.com ([10.107.246.123])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 17:37:54 -0800
From: vunny.sodhi@intel.com
To: linux-drivers-review@eclists.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: i2c: maxim-serdes: resolve V4L2_FIELD_ANY in set_fmt
Date: Mon, 23 Nov 2026 07:43:13 +0800
Message-ID: <20261122234313.327866-4-vunny.sodhi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122234313.327866-1-vunny.sodhi@intel.com>
References: <20261122234313.327866-1-vunny.sodhi@intel.com>
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

From: "Sodhi, Vunny" <vunny.sodhi@intel.com>

max_ser_set_fmt() and max_des_set_fmt() store the requested format as
is. When userspace leaves the field unset, V4L2_FIELD_ANY ends up in the
pad state, while the sensor reports V4L2_FIELD_NONE. Link validation
then fails with -EPIPE:

  v4l2_subdev_link_validate_default: field does not match (source 1, sink 0)

V4L2_FIELD_ANY is not a valid active field, so resolve it to
V4L2_FIELD_NONE as done for the default formats.

Signed-off-by: Sodhi, Vunny <vunny.sodhi@intel.com>
---
 drivers/media/i2c/maxim-serdes/max_des.c | 3 +++
 drivers/media/i2c/maxim-serdes/max_ser.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
index 37f438608616..8e9ebfae0956 100644
--- a/drivers/media/i2c/maxim-serdes/max_des.c
+++ b/drivers/media/i2c/maxim-serdes/max_des.c
@@ -1923,6 +1923,9 @@ static int max_des_set_fmt(struct v4l2_subdev *sd,
 	if (format->format.code == ~0U)
 		format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
 
+	if (format->format.field == V4L2_FIELD_ANY)
+		format->format.field = V4L2_FIELD_NONE;
+
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c/maxim-serdes/max_ser.c
index 1c4cec2efb95..b4c1afd6cad4 100644
--- a/drivers/media/i2c/maxim-serdes/max_ser.c
+++ b/drivers/media/i2c/maxim-serdes/max_ser.c
@@ -510,6 +510,9 @@ static int max_ser_set_fmt(struct v4l2_subdev *sd,
 	if (format->format.code == ~0U)
 		format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
 
+	if (format->format.field == V4L2_FIELD_ANY)
+		format->format.field = V4L2_FIELD_NONE;
+
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
-- 
2.43.0

