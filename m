Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755A47D45D
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240710; cv=pass; b=fPYgvAWk4K4Iwjegsa3I3ou+/JOXPDwfFLiZNa+xjdMpDeIULE3czB1AjSVDuyNv5drfQTf/acOtBgKfKJmJohcA85JA5oIQygi4V7Ul+jdKw26yMsqUQWLYweUExb01/x2fiWTERpQQmqKXKfn7JOd+EfLV8XIfRvz+zd6eDlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240710; c=relaxed/simple;
	bh=96YZ5+E7XFod8hc0MhXlMMGNEE+ZjoKzWhLiSu9gfNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EabmiGUWf0g9Bz8wnX7QDK6bf/jmoRTcS2l45klw5CfkCta1qCqwX8UemyiWW4F8ug/SJqc2VkQUREAo2Eh7XeoPQl5lWIB4GUTIc/lP2qcAhhCJY81ekUbFQMtY0n/i26AWr0jRrzDa17HHASqKTLvSw56apzU5Y8ISHecSWA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRxkpCqQ; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRxkpCqQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2965789b3a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 08:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787240702; cv=none;
        d=google.com; s=arc-20260327;
        b=NEtzJxuIgUaFpiaerW9olTEjbIMsNaCPSnziuWugCn53ba1MiAueFk1NwNewSmKVDa
         Yxg+IYE792GFnk7zc3tyAWBl1eFKzmIpKCa6AnIyq6IO8iTy0fkbjIR/GSrY72MOWoOM
         IZ6dZu8WuC53l5R3jSS3CAZ6mpLkz+kaQqR+5kQZhLD7LvrloUpOrnHZLLRmzTLbp1gW
         Ib+Bw8FbEEtxGhy1u00Cnlg1+1qI94HghMX6O6mawrpVRcpAxbfDwtCy9OSnonxG/M/j
         VptXkR7hdZXGtHqbT7IVm6ZttAwHr/S46rCTYDetEae6SQWvyPza3s5Iu0uWhmwmOrlp
         opmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FliHDCv7ZcfcxjqJZIvGB8+Aoy+Y47ob170ZGBFvEEk=;
        fh=y0gLMdHfe3W9iBKp7P+NgN/rHG+wuH+vAhYKBKKBagE=;
        b=PIa2qEWcONyNahQp+9UDKr2vhmBO8MC2vEcBKACd2vQELvQLaQgtMfMM6QwpTQ8Arw
         35g25jeBFudqfjNVQ6T3VvRFskyt86OCzExceObX8LN99DjcCMO5/N+9IyjvsptfVnpg
         qVEId+xJ+vtfywj0YH4Z+9HLF2eTyu3/zmardorJwlejaPSqBzIcaP7aMjtVr+LlZDRu
         c3XqFV70YCuKgzKDl0uWO7cvAY1FA6yID87kajn9nFQ0WlHqD9wl9tgpKCtafJC8g/XH
         bSe1YM0gbBnGsTBwa3GK8P+eJN8X9cnvRBRGm+zIw20ZP8+DQ5T31gHvGlQktp5nrE1S
         ewuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787240702; x=1787845502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FliHDCv7ZcfcxjqJZIvGB8+Aoy+Y47ob170ZGBFvEEk=;
        b=KRxkpCqQ1YTlAQSz+7QxVotvSU0dOwhgyJN+ue7n3Qq5pg7Pivo/oHeEOv1QzGzuAo
         7Yo3osIyeMI3tD4QYsRcSog+2F4YVKFb9OVxaFWIqa6i95iGkNGObZlEfJurQqFVjWJr
         ovcTjCVqj9GPjGXzbbtXvBcNsoUeZK54pSmOvSleZ9oaRridNrqUD3WxCN9ZK996sGhX
         avAMSnzDOgMNy4hdtsUoW5PD7B1fDTguX3n+loZ16QcuKHU1z/fUzT6TLSORzk2MgQq2
         pDDrms4xvhqp+t90YTbuhyDfE0YmyHBVitZ8ZEyKDWDr3Fp4h9zy3Kv8WhgzhZiqo/GN
         tsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787240702; x=1787845502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FliHDCv7ZcfcxjqJZIvGB8+Aoy+Y47ob170ZGBFvEEk=;
        b=V1XCAoaXcnbKnPjEp4yllJHTyKuJtny+aOrFUoW2Vq7JfZhHrt8i3hwaBWPZS/Z0Pw
         KriXu7JWAsCRUp1IcMQYPlZyH8RkfTYP3kH2+PveAAnRyZJfbDizMUONlUR1K/hI9FlC
         Kj1HFAqieYsR2REoUV2KKVArm2KIoTbnduZe7V9t8N8ZdhejwXY7cxuFrgCmjrLzFUh1
         6TYhOg40HiRoroxBdZIwoLZwY+1TMJsech8wTnGJ8uHQU9PYapJM9k+4nmf6xdU6ODR6
         5VA4S/b3/+5oM1NQDTj3yfpYi2SsGEJAA4AIcVRSDX+2NdeWd/ALU22/fg/3KXzj33Oz
         4aug==
X-Forwarded-Encrypted: i=1; AHgh+RqtDyt3y7PlT4ZKwuHRJYwMftsQzmzGz+tzeA4zxIXpdjUAjVbwigV3AjkoizSL2NFaSvKkFVOtiNTmMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/cFQFDxqj+9q4v75M27IRlQ6EtX3o9iSf5xiCgSb5LnQEmfU3
	3mVJI7k5sKKzzcnG5IshAag4LNDcDkgf8SQeoNbvFMpJnUfsXwSBQSLFF5+mwdMFP4BAptD5wyl
	OANvf7swc8tXNMuXzb+6SWLxFfNelHOY=
X-Gm-Gg: AR+sD13ExVsA9pvT+xpnuvTg/EpVHqc0Q0OYwQ7RlzeNM1LnM96uP0+Z8Y7EHDxAgUM
	eLvkzVtRO3T60Ju9N37ITlNR1Tu2vs5EJjr4rvTxnaYsTPLNfTNRbOl6/GMur4O4QGq0jU6skmW
	Stgm6QtoV74/N5q/VbjKDaEuIIMUb8CBTWS19Q8LW9+6SdqCmCYVZdl83c/+3oZNYvuegdCGfyQ
	XEe+zXhPUj4VtNvtDqIPQ2EWQi5krII0RSOk76l5V1SvrMh9BUyOsop9H8P7Yq24oFGLYeBs+V4
	LP1Nnvpk9Abiu3eIeQnBjAjU4rCk7RrFSAjNz+zExjQ=
X-Received: by 2002:a05:6a00:1d8f:b0:82f:50cd:e586 with SMTP id
 d2e1a72fcca58-851d39596d8mr25482213b3a.13.1787240702147; Thu, 20 Aug 2026
 08:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819063351.3804260-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260819063351.3804260-1-gonglinkai@kylinos.cn>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Thu, 20 Aug 2026 11:44:50 -0400
X-Gm-Features: AcwNN1WaBXTjmCxjdlgEY6TKIkD7_Iufu8bqfo9Xzb3xc3tgUKE7h-MBcMFpnm4
Message-ID: <CAMSzxxTQDRYQfL4XaGiNuyCcER2Vamo6zqij8JXsBVN69kSWjg@mail.gmail.com>
Subject: Re: [PATCH] media: pci: hws: only init channels the device actually has
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Ben Hoff <hoff.benjamin.k@gmail.com>

On Wed, Aug 19, 2026 at 2:34=E2=80=AFAM Linkai Gong <gonglinkai@kylinos.cn>=
 wrote:
>
> hws_probe() initializes max_channels (always 4) control handlers, but
> register/unregister only walk cur_max_video_ch (1 or 2 on smaller
> chips). The extra handlers are never freed.
>
> Initialize the same number of channels that cleanup uses.
>
> Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/media/pci/hws/hws_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_=
pci.c
> index 30bb7d34465b..87ba27877f29 100644
> --- a/drivers/media/pci/hws/hws_pci.c
> +++ b/drivers/media/pci/hws/hws_pci.c
> @@ -441,7 +441,7 @@ static int hws_probe(struct pci_dev *pdev, const stru=
ct pci_device_id *pci_id)
>         hws_init_video_sys(hws, false);
>
>         /* 5) Init channels (video state, locks, vb2, ctrls) */
> -       for (i =3D 0; i < hws->max_channels; i++) {
> +       for (i =3D 0; i < hws->cur_max_video_ch; i++) {
>                 ret =3D hws_video_init_channel(hws, i);
>                 if (ret) {
>                         dev_err(&pdev->dev, "video channel init failed (c=
h=3D%d)\n", i);
> --
> 2.25.1
