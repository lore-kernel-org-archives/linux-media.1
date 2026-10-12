Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6432833F8BE
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 01:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770062; cv=none; b=UcoxD/iHl5nNoHd+RGoWsXdJZDcACZtax8ORiBUVkpjpjpwlbsXLYuZGKumNnwTal3YcPwLUeJTR9xwLBFHSq89e37p2+XX5T8Zv+ZL/5yWnp693blMDD3+wfPrqDslnNIdVneOJ8V8RxFqfHpKj0HFMXT0FHgz0AslgB3XF9F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770062; c=relaxed/simple;
	bh=fuIFDJ09YT2y/gdrngPJBXsjaz5KcU6XyqRitxLnvns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmMLM8tX3tF2bj+xdYLFFzfXVaKom0qPltxuDq9cm9asC/FshaAdBlzQrIW/yS9UHM6JOpG9PvKaOBV8y/3NzOxGoHXr1JAY8ujZDWz3ffbrRH5dobW20EdlS/1JvFWx1TL3eqtnbbPLVIh3v2izMEDYRodWG0SJTcxmrysCYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NuleTeF8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NuleTeF8"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1171875a91.2
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 18:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791770060; x=1792374860; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBRH9zb+DpmAXh0LEaeO6lRXEj5Ct3w3C8zKVqnBWE4=;
        b=NuleTeF8OE3wSGNaauE2nHPenvQlN9J/dCv7K01KY7RsVj1Q6ihfVVrVNXFVnYK5AX
         j72FyKA4YmPB/fFAuFQouS5n66/srM0GT1AuxB4POD1qxhz8krS5ESk27DPTJLHKmdod
         p89R7t0y1u/4Rkcd+ktQhtvr4mD6kRvYMHDnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791770060; x=1792374860;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TBRH9zb+DpmAXh0LEaeO6lRXEj5Ct3w3C8zKVqnBWE4=;
        b=bJNYH5JAZrpLL2cdT4sqo0nGw114f0GjSEzUGd0e6FHZtRFC5eJw97OlFLJ0M1WXkZ
         dWY5HV1kK90wKYEcMkiV41sS6BVPtJ6Gqcy09a00Kuj64lw7uohoViwtdxdtZ+FhIgJo
         9z0vW5pKpmJBQp96j81tWdOTl/blIgHt95tbs9IZQKQes5SZS+29hVzVlg8IcFIZX0VK
         Oy2mIEghKBuCES7OoU/XR/AXVIarpZXP7MO3eujh0hvXmLDHOIyiNUEUV+saYngr1QDv
         HgcAfr3hrNPREoso41cBn826+lUKOjzzwV6tOm1GB35qEkDn8eb8iidkNhgSXuCk7yZf
         7BUw==
X-Gm-Message-State: AFq9FYL2QEY+WnDR/326NK6cVgfaXzMifvsM7yBZiSswSCDRw4c3Fs3Y
	NhfWAhhF7LfhAZAdlYHzlMaIq0bh1NzeLQdkDLA2JKoK6qhd/Ax40giJsFKpr/oczlEtIvpv9HR
	ei0UfIg==
X-Gm-Gg: AYBFou2DhL2qAekLdTO5eYEoUwoFodRYRWl20vvZ80zzZdQ58ncPau2aO8+gQIjJL+H
	jUeSSRRSDAv/ZyC3KWdnJblUp4Xv9gUnYgwmVuOjcunkwXmnLIlU2nOLz7vcSs/YjODF0rV1eeT
	pq0WYijXQiRcdyUwaQLlPmztTH5x+MirQbSeJEffaqG5yVtmgWvJp8Q4+9rEAsvfetZSlB/27By
	ZRmVg+rF9rurGbjf6DgHjw2cL4lOoB5n/kkmsIbPUzNzlJID/VSoHqVYiuxkfE0FEOtOUW5NMJX
	Y1see4bqLcitbNbhSDudiaf5kZt5DM++PDHONFR2+ciSD26r9RshTQ1RezxMo/jov6Bcs4achXF
	ISBsjWvkvssDYMTl7P5McgXsZYXtx36Nb+27ori0M9DQLvHN5ALU0rwpACvBC0JqhZCogHbRvHY
	BC2R57LfBr5zOG78TluAqygZcSBSCBSXjtl7zrAfQA/OsYLSDNxJ2aWmBStV8dnq22eXTqm1/1c
	X2Qx2EHYG7OljaFb2b08he/nRSU68Ic3BDoW4o=
X-Received: by 2002:a17:90b:568f:b0:3a8:cc4f:3478 with SMTP id 98e67ed59e1d1-3ab3a3a1879mr8117314a91.8.1791770059514;
        Sun, 11 Oct 2026 18:54:19 -0700 (PDT)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm14006702a91.5.2026.10.11.18.54.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 18:54:18 -0700 (PDT)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1702364eec.1
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 18:54:18 -0700 (PDT)
X-Received: by 2002:a05:7022:7f1b:b0:15b:722b:4bfc with SMTP id
 a92af1059eb24-16a6043ce08mr13693926c88.31.1791770057521; Sun, 11 Oct 2026
 18:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165248.56440-1-walid.badar@gmail.com>
In-Reply-To: <20261009165248.56440-1-walid.badar@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 12 Oct 2026 03:54:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCtSo2nmbjzWC8CC3GAg2vsh-OBBW1-Skogb4tFpZ240-w@mail.gmail.com>
X-Gm-Features: AclHuK_S1QeR_jD5dyFFbqrBJmDHlUxppmKUPKoi59KTHhBZ-WyZFIAv6WQBKis
Message-ID: <CANiDSCtSo2nmbjzWC8CC3GAg2vsh-OBBW1-Skogb4tFpZ240-w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Handle payloads starting in the middle
 of a bulk URB
To: Muhammad Waleed Badar <walid.badar@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Muhammad

I understand that this is a RFC. Let's focus on the problem before we
discuss the code.

Currently, both for isoc and bulk, if the camera appends some data at
the end of the frame (let's call it trailer data) it is silently
discarded. With your proposal, this trailer data will be considered
part of the next frame.

The trailer data is out of spec (check figure 2-12 of the spec), but
having multiple frames in the same bulk package is also out of spec
(For some reason the bulk cameras are the worst at following the spec,
no idea why).

Your proposal (again, not looking at the code yet), will fix the
problem for some of the broken cameras but ti will completely break
the driver for other family of broken cameras (the ones that have
trailer data).

If we want to automatically handle your family of broken cameras we should:

- Add heuristics to also handle the camera with trailer camera (does
the extra data look like a uvc header?)
- Add a non compliance warning so the vendors have some feedback about
their wrongness.

Regards!




On Sat, 10 Oct 2026 at 00:58, Muhammad Waleed Badar
<walid.badar@gmail.com> wrote:
>
> The bulk decoder assumes that every payload starts at the beginning of
> a URB. It detects the end of a payload either by a short URB or by the
> accumulated payload size reaching dwMaxPayloadTransferSize, and then
> decodes the start of the next URB as a new payload header.
>
> Some devices, such as the Realtek USB Camera (0bda:579f) integrated in
> Razer Blade laptops, send payloads of dwMaxPayloadTransferSize bytes
> back to back without aligning them to URB boundaries. When a frame
> spans more than one payload, the next payload header lands in the
> middle of a URB. The driver then copies that header and the data that
> follows into the current frame, and parses frame data at the start of
> the next URB as a header. This shows up as "Marking buffer as bad
> (error bit set)" and "Dropping payload (out of sync)" trace messages,
> and most frames larger than one payload are returned empty or
> truncated. On this camera every MJPEG mode above 1280x720 is affected.
>
> Fix it by splitting URBs at payload boundaries and decoding each part
> separately, so that a payload ending in the middle of a URB is
> completed and the remainder of the URB is decoded as a new payload.
> Devices whose payloads end on URB boundaries are unaffected, as the
> whole URB is then processed in a single iteration.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=207045
> Assisted-by: LLM
> Signed-off-by: Muhammad Waleed Badar <walid.badar@gmail.com>
> ---
>
> Notes:
>     Tested on a Razer Blade with the integrated Realtek 0bda:579f camera
>     (bulk endpoint, wMaxPacketSize 512), on Fedora kernel 7.1.10 with the
>     patch applied to the matching uvcvideo sources. 150 MJPEG frames were
>     captured per mode with ffmpeg and checked for a valid JPEG EOI marker:
>
>       mode        before          after
>       1920x1080   25-36 valid     150 valid
>       1280x1024   37 valid        150 valid
>       1280x800    38 valid        148 valid
>       1280x720    150 valid       150 valid
>       640x480     150 valid       150 valid
>
>     GNOME Snapshot (PipeWire) no longer reports JPEG decode errors at
>     1920x1080. The patch also builds against 7.2.8. It has not been tested
>     on other bulk-mode UVC cameras.
>
>     The root cause analysis and the patch were produced with an AI coding
>     assistant (Claude Code) and reviewed by me.
>
>  drivers/media/usb/uvc/uvc_video.c | 70 ++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a43..fe1714ccc 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1612,27 +1612,20 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
>         }
>  }
>
> -static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> -                       struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> +static void uvc_video_decode_bulk_chunk(struct uvc_urb *uvc_urb,
> +                                       struct uvc_buffer **bufp,
> +                                       struct uvc_buffer **meta_bufp,
> +                                       u8 *mem, int len, bool short_urb)
>  {
> -       struct urb *urb = uvc_urb->urb;
>         struct uvc_streaming *stream = uvc_urb->stream;
> -       u8 *mem;
> -       int len, ret;
> -
> -       /*
> -        * Ignore ZLPs if they're not part of a frame, otherwise process them
> -        * to trigger the end of payload detection.
> -        */
> -       if (urb->actual_length == 0 && stream->bulk.header_size == 0)
> -               return;
> +       struct uvc_buffer *buf = *bufp;
> +       struct uvc_buffer *meta_buf = *meta_bufp;
> +       int ret;
>
> -       mem = urb->transfer_buffer;
> -       len = urb->actual_length;
>         stream->bulk.payload_size += len;
>
>         /*
> -        * If the URB is the first of its payload, decode and save the
> +        * If the chunk is the first of its payload, decode and save the
>          * header.
>          */
>         if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
> @@ -1671,7 +1664,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
>          * Detect the payload end by a URB smaller than the maximum size (or
>          * a payload size equal to the maximum) and process the header again.
>          */
> -       if (urb->actual_length < urb->transfer_buffer_length ||
> +       if (short_urb ||
>             stream->bulk.payload_size >= stream->bulk.max_payload_size) {
>                 if (!stream->bulk.skip_payload && buf != NULL) {
>                         uvc_video_decode_end(stream, buf, stream->bulk.header,
> @@ -1684,6 +1677,51 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
>                 stream->bulk.skip_payload = 0;
>                 stream->bulk.payload_size = 0;
>         }
> +
> +       *bufp = buf;
> +       *meta_bufp = meta_buf;
> +}
> +
> +static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> +                       struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> +{
> +       struct urb *urb = uvc_urb->urb;
> +       struct uvc_streaming *stream = uvc_urb->stream;
> +       bool short_urb = urb->actual_length < urb->transfer_buffer_length;
> +       u8 *mem;
> +       int len;
> +
> +       /*
> +        * Ignore ZLPs if they're not part of a frame, otherwise process them
> +        * to trigger the end of payload detection.
> +        */
> +       if (urb->actual_length == 0 && stream->bulk.header_size == 0)
> +               return;
> +
> +       mem = urb->transfer_buffer;
> +       len = urb->actual_length;
> +
> +       /*
> +        * Some devices (such as the Realtek 0bda:579f) start the next payload
> +        * immediately after the previous one instead of in a new URB, so a
> +        * payload boundary can fall in the middle of a URB. Split the URB at
> +        * payload boundaries and decode each piece separately.
> +        */
> +       do {
> +               int chunk = len;
> +
> +               if (stream->bulk.payload_size + chunk >
> +                   stream->bulk.max_payload_size)
> +                       chunk = stream->bulk.max_payload_size -
> +                               stream->bulk.payload_size;
> +               if (chunk <= 0)
> +                       chunk = len;
> +
> +               uvc_video_decode_bulk_chunk(uvc_urb, &buf, &meta_buf, mem,
> +                                           chunk, short_urb && chunk == len);
> +               mem += chunk;
> +               len -= chunk;
> +       } while (len > 0);
>  }
>
>  static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> --
> 2.55.0
>
>


-- 
Ricardo Ribalda
