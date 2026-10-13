Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266938D014
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885254; cv=none; b=tuDs91KEguy6PZwLAihzyJubJg/dyajPm0mvgQt9BSnVz7nQLVAHgTFjxYrRXRqiGKCSuf/pYIsq1EvBk+KBapH0WSFAGuOF1vShbgyQMQny+dBiXgcqq81hqMaJRs/Kn/S4Pki/H/umoIg1Kue/GdndCDddvuImcTV4fBhyjWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885254; c=relaxed/simple;
	bh=bLkEdoC/s2ohCzLHE4r6Q3cM1e+diUmnTJyVdXz9CjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlzAo6kVeF8gUf0Zq7agMmzbwhPiX6fdcwbPXBgXO6xrPXUQTwvL7x+KgqE6jQI11je5XYFr8W42kGoUoHzclOjUNt3h1w1KixqQNDl0DlXcYxacJtz2dykv+GI83OezKoA/4sdvFvJAd+vyMeg2QNBqT+cnLaI9JvmMTuQSCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kmaHmF6M; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kmaHmF6M"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86aecf49833so1327221b3a.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791885252; x=1792490052; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7LIq4BnVsJhg0BWPrBY8yFOcAMplxkq0gIlyozRd1E=;
        b=kmaHmF6M0NTSLdO00OTtk8Zio/Mk4Q9UY/Kl1NmqCW5uCR79v2HIi3vLywUbqhFoll
         nr84No++zapupzmjihcTCr3XIZQTJp4O4aTxvxigdhQXFcOwRzM8BM5CEahAGHEMrt+y
         zcP6asy8LEfIjWNu5euh5utzTRh7mUTJLFPlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885252; x=1792490052;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w7LIq4BnVsJhg0BWPrBY8yFOcAMplxkq0gIlyozRd1E=;
        b=xOITqulHVAQ70kxtQh8MdyZCUsGXLUSjbV8z8BMX8ZTmOcCYozb508cHNED97TNf1M
         e+bZp7L8mofsJAHASc2AQGAjea+ZC6F52scfbnACKtJeu7ydB7rJhyL85d7B/aqGfyf+
         9jzqTZi0xsdnyHaJuU2UexKbLaHWNK1Q+w7A5x/q+E9XATzhkQpimSp7ONCSEA1RRPqJ
         F3ucY6fYc8rI55eEeQ6OobovrbSLjd4Pbxpp2ZxxxIr1kqDpK5Rb2eeGPsvNAfpzRIXS
         bB/b+MULWO3v28ijLp8Eq5rvPccFNihx7dWFDbWUCKKXXK6KZxVQf9HuWF7aNGx19VoM
         IIUA==
X-Forwarded-Encrypted: i=1; AKwUvBwI1cJPKliOVAtARvkueVTEfHRwHqU5wDSFiQaD9HvjnbWBBpfqL4hsEuopomvpOm3ET1K8DPOT9GRmNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxYuFjyP6Fk2tXkcRk/365B8y5J/YK/MoJHUqzpUhM1LOEWLYB
	MK9UV6bYYfEnsPAxuqjd9y0DJdgNjBo6OisUbg3C9iX5lqWQi3ZsZG86xHX/K0I2558OIXJI4hJ
	mbmY=
X-Gm-Gg: AYBFou1pSm5oOsXsW46luTE4FK7t0MpSSE67+eZJDMnXz5KU2BUbUwUaDfKQMcU+CdU
	bsbAfG9gun3hfwjGNuT7hdP8um7Cak9NJDKmHPTUiUfG5WxmCQ1ZiYrzxZuHz5gNSCLQRxgp76J
	2pcfIv9XR0wZSXKBjz54T9h9nJkKrHcN5PWGb+rwwb41052G69KgIdShrX7M+472ODM70j4+gML
	ur8UeYEil+FJSsG4vjfcvzHlTQPPsHJWFiXYA22MJJF0TZhaUL5O/ZgCQxrLnc72gBaNMU7vhjh
	QgLi9+2ng37IhiyOP7MvKc+fsH0wByIpeF80ySVQlOEbNlBhrAt+EmYza9gkSsVM6ypWFm8fS4A
	1N+XxViUGKdehhIq6i9EtaiZAZmxaxto3RnrqwWrEpfuSZY1miIuiYBMQzWCF7U8TqXMSugvEht
	a8hD/c1NB8icdYzCn/VVZTm9wXQ9rS6Ou06OIMTf+kUXJ0Kfx9/xX+Jhg5d7uUGEHlzShrzOquM
	UlpVZ8/ql3X/+EqcOFM4T4jGopNN0U9fVu5xM5OVy1VnA==
X-Received: by 2002:a05:6a00:3d49:b0:891:e380:3d03 with SMTP id d2e1a72fcca58-896a29105e5mr8209914b3a.28.1791885252262;
        Tue, 13 Oct 2026 02:54:12 -0700 (PDT)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107373sm4557304b3a.9.2026.10.13.02.54.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:54:10 -0700 (PDT)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1438d9363fbso764662c88.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 02:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBF6nnRgxXWi7tBJo0dF/a4vsRlvZz2IoRc+rU6kRX6TMfNbGAuE6g5ExBcTBKiYbLQujqufD5kJoQZg==@vger.kernel.org
X-Received: by 2002:a05:701b:4510:20b0:15b:1439:1fcb with SMTP id
 a92af1059eb24-16a5b979b4bmr16261285c88.10.1791885249183; Tue, 13 Oct 2026
 02:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013065335.2246959-1-clinckx.louis@gmail.com>
In-Reply-To: <20261013065335.2246959-1-clinckx.louis@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Oct 2026 17:53:55 +0800
X-Gmail-Original-Message-ID: <CANiDSCujghpaqP64tWnObOTMUmNTdQp3-6yb2C2MrOC9=48a4w@mail.gmail.com>
X-Gm-Features: AclHuK_01jiEiqdsSns1DzgI9X840igUpsiES1nGyb81ZHSPK_oSApAFhO_Tx_Y
Message-ID: <CANiDSCujghpaqP64tWnObOTMUmNTdQp3-6yb2C2MrOC9=48a4w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: skip bulk output URBs smaller than the
 payload header
To: Louis Clinckx <clinckx.louis@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI Louis

Thanks for your patch

On Tue, 13 Oct 2026 at 14:56, Louis Clinckx <clinckx.louis@gmail.com> wrote:
>
> For a bulk video output stream, uvc_video_encode_bulk() starts each
> payload by writing a fixed 2-byte header with uvc_video_encode_header()
> and subtracts it from a signed length counter initialised to the URB
> size:

Out of curiosity, do you have a UVC output device? I would really like
to test one out, but I could not find anything on the market.

>
>         int len = stream->urb_size;
>         ...
>         len -= uvc_video_encode_header(...);    /* always returns 2 */
>
> An output device can describe a bulk endpoint with wMaxPacketSize 1 and
> negotiate dwMaxPayloadTransferSize 1, which leaves stream->urb_size == 1.
> len then becomes -1, and uvc_video_encode_data() casts it to unsigned:
>
>         nbytes = min((unsigned int)len, buf->bytesused - queue->buf_used);
>
> so (unsigned)-1 does not clamp and the following memcpy() copies the
> whole frame past the one-byte URB buffer.
>
> A URB that cannot hold the 2-byte header cannot carry a payload, so skip
> it instead of letting the length underflow.
>
> Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1701,7 +1701,14 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>         if (buf == NULL) {
>                 urb->transfer_buffer_length = 0;
>                 return;
>         }
>
> +       /* The 2-byte payload header must fit; a smaller URB would make len
> +        * underflow and uvc_video_encode_data() copy past the buffer. */
> +       if (len < 2) {
> +               urb->transfer_buffer_length = 0;
> +               return;
> +       }
> +
>         /* If the URB is the first of its payload, add the header. */
>         if (stream->bulk.header_size == 0) {
>
I'd also detect that the configuration is broken, maybe in
uvc_init_video_bulk() ?

and a bit nitpick. I think this is slightly more idiomatic than your check.


diff --git a/drivers/media/usb/uvc/uvc_video.c
b/drivers/media/usb/uvc/uvc_video.c
index ec76595f3c4b..03940b62b250 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1373,6 +1373,8 @@ static void uvc_video_decode_end(struct
uvc_streaming *stream,
 static int uvc_video_encode_header(struct uvc_streaming *stream,
                struct uvc_buffer *buf, u8 *data, int len)
 {
+       if (len < 2)
+               return -ENOSPC;
        data[0] = 2;    /* Header length */
        data[1] = UVC_STREAM_EOH | UVC_STREAM_EOF
                | (stream->last_fid & UVC_STREAM_FID);
@@ -1656,6 +1658,10 @@ static void uvc_video_encode_bulk(struct
uvc_urb *uvc_urb,
        /* If the URB is the first of its payload, add the header. */
        if (stream->bulk.header_size == 0) {
                ret = uvc_video_encode_header(stream, buf, mem, len);
+               if (ret < 0) {
+                       urb->transfer_buffer_length = 0;
+                       return;
+               }
                stream->bulk.header_size = ret;
                stream->bulk.payload_size += ret;
                mem += ret;

-- 
Ricardo Ribalda
