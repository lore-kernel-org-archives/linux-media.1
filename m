Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAC442381
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641528; cv=pass; b=J2sjnqTkCIOtKqwKO3/hk1vbAlftSteGHhmqNCbw2GJu1PmQC7cGEPMGyFy9FM5537VvLv0HSCuvC9NBSrgKC121id9wDFFvvWy5I2BeK6wkjuRWo9p7JMAe8P9uS3gENuEj+i/IkaDQwhuP4YvD8Z+RFw0NlrDAdeFbMX8V5r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641528; c=relaxed/simple;
	bh=hIu0CuAARuW7ysj4YlS35+aN6AN4FoHp6vMMtWGb9HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lE/bfSvIeal4zt54BjXfMso6kytX4PZcmOL3tSn1q+51a3cpksL9FDUcb9h01O0iLQnf3u29ox1LxD96058RsXBQ7YA/zkscl4jLNor17ZvBjWG2WtmUh8o65bhT6ZNAsIqxbZAOE0X6pcEpDjuil/X3qjVz3TlL1gaJ8ZzFaWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XtXl0iT7; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XtXl0iT7"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so383227a34.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 03:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789641519; cv=none;
        d=google.com; s=arc-20260327;
        b=otWEUUYUAN6Lwg4ibVEwyTtXDgvauaI57QiB4vBzRn5S6P1hHcihZZPyfSKA1HKFob
         /ddwKNClzvkn6vI8mYYz2OTfUQDNlJhI3ru6q9u2P3c208RycByuA2Q0zORwmm1TFI7M
         9DGMnOu58IsphKXR4HwZQQ6DLz5BrVi5CcmfnBHnxxqguJT1qajFc3PnbqpE0oIAlOvJ
         Ymp7QAr6Sgqn/ebCP2Mdr+6W59WgOXHjjCt43Wa1B3jn0bnMfJ+jD1HhX8EWHBk1omHN
         chDhlnyOnUyWc9mvpaAFM0BozsIxomZ0GZc7fbKsuqqmDZ2tnJ9f3oVZTsZ8Nl6W5zgB
         YxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sidfwu3hzK5NrEiJKEQna5QizdXQnz4aWmmgavro3+A=;
        fh=zPY3IOVWw24/UJYkpEcCpFBsJ2guAg0XxobIA9q6oY0=;
        b=dYZRx+Kr+s+tKp27GYaehOXvGuMts/MQlyPyikBMCczIxZObItWibpzXuODiSJUHK1
         JmTsMe8KH+dZNzeecunHJUdR+R4/yUHJCRwFY0qW3uOXXJFhmhZ5ynikIt0tZDm1OfBs
         zZy0AZlqX4EK685caX0QCVacfCIIW7ubn80txzf2iEfHyydqoI5fz6g4nc3/kUKOFOZ2
         B/vEnQalDZKzRBqvwO91FIH1QbvveHA8zAPUMc/BG7IAys9NxRvtxxBw8a0VKPaffU2B
         yKeHNOEmB3UIr1SLRAaCWjYM6A2BKB/hyoS8DdwejRhrFNpxvZu5xwMRHb4doGRfEktO
         p4uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789641519; x=1790246319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sidfwu3hzK5NrEiJKEQna5QizdXQnz4aWmmgavro3+A=;
        b=XtXl0iT72nVZpUKlGgJMITJGATaYAhAMkEDOT6MnZ6Yr+2+WX6Rt4XjW9IfYOpEhUx
         ufzEfRENgUuUuoN3FV2qeCwWIcrIZjOA4OPlKZLjVnDuHV0eUh92EPbkHY6CkZikz+HM
         eI3bvRD1GzBEzgRTTjNq9kyLEaOTdJKhYYTkwnQc9sB+0EmQcsQRt5b/5Eu5wQk2hqlz
         gBa9le7Zuhu0fBVAV8GtQhgdnKQ2UQAFKC0KiATPGWjXNxT/+GzceIRDSCRBvoUYJDUF
         ssbTsoGWhfm+Yqb/c1b30SODASE1Wv66sV046mjNXtrqZdttKdJ0Bww4xQ/mkDONX8bh
         P5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641519; x=1790246319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sidfwu3hzK5NrEiJKEQna5QizdXQnz4aWmmgavro3+A=;
        b=RR4K/2qhMJboOL2wEcKxyS+w62fQzaxz13pGv7om0vdkgAlZqaStYE8IQaD9uxKs08
         x4bZxfzBacRdcd+gp7kQOeyyHDyTVz62HbqEu8B0GhoVWOO174yPlBdNrFAICpXUFOpu
         0DTR5bBWUyD41yzqQwAjVohsIFJ3i4Pn1sxlq/WYE1NvxEf5rVhOAIrRStVaUmZDFypj
         TQte6hX5tSdCP2n2UlZ7WGMxjVqmF1ksiFbsMW6s1IIwcrzUR2jbWpzzijBtxo0VByUQ
         ST/1f42P9JW6mi0n1P7Os6J9QgO0uf+w7eyVg0kiVi+nEE7GZ5+wFfHXZHk+u7cM5Ts2
         +b4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzP/yv3TjbOWSyHQkJRPrb/zhfyezta4SeN8sIS+2Bvl5qu1bKf8IL36z7kFVa3sjqC/bS61YWx61BWjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ntzouDVC0iSebobV47cwNCyWjBnN0T9j2b26QqnEw+LFhEuiKA
	xOmOks9/0GITtsI6DqdCOqgs9DNywVES36mEI4cREQf9BAvEapKdRwsg8/poDzD3LAa5AAg62K2
	3N7jV7h+CqOTHLge4WBWAS6GgjKjb06QIM79ckCiPIg==
X-Gm-Gg: AYBFou3vq6480+oyDP14p1pjnaIWJqX6tjTM/PFJREWjzKOzqr1vKTOqT79bHUROD/M
	BQE4eTrMKLxDqDY4VsRpXp6OJurVm6/PRjsXNvZXf7dEa0SwIxsKO4xwKTwYlklhOVhPm/SxJIP
	WJq384+nbPBjh2tRRkiHOXrg/Ev2iLz4rALADQmPM7UmSHET1nTgAc7oDIRxDBMs94PjBSPz/Tf
	siSUzCYAveMQO0/LdRQS6m//lBUUeiQkAxpzpS1MBRxFu0mbdeUtcOm23J3uKhUWpCFUUAt0m5e
	EYsZ+V7+dVLpcWpXbcpFdKsf9MHh0nR9pctw8m+fId8fP/8eNYvrmQ12hSSabx9D2RYX0zOd5Ke
	J1zbKKdgS6vNIdaOuqGsS7Ih2gfy1C+4DG5EKZAerCPqr1sxjCqFwgNRgxDHHbo7UIHn1e2o=
X-Received: by 2002:a4a:e845:0:b0:6c9:83aa:6fba with SMTP id
 006d021491bc7-6c983aa737dmr944835eaf.63.1789641518793; Thu, 17 Sep 2026
 03:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-4-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-4-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Sep 2026 11:38:22 +0100
X-Gm-Features: AcwNN1W1XA4_8El0nHmEeqmwuby_RmiS1x_uIdVKr1ADLXoFM9cz5UdeJpsWQHE
Message-ID: <CAPY8ntAyYq_54Yvo1uC=LBepmqLma8mz_rYTmsm62LzHkixX7A@mail.gmail.com>
Subject: Re: [PATCH 04/10] media: i2c: ov9282: update flash_duration range
 even when powered down
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> The flash_duration range update sat inside ov9282_update_exp_gain(), which
> ov9282_set_ctrl() only reaches after the pm_runtime_get_if_in_use() early
> return. So with the sensor idle the ceiling kept whatever value it had
> when it last streamed. Therefore setting exposure before flash_duration
> while the sensor is powered down may clamp flash_duration against an
> outdated exposure.
>
> Fix this by moving the range update before the power check.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 90a0fe542ce4a..4c88de1965171 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -645,6 +645,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 if (ret)
>                         return ret;
>                 break;
> +       case V4L2_CID_EXPOSURE:
> +               /*
> +                * Ensure the flash duration range is also updated on powered
> +                * down sensors.
> +                */
> +               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> +                                              ov9282_exposure_to_us(ov9282,
> +                                                                    ctrl->val),
> +                                              1,
> +                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               if (ret)
> +                       return ret;
> +               break;

This hasn't removed the __v4l2_ctrl_modify_range call from
ov9282_update_exp_gain(), so the range gets updated twice if the
sensor is powered on.

  Dave

>         }
>
>         /* Set controls only if sensor is in power on state */
>
> --
> 2.53.0
>
>
