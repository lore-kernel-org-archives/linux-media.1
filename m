Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE825B30D
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 05:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821925; cv=none; b=Q6RiMEWRbpRuvDE3IyG3LavwHe3qwwejWNqzjkxdnPFsHa9hZXlcNKZetT9Wd71+H0x/qUrDyO+8Ed4fd17AGt148HNy4TA/WiyghVjv9IE1aKdIccnDoc6wfetQ3Hhrh0BFDyWnPO9n/YG86+f95sHM/cfaUBypXiE2Q1+pXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821925; c=relaxed/simple;
	bh=cUhyc6REOIcCt/J53B0RZA4iBqBxJJ/nUoqA6gRWgDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhvepweVxtMXMOn1CdXZ0M2EJX3dF6V++GQJiEztXoql4ECc1imqbYG2QMjAjWl2o43zLj4OWRO+cm5gt4jzCLP8sbxjCrtNRxPHgVLZVINXUwS9nrRAe4YUcOjNOujxIZsr7ykF+I4nr3jbHtnogbOSrmPls/GQpsBNX2TBy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kt101tZi; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kt101tZi"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a063d211ebso5257535a12.3
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 22:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785821922; x=1786426722; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+yKsXnoQggzIBNMWMCskf2cbt2dGwSd5WR68jcEVwo=;
        b=Kt101tZieMtSKs9Q1SggSMzmL/AYfbdYc0I0GQ/9EJimcsW1VO1uveP60wGJGlmXQs
         n9mgOcSzopJELQU4LUFhEX7LuRYWKwtqsInUpD5vpymqc73PunWD33oD70DJXopqW99M
         Z4eBjKHDTHhA8tlRVFDbxuC+4rvldivxpbUuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785821922; x=1786426722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9+yKsXnoQggzIBNMWMCskf2cbt2dGwSd5WR68jcEVwo=;
        b=DGwsKitKW2aMLUcXGxwiC7uxWpb9Q53RCmaWMMZn1FZi6I2uMfyD3jFWf+jjE18b8j
         U2jQo/h/Zuqh/kTYvSrzt6F+0ugsWn3GQaFXDh2A8aqBK5EoJXVUEU72MuGS3xQdIIbP
         /dzMODHagBcCo3+cHsAYzwZu658GOCaqJTQFCw6YwlCNpkhypifdffFkxrj8bAfRo6M/
         9nhVpbo85ynWbldfgO26dXkPKXeTobNXs7R4KoGFTfta6/gJcdzvzdnUM9AkGI+i8hZt
         zRRbOFFhoxEv0xT3ZTPOXmf6+h8CdGpuAod1h6i4Elc7lhvUVXkbWLt3E/H9SJO/H7F0
         ao0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+CyIN14GqSeKOwUmvSS5+GNPE/3wCbFRdOm87dnB+IeDd+gz6BwtPiTeVaFrJCEgUvSkZYs2npng9Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfWyDODCfZJsQ7VA/8HvJ9RcImy4Qxi57rvCBQgyaU5ADRpTNR
	VmDAQ+IpxNr5W/LvlCGO63+64dn38hJumDuRPaiLK+24vEpgX39TVobCJugR9+YwqE55ojAaGnY
	fdII=
X-Gm-Gg: AR+sD10a/aZ0HOUy8lFHIgbrJTvx2wakeKQy43wQcjr1NG9TsjoKs67oePgGhSxlcYY
	QAA/gtTDg7UcHVqSbGqw1udgQWxgdz99eEIPwGi8WS1I2aW29Ifrx+XPPp0iiBntTTLZb6k0WLQ
	IJfYM6B0gQ5jZJ0lq60YTDpfk9IOU/Q+MSiuWyKEj9npXcQgf0oYqnmpSLK+YI1xF08PO29pnx5
	xWGLvsUKwVQ2S9rNqfPYXNM5WArr13XBHQvXr0HApMdjzGFnVyp3Vu2ckkxmMxfTQLHHnRw0cxq
	eLBaByqDCsY0zFbS55p/KQsm340gJvZ3myWjrS1wAU7+3ybqFJs5TFCU/MSaiEali3iDCw6VMPa
	zbamfJg1dWA/TTmTbCnF9ZoS5Ryw1vjzYg1OI43Qir01SW36kHnGXOS7oRrtMRHK4V0WTcIJobw
	uudx+PEZQDj3C5KXMWvCYyl1dbMBxcaXzcfxg7dP8aZr07eBRW267ZPAN8vzn0DeP12uvj56GBS
	6LDjiUHLTSwE9YR8t4NakAnyQ==
X-Received: by 2002:a05:6402:1f48:b0:6a0:33f6:13b4 with SMTP id 4fb4d7f45d1cf-6a0a7cae888mr10208490a12.13.1785821921817;
        Mon, 03 Aug 2026 22:38:41 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5a098bsm6485858a12.1.2026.08.03.22.38.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:38:40 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6771510a12.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 22:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq63E4T0284mYw7aY+aUfUiNqmrYGiYEL8sS0Vi3c5f07GkmNsVEmF1tXB7uahZni35qNCe9nDfe8cdCQ==@vger.kernel.org
X-Received: by 2002:a17:907:c0c:b0:c12:8cbe:b897 with SMTP id
 a640c23a62f3a-c1fe7eec156mr1051857166b.15.1785821918002; Mon, 03 Aug 2026
 22:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803065811.3490286-1-yunkec@google.com>
In-Reply-To: <20260803065811.3490286-1-yunkec@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 4 Aug 2026 07:38:04 +0200
X-Gmail-Original-Message-ID: <CANiDSCu2TxQOGPNGV_mOwT1xsKH+LRnGU42Qf2C6CCRNnXgSTw@mail.gmail.com>
X-Gm-Features: AUfX_mwFn1cd6FzTmhdBp2SdECK5b2AO44m-SiXgbc4_Z5bBbckec1NJ6koP7BQ
Message-ID: <CANiDSCu2TxQOGPNGV_mOwT1xsKH+LRnGU42Qf2C6CCRNnXgSTw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for invalid dev_sof in
 Logitech C925e
To: Yunke Cao <yunkec@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yunke

On Mon, 3 Aug 2026 at 08:58, Yunke Cao <yunkec@google.com> wrote:
>
> Logitech C925e SOF does not increases at a stable rate of 1kHz.
> Add a quirk for this camera to make hwtimestamp usable.
>
> Before applying the quirk:
> ```
> seq:     31 ts: 1075.543294 delta: 29.423 ms fps: 34.94
> seq:     32 ts: 1075.573022 delta: 29.728 ms fps: 34.90
> seq:     33 ts: 1075.602353 delta: 29.331 ms fps: 34.87
> seq:     34 ts: 1075.632031 delta: 29.678 ms fps: 34.84
> seq:     35 ts: 1076.177759 delta: 545.728 ms fps: 23.00
> seq:     36 ts: 1076.213255 delta: 35.496 ms fps: 23.12
> seq:     37 ts: 1076.209371 delta: -3.884 ms fps: 23.82
> seq:     38 ts: 1076.232233 delta: 22.862 ms fps: 24.11
> seq:     39 ts: 1076.264682 delta: 32.449 ms fps: 24.24
> seq:     40 ts: 1076.287318 delta: 22.636 ms fps: 24.52
> seq:     41 ts: 1076.285949 delta: -1.369 ms fps: 25.16
> seq:     42 ts: 1076.317714 delta: 31.765 ms fps: 25.28
> seq:     43 ts: 1076.317085 delta: -0.629 ms fps: 25.89
> seq:     44 ts: 1076.339919 delta: 22.834 ms fps: 26.13
> seq:     45 ts: 1076.212836 delta: -127.083 ms fps: 28.91
> seq:     46 ts: 1076.242494 delta: 29.658 ms fps: 29.00
> seq:     47 ts: 1076.271852 delta: 29.358 ms fps: 29.09
> seq:     48 ts: 1076.301739 delta: 29.887 ms fps: 29.17
> seq:     49 ts: 1076.330887 delta: 29.148 ms fps: 29.26
> seq:     50 ts: 1076.360639 delta: 29.752 ms fps: 29.33
> seq:     51 ts: 1076.390095 delta: 29.456 ms fps: 29.41
> ```
>
> After applying the quirk:
> ```
> seq:     31 ts: 203.782342 delta: 33.460 ms fps: 30.94
> seq:     32 ts: 203.815492 delta: 33.150 ms fps: 30.91
> seq:     33 ts: 203.849017 delta: 33.525 ms fps: 30.88
> seq:     34 ts: 203.882190 delta: 33.173 ms fps: 30.86
> seq:     35 ts: 203.915672 delta: 33.482 ms fps: 30.83
> seq:     36 ts: 203.948902 delta: 33.230 ms fps: 30.81
> seq:     37 ts: 203.982335 delta: 33.433 ms fps: 30.78
> seq:     38 ts: 204.015475 delta: 33.140 ms fps: 30.76
> seq:     39 ts: 204.048992 delta: 33.517 ms fps: 30.74
> seq:     40 ts: 204.082208 delta: 33.216 ms fps: 30.72
> seq:     41 ts: 204.115675 delta: 33.467 ms fps: 30.70
> seq:     42 ts: 204.148995 delta: 33.320 ms fps: 30.69
> seq:     43 ts: 204.182354 delta: 33.359 ms fps: 30.67
> seq:     44 ts: 204.215605 delta: 33.251 ms fps: 30.66
> seq:     45 ts: 204.249004 delta: 33.399 ms fps: 30.64
> seq:     46 ts: 204.282259 delta: 33.255 ms fps: 30.63
> seq:     47 ts: 204.315686 delta: 33.427 ms fps: 30.61
> seq:     48 ts: 204.348945 delta: 33.259 ms fps: 30.60
> seq:     49 ts: 204.382337 delta: 33.392 ms fps: 30.59
> seq:     50 ts: 204.415570 delta: 33.233 ms fps: 30.58
> seq:     51 ts: 204.449069 delta: 33.499 ms fps: 30.56
> seq:     52 ts: 204.482218 delta: 33.149 ms fps: 30.55
> seq:     53 ts: 204.515706 delta: 33.488 ms fps: 30.54
> seq:     54 ts: 204.548940 delta: 33.234 ms fps: 30.53
> seq:     55 ts: 204.582403 delta: 33.463 ms fps: 30.52
> seq:     56 ts: 204.615563 delta: 33.160 ms fps: 30.51
> seq:     57 ts: 204.649057 delta: 33.494 ms fps: 30.50
> seq:     58 ts: 204.682301 delta: 33.244 ms fps: 30.49
> seq:     59 ts: 204.715735 delta: 33.434 ms fps: 30.48
> seq:     60 ts: 204.748890 delta: 33.155 ms fps: 30.48
> ```
>
> lsusb -v

Could you provide the full lsusb output if you still have access to the device?

Thanks
>
> Bus 003 Device 005: ID 046d:085b
> Device Descriptor:
>   bLength                18
>   bDescriptorType          1
>   bcdUSB               2.00
>   bDeviceClass            239
>   bDeviceSubClass         2
>   bDeviceProtocol         1
>   bMaxPacketSize0        64
>   idVendor           0x046d
>   idProduct          0x085b
>   bcdDevice            0.16
>   iManufacturer           0
>   iProduct                2 Logitech Webcam C925e
>   iSerial                 1 2F2036AF
>   bNumConfigurations      1
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..5b9ea19ad9f2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2706,6 +2706,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
> +       /* Logitech HD Pro Webcam C925e */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x046d,
> +         .idProduct            = 0x085b,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
>         /* Logitech Rally Bar Huddle */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.55.0.508.g3f0d502094-goog
>


-- 
Ricardo Ribalda
