Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839469;
	b=wVYvfbcbtuo9DxWholo7pwl1Gpjybr5kgDl3Ug+4uj0GVA55DnLFAzwhCiIdYPhmAk+H
	 SW00FrmKO7Y6AISMbLDJGZkjLPuUCOjCEN5gku4o295y1qyApPKRq2j6ZrWxMl66eB6V/
	 W/JcRQ1Gung0WEYmhrjDrGE9ZHFxUEAgPXVXTK40DFnyx9U6XTdTqbOGA6c65KbCWYW0D
	 zRFlyqbIe1dtxzYk30F6ftPtcMY+Izth/5twKg2sNHCnV5z1GO+SjwVDr7LMWUdiDMSVu
	 ry9eVULkUfWzJ0cgHDQseugMi2N+7gk++VBIEYuXcm2PqHxbxNGsdOcWyQ4JPLIPOng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kIdEF1Z3yDMJ2Z2N07TC997u86nRKx5F3ZLJFgHcL5g=;
	b=z0DHZYkkwl/3iX6GJixQzIl5+0w6cVQhIsNS3vOBFOepT3/YRk9A4jsxw7xVPYTIuFqt
	 RmB02aKcw9AaQN9JelCn7wNQaiFQvoYViukPwQOl3Kfok+W6wp+Z0brhsx6f8UEC9h0Uy
	 64a2CbX2nj9+V5al6ZmOtEx19hW+eGspHHoZH8Dy3ELhQq5vpFkQfqqOrnysinwAIUJ/v
	 +Z4cdJ/iZMcBNdwpbhaJiK/My6N2is51IQQA7qjOEYoBOeYTA4K0aM0v8u3OP+sa/0IuV
	 onRSvbzM7FnXj3xBCeGU24FrErmuDs4INxaRPQx+ZEg6dN4/PQmvKOhVG27NXtDt6kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqtleekH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DFB606A339
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 14:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DFB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqtleekH
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55d2dcbb905so16635241cf.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 06:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794839466; cv=none;
        d=google.com; s=arc-20260327;
        b=V1yNKGWuLRRbMpVzppvWrblM+kyX1A8XRAoX04SlZB2ZNjir3fCq3UUrrSpwiNtNqg
         fXqqTSbtwb3qMpN36iKjISckJjMFeVgiLvDryYpGMcW0WgS/jS9nOorABIN7fUsOiC0d
         gXoIvJwxrFsELpebQ2rkQIdP26ih39nMVjxjnjxnRder2nRNpTPmvYawftFYzo1cPVNb
         ePhuIcCWOtQWtLCMnA9cYjBqT1UpgyykppqqG1QIpbstzx518Pn/MjqXmZGX+DO1SThj
         g6EooXjKPFiS/Ik20B4B/aVUrcf76yEobh3J3ul5c8i2eZrtHSQaHsWFxLFleAAfW4t4
         TwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=kIdEF1Z3yDMJ2Z2N07TC997u86nRKx5F3ZLJFgHcL5g=;
        fh=rqudOY/0eHtwJ+Xj3UtULvamlj2Ie8jvEZPi5sAxI6Q=;
        b=Ewr0ToTGLyGlrDLSkXLSEeirAU+4nIWFp9DjVRRx7qyDDQllEAuVrwfir4SgZy7xnw
         ZyxMRAOPC0ExCSD+ugWA9UacGihUFwEvT5whB3b7SjCpxqhoG9oCzsKOZGxE7fW/JBLp
         j+7MY0i6eA+BWCmTC4ENBrUIsfkEAyFqhhxyLo8FP7/zjD5/nfetfxGa2+j44oY9bivv
         VLKiKSAnNMvpM8HkFl2iU63nXrikoFAuF7Yir4Fnx8Y9MKoihHjZctb4KR5bGeQsL+PX
         rstOj/+Vve6+sdVnxhw2rXoVyGSrPxKEyfkb04ZEkiht0cKCMJYhDp4tyVP4WLABW9jw
         J5rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839466; x=1795444266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIdEF1Z3yDMJ2Z2N07TC997u86nRKx5F3ZLJFgHcL5g=;
        b=hqtleekHZB7IzIe3uFH5SCWu6iTM75sqGs/ghw8YQYkIdk+T7vjVWyA6AO700qdR4Q
         vbJCZb0Y1JyMNrjpjks7ISuAILP1akb19NG1w/zoOS+BJ7ne0rDgeOEZAmH5rKWZ5f44
         RvWJjPfT45l5siVFj13G+ajf1z6A76L3ABfVQ8cxEocMif4i8ocbTvdliyOwWARzVOM2
         1PaEvp5Q3boj498dDJUv4JM5gZ3ylytJ/O++J4+DPrHAfiRvoHRiEKp0Ja+WQHtpLuSp
         O+RZ+lqvbwjBOzEG0ctjc/wBOWzTbnzv8BC1jI/Xqv6agdcfo2IlMyV788HbK9SZLjHS
         3wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839466; x=1795444266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIdEF1Z3yDMJ2Z2N07TC997u86nRKx5F3ZLJFgHcL5g=;
        b=L4mWG4DEEoZ8TaUno6rzY19FT/bjvlRu7oC4cBTwia/NttF0WXaMJ8+0O5UQaJgjPW
         R9VUu64mvMizMkQyEDhEA5tGK52ixJhdqO7tig/wfkitfp9HbZjBZAkRYkAnmEAf0NC9
         EdNYY2bIq2GhoMdl7+y81mO0954j1gqcKfR3cDodYbweGNqhq7COY3YE8C01Guv8vP11
         +xPGuc5nfpkVmsCG8Mtu1McRnhmIQKX6T9rS+/OW9+0X1tiaUpkPvP+KBJq72nDANFTx
         KX0J1hNoWFKAuOmEq3Xa4C8E6iM7MFu7NDOdF18505YnFVu9W/jEHkpmDVg+i5Zj87Jv
         kcug==
X-Gm-Message-State: APuU4Z+bFamp82uMhUWE6/gpyUtd/13hA73UWEuTkR0BCjFPTrv0razn
	iw5PgkFQZKRhp2ptTbLj5erlv7uXCqKtH6hmY8gOcKMA+56sS2730HsFBeDyccLlgajsNPMJIrO
	Qf4rNh1jCwCpOFSDYXzqd8oqlXgNUlOs=
X-Gm-Gg: AYBFou0exph3fM+u+eVb2rz4fhNojnaX3ji0LYxfhCsTSaeQRuENk90iXhC8KDh+zpq
	+K4bLR22fbaxWBGd1izEO2s1yM1+EG5DAiMIwRbrJDeblnyfudyOo3u8ScEx7ZZNmlci+LE8RqN
	KFwMJoZNp5PyycMW0iUhunNAlySssZ/NScAFVgZEA1dOC1xEz9BniJp9jkA8buO2VnwCS+o1FIX
	D7CaQ8C4Ihclh3jibrtTYXGQIzDI0Gqm04wWRlXAn/zH/jQGr65E4RkRxPhsBjjaW98M5LVI+eX
	+4jT0cdrhnOI6OOy3O6gFyKwD/4w4ZK3YGtJ3jynYAsoiusnKQZms/E/7wKT+Otxp1bv6k3YxRt
	1xdEvtx/2fx9SL/jBzyYR6m9FztSaa3QDM4/RgKSnlUSkCRXLwIJ0xrrOruYPfYGNZYNCUh7tz4
	ChwSOZositlLWpCBcqeHIwTN1NEfD90b28Mik7NUOipQ5Vn0e4MV70PAegsw==
X-Received: by 2002:a05:622a:228e:b0:536:54a4:da1b with SMTP id
 d75a77b69052e-55ac818006amr178170141cf.19.1794839466213; Mon, 16 Nov 2026
 06:31:06 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 14:31:04 +0000
From: diegomancera.dev@gmail.com
In-Reply-To: <20261113145359.65440-1-diegomancera.dev@gmail.com>
References: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
 <20261113145359.65440-1-diegomancera.dev@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 14:31:04 +0000
X-Gm-Features: AclHuK9UAbcFYKKYqEt49oleQtJDZRVSxmL5ntIV7z29bwWa8fht8qqVtkVB_Pg
Message-ID: <CALruWrXhXjiw2eVL+YzDXr-mLHT4y0b799PEMH9GZ-pmSHofKA@mail.gmail.com>
Subject: Re: [PATCH v3] media: em28xx: clear dev->v4l2 when v4l2 init fails
To: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro and Sakari,

I noticed my patch [v3] "media: em28xx: clear dev->v4l2 when v4l2 init
fails" was marked "Not Applicable" in Patchwork, but I could not find
any comment explaining why. The Media CI checks all passed and the
syzbot report is still open, so I wanted to ask: is there a problem
with this approach, or would you prefer a different fix? I am happy to
rework it if needed.

Thanks,
Diego Fernando Mancera G=C3=B3mez

On Fri, 13 Nov 2026 08:53:59 -0600, Diego Fernando Mancera Gomez
<diegomancera.dev@gmail.com> wrote:
> In em28xx_v4l2_init(), if an error occurs after video_register_device()
> succeeds, the unregister_dev error path unregisters the video devices and
> drops the initial v4l2_dev reference, but leaves dev->v4l2 set.
>
> An em28xx_v4l2_open() call already in progress (such as from v4l_id)
> that blocked on dev->lock while em28xx_v4l2_init() held it will then
> find dev->v4l2 still non-NULL and succeed on an unregistered node
> instead of returning -ENODEV. When the device is later disconnected,
> em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
> v4l2_device_put() a second time, dropping the refcount to zero and
> freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
> in v4l2_open().
>
> Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
> error path of em28xx_v4l2_init().
>
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1a7507a194fff09e5c44
> Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
> ---
> Changes in v3:
> - Resend: v2 reached lore with the "diff --git" header line split in
>   two, so the Media CI robot could not apply it. No code changes.
>
> Changes in v2:
> - Drop the non-standard 'Assisted-by: Gemini' trailer that failed
>   checkpatch.
>
> Note: compile-tested drivers/media/usb/em28xx/em28xx-video.o with
> allmodconfig (no warnings); not runtime-tested locally against the
> syzbot reproducer.
>
>  drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d486..f78325a41124 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		vb2_video_unregister_device(&v4l2->vdev);
>  	}
>
> +	/*
> +	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
> +	 * succeeding on an unregistered node (returning -ENODEV instead) and
> +	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
> +	 */
> +	dev->v4l2 =3D NULL;
>  	mutex_unlock(&dev->lock);
>
>  	/*
> --
> 2.56.1
>
