Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988798;
	b=IUR6WH0I5EiWd0P+H+m1o9cK8g2GLMNb83oUL7Q6yKORWWnSX3wsLSPAq360DtUbvRa9
	 sEbmjqpnoXLOCv0q0L4XNp/I7IHBKslnvh7Ddm+semjUHSkGJyOMbEq3CzkVzXhMuBgKm
	 RXSafnOmoA2Pc9lZwQfAcGLt0Zk2RDvbL+S2tL5ihDm9AXEBtMwBuj6g0V5A06d+2VN3Q
	 UC2nk6u56m5p0g49uK+iFHEbhkKIDlOBIxXMVuJEOY3a7ED82jEa5dCSmDNzpVzd2cZ20
	 HMcZTz8LmoecTR8XjNQfdVmq5EI+0alF73RTJacNfaSCmmHkviP4/2RBKeSf6VOkfLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=72tGctQSJC3sovrJNDKUw4VsbC0GPU9rXB9Nz1ShMzs=;
	b=EcB/FNRi+XAGfEb9j3oq/p8t2AqijlXkvAUFgED8sNcOdRWsWLZO3mfGHh0ObrYSDlSx
	 4iRNvyC1p31DCuK6RNyr4cWYt7JITk4qyehJJdeEEcUxHBZVjWNe21qcd0JzHPvPOdKmk
	 +EKp2oXbSY0D3L6F00gvdYuOl3frord39I6EVeE/i4v6LlvSZ/M6PuAi+UDQmomSCXci/
	 1MrCLgm7gpTgiR9qsbMpcZMn0J4QaUj6Tyll1toz26XyYJloP/AHBvUM8ZoODqsAlguCc
	 S1hui/V9yfBEiKZHVZK5IK+qLiql13DeB5wZhWxRJWnP764ZEFClk6Mg29FX7S6vKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uq63F+mG;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F0606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 07:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uq63F+mG
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b2382bf051so440077b3a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794988798; x=1795593598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72tGctQSJC3sovrJNDKUw4VsbC0GPU9rXB9Nz1ShMzs=;
        b=Uq63F+mGUdnOCuzr6jxVFIqzxqY3jT2j2B6h5/mVYuQ8tldoG47usv+jjipwy41yZ2
         qn4+BzrJnjK8QTSvt+QX6lNCMeWpHKpPvX8BgNXWPcaMDJOWJ/Taa8DixmZ4YMkA4+Rf
         GaduIWcTZtR40rkj0Ms1ZNGk40Jp2oZH28Jio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988798; x=1795593598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72tGctQSJC3sovrJNDKUw4VsbC0GPU9rXB9Nz1ShMzs=;
        b=hnzaG595znEt1rKz0cY6AgNeha/eEDY7Z31pMCUKRMis+RCVCK3jk61ZtjvaH9gCqr
         SakXLkZd2GxD2v8Zk/eAoKURoGOcbo8MjPwnETZbcZ5zNYRsW8H8OyyIoQMq8cPCqlYd
         75yx1qkLhKQBxqLdj/pjYWlcfvqF7CBg/quVSe8iVRlj/7WloQ3N0UquQ3Dg+FN3dxLu
         GF8WiRkt2M958hLb1pDHiYs/br625aci0KFcFD2pigdh+Z62xYfmvxdkUSocFdD0RLwb
         IBIg4c1hMemFuwUXw9ht02GQnCwTzPjMTYUnxZA9gcAIzTTq37C8Y0e0+SanTzxj7Ro4
         5kpQ==
X-Forwarded-Encrypted: i=1; AL+hErG/C8oGUZBVgSPgC0A0nqi8vcZ4szZ7ZLPnar5WMptXKwReMpquNINm5DalSX8eXw9a3+pqHD3AEvlyrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rnGPbZPK870g+Jw5SxmDUfH57NKuvXT4nRSLJ33chmdwNid3u
	sMwBhDSX+al83qd/xX2Hn531xvXew6/hbp8WsfUHb1hB9b7ikX6gwWSB5SBO8U9eLVAn/uYRJ0E
	IBXcZHz6B
X-Gm-Gg: AYBFou1J0Csc+aBQGn9L6o5GfqYXQWIXmhX4Vw1ze6zs5hWlCfqCTj67cDz1EP6i6Bw
	6bHizQUaSVSLelJJqbb4qnxlFMpi1sN/n/r2yiz3tfJd3DrggPa7lxZNNYdOtj/U+gOh9ShUHfe
	qNEM8oTFraMyulmE7cKp8xg+nid0bKPgdzYxZphcI3WQAOC1ICA0XJChBqaLTvc5REIOO14G2wk
	+V5+MXZFwyaGPB2WTwiJV83v1qLFIqqd8hi1OauEFpQqBKO9owmTgV0gF0mk+5IKMzMLps0gu4U
	gkCKDKTZq1lXhpTLrtrCjmAZ/1wVrrsEa3kpJsrGNF+lDrAbN3sqMk2T0qktKZFtseKtAsr+stW
	TtGDWBb9QrRJIeUBon6zOrWpgEDBv3bQbtnvCs4D1UsVwUS5itZYHpXUEzCbjlZ46OxzvVysj6P
	C6aUwsQX//3EW1pvHUXAJL5PpwxtSM4jGpW3EwMg6G5eZ0oGJd5JLfK49hs8B+iaEultX7eSlVo
	Jrs/0K0W89Cy5ZasRXAmJFmbZYSjDnjPOFDrCJPMzlXAHf4LE10dEVjqXDoYuz81RkRn1EnxPBU
	GzCV8dc4zEtATGdZ4QJKObDDgDJZ9MnrHdEn6NfrS/+Cfw8L2zNH4rhdzpSH0z/d4mI=
X-Received: by 2002:a05:6a00:3310:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-8c5d4eba27dmr1721985b3a.37.1794988797796;
        Tue, 17 Nov 2026 23:59:57 -0800 (PST)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93ce12sm746065b3a.52.2026.11.17.23.59.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:59:57 -0800 (PST)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so1150499c88.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 23:59:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGWoRpTj1d9vh7UkkOqYaiBzOQXEz8UsVOv8yuVCFCGwOb/6Y2FJcUXbs9Owx6t8xZi89eYDyXrIHn2/A==@vger.kernel.org
X-Received: by 2002:a05:701b:21d3:20b0:1b4:f5cb:ebe3 with SMTP id
 a92af1059eb24-1b543beb815mr1824249c88.16.1794988796147; Tue, 17 Nov 2026
 23:59:56 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118134629.463042-1-shxzhaosr@163.com>
In-Reply-To: <20261118134629.463042-1-shxzhaosr@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Nov 2026 08:59:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCuFgmeFyLt5Bjy-WZAWXVBWwsZxmTZuBcf_1hmVGDjkfg@mail.gmail.com>
X-Gm-Features: AclHuK8OLcA5-JmybD4qQm43TUB5nr2Qa1PGlP7CqD-OYUmqV619UG_T_bPxNfA
Message-ID: <CANiDSCuFgmeFyLt5Bjy-WZAWXVBWwsZxmTZuBcf_1hmVGDjkfg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: reject descriptor walks that cannot advance
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shirong

On Wed, 18 Nov 2026 at 06:47, Shirong Zhao <shxzhaosr@163.com> wrote:
>
> uvc_driver.c walks the extra descriptor data four times, advancing
> the cursor by buffer[0] each round: the frame descriptor loop in
> uvc_parse_format(), the skip loop and the counting pre-pass in
> uvc_parse_streaming(), and the format descriptor loop after them.
>
> buffer[0] is bLength from a descriptor the USB device supplied, and
> nothing constrains it.  A device that reports bLength 0 leaves both
> buflen and buffer unchanged, so the loop condition is still true on the
> next iteration and the same descriptor is parsed again forever, on the
> enumeration path.  A bLength above the remaining extra data walks the
> cursor past the buffer instead.
>
> Add uvc_desc_walkable(), which requires the two-byte descriptor minimum
> and that the descriptor still fits in what is left, and use it in the
> four loop conditions.
>
> uvc_parse_control() is left alone: it already carries
> "if (buflen < buffer[0] || buffer[0] < 3) return -EINVAL;" at the top of
> its loop, which covers the same case there.
>
> Found by static analysis of the descriptor loops; not observed at
> runtime.

Your new checks are redundant.

Please also include the driver caller to your tool:
drivers/usb/core/config.c
usb_parse_configuration() already checks that each descriptor
`buffer[0]`  is valid.

IMO what could be improved is that our "field parsers" do not leak to
the outside the `field`. Something like:
7fa44c2c123c ("media: uvcvideo: Bound uvc_parse_*_control to the control size")
but for uvc_parse_format() and uvc_parse_streaming() and
uvc_parse_frame(). Unfortunately, the change will not be as clean and
self contain as uvc_parse_control(), so I do not know if it is worth
it.


Regards
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index cbc1456..57437e1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -332,6 +332,18 @@ static int uvc_parse_frame(struct uvc_device *dev,
>         return buffer[0];
>  }
>
> +/*
> + * A descriptor's length is supplied by the device, and nothing constrains it
> + * before the walks below step the cursor by it.  Below the two-byte
> + * descriptor minimum the cursor does not move at all and the walk spins on
> + * data the device chose; longer than the extra data still unparsed and the
> + * cursor would step outside that buffer.
> + */
> +static bool uvc_desc_walkable(const unsigned char *buffer, int buflen)
> +{
> +       return buffer[0] >= 2 && buffer[0] <= buflen;
> +}
> +
>  static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_streaming *streaming, struct uvc_format *format,
>         struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
> @@ -486,8 +498,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>          * based formats have frame descriptors.
>          */
>         if (ftype) {
> -               while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> -                      buffer[2] == ftype) {
> +               while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
> +                      buffer[1] == USB_DT_CS_INTERFACE && buffer[2] == ftype) {
>                         frame = &frames[format->nframes];
>                         ret = uvc_parse_frame(dev, streaming, format, frame,
>                                               intervals, ftype, width_multiplier,
> @@ -591,7 +603,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         }
>
>         /* Skip the standard interface descriptors. */
> -       while (buflen > 2 && buffer[1] != USB_DT_CS_INTERFACE) {
> +       while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
> +              buffer[1] != USB_DT_CS_INTERFACE) {
>                 buflen -= buffer[0];
>                 buffer += buffer[0];
>         }
> @@ -658,7 +671,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         _buflen = buflen;
>
>         /* Count the format and frame descriptors. */
> -       while (_buflen > 2 && _buffer[1] == USB_DT_CS_INTERFACE) {
> +       while (_buflen > 2 && uvc_desc_walkable(_buffer, _buflen) &&
> +              _buffer[1] == USB_DT_CS_INTERFACE) {
>                 switch (_buffer[2]) {
>                 case UVC_VS_FORMAT_UNCOMPRESSED:
>                 case UVC_VS_FORMAT_MJPEG:
> @@ -734,7 +748,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         streaming->nformats = 0;
>
>         /* Parse the format descriptors. */
> -       while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> +       while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
> +              buffer[1] == USB_DT_CS_INTERFACE) {
>                 switch (buffer[2]) {
>                 case UVC_VS_FORMAT_UNCOMPRESSED:
>                 case UVC_VS_FORMAT_MJPEG:
>
>


-- 
Ricardo Ribalda
