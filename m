Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9465616C0
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420110; cv=none; b=QakzlWy+/F1x3RiG8ApdgoX3Gl3IxbU8hdWN6NNcME34Ey9uGiaJs5jlcIenntRLjtL7DXNFnNk4jj82q+WpQbLLN0TTOgME6qSWzMKCB+SQ4uYQiFEj1fdTSZvSa+Zdb1QTrsDo2KbYCEvsI1sdRzSiI6ZsT9vUo/V8CBOv8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420110; c=relaxed/simple;
	bh=anBcak3Ys9II84vCh2gVKyCJfNBmhw+4V0+PFeEukjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWUD1jjB5YxfkUp64YDUb2vchcO9Lu+KnBHrAURTQKxsu99D60Y6Uy5QpMcbTuMVcK8vrxm9+25yNpVL96Ee3emPakgC/XEE5v4zi6pBpTzvfHZV6EyjkPij2UbY1qCAs4dlC6DlssfAvwbxLrZ21ywDhOH4HzJvQxbNwwdb5wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=FevbvPPs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FevbvPPs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso4707785a12.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420107; x=1793024907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcJ7RHtekvu//YyovleHaPy2Pek3quV3iA/aby3t/xk=;
        b=FevbvPPscMs209qdlZGxEMLzToIPgPCcL4dsixfI4DLqobcnqb+wkQkmrSY1D3AF2z
         siZp5ELrIurk9c2y8Jmh5PHbne3Yw18ZCKSGElEtBkUEuqmE0M38cFhJSS+ikPKrQ91r
         p288Yi8QSAFQ008a2s52zsqU1DPptxcfgSuWpnmFRjkPvEfIyaCRq9yO7MoJldbDIAT/
         L19hQZdWSR325tso4Kf+UGZ93Jh9SO22rZrbgWs2M7tlo1UrYGTiMCnJDm4DMJpdMM1t
         bfuFODTxqwlPR35FR/xvmemTT+6SPi2EmVgwxxYUgpqnyvVEtJfrUwomcAbe7XNkPHib
         AFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420107; x=1793024907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcJ7RHtekvu//YyovleHaPy2Pek3quV3iA/aby3t/xk=;
        b=giUpL7R29K/XYiKKdW5s7LFk75IGc9icQu56OUKdjo/EdYjqpGHOgttnN4dw1kxneF
         ovpw0PXBF7ZJkR5C/ElCkwAODlTmFDTLgICgcYPEPaY1rBJyq8AAXW9iJPSzBBOLr1Qu
         kbBmTcne+HnlWZgoQf8W2rk0Qx83LOlfKQBIuyVjwA7jh+XRhsb8QZKcrHcxlNghwA1q
         AzUHnN+hMRGjx0gwVuzRaieHZi1utsmI5Q98XBVd9DRvg/XHNU38vo2AAkvxgenurRXX
         /1fo/PiDS5RaBIH2mJvPBUzFJgYoduIBKeWBQo5qJ63NYXG97X4fiRLgoUW0CgOuVjzU
         oVvw==
X-Forwarded-Encrypted: i=1; AKwUvBwuKv+Ymbw4DkDxU//lLnINEKla018mRDtgGtUEqq8/sBempJSfUV3j6zcBx/QBtLSBzjHYyLYoxTJT4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbQevWtwM81nE7hHPModdWuoW1x5qZ0R4Dtp4Xht7De++LxX4e
	hUuBwXUBSXnYPK4OFqGaRt06SJSK7aMVxOf8vEnDOykFkPaN4TQi3qteD+0aaZOimxw=
X-Gm-Gg: AYBFou37qBVMAyyYy+iL5HtBDGXn1MRQXpiUguRgIBWl8QkRPQjRezErHR4rh1OSMSJ
	/ubPgkphN80qh9tQRBQfnkCFsPO1Sk4SINWKp5zbZb3g1GN/BSHOQ9oPChFaw4FAiiYUdYjfxQ9
	D+AP0Pt+KBh0S4YqWaWXn6H7SLUQY8fEukkFzUASJE95bRvrh3xd61aDXRZYJNPfLDznSK9L/OK
	WzRLdmLNqrcQzV+APxlXPOluqbgdtafzUKJDK43jwPHDgyUSOYoh2OZ0FASLdQtX/HP7t3AkhYr
	hqJ6yzuOdT3qc7bK+ututngmkHKj7FOA+aCgxsj3rZYYy4Gm1bJq7XhcE94zAGDeJhY90aYu5ad
	fY6JAeHGssU1OP1gl61lZdgeHTz+3A6Ssw5IR7isc1ZY7xILC4kwTS8+gdYgJYzpz+X8NCWMEAh
	+3Shg8H+ZAB93e42WfZW6iv21dTzMZoMIb6QkI7O86ZWN2d8l/xXTAFWs+gUU+kjxjX93T9+N3n
	zHBRztIkLQWUNeSonIOqlf3MYg5s15d3fkFf3YUDaq3nmpekA==
X-Received: by 2002:a17:907:c299:b0:c25:4d9e:bb28 with SMTP id a640c23a62f3a-c401e03b0bemr808167666b.3.1792420105499;
        Mon, 19 Oct 2026 07:28:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:10 +0100
Subject: [PATCH v5 03/16] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-3-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
index e5c56a1d09df..981ce722bf8f 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -922,9 +922,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

