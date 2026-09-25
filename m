Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6964C313547
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361731; cv=pass; b=oLKPy0+hsZIIv0FnLFOE0dxXrya1LblcYVWOWQRYdYj01KphuNFMqzjCGifDpYvEK94I2ov0Flm9953ukTW//bc6sh79X8+gURaFAPSpacaydRG143ATWQaQpD0Oqz7aUEnO1+rBYyTfnUNUfpCAqjNx3RrnlNIniLNyfuqXDCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361731; c=relaxed/simple;
	bh=EG2PHgTixg9rBHSr4w1yLq7tvCjPCFuWWWvAJw5rlQc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIqmM2n+Z+eovUP6exLg3Or+U4263r1SndiC39tRwJ1qwItuL0bo7Lxx5Nq2HGxU1zHTVr2JYM9nq1f/X8n48PYLRo90lNqntpjYS2eLYDfOKkRAoHGN1TS00PW94lI0VxPCV2ZZbu7lhiYJ6tTR0AO1D2vGGfm+eePs4UVlvyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc3ck6Ur; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc3ck6Ur"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afd63c3e0so59025766b.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361728; cv=none;
        d=google.com; s=arc-20260327;
        b=MUH5fyp7njQwxrvsOAJ/fgTn5ZAOxAQ/vILP6p3HIfbdmACRnIYPNX4eeusqQuvQ69
         MStGHpW1qTBkpjDoFPB4iZ9pzEa0DBAY20nwvCxVCzt7CtsrHv4OZoaTBeQyB3VYvMcf
         QtPDXo1KQiH+mR338HK6lOVgLufL0egILP8fWLGrO3rJHl60LPsP5kf+yZ3G1AUvZmdH
         PGbTA6H9ZtmltQj40K9TGM+yuRnOwm9w3qOjBXtV0XJkXeJzNnju/b7b94SenbOy3bZs
         lSL4wIh1Lt8x/WH6XQXzXiiFc/KOD1hplPtV47zv8C0oz1brU+ep6sBtxLifJgvm6IQY
         nqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=iH33DlG7lPeRyDNU7/KmTL8YXtHt+KDjYSFCKP0/eps=;
        fh=pMzpuFMqtiHYtXBW+PK7zBtNhEkDP1TTuuO4RwEhKn0=;
        b=T93ctnJuLEnnERdYbITVpJCAKwJER/cbKqQCCbOS/TcfLNmtdQl3VxVATcNSXLItFy
         AG35kbt/rD8vxd51x5sWoHdac3i+HlF7Dp8YaMN6ZBXEW0pizBpC6ds7rWNIeaCDb5z6
         oRERwVC31Mv+3n7+NUvUsOHBdLkyYn2KLon+zuTW6IE91qThd1f1isea9wtmXd3Q/HMk
         sJ9VFMHtCfJGLhUDf1vggCa+14G7gYEpgzRNiyOmGN/OxZ6seFDq3LQqlCdS+AhucuGO
         twi26TXxFlY4W36zy/a3G1AeooPawlEkOZ78vZKVrRb9ZyQqPkxfWfjht1OJJ2+8st0n
         zvxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361728; x=1790966528; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iH33DlG7lPeRyDNU7/KmTL8YXtHt+KDjYSFCKP0/eps=;
        b=Hc3ck6UrOQDwxnK63GsfDThgGWBOpQd13H9nIYM+xizWrGjXwpIcJxg5DdJy/sPd80
         cwgzlsSbt0sFvuZu3W1EuRslN9S497d4E/pcYfB8xkS5kn0hgfdzrcmM/dHUaFb7PtgF
         GtBMtxi6zPDZbjknWJYdwEpACj2EsQYUJwcrjMbzPSmntWYwi9FkDT2xDnx6Y+5ihTO7
         B7Q1y4ZvMksps/7T9gdRKciyGQOSsXxrVSullgeU/EVyK/3Rtv9VPRqYu5zStJNclXmH
         Wx1lKKmJT77owEBdXgbr4QrbZbfvco51Z4QQUOmGyxR2ejj59HP5sWJgb0yJ4Ii3f2je
         IL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361728; x=1790966528;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iH33DlG7lPeRyDNU7/KmTL8YXtHt+KDjYSFCKP0/eps=;
        b=Hhs7H8SsKq8cH2YspA+iClvQCEfw0RQEnQ1M+Pw6dQX/wgdaD4SQg1yP7VtfGH58tU
         bcPXfJQHVDhKoVr49tnZHxmQoT4LFciYSRJnLDCCx+5jK37zrj3Dt6XleJmvEXGmZAJJ
         Quk8fgS8BcHMc0QWd1HT4qij+fNICZZb04kVeIYOEYKWMWXlnn2qIEer4D2rvFqmVEzm
         rQ/uEUmeK1/lpRv9EQsnDuSbqpVIZnhS8s0FUh4U29rpfUhtqD3ItoaZ3V4BYGa2x/eP
         O651BnvURkVVFxVhRUzCHCZoJR/lSWyxXnyiDsJG2D1ajfRuNuvD5KI4xzeO7yCgbiYx
         R3UQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMuTDcufUj4rcGjLbw7y6j+aeMf2W1HyTaOuEU0hYgYDluMs9g0okwZaCv0gOqYSEiNYFKQX0+BoxwFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lrNDEeKtdo1U9CFHxllTO9w4dRDDRM5um4CAxcrIsKm1urKM9D
	rXf/fOkvgO9bz2qMV5ULn3dozhPiFUOYPkjxHxJtvh5F9pGl5imVhsRAwLpD5KZcecqkNejsyLr
	89eztnhMSjhiDGADPpwgrBQWTvFVpcA==
X-Gm-Gg: AYBFou2G9lT9cvCh3SBdhAH1VpNKUkNn7+F1DaboleOuoqjekBfBseGQqG2XXEWAE/5
	vfKQ9XlWGQOVzYSaK3bseeJTBKZ6J0FBe11PWuhgYKAGsaY5oHK+jompZgXiO2+2jBdJ9+PePlt
	pBWAV+4LrfuooHo2g4n0hzo+6/qfuOmiCwJ2IitLniACN2MPd2MP+dtyR4Iw+arzVHlmwjpiVes
	VsBRWY4HkCpZS7BbQF6Wcsitg8fhqZtQzaK1HGQIDVY7D23z27SSGgFCak7jKXKEScVnKrXlG/j
	KeGyoVquUUQKezIGKNjZFQ6AULi6JHtIX3dZC83RW4oCwW/sJnjCZ0l4apUmJpkmoksHY+9Q7aR
	nDqxNq/fFtp+VTVeNuM8aTJhEuFEmP9Df5pB9c620V0tL2KsrmNLEBVolH/tiSMECEApYYqnV0V
	w=
X-Received: by 2002:a17:907:e918:b0:c2a:9e6a:3b4e with SMTP id
 a640c23a62f3a-c2ac228e60cmr610461666b.0.1790361728266; Fri, 25 Sep 2026
 11:42:08 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:42:07 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:49 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 25 Sep 2026 13:41:44 -0500
In-Reply-To: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
References: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 25 Sep 2026 13:42:07 -0500
X-Gm-Features: AclHuK-11njtSOspeCyZG4OM6KWbRhEYVXC0k2M43DNY4OjfE88LmT1g-L_uDk0
Message-ID: <CAGEsz8H4wT2Cswcr3g+5KJJDek0GACj1-gbFAC_NunHV+d78JA@mail.gmail.com>
Subject: [PATCH v3 2/2] media: amphion: prevent unbind while video instances
 are open
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

An open video instance holds a plain pointer to its devm-allocated core.
Unbinding the core or its parent through sysfs can release that memory
while the instance remains open. A later ioctl or close then uses the
stale pointer.

The video file operations pin the module, but sysfs unbind bypasses that
protection. Suppress manual bind and unbind for both platform drivers,
and warn if core removal ever encounters a live instance.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 3 +++
 drivers/media/platform/amphion/vpu_drv.c  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index a0c58ec97a42..2e8e08e05de7 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -696,6 +696,8 @@ static void vpu_core_remove(struct platform_device *pdev)
 	struct vpu_core *core = platform_get_drvdata(pdev);
 	int ret;

+	WARN_ON(!list_empty(&core->instances));
+
 	vpu_core_remove_dbgfs_file(core);
 	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
@@ -846,6 +848,7 @@ static struct platform_driver amphion_vpu_core_driver = {
 	.remove = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_core_dt_match,
 		.pm = &vpu_core_pm_ops,
 	},
diff --git a/drivers/media/platform/amphion/vpu_drv.c
b/drivers/media/platform/amphion/vpu_drv.c
index 2cca61f41bea..9c6f32c5eae9 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -205,6 +205,7 @@ static struct platform_driver amphion_vpu_driver = {
 	.remove = vpu_remove,
 	.driver = {
 		.name = "amphion-vpu",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_dt_match,
 	},
 };
-- 
2.53.0
