Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B636A363
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127731; cv=none; b=p5mioTDDIhEPCagyjE1wiK8pjLoeX0A1FQ/fFvZyb9SLmdYeeCUMgHQeFGRN9mi/R1/JFNXY9S/DsiNJoBgmaiu3DtmyZZQnUXkNpQL3tmdDiXqzkE3uh22zFeYzdBTa5HfdUL974A56c6lBxECPXVU9/nMLoCMOKJKkZcuJ6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127731; c=relaxed/simple;
	bh=aolz0CiZatKyYk/CfTXhIN7vFfsQB1RuyO8bvJfZhHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAjljFgCjyyiNQF762UvJQCH9Ot+3K8YTW5QbTJxLEqIPNZR96T/AXqotxXPnxE00zfJSbUOj+zyI3A2+4z5FwRaDv9Pt/liWDkDo6EaR+vlby2hbDa1OVR7Kwuchdhg1HTl7lID9Jzc5KKBf1LJXw+kbqSYYFZURd0tPku1/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/tGV5RW; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/tGV5RW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so3470029b3a.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 11:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127729; x=1786732529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71FmqS/PHvl7o8NluFQ2/b2PDwnrkoEGcwVSYjd4tqw=;
        b=d/tGV5RWpVDuXdMz5fXRIsAL/wfkZi+s0615IJknZ12OtJLLgHgTR92/55/gcJbZBG
         c3ZTicons9UeRH2BPPKJPjFKuw3tlVt78WDwTAY7bgwenWPyqA3JbTnEf4cAJ6Oky5TA
         eksTI8gqd7I7w9EoFBti2yzWFDTCHdoWFBp8tVamgH6lBvKlrBytCk68fldoIfoB+Vq6
         qYle4RSBrGTiGGJ4AB3cnEtqb1mM2ygZwXp1g9wkmz1UQBqZX8vkmcPSUhLnp5f4I5xG
         icrGHRzwC2fr1O3PMfyBD0hbEIfx6Qq4uqxUzRfBlG20EuVfOAyyj7WhmdZPaMmT+O47
         LFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127729; x=1786732529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71FmqS/PHvl7o8NluFQ2/b2PDwnrkoEGcwVSYjd4tqw=;
        b=TX2K/y8hzgQpilU/7fw6kxRilQisJgMYRPAicMGALBNhJJDKeCkkRbG4sZ/exvYPHo
         w/uny3wbY0I22pGo5as14rdX+BQFqIGRo86ZaOtLP9m/CXeUeX4Hn+tDmt63VCfWNUJR
         I1i58WSq26CmM8NXpBMqhjWh70FRKk7M6TFal+fiME3Z7eUkDSmAjp+6camrxP2MHslf
         1zopRTDuIa2qIxzCNuGihiALvXKIs433Y3xgNM/FckZW9aBsYRxaC0goZ0hjYfO3PxD8
         9mORlFX57iD9d/Hi0QsvlVhRDo2YG1sAERpQmOjYr+XI/om5V5HRzeKs6sMf1jrVtwi+
         at7A==
X-Forwarded-Encrypted: i=1; AHgh+Ro6+zCl4KRBcJ17+Kl/leyxKKC4Nb3F7bpGBKRH5NUkHWhb/G1hPzm+Cb5b5aJVyxivxUwRR3i6aFG/sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPZDpsVGtQdpoIjAgTCavAu5Cj1oYEux7fNsSAR7GBmZ1ug/M
	9q7jTFEG5Yj/10qXQaueg18sIxAQA1eq8ni5huIIcluyRQcvjs1QJBD3vOOdCVFMlrg=
X-Gm-Gg: AR+sD13I9d/kuw/K2PkyrwKdZTzAJQklRiWcjZLiCg3nTurq3lSQm+HyN55nSwgjf+p
	ias/cDj+cytPXw2IgM40QeEHJ8RQeERYYY5O7WxkGKLqPdjdU6QPez/m2QoR+Ws+ATV7/g6hDvo
	AofCFjjVjcasiW1JI7KoQiqinCcxH2wevtxlUccTOoF3DLNg9ncFsFr7H8PsSowKCcWM7Tgajmg
	GeLG5+KlnJGLfoFqF/8hAu/ljjSa3vVN/qSwXHk/yJmvIuxxfFUAykgLapBY+Q4YcJHDnpIL/qI
	iUKHIhIYU9qXyYJbSPqI/0ORju16fnghgHEUexmGVJqmjDI89ESbVyMrokDLph8cG3iRt2LD8D0
	QxbiYYDoDNYtBA9O86iuvfG346g232ElBnRXbNN6QwGMBN6UZWGDmTVXEzaKDjnTn8koiauqyGh
	2pLsVk3FjGY4N/8RW2UZOPOCRvjLkJgnfAH1yr58slsLIuTjiX7STwcvJ/aehiAK6ykjAPn0zEl
	E+rhgtWGSV3EJtWwz0Dt4S+miNbGg==
X-Received: by 2002:a05:6a21:6089:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cbadd74818mr15000583637.36.1786127729266;
        Fri, 07 Aug 2026 11:35:29 -0700 (PDT)
Received: from localhost ([2401:4900:1c70:5a7c:d1d2:a457:c3e3:35a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm11483405eec.25.2026.08.07.11.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:35:28 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: error27@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH v2 1/2] staging: media: av7110: fix corrupted BER reporting in sp8870
Date: Sat,  8 Aug 2026 00:04:42 +0530
Message-ID: <20260807183443.13912-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sp8870_read_ber(), the 14-bit Bit Error Rate (BER) is assembled by
reading two I2C registers: 0xC08 (lower 6 bits) and 0xC07 (upper 8 bits).

The current implementation masks the lower bits via `tmp = ret & 0x3F;`
but subsequently overwrites `tmp` entirely when processing the upper
bits using a direct assignment (`tmp = ret << 6;`). This logical error
causes the lower 6 bits of the BER hardware metric to be silently
discarded.

Fix this by using a bitwise OR (`tmp |= ret << 6;`) to correctly merge
the MSB and LSB payloads before returning the metric to the DVB core.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c..77bebf2c7 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -401,7 +401,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
 	if (ret < 0)
 		return -EIO;
 
-	tmp = ret << 6;
+	tmp |= ret << 6;
 	if (tmp >= 0x3FFF0)
 		tmp = ~0;
 
-- 
2.55.0

