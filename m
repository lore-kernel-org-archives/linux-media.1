Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4226FD9B
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607770; cv=none; b=JcEBYC86TOzyMhD2ZyaTzk16JC1Rdh8JUt8g/aCQ/RKlfOHP4X5ubE5dAXt94nCJPKGam2Bkx/D3T/0jhEe/iYqBAxC0DzmtBeIgdy0hYBWOBuMEgd2auuRlqGbnhtojEhTfht8M8QC7LzkzjUFaydxMoOyFSFMD2oc7dGDZS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607770; c=relaxed/simple;
	bh=VK4j+xu08h1wN3/o+FlfHYnuyc2SkPv12s7ZOs9MMjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2s2Mag1y6LWuy6sFahlCfLjYTB+H22ujo6glIrpKOyQwp5HAoe/AGkyih+OiYyY4SAB4nFTRBHP6zY9hvJDRXyBbRptVkDz8VYqrxrCuTKcvITS07mpWr5QlEfY3GxF7ksMQ9b+8cwbe6MDBQZgcqxkXQag8sIZRVvBBu8Tk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHoDOGUJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHoDOGUJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so6497965ad.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786607769; x=1787212569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YI19pGDcKtgcxpd8zZLgfvky7dUvBcCdOVpIkb/C0Ow=;
        b=HHoDOGUJuC3D8l6MjmWMCu4dfWHy/NFIbNVFJ2AbsSUKOSjcfihlRUF2hXD4ikxJc8
         DNVpmHI8yavPewBGmCoMKtO9wr5cZWCiqTf540jUNBwMrb21jIT9WS8pRLpQpDYgAjqd
         +MibLrGePzlYoQXiq25gkqurcFQTDcThoLPo/DDO1hUdtn2aZz3Pz68hCLcCtzrrjcWu
         8X4CbDoPEMUv6Y30oy2WwcFzBLl+ckS0kM6d4kdVC3f03eTZsr8MD0bqH6a9ZgkyXdn3
         nWZTsM18d6nED/z5crfk2076YEDgJNRjWhUSJH7c6trvanb0R+OiCIJ9brLqyKDU0G8H
         ZciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607769; x=1787212569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YI19pGDcKtgcxpd8zZLgfvky7dUvBcCdOVpIkb/C0Ow=;
        b=l9pFltfYsQy9gMNi0lmyE72G9gGXRtpDNH8Rs3HGs99GdIa68xrZJCXHpwLyRpY1KJ
         iK6Lyzly3Vng7og3yiYUIqxmycF0yTrDw0F8qdykfWUYqR6qP3AVxNayibuEZ5d710ts
         x5ag7mshlGVtuoPdEjPKhmQrZJ62F6XHe/KKTrFQEpcYtFX830VbEMWI093SqtXY7u/6
         6zXZ2H6jP1GHR5juil0avf24oCzVO4rftDkEpcpc4miY7oPTvD85sC5AxnnK4H9zoo2S
         04W55fH3e5RCQH4u5dbTdoSg539qgkaf6uzvBdpKShvndssa0VnUfD4StmxQXvOKtetg
         74vw==
X-Forwarded-Encrypted: i=1; AHgh+RoG9UXCsP0za4eBQSv2fjRH1QphNrQh93pirqGbLt3j/XC6Ql2iKOfhJXM+QWgAd2WsSO8e9kzkupquRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVm/pB5AD+Kl26os9mmwKOi687UdIOOJQ56+Pb4XqJ0DTtoNh
	7n2Pxd6IQRoWdeG2oUx8Xw//xbdx+Myw730HZ3uSwtf/RGAetFYspx9f
X-Gm-Gg: AR+sD132gGw/LGwhFWfBdZoLZq4Y1G3AMyktGhc0Ug/FzGgATVohxNTrO9GG9BYedLN
	HFxNJbWJ9C48SAiJyPXtmbMzNgx/Dz4fV4kiltB2nkoH3ymd9uLqwz9SnqxjxATvfbJNkYbufxR
	gv5Lgn4wjj7N/Qfm+b6Zkxw9wZW3CEqfR7jYOOh0Mu0BvNupOGR+xqOycfNDZ+RKsBsrwbWAxVI
	qkIfg1TzPJTfV/zRJuetpUXZExMx5PWOQJ0vSPHzpuOeVrE8oDKP5HQIWKL9wpAes0LCA7UQQo2
	dLPJt636J/zBTpcyiJogpeIBF3MuuEnet/4r5RMIGagd9mka7Ash1BVJ6AIl4EOZKMbgQvaB6wX
	Vyzfe+LOWMijZyvbByoAK02LVKud0Tn/rd4kiJWiEf4DMmdsgZv2JuBTRnBLRGLXtguZ80zXxmB
	IDhZDehDKslE5IVU7FJhF77g0T/ZpF24aUP8eKbD0Itu0tjSI5RwrJ1MxwEPzPswMC+C9w4Yk0i
	1B2ObAeR5rWPCBk1GW76bxS+TLa5YM38ElsVqm6/t1ikw==
X-Received: by 2002:a05:6a21:3397:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cc5533a206mr5508818637.25.1786607768959;
        Thu, 13 Aug 2026 00:56:08 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d961e39sm9545397c88.11.2026.08.13.00.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:56:08 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Use ARRAY_SIZE macro
Date: Thu, 13 Aug 2026 07:55:29 +0000
Message-ID: <20260813075529.153217-1-rishab.madhugiri@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an1vaFk4UrhQPkSu@stanley.mountain>
References: <an1vaFk4UrhQPkSu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up loop bound calculation by replacing sizeof(bds_factors) /
sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
to improve readability and maintainability.

v2: Move loop increment to the same line as the for statement as requested.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637e..e8734ca1a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2160,8 +2160,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	bayer_ds_out_res->width = effective_res->width;
 	bayer_ds_out_res->height = effective_res->height;
 
-	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
-	     i++) {
+	for (i = 0; i < ARRAY_SIZE(bds_factors); i++) {
 		if (effective_res->width >= out_width *
 		    bds_factors[i].numerator / bds_factors[i].denominator &&
 		    effective_res->height >= out_height *
-- 
2.43.0

