Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D883B14A2
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482007; cv=pass; b=nOLR90DDg9GAyuzG87hQnL8pgSHHqQsO/U3s++qNenBia69JZ37QHmOEYCpxBKWiIU1Y/+tWyFpguZVBx/4im9yqVitfBlwhhb/opfbq4j+mOxNoRpjBL2Ss40yqxmMxzffzbKSErYrDR3pMHTejMoGNrOMKclWqTWEFzkotkSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482007; c=relaxed/simple;
	bh=jzjn0k4srI5F1aSZR0pfM3WdUHfq7jYHQR3HlQNiVc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQI7hI8q0wNtMLZwI7HX3P+/9JAIsd2BJf6qIXAYdya6RWNFWJjk8gEI073n4oPZO3ZUJ5gzCMeOQpMUykIW6DS7Tft6or+lsCuakCHBK/IS16ZIeH1ZSYGCFH6BYbF/LIGNBGU0NqisK6JSMiaWHz0IpqFfUvaRGTyq4ab6ESs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YxnpGu2F; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YxnpGu2F"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc93e00so1776806d6.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789482004; cv=none;
        d=google.com; s=arc-20260327;
        b=kUlslS8+9c8iqeMaW2Jzjr2jnkUcXvoCizOQIwLjv0pEVF4k42KF+KojfzZ0ab6LSN
         cF+n5oJi323O8Jn3OGPIDyDlK+VaZ70ZgjwRO3/Frxl8GKW2AEVd79wAV8TmOZABbNZS
         x+C4t/X7AOp3/Yv/+pDseekotm7yUY4LEHPdrhIGP50dxM3evRQLTG4AjsPhW3/sDr5Q
         6+u3eTq9HquvA22KdL2EprXeuJNeYzu+QWAmztlDDx3xxsRxNS8Pj/o/6shKKi8LAEKM
         Lsl4ggpyiYQ+4B5M5KmGl8C5bB3UTbgbwUoXYmTSpq60IMC9xEIpbH5jaTvw1kaVyHmM
         499g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mbk5oDhmq9C3ryUTeB+AgXe55pLwJERRdnBXATeh3YA=;
        fh=aOVYN1D6fSysAzEed9PuVGSM/rYUcTXGVZM6u5NBPpQ=;
        b=hdKoooijWDanCpe3JU1iZVlSD19bqnNgrYqjrLFP24Xb4dFiR41UmW+s3ardrvH/09
         s+hCD3MTidHuaERpeuhUUt34hEILrO90pDww9jxInCV6zcmaCwjI0jUMQApJnG6dscng
         8GUL+9kzIVkLIL7HTfraRi7le3eBjFfx+pEScBPRYbvBF6rwYd71EEkentDAzIuEYubH
         bzLmswPZ8Knn46K8+PCETtq5nHbI/+/T22ZTICMxsr7wlVu5+qLhWR7rlKWv+fnly2Gn
         Di1Py0Kj19xNSt8+rRMDA2V1/hV/HTlNg95G/4uGoabpiz68DV1jK8Bf1I6yM+OpOtYT
         Ly+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789482004; x=1790086804; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mbk5oDhmq9C3ryUTeB+AgXe55pLwJERRdnBXATeh3YA=;
        b=YxnpGu2FyqgHkG1svIBY8ZbNZDfo6Rz27YYjHInfPJNt+k8xdlrLrqJ9MQwrhd2ioJ
         sUaqHXFXoqjXOgOSRS8DthmFgvKNp2XbEyJVD0BlTjSYoXNu1hNSdBbgWU+Qh+JENORz
         h+mSakWPNv7nMv7WojHcngEohCNCIY87vaZanPfTpk8zXWEmbYt/+6Dax07lGvNqM++3
         OyzHwT1Pk664a/PUFeNFE8m9dWd0hdbNvn+qe+hmFn6LkF7lTEGe6gDA0LAsNrOcvKBp
         7kIuxAECadfoBmeMdJ1F6iEfMS++OZy2MYdnYrAUgX2AHZ2NCiWyhgSLqrDz5ZYTHxBC
         lahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482004; x=1790086804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mbk5oDhmq9C3ryUTeB+AgXe55pLwJERRdnBXATeh3YA=;
        b=et3hoQCfP5NDpCDuzXe6MmiVamlMe9zp6HmjFS5DvzfnikB8C10AKXHgZ0GmgjL7tV
         SPYvt3ev3pHbtD1ZrxSi4wyqWg1sgCVwGVM4TEuFDfbhYhtJnhCHGC1LaCdBfXFTUaN0
         KR5ceiCoaMbZ8PImzioJmmmlsP2GLWZF1IfUaXtXKcNjcEI1t669rWlERlggEGcrwa/n
         t3Fxx+i3czz5s7cOeTVUDliySx8qnGQHG6sDUcHrcBDSrQS3gfOM2sjSzmwHO4oCBpe4
         3kNPAJPs43y6YO7mDOoQqZalao22b5bLJ7OBqvhf2+JxPeV6TxQJ3BKsdsLYn8YYR297
         LGRA==
X-Forwarded-Encrypted: i=1; AKwUvBwQiDWvg5vljZdzj5/BX0fBFglSe5arrpaVg83wvHIikiLCpdbUeIJxcfO4XKk5Vaz1dyo+ugM+dU2QIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kXWPEpdrR0B2ytKtFWuCtS/vP4Y/tNTrKjpbiX8+vhPhFpBGuB
	f9M530XB2EEE09RHGBzP7K1z7emDkjbUZBFP2Ed+McOgh7aYp0HsPseBBu2CgQsRXgdZ3UQ/6TP
	R4yS9KK6hwodLHx0L3vocQobezdYyGI/Myflu6i0Gtg==
X-Gm-Gg: AYBFou3SVFq/GZCt+0NuyXld5nGbESNiKCTS4m4ySL91N75B1z6VyLCGRkqZItaf/IM
	qPTW9qaKfQ9BC94a2p2ZtqcxvJGpa5flPnFhoLhUZ3reeDec3GG5FsmrWxN5t++qdmXFGh9ScXR
	rwfOufDp535BjqLwd65udjQVToWQqGfJLmtL1gHsRfLMTfMZQkKYuW6ufAAEmT2meW+kU1HE1KG
	sdOW2FmGr2G4Rs/Ub+AUm47FQVIoVy/++mrz2cOsqrhrvkfL/M6koaxDQbYjjTayNbpwrZre0aK
	lDFUVHiIlv+Io3OSaglX8OP9iV+yBL89kOQAR9Fvg458ZPXX4zwlzvWagNHqsyaI6Q36NUSyP1i
	33oDiViQ0KnHZyIUkbs5BjGIMg7DkGWNd5ga85XT/If/4yeg+//oZNSxpC/CEGzGFwh1+qz90ig
	==
X-Received: by 2002:a05:6214:8503:10b0:912:3b8b:3275 with SMTP id
 6a1803df08f44-9123b8b32bfmr3657116d6.19.1789481999618; Tue, 15 Sep 2026
 07:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-1-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-1-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 15:19:42 +0100
X-Gm-Features: AcwNN1X1t13-sNIByzRZhObLlskVbwDF7voVmSdDqd5Oiho8QeQtdpxx9t-nma0
Message-ID: <CAPY8ntCJLtHbBK6a9R1EMN6BWEnftW8GJPaKrA03rdMUwkKZRw@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: i2c: ov9282: handle error from exposure
 range update
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> When setting V4L2_CID_VBLANK the V4L2 range for the exposure control is
> updated v4l2_ctrl_modify_range(). This range update missed a return value
> check, which resulted in ov9282_set_ctrl() not returning on an error from
> that function call.
>
> Fix this by checking the return value and returning it on error.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

AFAICT A failure there would imply a driver bug rather than userspace,
but better to handle it rather than just ignoring it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5d301660a87d8..c10b2e205834e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -608,6 +608,8 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                                                ov9282->cur_mode->height -
>                                                OV9282_EXPOSURE_OFFSET,
>                                                1, OV9282_EXPOSURE_DEFAULT);
> +               if (ret)
> +                       return ret;
>                 break;
>         }
>
>
> --
> 2.53.0
>
>
