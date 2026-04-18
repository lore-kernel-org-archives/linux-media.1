Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B92F2571BE;
	Sat, 18 Apr 2026 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543489; cv=none; b=VqXxZ9N3P5qmDo5dWwB1+XyfBOsGAzHLO/J+RJc0ZtwmXw3krK17YngnqF6eorLBlAyk5HQ/sioCXiewWDaBzyDjLV5AmvB+2zPV+wrzhZy6Gy+kOIs7yflCf0H9iu7V59LAexAG5n2RMjw2Y1bV4s2X3/6SWYEE5PW2T40y/cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543489; c=relaxed/simple;
	bh=JrBO5YbQDKA/sMD23kXqcEkmPjDyJVetYL0XxpsXWuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+NJxsr2lNrkqgqSvQDYUdiibMih5LzozxYHFCVUe1jb7SwTFrhxkM0moEAWF8rqHmqRUamFNZeWlj2jjPtYcToHBPEZfuMx3KkXUglGr3/6k+Qqm0wD9Ceig5yj5ut+wIyPTeVoXy1EPaN9v9+2LE5yTUTjSImjngcByinKStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=JQlLT/+x; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JQlLT/+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1776543485; x=1776802685;
	bh=JrBO5YbQDKA/sMD23kXqcEkmPjDyJVetYL0XxpsXWuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JQlLT/+xjbL1+4esioM3O6N8q2jlXYS84NARRRtJhTjY+QMo9Z4s4cpMvRZwU7qbq
	 lU6PI/Lov8i3A1A6o5pxqtpXie/fHxrZGV60H9CyX0avULF+5BUncmWwyetIfqFDvJ
	 9raJ3j2YDYHbs6L8xMyGBApdnU401BcwqXs+diu1eDV+YKvlshBmydHmZVQ2khiVGV
	 DxWwULfsurCBgdcLBX4/c6NuD25jUxSXOdTmpu413nc23FAJB5XjKHb3gJF35bix5v
	 8Uf0hqJ6Zm7L0W0wv/vQqfIFCeAAKsIUA3VdCRgf8u15Mn5ifz59Efs5pks8+Kn4TF
	 9fhHZFBZWdPvQ==
Date: Sat, 18 Apr 2026 20:18:01 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Abhai Kollara <abhai@protonmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH v3] staging: media: atomisp: gc2235: prefer fsleep over msleep
Message-ID: <20260418201755.2604188-1-abhai@protonmail.com>
In-Reply-To: <20260318212645.2014561-1-abhai@protonmail.com>
References: <20260318212645.2014561-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: af805ef3f39f723eb3dc035b5a2502a8e26d6137
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The gc2235 driver uses msleep(5) during power-up. msleep() is often
imprecise for durations under 20ms. Replace it with fsleep()
to provide better precision.

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
v3:
 - Use fsleep() instead of usleep_range() per Sakari Ailus's feedback.
v2:
 - Replaced msleep() with usleep_range() (Superseded).
v1:
 - Initial version.

 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/s=
taging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..7999c8595a68 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 =09=09=09goto fail_power;
 =09}
=20
-=09msleep(5);
+=09fsleep(5000);
 =09return 0;
=20
 fail_clk:
--=20
2.43.0


