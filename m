Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C76568529
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000474; cv=none; b=qHTgr56lt97ocXQNOphLsCGwNA/FV9Mig2QvD3vpBawpoZVe+wmWHwpOMrdKbqKAM5SJ1+pFC59j4LPBQ9CPfNsJuRvPf4X6pskIhcDKRKH87IXBVrIzpX8h0td61k1akjGBDotJB5vjAF4iv/RtSusAZBoEVcuxpfjGy1zpAn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000474; c=relaxed/simple;
	bh=AbDp74FboY/m54pfNSPGHJTdkLesKVKCn+j165dfG4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3KUyU94DXlK+oGyE8LvFghS6mJGV88qkXTwGfSHdMna7HRf6DrFuLrFehI5OxQh34d948Ek7/U7tIfLhm95RCivrvnlAbHjvO5mvsjdbiyXK9/UBwKm27R+fWZ5UytqEsodYvDs7AuJ88yZWMlX9BKe9H9oBK/44qmoJmd4Ilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=X9yccBPK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X9yccBPK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so31473235e9.3
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000471; x=1792605271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=X9yccBPK4Hx/qSdHwKnbDwE4FkNjyrO6MK1PGgaGdGIRtqteftLkVz359TKOMb7Zzx
         0mMhnm4r4sED+LTRyj/j5oBNY41LErXnTqxzMAsoCcn7CccI8MoSFcQf8pKo4eLyy/N7
         7myCCN4GzfdXIZt7wY2kY8WKVo0X9pedeCLaVdcJkg2I2qxRhJ3zKJlGHWjRBKqj8BLC
         YlsnfC4+NqXb1JFpPytdo+tRR8CqIxlFMevrmzCuVGwXvtOTVYLAxJ+WpWzKo93gQzFF
         n/Ot4zQpcT8/KMfa7sLLKj+trW43SDKJ+OiHXEa/oASIWKXJA+34ywLMJnHgbnQQij6e
         Z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000471; x=1792605271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=tbQy938djvVlG31bEm1AoZA6eg4bDY5ND4rJsjdg3AeK+VxcgdmV13uM4HQVjzMyA0
         mR1ADD5IJphY9nw3G9+y+inp9XtX8ejFKLqMt+7vAx6HovVBZtUANRhS1c345evUX+AN
         zhtQnicWj4QEDC7W8ru0aQC9jD0QiPi4pslPrwCDvs8Q3X0krnS1I8A1fZWRF6XtNBYU
         guzu/i/MW4uZnXiX3NYkUCRaYi4zTEgfYNUv43sjitRgNjT5OPN8M3NB55XwrP4iSfhj
         I7EM/9I+zaKe0gWf55lBCh8Gz/xOUSS97YnnJC/yiBCGx7FQs5ntzaIqN15Gej5kiQ4D
         OwlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVoJOHne2OB+ePJ6wy61ksRAU3uoxzJphniJra14hAa6c7ds0P+EkiOigUPRhBWuGm9pSXjSWsW/yIjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKo/eLGpX8n2bMEmtanOGzHX6i7QGz0D8u/KwxdEKrQguSbQszM
	kAyO4uNsWtzIjUvmoZxX0TNIDtkzctMzeHwT9ow+0sycR3DL/L8DvAcrqrsgewJByuQ=
X-Gm-Gg: AYBFou3aSJ2thUELcU1RmXCX7DWfjxw2YnTIN0OJChVqrReHU7WNe0E9MFK4glndc8I
	CsfWpcB6j/9TiFDc4h8MbU/Fe59ImoZW1f/mI89V5hOGy9m3Tg2XGHJ/2MXjD60vwZi/dPNDBK/
	5McgIXMTrZnPKPcwvtSPK0r6Nmf6C9WiziZg41T3E8LjthHbXn/pY8FMpmPz1s5oVocM46JuVny
	5v32yzP+MG7Li8MZcLGu1zuk2Ypfh6YhvJ1L4RJ97bMwp0SnvGwCZyjWmVwOOgQQ8tjg5VDcRFM
	JBTHNlY55zRuINF0GGHN0eTgs3Q7SXOMwj+/kvX9Sir4UCQUCf3J1RAVxlaidwpK/KE8KXgBMJ6
	7GG5nX/caR79Gl8iAO0JNlL0D2V8AuHr/bT5gyCEYSQAgtahW1bv+WmlrhJTYV7JHYazC1hPFp7
	SPNG62fORUd3j6Rx6kYTeiQBapQH2Q94zUMbPyRKg52l463FS6AanqZ9GmVh10DZTQQ3Rhd6qH+
	t4fjOaLrW0JzUdvsKvlKEJg5KrYUv0PfBtMYRPkYPvgPd7Wmw==
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr334100795e9.24.1792000470895;
        Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:24 +0100
Subject: [PATCH v3 03/14] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-3-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
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
index 3656658e18a4..c4f590c489d9 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -921,9 +921,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

