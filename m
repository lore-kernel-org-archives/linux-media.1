Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5D526A8D
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904668; cv=none; b=ly5nbBeUGeAHYf6H2csY+2eZoGF7i3S34RLXM51PfenjEZZC2j9hjBuRkrbqMo246trWN23qZ97WpskkJPkHGbmCSLhCTxk2eA3sgN9o302+uby5yKcJh6CMl4BDyXkiKOKCZbrPxB0mwgCxLdE51LIsy2WJy0Qzu15XWeogLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904668; c=relaxed/simple;
	bh=bz0c0FzRoFwONs0INWzutnRV3/uG+7US0x6YY49BHmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4JLSfCjKtTMAbNX2gYL0pnogoZoJNmTSscmc8NQiFounEcoAmJ+0LEZIMf8H+EkT5N2zvDksmV6n7FBQeQtSaj08Ja9eStH/ej41X1X/iom8fjHYOFi0IQ7KwYk8f4TRM3JTMyYV3wofOF8N+FSfYnRyFg+BBn4sQqf5qSzUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iM3WoLBE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iM3WoLBE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b02a2359aso2934479f8f.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904663; x=1792509463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hnlvbehMSyPR6UnmFPNMKU268xjGZhcR+ZNGcu0l5I=;
        b=iM3WoLBE1VaZjLLXEMM9S+0ic9vr81RCtyR+I4wPQQWz4a78U0FJw2uQ223vH6wK3v
         bubob/J8xvnfFs+5vbGFbkoFgqGp0jKqPr5M9VO+NAOzgAsOJYZyI1zPLbR6FBN+EZTe
         vIKmPX2oZN8l/+hSG5LTIQV7SDXydRwSzOElYhVqFg1lhd5U7GZmmiiZLacLyBf6TaOK
         mF3dMNKBb+1NREbFyrzlyE159ptUqdOgNf9no4DFvjfN8SKZPWkjB+w9Uyo0WYQybP6n
         TMPXaDpFPzEn9X+fkny27+fEkW8eEspw9wMYn9vm0125qFBU06/qLh5b8k6WyJI2Ubw0
         iITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904663; x=1792509463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hnlvbehMSyPR6UnmFPNMKU268xjGZhcR+ZNGcu0l5I=;
        b=uA4+pkp/Dvos9pwjHGd/2BCqdfz1kzHe0qyiBYRt5jwYyedcbDtEMdsg7Qj2Ixrirr
         k/xaMrLUZwUBwvJbZ6rH6gE1iQCVWrD1QD2bMNp3L0X4LPOOZx0Ukw5ylWVKoLu83NLS
         hYJRbfHbqOfXjMum7kDiAcTHQFC71OmNxmjtOA6IL/PpX0gngSl6pzu9904JZQZ58veN
         Par55PnUW12P3+skgA/ghsoYSxwkYrAF/9EpQ7BCyqDRJqbh7fzAkS7BD54sQqv2Fam3
         K94OIZKPx5IEX8Z7RQKqjYR/JCx8XducHDP4MwfjyzX/aTQkrmSI0HpnzP+20c3wEuxT
         q2Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzAenFpPxnkm3sL4yYq6QBokFLUx3MFNh9Wkvkigo6M++nahUSGgPqOyL3n2ARe5/uti+qlgMGKSJre9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVRC0HljNPqozgiByMcNNF7vsjEzvIGvoh2RD0AfKryd5uX931
	c+ECFmstKHWt9X4IM/kc1OOBnswxvd398O+dZrWVlx8s9gHBoYfdG2ZCRBHU06mb9+o=
X-Gm-Gg: AYBFou31sB+PSc6zRR0+SI4tn3Pq26LNB1jWDgyGtkzPGqjiydPbDQ3hSS/s1HeSbAK
	MS4oMsITf2SIjmXLgKSRL/I23RTmEFTJDeSKPs/STqiepjWZhp9xlOCa12RA7WZ5sjogXY0ZiWz
	KnsY83T31V01iSjRGJ9FtB+0Jp6nl3b7FIA70XMCmcCOggtlPNWoB+9EiCOngOa2exwe0j/ScDN
	p0CyheUGJ5ww3a0uleYFVYDayW3ip70CBt52V9YYlbFm5L989CnRFpiVRq7ORm0GszMF0YYj1up
	lhZlSiPPZFbwDnRIXOfYH4vOYYfjA2mFvRDwu5/XH3tZ3EabNCxmLXwtVtZV18G572o9Jah3DwS
	jHbenCagFtd/Iwn4B1E7Udt80UZWvKCnRCcHasIbqMu09RAY7ugq5Giqp+5wy3B1HeeweOTzLTI
	oJ7haQGqXUbavTpFKRUrx87QEbKXk7uM6CcYmc0PqOgyN0bQEoXP//2LFeJfyBY6sTA6nJxW7al
	L3nnBS627WNmAhiyMH/NYwwtChoimPuPLXhgYDNO8iXkN7PGQ==
X-Received: by 2002:a5d:444d:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48dbace132fmr20717882f8f.18.1791904663170;
        Tue, 13 Oct 2026 08:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:02 +0100
Subject: [PATCH v2 03/13] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-3-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
index c7fbc5c132f4..20f3489b58d3 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -918,9 +918,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

