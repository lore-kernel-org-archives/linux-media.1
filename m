Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286172;
	b=cCRnW5I3Xj7s7/lvk36rQSm2PG/dIuJMYCCnMN7XQK0Sq0r7cMbeXTascLf8FIMylgJO
	 LW6QuiZpw1Zf7h2hWWHhgnx6ca4ExUqedKN5Ad24xNE4Aw6pEx9mb2mWu6AjJeKWKiESH
	 7UygXDTedQo7x7J/iL+8eAEjx5t2ehSxZDtkZzfeJw4etlCx3GwkC9FXf04+KtTEFzVVy
	 wuNQw4lPUtpWDC5jwi4wnAq3TTdZCNK/Uvf/s5LXikYBOpq5P8bP4Zrru9yLh2pWgqvgf
	 sjLMSqNz4+6uxJWBC6bcaeC0EHB0pj0fgHGukulu2VPMsXG7O6qwz4DyyeBHmULXD8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
	b=a9zMkDSAtuesn7wVzADNDdDz5dBpml3gGkmxFakE3kWbidHW8/rMQqDzwRWNr3MGlTmo
	 FF+aD71dkz5x4mXsySn+ePFxD3xcRHpenpIdIi6FD5jWztztZWF2IpGKgfmr0CBqZujXA
	 8K6A/UpSzIBE0h6CBC6o7TF+i49doagSN9Vn8obUQ2wZPyNW0R7LWo6Ykzj/vVUuKLYTJ
	 1dG4w2102HB5s6topmn41GL8Oz1EvouATnDxLUuZeWBZJ+ZeDgI9dGExpWRb/UlamKjAX
	 cndg3oi50Nu+EMLLA5eB67qokd7xnr+k83YuzJpZSWvxT6rz7wj30x1eQjAr3Z/liNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=kUptFaBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A3606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632A3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=kUptFaBE
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4877837890fso1253007fac.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286165; cv=none;
        d=google.com; s=arc-20260327;
        b=EJff7aNDKBp4Vo2vahPWXKP+6VL/SvKTADgnuysFZeF+dKpiPchFUwbbKmtU9tl1of
         gFoYAty86taL+K0YyOvhESaEH0LyN+w9rnVzW6KxX0LO+E8Mh2OAMUTmLxhmTFIWD/rl
         PoWyEybuTVI2Rgql0dyFwiUVKQHhF18XuBPqdW8aeq/UDmTt78rLP2sVFxPpPKvbEYt8
         2l2xVwWvXhqGFGoGRnXFDC8S6BFYUSRk71ZhFARaLm7+FJdvcl55NYD1PUg8yRaJBel1
         DFmrZBGpbXV+hflRY3zuL/Qal9E9NHJ7Kww7Ta9nyXu6BLzAcWFnLks4+oNKu9RPNcOx
         rjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
        fh=2IXMyRMNjeP6RaO9kUY6Q7NlbItEIlXZ3HAXgDb9i/Y=;
        b=DF2CY1q9W8k8mgvX3eN70OqdJVUr43VSldJTlWCqbEiSFVEttS9Z2j4qxtRfwOnBk5
         4CQEdzWB7aKn2MtJEpELE0/Up57H+VhEZmAgX4wP45uYQKSHK0W9CQu2MHRvQ+A3V4py
         MVQFqWBEf+W/MhD5Tl/gLxSwdi0C/rpt7R8jpWrs8p7eORVQfVCpbO3zda6ftFB3SEf5
         osUVev7Qv+hJ0wmD+8UfdfNvMa/f/q2Nfj9JJH3pYwCDkwLOvl1Wea1MhLkYFhBZBE5H
         YUhgkPZS7Qp0rUka0EI4rzXgOy43zyqygemgR9mzu5bMorKJhjboyeJ3BAbJpp0ppx4k
         K/3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793286165; x=1793890965; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
        b=kUptFaBExjtmignbdxt1LEDnztQBGVfbv/M45YWor7b4iidSbjXJeQadLYQ+Rs6f13
         UahaoMLT+piO8QQ+ypRM1Tr3MsYpi6glJ5p9YaSaFON4VaZRkpObl4vmnv7sns98U3rp
         XdolxfrwbkCywumJd+8B6mnNC5KkPOG4uNPhMCtxZF9yuFsQ0J32qEtj2PgmKqO9/Ydk
         osv5fWFDUjfHsooz1uYRX8gTTGCqePBInTcQk+peDAOWkvkjz8S2Xig+lZK0SNdFIEQs
         Zwdt9xNANFYfHMyYnK50RyMfvkGUj9bdJLJdu0KgD2KcY+D5SBI7hxUT6p2xUkZo0Y4S
         bo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286165; x=1793890965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
        b=XBV7iwrdCXoFybVU23WNKIidhbnGlsobSmwpfqY70bXqOtC2ScmWBeTUOMFyp7cahe
         twOTmxxBJJzaOY9T4s6mz09KyjMLjheWyEVD7m7wpTJB/qoXYsZheQLcqvoIwa8zkeFJ
         1vSY8DAcodI9zRHRb3l0IScY2187otF36Wj51MAANyWZ+VQ6jbrYfpPq4VVrsncrgS7X
         pNOY4iC64V2MNw1RxWZPcAwu3xAM3FYdJ+0yYx2X5RIRNEoEev7yCgo40D4oVQnClfq+
         CxVS4G82AezQS+qLlPJZnTIPxN0R9+K5cJTlwTVv67wBHs1axCGLo2zpRUfB95AoqLFI
         wCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS/0UMV40e8IYQ6aZ2VxeL1dRFibZc7On1SdlxE3R6I/idgHpyBXACnn0KVEl/4qVDZzAOtEhldLmy8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIKWjIkn0zj8BRi4gKdyLkIzMxxs6je6dFrFYKlWtSpfOHlkpkE
	7ebkXaRgySACOJUU6UzMEgWWSgo8JZu6nO3yrn/Y+i6xz9K09jVlBA4PXSVmlRBd8yMtwGLwM5z
	MZFRH9RS5HUvZP128TEh1nBAyZbHA1HtsazQ5l2rbPw==
X-Gm-Gg: AYBFou2PIiDq12tAeHxsstoSXi5FajDgKjsTpY4ZV8dnjwcBpJRtOjbizfTB5gZQ3Z7
	6AC82GBzWA3kcuryIeCJlUAMZ2EuqcwMdkR1nWuP25fjbJJ7vX5bHX6q0vY6C3BQevXeE//7bJS
	ZjhNuGKXPR8lJ3vWGfCCNSTyZigcz7vNtAFn4Im5ckoZwMeHuW6nbpxDfYuMNuDJLetac+jQ9HP
	sNuC55ArBHQv/fwvXhrAUVrVqhphpw4ImOXv4S26agiCtNiO4YO9rMjcaCuZ6+B37i5u4BXz0ui
	bANXLxn2b8ME9e/opeHGMABRGt/Xjzg4rOdYVRIlxclBsjcrG93OYa7ZYeOS8In0HWJeWi/ORxz
	6YKD9QaDGc41PbZrmo4+m5v6nw0Q55QfqpA+wJ6Mi1U0K58yhHxxSwT74hK8h9v7VOAIzF9lt47
	/WdiZmMZ3ZC4mzqlbuh9+8rjfiGETgfG6o18QQvDl4+KVlo+x+vAQOwff6V34EH0n9E1AAypSE9
	Tg=
X-Received: by 2002:a05:6871:2102:b0:486:a82a:a204 with SMTP id
 586e51a60fabf-4a8bb21dc71mr4339383fac.5.1793286164997; Thu, 29 Oct 2026
 08:02:44 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-5-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-5-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:02:28 +0000
X-Gm-Features: AclHuK8voSOcP2Yc93--NhJD3VRIP_1eHNKLU2iJ4Kl10Q7R5Gjav4eSoB_tiWQ
Message-ID: <CAPY8ntDPj06a_fa+fJRUmn_8z2jxBXgFtf-PyHw7n34Qy9zeig@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] media: i2c: ov9282: add refresh of additional
 ranges on a mode change
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> ov9282_update_controls() updates the pixel rate, hblank and vblank, but
> currently misses the exposure range and flash_duration, which are
> dependent on the frame height and therefore vblank.

This ends up being the opposite of my comment on v1 which claimed
"Both are dependent on the line time and therefore the pixel format."

exposure control range is dependent on height and vblank.
flash_duration control range is dependent on width and hblank.

Just omit the dependency comment.

With that:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Refresh both, and commit cur_mode and code in ov9282_set_pad_format()
> before the call so the refresh and any nested s_ctrl see the incoming
> format.
>
> Fixes: 14ea315bbeb75 ("media: i2c: Add ov9282 camera sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e6920e18b7818..b48c959b9c908 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -548,6 +548,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  {
>         u32 hblank_min;
>         s64 pixel_rate;
> +       u32 lpfr;
>         int ret;
>
>         ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> @@ -568,8 +569,20 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>         if (ret)
>                 return ret;
>
> -       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> -                                       mode->vblank_max, 1, mode->vblank);
> +       ret = __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> +                                      mode->vblank_max, 1, mode->vblank);
> +       if (ret)
> +               return ret;
> +
> +       lpfr = ov9282->vblank_ctrl->val + mode->height;
> +       ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl, OV9282_EXPOSURE_MIN,
> +                                      lpfr - OV9282_EXPOSURE_OFFSET,
> +                                      OV9282_EXPOSURE_STEP,
> +                                      OV9282_EXPOSURE_DEFAULT);
> +       if (ret)
> +               return ret;
> +
> +       return ov9282_update_ctrl_flash_duration(ov9282);
>  }
>
>  /**
> @@ -832,10 +845,23 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>                 framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>                 *framefmt = fmt->format;
>         } else {
> +               const struct ov9282_mode *old_mode = ov9282->cur_mode;
> +               u32 old_code = ov9282->code;
> +
> +               /*
> +                * Commit before refreshing the ranges. ov9282_update_controls()
> +                * and the nested ov9282_set_ctrl() calls it triggers derive the
> +                * frame length and the line time from cur_mode and code, so
> +                * they have to describe the incoming format, not the outgoing
> +                * one.
> +                */
> +               ov9282->cur_mode = mode;
> +               ov9282->code = code;
> +
>                 ret = ov9282_update_controls(ov9282, mode, fmt);
> -               if (!ret) {
> -                       ov9282->cur_mode = mode;
> -                       ov9282->code = code;
> +               if (ret) {
> +                       ov9282->cur_mode = old_mode;
> +                       ov9282->code = old_code;
>                 }
>         }
>
>
> --
> 2.53.0
>
>
