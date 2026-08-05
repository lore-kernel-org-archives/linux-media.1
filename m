Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4947D93C
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946320; cv=none; b=G/8DnkEUYjE2Ivv6AsySnwhAlGc8vm4mew/x/ukOdB/qDuiV061rF9gOYT8TZGEcVwoWKjscDkkn4vB6ORVy3L56zedAJXrEq+GdRlCttdnOwM2MIedxQMrys47Bqds+1yMfnjUWZh/7tkRGBz75UdFsqBziBBAzg5WtU0MLU48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946320; c=relaxed/simple;
	bh=Ub/KzKuNK8C8JkzXAAOJ1yPuTy3t/O4dOjhqpJfVmcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NcLW3s8aYJ9Vv048vy44l9Rk4D3AdK0/EXEznHVbB/K199+y7j/448KDuy8wMcXC9HF32cyolQRCVMLOCfZiy/QCMxNRLjkTIlt4XCfkUVCKS5N/vQXyDFw12P3ygIqbVbmgIw/miiW3IReDFC+PaLNyhM6DvBJ+NHH/KjznUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OmNc/JYY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OmNc/JYY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1047573f8f.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785946313; x=1786551113; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xyoEoQkQirZXAs0MtC6cd+mxlW1qQbDSK8DkuQmSYR0=;
        b=OmNc/JYYu8wVZMpc+4DhD3TKJjrAZNsFbbRFZHR409dJ6WijqspcsxLDBVa/fEu8w7
         Ye/KZqtP0rmoLNumMWeRGiHUF3s5t4ukAbnolW21DQaw4fBwHm7yKor7Z4c8UewdgQgh
         iUEM67uCwRXAI4zZ7lC9X8Ik6SLCMALOVIcMRhAAuCvS6s+zPmvjxnT9W0pvAxf1ZLAZ
         3IK2j9JBscp17OeMw3RKMej/v70l4BZUcw/FrK/xGxuBE786JcgsorzLRqr31QwJdQfx
         KLKphL6HfJAGKejVniyG6t7LhAVJIg3E5Y7OAM30aGdvGZHK4qu2jc2elJ5/6jiFViaG
         daXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946313; x=1786551113;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xyoEoQkQirZXAs0MtC6cd+mxlW1qQbDSK8DkuQmSYR0=;
        b=qOkvDI8iGXAJctLsaUEsw8Iw7KUzU2sQXkyAaEX7+98NYDdcVcAQK0cUQTJ4RZmn65
         W/7S/QI85zEV2q6ej2mMQ/bnlKSV4QXwCAsccWvpKoY8A4t7DprUgx0SMR/UcP9uU22c
         V27Wnx8pVhW51rWKxL5oOAUeZFejmtx2o62ucXibULk57471ANDq3qO6M3MJDVQ8qsZk
         QYkgHzr2j7AIeI+aQFIx53ghYXTGO2PIkgpn3IhtQ0QsGOYxXAymx0uFIAiEfPGcQP7w
         PpS5iue9vdMInH1TmTjebIGij2+CsG5Q+YKsyohO/SVt6gTx48e5uTbxzo4j5Sd3GR4E
         Nv2A==
X-Forwarded-Encrypted: i=1; AHgh+RrpsLHcUy4jbu3ZcXHVgQ/dlZvV5+Exm0uDijfWIi/RbrM39gqSLxqZPqHDg6qQYyj0oVy3r8gCD01z4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZedrDZwCpTQO2yFR413LOxD1h2fuB2il1Q532zrWrY3Tha6x/
	45/pk1SqrKY//nLUdp7cReP4eolDe6tgTq50hsFblBeVjibhlX98LIsgof6TKXtHgUZcij5UtaK
	oTB7I
X-Gm-Gg: AR+sD11+JnC1dXrCzAC583AfUMfsZZaz+4n0c+EP3+m+DTznNGCJ3COfCfyu9PZE90a
	Hx95KGs6cZpK0SmvLcSiW4oxXhGA8/twskH6i4K96ldDxQmEXBv3OUwtX2deKajr5Q/Kcq6ZD7N
	TnYNVrC/cMGOcdP8taO+FJqUuZ17Sdg9b6GUC2tBuzgjhUjj20aXtttli3Hohfbo9owDhxcu6N5
	XAflp2UWyId1ZfVs/tT4XChqdUdr4BoAai/J9eu3ZSP8vMspumm4tgTSew2q3PCEa3/FPwaacPp
	gOC63TjF8KzhIQQ5QDlI6js0Z8/t79JH2txTHeyn2qFzgFIRt1VAuFvhiht/LeQiWSv6QVpYiPu
	dDAsVRxZ90WeBbzALm5Zg3ScXwwNunUlvout+o68Tw3xNkegdpB4P2yGr+hvdhtgNw9fa865O+g
	ZQkZwpXgM2R3Xire94K7pTFSHr+S3URv1yHaOMZqcoRAVQ+AGz0o9LQ6/WdJtpBe/fnczmL98S4
	kTFRPQNWa6IeezXTYNaFJVwtEGgT00Zp3rTyyjH
X-Received: by 2002:adf:e001:0:20b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-47fec51f260mr10891728f8f.13.1785946313147;
        Wed, 05 Aug 2026 09:11:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm9802575f8f.6.2026.08.05.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:11:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH RFC 0/4] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Wed, 05 Aug 2026 17:09:15 +0100
Message-Id: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtgc2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3dzUlMxE3eKSxCKgYiNdM9NE06RkEwPTJHMTJaCmgqLUtMwKsIH
 RSkFuzkqxtbUAhIAF/WUAAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has been accepted.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated.

This set proposes a common driver that is working with all 3 of
those sensors.
It's sent as an RFC to gather confirmation that the resulting driver
structure is acceptable as implied by [1].

If it is viewed as acceptable then there is still a modest amount
of tidying up required:
- DT binding updates for the extra compatibles.
- Rename the common functions so that the model references are
  only on the model specific parts.
- Add the Sony init sequence for IMX662.
- Check the init sequence for IMX675 (I'm waiting on a datasheet).
- Update the 2 lane mode handling of HMAX. IMX662 can achieve the
  same maximum framerate in 2 lane mode with a link freq of 594MHz
  or greater, and I suspect others can do so too.
- Hopefully add IMX585 (8MPix) to the supported list, and Jai has
  mentioned IMX676 (12MPix) as well.

I wanted to confirm that there aren't any major objections before
doing those cleanups though.

For anyone testing on a Pi, I've thrown a branch at [2] which includes
overlays for each. I've tested with modules from Soho Enterprises,
but there seem to be a few different vendors around.

[1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.alexander923@gmail.com/T/#md6a186b4abd05fb035d020ce0bc562455ef5bed1
[2] https://github.com/6by9/linux/tree/rpi-7.2.y-starvis

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (4):
      media: i2c: imx678: Always program the sensor in window mode
      media: i2c: imx678: Parameterise the configuration to allow for other models
      media: i2c: imx678: Add imx662 support to the driver
      media: i2c: imx678: Add imx675 support to the driver

 drivers/media/i2c/imx678.c | 451 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 393 insertions(+), 58 deletions(-)
---
base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

