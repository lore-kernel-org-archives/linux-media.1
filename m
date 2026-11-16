Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839245;
	b=HX0cReruYK7ZYj1IRnqeE/eHauKe41EUhmDGoI5sLMOsn4p04a/Rl5fAiXGlhyUpW3pY
	 sf2odsz626DL6pdF0BdpAWmIXnno0KH8LOhLj2eAf6gMWLd3rNvMuWBD6rqhGf7ReAoAE
	 JBXhM9cI8WMLkIp/VhpYN5qLUn6cBRCqA2hy6IsRGPdZtmbn1cCCfLrfDO9HB68OOsQmq
	 aZofCwWvr8gbBdKax1dPxkLcwBoNTaPdAh1E6zMU4VwVYb4LqUom8g23WBeO+NA0sZdlB
	 iwVyMe+2lf6n9ucpxaHr2tSXwtR/cExqfPaA/DyDLGEh+mluQ2Yj6fFOv9qXsWgUJPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yZqYyYz6dpLdL8GHBDQVwB9zUDWf7FNjz92hLeD5y5Q=;
	b=2tcFwLqfr76epcRRaHdXSEEpTSajC3DoFnGQmCK3SUBzSrCBDkewcdzAChCEi4kARGU3
	 V5E+YpwHFFLFXYgw3FZrWwEkYL5gNCdgQIhFhIai2ycqRlbsxETdFfKvVHAjFjmOPB4A7
	 LXY4J2L2K5lzylXJeSk96sWbk9GFNMaoAoFVUjObT/2iDw5CE35n7NxMHuyFOREefDxMd
	 trTNxcBo/wZdVD2dnsL6fOr2Ak9w0blOD7ELiBE/9r8v88SPeOuP4l1XROkrnFQmwj+Cv
	 zaXy2KG/e6rPqAZKGE3LI9odp0YxnI5mcXMnhLxkqm/WDf9M64lXGWFm1Wcs/IS3AgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T50zmCMu;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2163B606A32A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 14:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2163B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T50zmCMu
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1196526a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794839243; x=1795444043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZqYyYz6dpLdL8GHBDQVwB9zUDWf7FNjz92hLeD5y5Q=;
        b=T50zmCMutFQMf12qCJ9uwW4p4HoqLyAg9G0VLLlY1VlWSlAQ7o3XoEosx/OmNOPYRz
         iaBbkJwXIvfIhUfmnmqFuuLLloBcgk7G+eiUc9bRXRnhcHb5BrKeH/IqYh/tz0DbNa1Z
         2DmcpMMQ4p+6r3+aHH0dmuG+Yhms33ilXG6dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839243; x=1795444043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yZqYyYz6dpLdL8GHBDQVwB9zUDWf7FNjz92hLeD5y5Q=;
        b=Z9KstzaWhqmoiV9g9lEBwCe4pItqHA24K1N+qq6Ntkk++j1vbGwK0zm5kBfl7G7M5/
         QUzr1I6G3LLW9eeNz8Xk7Me1lOHcg2H1U99KMZkjlli9SuY159CYQRCAvW31o7w4PZ27
         vwCE84w8AfYfuoVgnfaXcHt0b0TtgbcaQg9OHNdKCKvfs/OI/uRAi8OalbMZUDyjFMZV
         eR8fa0fF7DF0D7Ow8decOFq1ZleSgnMFrEFv0YigRfHwlF+OdXPnD4Mw96QLNMYie98O
         lMvbZ7rqXvYC82SLmWtE5jaDS/1yKGK829OcNOu5rHPirs0JSXJV3ZhekCm9/ETMWmEC
         VCFA==
X-Forwarded-Encrypted: i=1; AL+hErHgfckYU0WAkDZP3zZhSeIu2voTrlxCdivolGHFYB+cYx0x0I95jaZOOpDirrBEVnF0t2DZ2dfjoOVlzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZq6dFIxSvGrq8G6w/lkKezaUdim5EeUGGFaK9CnuEt2BjVRt
	tvmlFKEm3DFdpaKJsMWTiRLdFDOnYsKI0BPvB3tP841gW5lXUrelQg+Niu1Y2ZPozIzEM3HWryT
	z9SCey6Dy
X-Gm-Gg: AZFdTZc0kN9Xilpe4Q2nFJ8WLEa7sTe2E6GtsQV+L4gyxCCSge/UC5BlQPRy8VYCP9P
	SVMfI0hqR0S4xCoJa/e5B7KLSz7lIFYutJk7bcJzCfb7CGA20uKaFt29DQgSZpMZ7U2Y6XYB55q
	pNKA2gfpgn4Z2B6QcLu1an3WA45624AOjNyillTsg7IWf7+W2yFQFyyPlG2f956XUXQ4Z4HwFcD
	+oqyWyLoDft6A1N6v9BgAXV2454AooLKsw0G/7z75FkZQPiRIByJJL+7qEZgEoHadD4vTnBsvgM
	7ZAENcQGhGOPq3H+1Y0Z4lquJQk58XJ+7yc1J8EkzSXNJnHOd7sVDn+hlorloaD035C7qaFT5Mn
	JXYvGhHVET4CGYXxe8YWUPZlXda24Qs67k1yi95Da6Ft5Uu9gEogIJWijQzY5BOroLJJQMGKkPi
	jPWT+akDWLfr96w4/lbQarnZvGCKnYMTxGqzLyiM4klJN2PnyJwNLHWRt50cXrsFwQuJJjhxUem
	sjhkYJ4jez5cf9mg1+2kU4ZfGWmPYb9rS+UHlcSGqkLnhCGKD0dJYCKkDryI8lajyhNo4buWSyN
	/NXQT6D4a69EWdrNAhydNykJ57UFZ2ahzuLis12acuvCfal5jLl9D0rl3i/LMNbAOQ==
X-Received: by 2002:a17:90b:384f:b0:3b0:9e2f:cfc7 with SMTP id 98e67ed59e1d1-3b1b0b649d8mr9212536a91.44.1794839243320;
        Mon, 16 Nov 2026 06:27:23 -0800 (PST)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com. [74.125.82.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm17366998a91.4.2026.11.16.06.27.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:27:23 -0800 (PST)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so5246352c88.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:27:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF5eJWZHF4RfzyxyF6i8C0DB60JubWDlLF374n2Qu8e1aHYOYU8w5ubDEwJ82HEd96GzURn80d++wttfw==@vger.kernel.org
X-Received: by 2002:a05:701a:844a:20b0:1b5:1a41:f3b6 with SMTP id
 a92af1059eb24-1b51a41f403mr6681578c88.4.1794839241010; Mon, 16 Nov 2026
 06:27:21 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
 <20261116-uvc-shortmeta-v1-3-487cfe42fa89@chromium.org> <20261116140114.GC1714298@killaraus.ideasonboard.com>
In-Reply-To: <20261116140114.GC1714298@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 15:27:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCvitQJU+RTO0MLJgJLPK3BZVPHPcrtU_7iJygGRxKpCgA@mail.gmail.com>
X-Gm-Features: AclHuK9EY-9Q3Zcf3NUEcs1Z5UODzPpXwEEXxHoNI2jIHFloOBFHm9IQER-8PH4
Message-ID: <CANiDSCvitQJU+RTO0MLJgJLPK3BZVPHPcrtU_7iJygGRxKpCgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Fix unaligned and OOB access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent


On Mon, 16 Nov 2026 at 15:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Nov 16, 2026 at 11:56:39AM +0000, Ricardo Ribalda wrote:
> > meta->buf and scr point to packed metadata and USB packet memory that do
> > not need to be aligned to anything. Also, scr + 4 is a 16-bit field, so
> > reading it as a u32 reads 2 bytes out of bounds.
> >
> > We use *_unaligned() in the rest of uvc_video_decode_meta(), but not in
> > the debug print.
> >
> > Fix this.
> >
> > Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e9be0a627033..3e3296ec5c65 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1532,9 +1532,9 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
> >               "%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
> >               __func__, ktime_to_ns(time), meta->sof, meta->length,
> >               meta->flags,
> > -             has_pts ? *(u32 *)meta->buf : 0,
> > -             has_scr ? *(u32 *)scr : 0,
> > -             has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
> > +             has_pts ? get_unaligned_le32(meta->buf) : 0,
> > +             has_scr ? get_unaligned_le32(scr) : 0,
> > +             has_scr ? get_unaligned_le16(scr + 4) & 0x7ff : 0);
>
> I wonder if things would look cleaner if we introduced a struct uvc_scr
> instead of fiddling with manual access to buffer offsets. What do you
> think N It would look like this:

I do not see a big point in introducing the struct: we still do the
manual offset math and get_unaligned_le*() in the callers (and meta->buf
is still unaligned), and marking an in-memory struct __packed just
makes slower for no reason. I think it would make more sense to have a
helper like uvc_video_parse_stc_sof_pts(*data, *stc, *sof, *pts) that
processes the header for clock, stats, and meta.

Comparing only SCR.STC in uvc_video_decode_meta() does look nicer
though.

Let me give it a try, and if I think that it looks nicer I will send a
v3 with it; otherwise I will send a version of your proposal with my own
added personal and funny bugs.

> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
