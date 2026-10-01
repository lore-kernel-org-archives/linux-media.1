Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A993472F7D
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 23:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898605; cv=pass; b=nduTq2uSsIBSEJKXtpGFiHk/nJZLfbs8AdGEqZ61s9GothS5FkclJrtE7b9vmCPfvCYj1yH+Jy+mPRNAIi/zm6UAier8djbs1bNlKWR8EWCu10s4rgvVtsM4B/NM4e3jREccvklNoHsyFv3kLh1sO7xO76pn4i4BMZybRy8YHE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898605; c=relaxed/simple;
	bh=tTc9z7FYsgGlwJPZrMfkGMhg4VwSkixsGCk/z8dgvNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgeAa3v/VnqisqpKEGRXomz2bD9+UeraEuQ9cCbaPv/bSaxrwzrhqu7J65S8iJMg+VTP0WhXgkwpACEWaIBNBTf2Cm6aeIV/suxlHVsnFP19YHMpU3wIT5S8OkSkw05oGN8qQHy3MDJ+Wq/8QAzbDJlxNWnKPfkY7pPWRRnux+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=g/MoVTUx; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="g/MoVTUx"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f50193fd21so324171b6e.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 16:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790898601; cv=none;
        d=google.com; s=arc-20260327;
        b=WEu0aRlZhEm4bMapVeZzrKW1BqZJKHBSGOZVXAukioTtTd5C+7HsSyBmf6CMVNH3+i
         rL06Ak9Z6NlcTSoiVx8CGKI7uqTdQPSeot36NFD6YiFjOtnrmVABYxU4jdsM0wmQQVIM
         H1ohb28ht2WWtvMIw9EZw8MYEIE1x9jkEn6v1DP8XE3D/1vh+9px1599VB0ltDu3XKS6
         FtHP8VW7A7RSpD3YQq5dxIuhIX6BKbibyvYlp+J45s9DbeAKk/hsOn9XuBYBPgaUrIsY
         N3g8QftPuFofNBmVh/2+CrgEPwgGJm4fa30RmnIV0ZdpRmkRU/zzlRlQVE9wJN5DJ/ES
         omPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKY9cPJJozKGHFrfmhUD53rTouOcT3tjSvoX5iN+R5Y=;
        fh=J6FzVnlFcB/wmvxjPeMZH5yxmTKE482trFOl51Zg+N4=;
        b=j8MHan1w6UewEvLG8g65vwakeK9BZK5/R6c7c4K78svMmC7v5EePoI+1kxE/bzveq7
         d2gWtLpH2qX0MmhZ2PptXy37xLg05sJzYeiEmyDm2H6KEF6HtPlX5lSpCXC9h2geEso7
         qo4N3QZBT/BUBXlPRhRmAxzfbpNgfOaJf/wtRYGmWfo77E2lrQ7v+zd/2OHug17SMB88
         VA6FsHQUF3adcBCOPIRc/vg1/t25BSjOtwFZNjt6m9TD1kXxwrja9PEMAEWFNSc+CHdJ
         8T5KilJZioofQmdkPZ8PmDD2sGiKWW7qipkCiYIQh7w5awA4tmg9sz72qIQ8e4CuMVr/
         qXEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1790898601; x=1791503401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKY9cPJJozKGHFrfmhUD53rTouOcT3tjSvoX5iN+R5Y=;
        b=g/MoVTUx8H/5A9Jwk/t2momBlaXQpJJpMPN+UMkr52+EaCMHlrmXNLEIJleMz+CUST
         Hj+a/RV4spFrb149E+HBsJoyDeAMiY/uaU4P6/yXEuR4nF+XrioSvvPSafTCJNjf27oj
         k68WkbThAPHEK6X+mKE7vRnOhokFE3yTFirqfW6uh6SHDp9MoWBJLoBMY3l5kbohkoJ4
         1lsArFB7FzjIEclfk/REv8+tvKQU/TtMX+VD2addalWm6tuUFzpz2juyGuhECm3mxTvJ
         UlauTj+RH94dmf4t3g0S9FgEkHgt95szXah6liCjRoDus9bAvHvEuFBQdLgcGSuSTp3G
         /45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790898601; x=1791503401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKY9cPJJozKGHFrfmhUD53rTouOcT3tjSvoX5iN+R5Y=;
        b=nkun5w4x0SKXGUi2NgYlMZEoB4arpilAxo9JNC5Zi9qeiOZoFcB08DAtdu2/bcR8tr
         zgW0VfHpfW9HV3Pr/4CbUeqKsXAzF7Tf2e9BLm8oB4Z++sc7HH7+hxWTrVMMQtnnzOB5
         0bFaPySbu9vwSn+TULOZ/GmTzydwVfylpownMT29yq09MwFzMJY+0soqP3Xq2M5ajhE2
         Xl+teSfG0AKbYAuT5e9WmJVFQ8ZxK0GTI23ea/5qHTzLI4C/gvsESODYlLnJxQjTwpsu
         nhTS3fGSvGyxzydSLPyo4T3tBDQ7aUgxmBxl/OV/earFdTich2nZNb87q02uX9y+Day7
         Yg2A==
X-Forwarded-Encrypted: i=1; AKwUvBwet/fEIEt0ETU6HpsZS4X2Oo3pl4yTzOZVVPlktPJkTD8uBo1UkKZaIM+QpimP2xWj5cTZQoMiWzWyjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mIMnj/0eHY1/6SiK19pNL2Jdmcmi+oMzVmjtXtbuPIEAyc70SS
	aM7ptlI9+rKgRGs0EiGifn5s7fbNAAgTyg8v7fov0zeDQd1+sw4o0r6gbt0nmVe4sPi/i0GBXOc
	ECUHmA/rZ/fik9tenfZllmbWp5YMxoEzLB5Ftb8WyLg==
X-Gm-Gg: AYBFou0Q26dOM5FQClICxuzvVXoYA0mpV3tWpft/xlWhfMWPDy383xi5RPVyeUF5uXf
	0GZwaXiT0yY3z2MpNl2FoQeSm53Tm5KM0Zo9m0qp6J06qFsylOkL4W/4z0w+V710s05TNITy9RH
	j/bWnphbGNDW8R2XG3KaTYoEuabYkrUoHWTIpKH70Fq5hgnSH7rXgXwMzhIARln2SgVO+lqq4et
	vWzXzgU8m5vMvU3jcRtTbuy3+/LL6vQ8bwXqsDUwpKO0T5Fuh3jx8JnCOTOzKaE9cPuKGT2xfiX
	lr799WUOJrZNdteyVG9XYxwG1eIJSr0H+Vn69AqgnhA8fqM9GgXVsQtAZQ==
X-Received: by 2002:a05:6808:6f8b:b0:4f3:e98f:fa27 with SMTP id
 5614622812f47-4f529c28115mr654041b6e.16.1790898600864; Thu, 01 Oct 2026
 16:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930020010.85250-2-chris@kode54.net>
In-Reply-To: <20260930020010.85250-2-chris@kode54.net>
From: Bradford Love <brad@nextdimension.cc>
Date: Thu, 1 Oct 2026 18:49:49 -0500
X-Gm-Features: AclHuK8gO8mr_tN_8askeYsS8qGi_AKhcozyXpVKRtdSd-d60e84_diX5L1-c8s
Message-ID: <CAA0YaJRW_q4HhSaMR0WzmHiRzLvNtNfUcruT7qZnHFHVb5VVLA@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: fix inverted tuner capability check for
 VBI device
To: Christopher Snowhill <chris@kode54.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

Just a couple days ago I plugged in one of our products with video/vbi
and no tuner and saw this message. I had not gotten around to fixing
it though. Thank you for catching this and submitting a patch.

Regards,

Bradford


Reviewed-by: Bradford Love <brad@nextdimension.cc>


On Tue, Sep 29, 2026 at 9:01=E2=80=AFPM Christopher Snowhill <chris@kode54.=
net> wrote:
>
> Commit 8e53399c63c3 ("media: em28xx: Add support for Empia em2828X
> bridge") changed the condition for setting V4L2_CAP_TUNER on the VBI
> device from "dev->tuner_type !=3D TUNER_ABSENT" to a check of the video
> device's capabilities, but inverted it: the VBI node now advertises a
> tuner only when the video node does not have one.
>
> On boards without a tuner (e.g. the MyGica iGrabber, card=3D105) the VBI
> device's device_caps therefore contain V4L2_CAP_TUNER, while the shared
> vidioc_querycap() correctly omits it from cap->capabilities. This trips
> the sanity check in v4l_querycap() whenever the VBI node is queried,
> for example by udev's v4l_id on every hotplug:
>
>   WARNING: drivers/media/v4l2-core/v4l2-ioctl.c:1119 at v4l_querycap+0xff=
/0x110 [videodev]
>   (cap->capabilities & (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=3D (v=
fd->device_caps | V4L2_CAP_DEVICE_CAPS)
>
> It also leaves the tuner ioctls enabled on the VBI node of tuner-less
> boards and disables them on boards that do have a tuner.
>
> Restore the intended logic so the VBI device has V4L2_CAP_TUNER exactly
> when the video device does.
>
> Fixes: 8e53399c63c3 ("media: em28xx: Add support for Empia em2828X bridge=
")
> Assisted-by: LLM
> Signed-off-by: Christopher Snowhill <chris@kode54.net>
> Cc: stable@vger.kernel.org
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index c418add65bb5..cdf1dc692b08 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -3001,7 +3001,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>                 v4l2->vbi_dev.queue->lock =3D &v4l2->vb_vbi_queue_lock;
>                 v4l2->vbi_dev.device_caps =3D V4L2_CAP_STREAMING |
>                         V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
> -               if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) =3D=3D 0)
> +               if (v4l2->vdev.device_caps & V4L2_CAP_TUNER)
>                         v4l2->vbi_dev.device_caps |=3D V4L2_CAP_TUNER;
>
>                 /* disable inapplicable ioctls */
> --
> 2.55.0
>
