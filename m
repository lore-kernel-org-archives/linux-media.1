Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283523;
	b=duMYmPmjHiKOVDs20h2jg0FhpjPTZ0dq671zkd+cqhC4Yc1zWMl1BMyumeHGb01PkfeZ
	 +NeFwEURhCOZLAcYjDfhQm7ub2TvTARes7tbbOWd7F1PyK0mGG3ERuB8LzqcnZ17MeGPP
	 5jA3klEdEQmEHpKZ3hUjKEIQ0kjnVVhUMu2wGXXiHbOVboe7233TcVqSiRTZue/TBzwUW
	 X8CKKc514wkCns+D9mTel1z/5S63mtKTzzJ+QPRgwtcVGdwPzsase9EeJT9fMzomBz9DJ
	 RJPruTXnzURyIErYy4pHBQchIJvBDnm7iBEnx9XzioZh0rJyfkiDZMIg6BDvVHZ+zhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
	b=GsDE7OFwBaK3qTsiyYUZ3zCJqsEcnacRW7NGv9IICqRrhx8vHJLb9VnPVZVxBaq+jQ8H
	 dr+2y1mPMLVA2pCi1whW0LiMBkmSwUVYCX32iVbNkubFizIchmamGLUMrX+L/bCKgjgP8
	 yEbO6XutflhLULQ8nJhtEYONrNsGNhEcEmehPiE1yHb3Bqwk/fLcEkisbyYatRCtjqwAz
	 mrY2vhDQpBLTTjt3sa3jHKNbb6IxETY4zU8BFjC6cH6+0J5OdQTw3b2lKuJ1fgg6l+h8k
	 g3ptfDawsfNSjQpwfReTbY4R/MfGPdFBccJoEnp2Azl3VYSxLKpVEtpZXsVtYyJfiQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=dhOIy7ji;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5270C606A337
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5270C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=dhOIy7ji
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so14563985e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283522; x=1793888322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=dhOIy7ji+W6TANGxzif2oMq88Dm7wMUE2qvC2UegV47Jc/ZPGCdEcPXmtNrZb5Sbb4
         YInMAP1Z0sjxqTUkaEwsh8HiY5ycIA1cWtTSLeUAklibQONfVo0O1r6l6t8CsXQzWumG
         GC8FmGUj7fGdZIA07dyC4ksOChVOiNGdTtfiIMMeTKwCgloi4HWv8ztOG/+1qVhc/H67
         TlpDsbhQpKdeZXNmov1WnX8DPs2nRGnz5eRJ6J2zZg87GG1MtZeGxfeQc/vyQ/xLBZJW
         0ffWjtD3z49GopF4q+k4Fi3EyoNRTgV9I1hj4qW91j+AmKZy4lvWBO0r7VGiA96qRLHT
         Y+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283522; x=1793888322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=wmQ3lvPop+qkGPs9Ad6RiCR7QGZDgRlN5TexS5BsOdn6S1byiIa+k95yMUd/t1qCdT
         UdSoL0ugeumjyEy7CIQWccsdlwrwk54VV+AlqOtgYHU+6Phv2XZ1LPCnzDo5BZlz3Mr4
         VyNfX7MVOtQUw4ume/Qq8F2mKku8mkotoWxwhL7XWmDsQxfQCKOSGvOFsFH3kpPpM350
         ofoRxHOLIQ4iB7soP4/GRJZ7i4Bo96kvCv81TSEnJnCg8IPHB708PSUVPm/XoZnG/Gyv
         /ZjHJi0UQwUVP9x/zL2ZZugjew0p+edPqMmjjbNxYlLz2+64RNTuIkXxsXNKlA69WXQR
         kQ4g==
X-Forwarded-Encrypted: i=1; AKwUvBxUPSasXhoqX4ll5V5KG53mrdj7Rcm00ywzQ2+bce1AczpOjDfWQLtm/F8UYhCwAH1UkBwJm7DqUrLh6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGde0OBLahjZtIAGbbYc4Veq1zZNiqTSl5ozA39jvHv1xi09S4
	iA3WtWVhqtPSI5gAzzkbNMYG4CK7/LIUl+1gY2uQ7O847AcZDmFXvrOi7LneeDcuIHQ=
X-Gm-Gg: AYBFou1aBSXE7r+gJCJSieAY+/T69klQn0CrsCa2opzyWu3Jlq2ds1WTAytudZV2m3N
	OXlWZsVUWfQC03k7Nl9wtZkQ/FfKAuRrEuUsKHrUw56HPL2Cf9uWVvtoz/zPlWGCxo6qfdw/4QZ
	OuhfsFEn255nJYE1TZ6gJEo7d80o97nvIW58PJmLQr+GfZ+Sq1MPXAa8/+oAObDnj6yyZ9MI2rj
	IbVnL8q4ZwRTOFfuAF6aNmjOOxfJuwzeRQ9RxirHutBEgrtyG18e1MtPBeh1ufCSSeIYmryOkfI
	DN77sBWYkcqmfiredYMKNKQoIyCrtzQcKWdaEoB+sxPMyiChE9esrvZ1icbjgEPWrWWKDbrRHgL
	YZrxJ7dncBjYLN8CFY1xUgWAvLS9SOTkRCSH8kXrPJJPm32Z2/QpUmRdbC87lGzAMDtzz11qYvK
	SJgSm5fwSHZciGQx+M2N0hvQ/3XTZhFTkX+LFblJwubXikU/kT4yw0ngIQ6AH6UD8JUUB+ymP7h
	5CtdZgtG+k7VHjIeycF/26RFuK1awuPHxtO1Abmcn1xWdEQB7m6S/C9KqAb4/iSe3ck8fgl1uuw
	+DDa5olH64eqJxkSaorMUiflbgZgwwtpLcVvzqIHkloeCtp9XYcOV1N/dAwrY89WiAudqgJxIbE
	EAGDf
X-Received: by 2002:a05:600c:6209:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a9640f231dmr129989245e9.3.1793283521614;
        Thu, 29 Oct 2026 07:18:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:24 +0000
Subject: [PATCH v7 03/18] media: sony-starvis2: Always program the sensor
 in window mode
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-media-starvis2-v7-3-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 134fececac5c..31aa1ec6ba40 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -923,9 +923,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

