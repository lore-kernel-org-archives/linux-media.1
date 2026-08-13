Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C9435514
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654382; cv=none; b=pZzc9aVZDPV0Zh7wmddKOqTQKwFxkKfq3QzWFYejn8Nd3JJWNgNMOq25vXPHQWXhcJW+d4BJXHCyUjmMu8n6BE/7kb8qiF6HBbwlabOAio1j+WMPMyO4Muz6IH5fv9hTQJ+SCvZyexm5LDEMhFvDg8Gvfl/WxBr7xIC6+ioPAMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654382; c=relaxed/simple;
	bh=YvOvKR30cP/m0cVMtk8jy1/sQaWDyEAB2J7fRPzdSJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTVPmUQbHksuiv0R4NTxBY19IeIDN6OBZjDhMFUQNUKxBY5tai7VM11ap2Y924Wn9IamezZul05lxqpQ1sTzFgT6hzJc1ahuGd1ooW40yggNq1lLekdPyis1JqmZywtOzOJ58TVskl+g0VJ+2VS23OjO+VIiW7wmuvkhbj2ivic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bNUxsnaU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bNUxsnaU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so315267a12.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786654373; x=1787259173; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKG0huuOVMT2uJhSczfBBnWYxOx3sQqhXePb2p3rxzk=;
        b=bNUxsnaUbVEh1Nyskk3NoJW5ik9oFsi3vYqH3aUCnpR0Uu+uBk7dESXFKJPuQ5AoZ8
         F1Vl4bfW6ihn/AMpKpzk6o480S0gER2ViexuZAQT6njcz1a9D1jwDUlAkxxxBgrISFzl
         n3CDCHFDMogb9EZQSw4kmiox1Pi+v0i/AuGts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786654373; x=1787259173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKG0huuOVMT2uJhSczfBBnWYxOx3sQqhXePb2p3rxzk=;
        b=fYOhEQf2POfvzHYux4noCGxTc3dqabQrcP7iAQ7y0Eer/1N5CHxCXtyS+MyhKzAAFh
         F7ymcmIFtfX9CAmJdWJBBbxGgl+wyF/z+Law5cYIeBZnNm4NcPymQ0pYoJh5m9pSWrQT
         anJrGeJcs+H5RhOIr6jzdsV6onbAdeZjgHBer1m9bCWcRIjb2BLO1Wz9DLz9jWwwUqBc
         5LQtFVl64u/Ozk+YhOd5Kc8LQdyjH1ubLWphXTzNxMVN97BqtJca/nopgGQRHKH8PO+5
         r0EILOWkE/hUnqc3YvkrQRKMJnZWIsPI6/7x3GuAEE2uIriBngpcNaIvr/bJ4v3JI52M
         wstQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHBhfjOE0n0ccXGNcIwRW24M4ArZMjSgis5qp49eeTjoLX1h2vIgywbjBtdZAnYP8M9MH9oK4ZDdn/Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkY/jOtQXVEEl88a8d/eDaTgbp5zSm8wtMnonnh61Xr9L38qx
	3ius6pZuwG/0cb+7JzF+AyaOjDOGKD1RPKoIZ8Aju84fJ1AdBox1xcVgkgfvMUMv5BBoHBkgZqp
	ALS9EqA==
X-Gm-Gg: AR+sD11NTxuDOE+oYkrImPXZWCubHGnEloT9a4diWOA3mmZylppzpYQQdS0MTg8E14r
	TQ3abpO0jm8wmNTfts6WUq+nTO2eUgrqzyaDUmf6saoJi6rfGcNgS42rO0ZUsbzNHdbLGpvtGWC
	yextS2aZ/JSjC057ZeUyp9SSBNlvLKUVacVJ1NB47QK3W1hKMmsSmXsl1Y9xaBaPh4zFBrF407K
	XS6ZlQazJLlQhlgAlqXuDmpMe8gmYNQ9Ue9JqCD2HmZ85E36Y7xyHjOU3xjTxZ95M7zNJVzTxD4
	cSoflogpPOllGIKMQ6odAM1oN7jtdbjJBo9n5nW/KxDsnVPr0w++A36BPuF5oP2kxeAz3oyMhE9
	THoLgoqdRL/edpVb8DjBzrq/hcU0023kD7kv4U34BYp7YuqBUtAl3SDn14wbzcLiGs9YDH7E3lg
	o8kRwtVk/OH5yneLf6/l/q4nLRv6vLSjCQyBy7MWix+dNxPLU7uIA2rdxvRsgQG45e/djoJj4rO
	a3a3TAk9C07MVoOobw2CjS0Cw==
X-Received: by 2002:a05:6402:52d6:b0:6a1:1e25:143e with SMTP id 4fb4d7f45d1cf-6a38a8bf3c2mr579785a12.3.1786654373248;
        Thu, 13 Aug 2026 13:52:53 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f8a24e6sm1322624a12.19.2026.08.13.13.52.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 13:52:52 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1f758014b8so36803466b.3
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 13:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RriODQcCcWT3Njs/E9cr8dx8xt2xsJz4dF8Q8YfoBB93BokUftxdhDf4ZaB9NS8/eHq1x/nfYGWcYSshQ==@vger.kernel.org
X-Received: by 2002:a17:907:874f:b0:c21:167b:47f0 with SMTP id
 a640c23a62f3a-c2129a8508amr50889566b.2.1786654370710; Thu, 13 Aug 2026
 13:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <F0F008459FFA835D+20260813074632.2021311-1-raoxu@uniontech.com>
In-Reply-To: <F0F008459FFA835D+20260813074632.2021311-1-raoxu@uniontech.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Aug 2026 22:52:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCsguGSgvEkWTCWVEctHFYN3teRXS07OczJfumWzVqv4Qw@mail.gmail.com>
X-Gm-Features: AUfX_mxdIy5-HXGmurVL_I6Zb5p7z94joSTv9qPTZsylVv8sW9Fe3PFFjKqGIpQ
Message-ID: <CANiDSCsguGSgvEkWTCWVEctHFYN3teRXS07OczJfumWzVqv4Qw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: preserve status URB interval on resubmit
To: raoxu <raoxu@uniontech.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Xu

Good catch :)

On Thu, 13 Aug 2026 at 09:48, raoxu <raoxu@uniontech.com> wrote:
>
> From: Xu Rao <raoxu@uniontech.com>
>
> usb_fill_int_urb() takes an endpoint interval value and stores the
> period expected by usb_submit_urb() in urb->interval. For high-speed
> and SuperSpeed interrupt endpoints, it converts the logarithmic
> descriptor encoding to the corresponding microframe period.
>
> The UVC status URB is initialized once in uvc_status_init(), including
> the UVC_QUIRK_STATUS_INTERVAL adjustment required by high-speed devices
> that report bInterval using the old full-speed convention. The first
> submission therefore carries the intended interval.
>
> Both status resubmit paths, however, overwrite urb->interval with the
> raw endpoint bInterval before submitting the same URB again. On
> high-speed and SuperSpeed devices this mixes the descriptor encoding
> with the already converted URB interval representation. For devices
> using UVC_QUIRK_STATUS_INTERVAL it also deterministically discards the
> quirk adjustment after the first status completion, making the
> workaround effective only for the initial submission.
>
> This has been easy to miss because the initial status submission is
> correct, full-speed interrupt endpoints do not have the same
> logarithmic encoding mismatch, and the status endpoint carries
> relatively infrequent control and streaming notifications rather than
> the video payload itself. The problem only appears after the status URB
> has completed and is resubmitted, and the externally visible effect
> also depends on how the host controller handles the resulting period.
>
> Do not restore bInterval when resubmitting the status URB. Reuse the
> interval established by usb_fill_int_urb() and usb_submit_urb(), which
> also preserves the quirk-adjusted value. No additional state or
> interval conversion is needed because the same URB is being reused.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Cc: stable@vger.kernel.org
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 1 -
>  drivers/media/usb/uvc/uvc_status.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..6552f541aa0d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2196,7 +2196,6 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>                 return;
>
>         /* Resubmit the URB. */
> -       w->urb->interval = dev->int_ep->desc.bInterval;
>         ret = usb_submit_urb(w->urb, GFP_KERNEL);
>         if (ret < 0)
>                 dev_err(&dev->intf->dev,
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index b632cf5e3fe9..680c6c7f4ad7 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -245,7 +245,6 @@ static void uvc_status_complete(struct urb *urb)
>         }
>
>         /* Resubmit the URB. */
> -       urb->interval = dev->int_ep->desc.bInterval;
>         ret = usb_submit_urb(urb, GFP_ATOMIC);
>         if (ret < 0)
>                 dev_err(&dev->intf->dev,
> --
> 2.50.1
>
>


-- 
Ricardo Ribalda
