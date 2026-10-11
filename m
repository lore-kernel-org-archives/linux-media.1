Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521343DEDA
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728920; cv=none; b=XwSXmayQ9OdIThkbWTdM2Oiu5W0+a/n+m9q8Vo1NWtPiZ3gDGk0WVJXitKerwuOVlo/XGzM+qn4B3VA7Hv5aOSy6bmoTvDaEBnAVzHD162L/dhzWZORq1/u7vH4pvLiNATzUudWlSli9YkvVNrvMyuNnKLrIeha1HU2f/xuafvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728920; c=relaxed/simple;
	bh=CpuD0QaA54XGgr89B5B8ce4DjGzmnRX5JzeSslUXyfY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i65M2D7BHlt6J2E73WSZ+XhjFv5gy4U9qGFphKIlik5MXwMD+UsB2+QjYjBpTnEE4FFa0aP5rq4s/YhPjpOOT06Ky51jkqzbHOyAVptdxEw8sajqmTRmT383xYa0u7tFPs3WaAzB1o+SXGrYiWSqgB6F27JoV/xHBhxrRts0lTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=A+6QbaxG; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="A+6QbaxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4ehtai4zmvfmffpo7unbewly3a.protonmail2; t=1791728910;
	x=1791988110; bh=CpuD0QaA54XGgr89B5B8ce4DjGzmnRX5JzeSslUXyfY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A+6QbaxGGuZq9LkpSrYJXOEr58UDEqGZ7GUpgWW47ILVcVebw/x7ijpfWv0qX+xq/
	 edky9/K9e43lIkSnawbger2FQvPGr2amzP2wJdBFWA/3GbS82Rwh1l4UQpYZdvKjaZ
	 hLuJCbu8sVcxYqr3QSEz69mANUvm2UYmoAyYnB4gMNkI9hiL+T/BUaD7IcCfnd+7Bu
	 IzyePGIQGPanOaDBs/akakfexy8xRWxrFMuRmx/KOSG34am+Fz/6kFpYwtZW+vYUP3
	 AAx177kp2FDKmvT16L3r3mA0MChm9fK69P0ENM2JrnI2b1YBPus8hO/MOIdm7u3mVR
	 REA3Kwk0DXjyQ==
Date: Sun, 11 Oct 2026 14:28:25 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [PATCH 01/12] media: ipu6: Add helper to identify IPU4P
Message-ID: <bziYxj2_XWtn36YDqbArJhWdvuTN1uAYOU7w21nXsMRN24fNujGCNMggvs7UIolKdga0KE2m4Q7x2vaYUrQm623ZCMg3iMyzB0hBfu2KOcE=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 9d0a4f67c7a0a09c92797fe7d62b940b19143302
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The IPU4 family has two variants: IPU4 for Apollo Lake and IPU4P for
Ice Lake. This series adds support for IPU4P on Ice Lake platforms only.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/=
ipu6/ipu6.h
index 72c5063d5198..321ca1d57157 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -33,7 +33,9 @@ struct ipu6_bus_device;
 #define IPU_VERSION_6EP_MTL=09BIT(3) /* MTL */
 #define IPU_VERSION_7=09=09BIT(4) /* LNL */
 #define IPU_VERSION_7P5=09=09BIT(5) /* PTL */
+#define IPU_VERSION_4P=09=09BIT(6) /* ICL */
=20
+#define IS_IPU4P(isp)=09=09((isp)->hw_ver & IPU_VERSION_4P)
 #define IS_IPU6_TGL(isp)=09((isp)->hw_ver & IPU_VERSION_6)
 #define IS_IPU6SE(isp)=09=09((isp)->hw_ver & IPU_VERSION_6SE)
 #define IS_IPU6EP(isp)=09=09((isp)->hw_ver & IPU_VERSION_6EP)
--=20
2.55.0


