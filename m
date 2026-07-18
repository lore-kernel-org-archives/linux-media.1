Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB61C3BFC
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396892; cv=pass; b=pU2mI9LXs85K/xR4uysn9Q7g9P2FqMFftr8nsO6JuijeMTVXFxmobK0MY9WAHEc7NdQM6YrdECObCMfZFZq+SguphffsccB7qHH2xMpTHNk3CcpZ/A0dSgzCFt6VD3484fDFJgtd2w5oewqXF4d0Zji9Efhciye7tFjkuFUGlH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396892; c=relaxed/simple;
	bh=M0HdMCCuDctuqr2UaxjUyuL/o2M1qJh7O8vPsuMSDqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulanLnrZJEretyYvnJzqScTlurVOVTW4a7WugqcpEjxMtskBj3j35XJiPxK9kTDr7WRNFPyE1BfII2U6Zw7Z+ISw23SKqfcSJDs9jVzxD38C1j7ARSP9Obzk2mu81YprN+OJNT3bpgwynn5oXVxswJGLSs9E7tDYt3+mXkAOwFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOENDU5P; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOENDU5P"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384c94c9414so4638862a91.3
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 10:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784396890; cv=none;
        d=google.com; s=arc-20260327;
        b=Jp6b7yHtuSBwMSmYRvhlk+Rn2LSHQVuGJZiJzDLoHnm1yjlfzRciQM9h2JC1yFnbLn
         LFaTuQebZH9yyllZ5UYkddcVgosV6pZz8OVPlvafkRdwzwDujcJbpRuxyW1JAPKOLiC1
         CZRC0WVY0GEJCdiVR7UnloRldeS/hQ7zmnFJ9zwlLq98NKfcGbLOl/hfLG5eWbcqAmUh
         gWofBRfktzXgUennes+wx0Jy5RtZmQc4xqdoSzqE7U9OC9krhSE3BcpZiyPlo6JEXMBe
         B6M9kswPSloVoLxmmQweISr37qzD+ZhH5igJUHX/l0Miw31XGp8OYlctLq8tt+7u7dnt
         KdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rLilQEu9/Lf5fDfwcLMOjRdiCu4BscmeUaeZYmnZu+w=;
        fh=SUHx3lxdVvcKTVR88pDt0PHq6iishJqJW0D71/wP8Fc=;
        b=Pvnfg9OmOCLtrhw0Ux+YaAr+ltzOGzIABWWYJJKmm80/cEpzAMKA7RS+nPs/5qV9Oj
         d2telBWFDnJSAsxyU5CD+nSKLQ6ips2ELNg7WfqMKKmiztrqkUtD78vci2EmfLuSGr7Q
         AI/k8tsgQ87mx1gb2qrmUmsde3+Fw4jNL9T+WLCaVbMfjGmH7J1Rt1F5E1bEqcct5zk/
         zeOhz4PRV01eBfapIZN+0jEDxbU5009tbF1rqtqbaid5QILQD2/Fh2OPMCn/Dqe0WgeA
         gA3JLtdq0wZV8Ez9UK3mUg9PGVyDtMmTU3FcrXHxKKrweqT5X2C+70BvnP5hqN7v8TEF
         s25A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784396890; x=1785001690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rLilQEu9/Lf5fDfwcLMOjRdiCu4BscmeUaeZYmnZu+w=;
        b=AOENDU5PXYT5hkqrRkl618+UbooS2Ia2z1mbOcixbMm35BdxfW7XlmhIi9aTw9oPX+
         0Bu31azojyJ5HJ17eIs75eq0zYgzVRQoZeyzJglFspqm+3Q03NvWRVGpHKVaztlLShSp
         5yQ7c/hQvU1996HMGLQuegF349RfdMq7MZdqyMIblbdE7heS1ja6n1ChanhRyvE4qLa3
         MxpEzU1lt5ylUPagJ3urLWGIXIrQ3NXv4GLR6habl3cHRngIkra5cExcsnvOQHhpvh9r
         86jtzLVsdoPdWbqO5po5x1zivq/SLxV7evrkyvpS0iDGbAw28N92gTzruIws49B7aFPL
         SsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784396890; x=1785001690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLilQEu9/Lf5fDfwcLMOjRdiCu4BscmeUaeZYmnZu+w=;
        b=cjv9/L1BTh3sg8vwMZRZx67JGM+NShX1PcvixfYB5aB+kZQzm9vsv1LRa8rU58WkFB
         FNFVRDFSSik4V324y/fjBsUQtmauLRyCKOQ8wzZY7Gqn0mBJ6sC8vCpIsfOWr+DLLLSw
         v7FKv5c1So83S113eV68rKQ8wLultmjwygUE8eYKU1J+UmvwbNnn35VZt5zVAyOBFHy9
         l8Lb5JA3TmZ8kMgdoOjW4cZ0lnpNpkgOL9MyH+CwYjc1TcAoylo26Ka7D9o4q9CXVR+v
         /OifZMo6nMTcY3W+YHvIQ+bbXiFsI1NF9HaSbHAosmOSGRWMIPasXXUoa2UHypZw8Vah
         UkzQ==
X-Gm-Message-State: AOJu0YyWZEgs6ZYSWIV10JgOv5yxIB5mRKLanTgUVJ/0hNbnY9DwgUkj
	6B/k4JDVMpJZvCkY+lSX5mz2Z87TPegXuf6HZoXF+g3EL35WpEViLo05tqYXQrd8y+G8XzINcIl
	+g/308u0AtxDNCsCAbM7yVHZSuLKoDiL4BiUC
X-Gm-Gg: AfdE7cnrPzyF6xBwVDIrfR5pB5GlvPvz50aAlotifcyoaKFgjYnqRWT9v4ZQIkiDJlB
	Lm2e0hTRzhW893NiCgpwiSBVmkhnMVInVKUXzCGskGD2CpKstgLPPVBTWn5ow8oTlJzIfmi1S7H
	vlKXYmqffxw1jM/gWoSMV+hAh46l5nY8Y8HQoigfXgpnX5AmJGMv9KsiPeF1ojM1TkBhwjSaLzn
	BVVwXzuyv18yY5V8XFnd+rUwOrmumUx1wd6tNEnOgey9k//8rXEw86ex5Br
X-Received: by 2002:a17:90b:580c:b0:38e:47e0:3ddd with SMTP id
 98e67ed59e1d1-38e4b53b623mr8110135a91.34.1784396890250; Sat, 18 Jul 2026
 10:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784276382.git.hverkuil+cisco@kernel.org> <9e22e2878ac7e7063474cb7e0b9bb8399f33649a.1784276382.git.hverkuil+cisco@kernel.org>
In-Reply-To: <9e22e2878ac7e7063474cb7e0b9bb8399f33649a.1784276382.git.hverkuil+cisco@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Sat, 18 Jul 2026 13:47:56 -0400
X-Gm-Features: AUfX_mxHD_Ho92cn8BudwXRph0MJNPaCco_sLhK4XguWJJH13sv18txknTlRszQ
Message-ID: <CAMSzxxQWkt6PmWNBdELA2NrvhobX7p4orgLLdTgPmM=2X9ZZsQ@mail.gmail.com>
Subject: Re: [PATCH 02/19] media: pci: hws: drop call to vb2_queue_release
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

 Reviewed-by: Ben Hoff <hoff.benjamin.k@gmail.com>

On Fri, Jul 17, 2026 at 4:25=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> The call to vb2_video_unregister_device() takes care of that,
> no need to call vb2_queue_release directly.
>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>  drivers/media/pci/hws/hws_video.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hw=
s_video.c
> index 18e4bc6901d3..27f12bbec00a 100644
> --- a/drivers/media/pci/hws/hws_video.c
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -384,11 +384,6 @@ static void hws_video_drain_queue_locked(struct hws_=
video *vid)
>
>  static void hws_video_release_registration(struct hws_video *vid)
>  {
> -       if (vid->buffer_queue.ops) {
> -               vb2_queue_release(&vid->buffer_queue);
> -               vid->buffer_queue.ops =3D NULL;
> -       }
> -
>         if (!vid->video_device)
>                 return;
>
> --
> 2.53.0
>
