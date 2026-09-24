Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83D341DDE1
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286578; cv=pass; b=fDQTf9Ba7GmkmJxefe7PNy/thy9JqDcveE/IBsNL7itO6JKOQZr6SKaR3T82AUgqoVOUunbHZsmw8ZSsKEv6Hy/FOjLexvuS2ko2b9pa7Tm3qoGaU+G5igZGWh3ATMJhZSO8lO5X8GoR8YyFAHfqUbKLKU3CeooPgk7/qVzrZqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286578; c=relaxed/simple;
	bh=EYwriSULvYePD3iJ2T4Pa8I2fYA+Ygahe3VBHSaLFG8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oljpYxNTtupjVMiQPwXg6w6KBCyH/LuZPzxIsFaEve4eFvSIRf6kaTyj26s37mtkM4t8F/l4DwPEwGcCStXxrH29rA+kC3RfVZkB2bdshI1/fNjuDEnNC3FaIs0HkD3zb3qNdMoEgCRAE55oWpe9Alqtt1rFWOOCiXJ+lCd34OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4R9qFfc; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4R9qFfc"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso471769a12.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286575; cv=none;
        d=google.com; s=arc-20260327;
        b=ZX+Q7DxMN0HZRObGJMf0eBif83vKXfAR8yGBfXsw0uSnRynYhXs2GXWGYdCG6AmlPX
         /2bRKtyWTqMAPA2Xn05f+bUrn53bqC2dyuFgRu0YTq6G8WVI0C93IIUoAC6yLBZBdMp5
         0MkncnJ72ZFghwjKGZk3H6JG2swQJX2RBuELBu/L+H/rQFhVu/0mMZuiwhGDoDTy7D+V
         8AK7Ar8Z/U6LJX4BQoS4pCGbVFhhBVrm6t8XBy/o1irDKlJ/fGQz/dnBa2gOlqBCWC9O
         3hrniONphcE19jftXBIvenSt9TwjN7Hs7i0SEOG8xJ8+F35TMKjxG5yTmClLqV9NDbLO
         aACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=IlXhqmO4UQN1t5S6AwF3HMJwBfhvJfo1PV6ZXzxULoI=;
        fh=h6jc8hLGc2roUao1Qrz8rwk5kSkKMZl8ogWubIU6hn8=;
        b=QKBMeJSBHi3ymiKoMzi2zSWjXbO5F/zDH9XKG4OR1leX8YcBpZgOeH86fCVVWzFft9
         EVP+RSKO5dCK8mmy2NnfIpggZd1XRJ0hu5tNamtpItPyUUREhmphiyhAuNXYMlDjta59
         dwQTBJ90HdEmeH9KL8MdB11JCgRHRu1LZrL/H6hty0D3K2Wi3DU0op5eagZ+lEdsoqE5
         u6sjU1XxneRtKZtyv31qVHF3JnTp7goZDmCGI1VKKzA6WlF8LTzKuEiobfocbHnnQ/wV
         5P9Gu3Yk4aTI949VubNfWEOmLgfWo09zcN9TPIS3zGn0luRCmVfKkCx3XIVVvbXYESh/
         P70w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286575; x=1790891375; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlXhqmO4UQN1t5S6AwF3HMJwBfhvJfo1PV6ZXzxULoI=;
        b=r4R9qFfcwXWDXMw2frbD61TNqnMSExox+VkYBMY40DJCxA2qh2sWTgzymsK/XOdeaQ
         phYCiyj43hC4NKG3ve6x0xM9aH1D4JRZAtzuSYn9cQpXvgKluPSsG34mtzLym1rN+o6S
         VkiTKdSD0JvuFZZotChNO9Fi/VAJBBQKJm3dL0s2IyApn3mkwGzsmW3kVGA0AfIgAarO
         oJRBC1XFaEgt8pvC7yxQnvmthYx9yDQIEq70EubAAGkl95832m/aJPDQNje+qPw4ms1/
         1yR4PU7Ga0g5woa614Uren5Gny10kHM+atrUzS7NyDVUjgvjOcjFmLmSI3+JfAFpegvD
         3CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286575; x=1790891375;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlXhqmO4UQN1t5S6AwF3HMJwBfhvJfo1PV6ZXzxULoI=;
        b=ZtCMt0sO/AoiMeLv63aB486dgzXgEh+ibvzfkw5uIJzih2rQRNwxBB3vE3vyYyF+ty
         sAl/sJrB+4BdAJcNBNSfTWJ/NgLX4u9Rk6YxyzDVpFL56RtZSEoeTB6PUNzGhJpKN/jh
         DbBf6VuaV6z1ggCzk3bSqZp+MyPU7MROxptqEsxFrxeTKj6/kwAJRYMXEEDLbJB/4cCK
         Z/EjBH1WJkBdU33mIsfArnBqDpNsjbXUCT/td2DwW/xtCGJVMPnelGiFDKFVUbF1lQkW
         rBLT9QbIVsBVq+d3GZlQYF2IZdRAprdkZd7hZyPHDZxN/bPbp4T3JWh/iwz6ZgczSFCK
         cvUw==
X-Forwarded-Encrypted: i=1; AKwUvBxppdtQq3n0MJnueWBVjfnKxWSFoApoZuEkf+xjzr2wqNYuWZ4cfbHFJEMUM57zrPyv+HnBeyVk863RzA==@vger.kernel.org
X-Gm-Message-State: AFuF++nvvBwx2/4VksxGesTexGoksRxy6JfEhG1cqBGPjHU3rzO+6DED
	MsbHzuNovUpLIvaMgWXN6Q8epjl8s2pht2eeRtG499zz+pk1ThT1hRtlAssvQpcxNLlqNuPIsp1
	uRARHL7YGylbRqqwHS1kWtcPM100y0g==
X-Gm-Gg: AYBFou3CWgvorzsrBiRelxtrKYYW+Ht+2gtwf2ffHKKcAAP7sZJePWcRvUe5bKbd7/M
	qRlKSWzFI/dM9dgpjBUa4XXder+wio7mB8+BXpEjcOe0RD1eTqHv0FC0xOR0gCO+rolFJsT+ZNZ
	q7IN3n8r4hpgJnnrDDdnRLIc+AEXlz2NZjgKNTBzB4PRi5Vxcirb5q31Y5Gx5WnFwAjzpDS/gTw
	pQJYxBxEaGP+mxKx9sr7kA2rqkm4ldShKRGKoeJ61dj877sGseSKln+FJiDv/sJ2HZhfzPlQCQo
	iQiBevWJvIjhawaexgrZDT4i2Hiliw5qo3Y4q4qTtisk1ugndiR3gMeGmoVP/eLLJVOsl+y6hbi
	aWE3xWYDN/jMCmyECgXoSMAK8J3JvLsISzLcy4WmWSQbtVUS6yasqZG51599uAq0F
X-Received: by 2002:a17:907:c71b:b0:c26:1691:b371 with SMTP id
 a640c23a62f3a-c2ac2538398mr364279966b.42.1790286574820; Thu, 24 Sep 2026
 14:49:34 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:33 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:33 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
References: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 16:49:33 -0500
X-Gm-Features: AclHuK8YiU9a_Ru4QSeqUTrJVzzT1FhyKaFMooPwpYN9sMpvSeDBkg2s-WQ3MVQ
Message-ID: <CAGEsz8GqYcGK8zaos_PTeto0de4+9nkyqo_815gjac3CNSOo_g@mail.gmail.com>
Subject: [PATCH v2 2/2] media: amphion: prevent unbind while video instances
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



On Thu, 24 Sep 2026 14:49:08 -0700, Myeonghun Pak <mhun512@gmail.com> wrote:
> vpu_core_unregister() releases the message FIFO buffer and VPU reference
> before draining queued message work. An open video instance can also keep
> a pointer to devm-allocated core state while sysfs unbind removes the core
> or its parent.
>
> The first patch drains message work before releasing core state. The
> second prevents manual unbind on both platform drivers and warns if core
> removal encounters a live instance.
>
> Changes in v2:
> - Move vpu_core_put_vpu() after the work drain.
> - Keep runtime PM and mailbox teardown unchanged.
> - Address sysfs unbind in a separate patch.
>
> Myeonghun Pak (2):
>   media: amphion: drain message work before releasing core state
>   media: amphion: prevent unbind while video instances are open
>
>  drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
>  drivers/media/platform/amphion/vpu_drv.c  |  1 +
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> --
> 2.53.0
