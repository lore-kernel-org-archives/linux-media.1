Received: from mail-ej2-f36.google.com (mail-ej2-f36.google.com [74.125.228.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E296F1A704B
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294977; cv=pass; b=NXGcY+T5BZWxX12HTQPqZImoEQMTwrPDK2M+6+OUb11o6vhBJF/1tY6ZoHuGmNmallzOmqDYb80BPRavPm5vrp1SpC0ylbNYSzx0IepS4vF/gOSBsui6JNR+RvMEkEajivRWlUUc9M8jZhKa2/R+ArQ/IyUTYDYdduX3t3Okjko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294977; c=relaxed/simple;
	bh=iPGTdM+eHv5ZH8W6go2pTrN14Dr3emCgNgRX+uNwDgI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZiGyFKmjovw27L6uO+OzVNwcns9O89+oYV4ltMoyFP4RYxG2csxTXlIHNcD67BRlYy+Bb5+9R+djMebIqFDRtrcUlhNkq1sB7pZzxEd26rQiZZBseTlHX+7YjY/3lHfvl1PhDzk16LsYyQAoOkygPpaiOk4aU7aCmD5gzLOQFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6qH+mWx; arc=pass smtp.client-ip=74.125.228.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6qH+mWx"
Received: by mail-ej2-f36.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso51724666b.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294972; cv=none;
        d=google.com; s=arc-20260327;
        b=EpIeiD3dgkAqoquNIZMjk3hEmsqP9ry7TnEWq0QHsedTv/SJoaP08a897R7h5c9AWW
         qJGWb/QcqcSVRRmptnltOibEn8QvDHWzYVydbr3VoWJMKZ8PMZNVEP2DTmIDYGnqkAEK
         UPy2a12xsTEpoKlXh4z03nLKycGlls/5t+G31acbmvbEXfJasxyWv98LTCRewZ1njA9e
         KIix2d8uE8ZYZyAitmgeq22D4tSO+95y3jUIEW0cf4XbiqSLDZ4cWpAp3l+ncaklVext
         +1EhTX5v4bcrCeBD+sXcXmEPhqfJFKpFsX0uBM2iEcdNYgt3Y31MmoQiZJq0j4TCsKGm
         Whrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        fh=oLU3jk5xKpF9zgpb/3yLllaf4VxnoaQyAwOJsJPAX3Q=;
        b=ipJVjg1yaiqJ0eCM9Q5ZfaxAdFt+hB/fsH3g1XBpvkIMCik3NunOvejlixK1fNpkbw
         4HjkrB/9mpU5AQ+ziL2NQKrf8uCJvZCCIz2NwZj+g3PYPOZ82LaFKbhOZNlqmpR0TdrL
         zBdeukwGkheK8VUYrZ7EFI1Xdx+6WO3QSDbEy8t2OPJrriC9Yz6fNeRVRsX3bbaqEeIB
         +fvSGDJrwPcrdz5GXkSKEbZrLkctljMMGnt//1UEvm+BNgyCZs9MSRw+3nlvX/QV+tUF
         zHOZ9wHvN1IXUTaphxqatm+lxyYzsyvdmdeVkaWuZZaZ3W5nEcDoZjMMuEYzCj8SQ8Aj
         bR+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294972; x=1790899772; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        b=Q6qH+mWxZJaJvAv1KW0FTxI9BCsH5OsOQ96JvEmAoR3w3vc8IQxSumZclnWkA1RP+7
         AJDXlon9ahImHv8ruO7cvK86d9m4/Ox/zZgTCcgGzmORa5Ct00FHS2Bwy6wcaw6EXlv9
         c40Ycn+5OxI67+YX/58BlFWv6DXGGvh3R+hgUZRCcMrrxrvIbU6xSEMUBU+qggGc403u
         AsThGV1i5PGJkbkKycKHmB3W7emoLC3A4GapCLJrgWYV7SlenxvbWdbcmGFXROBFh3Kr
         0M3DTw8YmCLW8syU1+OfZ7RbZDR6zs+izNzmoEl6HgwHFz2fOnw617c/CvxtpghuL6YM
         zYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294972; x=1790899772;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        b=GlI+SLqgPvrC0r8dUWazm4GS1hEk5dpQ0X42+KqVtj40Qb54JGKXDF3JTKZqhGNsI7
         EruZce+9Yf3FGlc54bOwy+3jnkpEjpcugf7O0nfU5Gt8+E/aw6wII1B1UaKi3Sq31A04
         xDJwzcvc/v2aMZRRuiRTNWecse9ZYvAg/Bgy4t9iG7drRReCcSqvgPAOO+7Hz+jamdeM
         ApQ4lt1e8fAPV6AheCd7b+HrYspmknFWt8/VKUFs+txoR3i567gBSHlsb192TCjhVcQ0
         RYAC+4mDAy2esqJ4Kg/uZLEEN91lJcWtcivETUMXVwhxMgdSGv6xVftLml0l+HAp4ZKF
         Hhhw==
X-Forwarded-Encrypted: i=1; AKwUvBzW97E8EHf+t/wpol1ddzYwbT5XGMuFwHw7olIcVaqy/3VpPlPKkvbzZ4v+quEbn/crvDvssltNpbmS+A==@vger.kernel.org
X-Gm-Message-State: AFuF++lSODcgYx9TmX6cFavyE+Cve0EBerYSjSN0jPignjloc0raNwAf
	KajUIywJSig4P0i6VmCUrZB3aUcQI3Ux7TV7V5GDWfnIhZ/4yOtXidPzh0pcrDecfL+Fj3qyg/x
	5GPZIiBcKlIEhhOjnPTuwrlvXvz/z9Q==
X-Gm-Gg: AYBFou3Y15NvaafcmUHsKq9V+c1/o9xwkQInD+edXVT+WqN2WiBtOno5g4BClz/bz16
	TzjRtXuNGX/Sgdy7+qL/+s2I9BnKLrcUKsp07JzxGpqJXtnGK7YNeZE+i2x2rFfNMAuRDARr4fJ
	TFZwtQnutlrh7lpv0ePTuu2dI46qqQ3lPFsB15DHPLUm8y/VP4WxNePtzeAln9so6bztN78f5X9
	zp/QylwoCrRv2jRn4g95IMaPP5M1IwFKpkwWxfjvrBj1dfebZ1j0wF5cPgUO6prCaptYrMq0s22
	77uYy+ZyJuKNdTlrn7vix6g8ql4tZRwak8y5CnI1HEC2JaUuGRb5PnHjx+4jAH1GBkRbYJYXsw+
	rvF6DM4EI4MCjlBQRkvM5sIwosEKF0pUNy1X2wuntMcmh+t43BfYHvv5VBAPCHdB5
X-Received: by 2002:a17:906:dc90:b0:c2a:85:5c01 with SMTP id
 a640c23a62f3a-c2ac22cabd1mr365869266b.41.1790294971950; Thu, 24 Sep 2026
 17:09:31 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:31 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
References: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Date: Fri, 25 Sep 2026 00:09:31 +0000
X-Gm-Features: AclHuK8Qhl5-EGC4HUcDq0yD-vI60rrYH2FFCNerdpeXKUT00izorJWy0kVNFrQ
Message-ID: <CAGEsz8ENFnYSCS3w7zLnkVbG4FEVG04WoptROY21mn+PnnJ7NQ@mail.gmail.com>
Subject: [PATCH 2/2] media: venus: disable recovery work before HFI teardown
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com, sashiko-bot@kernel.org, stable@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and
helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c
b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..94d4b8688ac2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,7 +538,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;

-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0


On Fri, 25 Sep 2026 00:09:06 +0000, mhun512@gmail.com wrote:
> As part of our ongoing static-analysis research, we reviewed the Venus
> teardown path and confirmed the race reported by Sashiko.
>
> This series fixes two HFI lifetime races during teardown. The first patch
> waits for the hard and threaded IRQ handlers before releasing HFI state.
> The second disables and drains recovery work so it cannot be requeued
> while HFI state is being torn down.
>
> The later Sashiko report also identifies a separate resource leak when IRQ
> registration fails during probe. That issue is outside this series.
>
> Myeonghun Pak (2):
>   media: venus: hfi: disable IRQ before freeing HFI device
>   media: venus: disable recovery work before HFI teardown
>
>  drivers/media/platform/qcom/venus/core.c      | 2 +-
>  drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> --
> 2.53.0
