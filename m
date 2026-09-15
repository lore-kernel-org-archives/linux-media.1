Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E663DEFE3
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484977; cv=pass; b=TgMdmc+bzLyI1vCG6VXN7BGQFWLhj7gDLw7rtg5sc4aggeX408nJ7nHA4ZirlCkLLzXbYec0orciEECipW0sZ6ejF8b6YhCOljFcI+Wbu1X/viIAAvUrtH1RAklSBUG0W76b6f03vEybZw5PwGcKP3d4AjMUI9US2rEqcqn1t0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484977; c=relaxed/simple;
	bh=wrwfiuuxQ7VMyrq8n37+qtZAtTX3QP8R+sDtYZcuGZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwyT1SPnr841pTaz/NDy31wuDJYYOxL36qevtWUWhPPClR8VLN66W8uWhYXr2GZMcWD+l9e4Rv/9X0Q0lGjrT63z/H/k3LeAFaMCZjRDwuUaFwoqlA+9fYQSMPImTpuuNht0omBSVrgQSZmguKfVomh7dBvB9fTLrBppGCY0ABQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WWlcIjrp; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WWlcIjrp"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c1cso27339927b3.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789484970; cv=none;
        d=google.com; s=arc-20260327;
        b=noDP2LEed+cGrOANqfvv2Hw6+a6yB+dTHscEphnDX/E0t1JTZ93zCoD8HSKA0ChXRA
         IYQnDZmR077zQr4GKoyzlEs+Y2LYej2F6RpR/TN8a9SHuhuOrunjD/Dr2jt9vAPp9+QH
         Pnvu7CZJYjxFo0bLOplzDUe5cQxYQbFoBh58mSTYhCM4T5lYed2K7HjEnumvvcQdJ+YC
         FdAQOemElDbZiEyeIc3iSXM5rLvZk6QkWpea+VyHQJhbQTM82uKohGH4UbI9GGpA90t8
         ui3zmMJEqbLLKwkNCVl6GXAvvHKjCrG01J8jMb6Usvd7lQMgQ9RnEhsRCMgFKdOhO5I5
         WL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jITtBmWMyGQHz3OcenM0SvZwsTiLzDM/UHvlj8p50X0=;
        fh=2aU0Tfaqa3Q2o7fkyu3vK2HnoluL2a5inpyVWHt73Ng=;
        b=Fi0FIrtPbNAsYmQlgoqxeIo/5lYlzNrpnCLGs5jcLdqg5RROjAS3khzbfkp6R7SbJ/
         SI+nMV32KxYfStcLDoKj5bslVu8T32dhDjFttCKC9Hs5Gqc0dk47YT/asJ0haxym0KRS
         3KDTJ5nsyiWjKWaftMc4ckZvQr9yDNeh1GKLg5ozT5GYlQgAzypvJCBzC0E1FPiyvfP/
         hClG8lUFbtUmF39HWFA1LoyM1zv1GdDiyx0Br5qKU3n+emeYpKWtMvpefWdgcOcRxl2g
         m8cMpOkIYktm4VcAgyBqn1mUGoVKNXgjmbFg4GpfZ31/ncfxay8xTUNMws3NWjiz1eiD
         le+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789484970; x=1790089770; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jITtBmWMyGQHz3OcenM0SvZwsTiLzDM/UHvlj8p50X0=;
        b=WWlcIjrpgpKxi0Pj3Uq7k81ACijVq6rbjQXcCQCUXPRb1z8a5GCrOG1P/8hG9eHbwQ
         Lh1+Lj/h6FbWonXWLsBZWOs0k1keQZyYCbdc9lbsYtgGtK2sOiOzqfb58qqrSBgmGByv
         mF04X2D7OrzCxSxZSqGHNdUpiiXCADIHBEez6IDTbwgxiLmzb2tgnBVr4Q3RRxSCyy2Z
         n/210xbEZ6ewmOFzvxf1Hou7wGRzyrzLwUdLuvQdbxAuUC87CmcfriYX802FIhn2dOh3
         KochDNJU4+yzIpS+9faJDEULJiI0qVFMFwZIVFsffrGFE6k2J3miVkVNARrgpXq9pcV8
         MoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484970; x=1790089770;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jITtBmWMyGQHz3OcenM0SvZwsTiLzDM/UHvlj8p50X0=;
        b=ZHHZbTSmheJocQAqIdroBr5Bw7y33Mb9WpaYHEUmx+UtbB6tasLU7zNNtXoaGivtTR
         QGZ9TRXRCpbDGqv/legMBueiUnR+YJajQWtLucW6uMQajSXKGq50kpK/SZ+Dcw6TqCqd
         Yy/CmDSMUhWA+zOkW72CIIH1R7r+4xop94QGKFZUbYr4ScJZ9T33Rn25kXbFKDPSBJOd
         amsRg8NWmdimzgZQHgQalJa+SnPQTrhh6IgAR0dY9ZICpND8MxY1B1D5kLa40dYXl/fK
         rJnoGBCf5Bho6ZhqAhDhqEfoBIwFvSxyXvAavUr6SM8QUhhYzHO9zVf/JaHrQONKyATZ
         d/RA==
X-Forwarded-Encrypted: i=1; AKwUvBwNCh3aDu8RNdBLRE9nyo7sixx2D6DMG8j3FLC6NbYgyrJyF49Pn/nzIa+2gnocY1MVGFb5+gsp3p3GiA==@vger.kernel.org
X-Gm-Message-State: AFuF++l7G/9+aIfbCe+5HELDJr3rAwcGxLyqiBtmvWwNmqcGkKjL8eXX
	mqcDIeqLozgdgEOz+f31w36s1gfWHWbOFwfVEye/I/1Q35IzxdkPgb9uOsg3tCY7xEMXeQzCVVO
	jMiF1IrBJkrjsESRBRWuNSZoQIiPcfPYV5pc79BZJcg==
X-Gm-Gg: AYBFou11h0B0BuSxBa6uFqTg2nIGRP06bzu62Zh+ib71CieHilpOeGL6bUHevsUaTjv
	s6tqLTncCzB3vzN3eoTSb+kKFF5w3a8pR77aq8t5ebb3aQ5AUJuJBxuJW/bnZkqA+Mbm/adQSNI
	ofmwAzHYsPmZ+UHF3LGqSFJtBdoteXocONq6i8H+TcpUzCKUdw7pyHaRGHCZPB3qcmKS+xOCQZW
	sG1FfIsP35J8bHf35K4/VRf4JP4itTmDa0XzUqloEOS6kognl8hYhtaBalUDI4pbnR1izBA77yy
	dGV0TF0+Gqti0SS2VrdrOUBk3wP3+ZyGSKzOuVYKb1LT/kfPta+zN7szwozfKD+qCeM1upDeByn
	DXM8F2NqiLYFZ+bykACXqKWuGY/2ZrrrWvbmFpAIcrrJgAtSfFGJgFQSXitVFvze0E5RSUrw/
X-Received: by 2002:a05:690c:9990:b0:864:6f4d:ef7f with SMTP id
 00721157ae682-88d1e93ffc1mr24683597b3.7.1789484969777; Tue, 15 Sep 2026
 08:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-10-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-10-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 16:09:13 +0100
X-Gm-Features: AcwNN1W7-TtmTIyUjllHDLNIKHhLg8r83BUrDSRNpnCFbQDI5w7N_3zM_OKztmM
Message-ID: <CAPY8ntDWF53Zv1yspiYH29TWEUODW1PPU4dcBig-ssa-e15jPw@mail.gmail.com>
Subject: Re: [PATCH 10/10] media: i2c: ov9282: clamp flash_duration default to
 its maximum
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"media: i2c: ov9282: clamp flash_duration default to its maximum"
took me a moment to parse as to be the control maximum, not the default maximum.
"clamp flash_duration default to valid range"?

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Currently the OV9282_STROBE_FRAME_SPAN_DEFAULT is always passed as default
> to the flash_duration v4l2 control, where the maximum is dynamically
> changed. This may lead to situations where the default is above the
> maximum.
>
> Fix this by setting the maximum value as default when
> OV9282_STROBE_FRAME_SPAN_DEFAULT is above the maximum value.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

With or without that changed:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index be38ecfad8c82..1c5bed85781ce 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/math.h>
>  #include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> @@ -556,12 +557,15 @@ static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
>         u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
>         u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
>         u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> +       u32 fd_default;
>
>         if (fd_max_us < exposure_us)
>                 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
>
> +       fd_default = min_t(u32, OV9282_STROBE_FRAME_SPAN_DEFAULT, fd_max_us);
> +
>         return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +                                       1, fd_default);
>  }
>
>  /**
>
> --
> 2.53.0
>
>
