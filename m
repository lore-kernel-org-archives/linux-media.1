Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340745FFAA
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371313; cv=pass; b=AzPcynLN9BlBvIdyHN/AqtOas08knNji2Tq6eh0A02N1rGhcn146Hf6yeRxjl8kJQ6RNoDkgK34/UnftkHUlPItP2PbitNymlRWJ5BF0ErXzmpFxKzt4x2JVDemXmy4mCQW9RFlsCifDfmOU7fJ5voFPmmCbRWXp5rJ9FHWuJCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371313; c=relaxed/simple;
	bh=tGowDxQJeXivQdDvAJkErb5jW7cMlEy5ohNQ/yw/K1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=os2NX+IUo/iKBUXltLt/LFRnUcgZlu82iVIoSw88nCvKQl8FoC0RTztynDAk+1zI8DQ7tz6EeTvcNNjRsr4lI93MSx/lktZJDCMPrEncCOqvyVo1C7oaZkaM+r6x55hovIviBgOZmcZTWp7nYloqqvN+f9oNgFA9PXDYPe0ag9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bisWipT3; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bisWipT3"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49e1251674cso1325327fac.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 04:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371295; cv=none;
        d=google.com; s=arc-20260327;
        b=qbt+8QuquLWeR2YB4FlUMrGRyeTvV3Hu5OwlbKzh2dCygUClwlwxnkDh83FK7Z+J3q
         sLAxY6aFaD4guQuz1KB94AIs8G1bCDMtb12vkxZzB4c6gH4oUdVrNIEwtSwsnRI5UlrR
         PvbQx8a54XNnwrVy80PZnSf+KdqkFtNUvY2sQ1pMC2ZI2m5TtnDrU7CKX8gaLHQNCJQc
         ALPUTSZZB5IIMG+aRCEWLu0aH3JU54WjWWS1Ys7D1NcAE2k18dabg+FkKe6e5qFi9Kut
         9jisfdqqDjzK4xsLMB73HBbDJeyJufxK1QdRwqvqe/zjStukY8ELMUYr2uKVUqO6klBG
         JaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RAu/Imf170djptZMOt8TN6cvFYKGz4NYBJqNFsnVtSI=;
        fh=b/29/JY2XTyc5hfPIopvxafQ4p3d1A6Jhqf8EfEM0NU=;
        b=fVi9Mz/e80bVm7TnZ5+etH1Th8Vik7XvdBIebJqcnM/IayA8EeYP5u+WdtTlNGWzEL
         r3ixK3kImIHUbhIPA+VNWDPMqSMVX7pVxS/R4y3Vt3ex+opN2zJDpaILnNvOSv3r6TbC
         a5f0Sd+vZ03fzmi2pHNUg2ExgQ6fq6Ma40SKRsPXY9tTXRPNhiHP9yHIzOOR/omCUzuV
         AG6sKEkN8rew/umMOGSjlVJTRRXQNMoRdf1I+qKQ468d/JVbL+RR13MSawGklGfXxe3N
         ELdSrnwEuEELEsT5pxT6aNg5JLnekxPGAbcDql18pFlXNayrOHQy8SBsZspNc1LD42KK
         FwDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791371295; x=1791976095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAu/Imf170djptZMOt8TN6cvFYKGz4NYBJqNFsnVtSI=;
        b=bisWipT3zxoJetwXafJPXK325wh96k7+SRemCOtC5YqbUDmU8N+tbMzQq5Nx/nWSuc
         9Ot95KD21EuhFUovjxuwKWGX7nmvHV3iWulheUKILkrseazz4uWjYVcdlGOPhyc7CmFQ
         oPPp/VEqFyjohgRtSukkypCIBBewFrREA6+O6nGyDIYTPVX1hx9n2fY4RAxOuWYzAO+V
         9xJLsrKboLDrtBUCw5XSzrkVf+y5X2j7W84Qd52guiz9qg7w2RlvsDr0/FG/LD/rzBw7
         5M8akiQURIC1ngyWNY9Is081haUtCPLcrarOmOyXL+F3UwWqJ8gKkOSZBUOf0xXrlZlT
         CtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371295; x=1791976095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RAu/Imf170djptZMOt8TN6cvFYKGz4NYBJqNFsnVtSI=;
        b=JxEX3B+Nw/xQzVkO1OWJF0WroGf42d/3f27wCWsBuPW65KAcDsPvUqzi6Dv9x+wu+r
         DM1FGq7ow80lbdA5BKd+yXdSFpemaWcqnugVQ/BTFeL44IfRG9AMavCgVv6QzewUzk1O
         wjDjxGyqkiq1FDt0rHfkoA1DHZT2Gbzhm/WxBpeI9L8CrLDYQ2/fmSSCWd+v8Ollwvzk
         747+UivY+cozGSMr1ggNrgyqgdLBB4FgsPgBnmNPDh35c7h9qI/F80bPhwQZd9CI02U3
         7UPX6l7bf2nL1yrDM/ie8mdSyhhZuIBa6oA9f8so0wztDTZpNDU55QYVt0Lcul+PDtxM
         BtOg==
X-Forwarded-Encrypted: i=1; AKwUvBwwSKyUxCUlHixqTy3s9DYLTFUfj7omO47fo9W5Ci1t09P6lK553WA0gGQNB2UCjuqCxDkTPIBsCQmPUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPRkdVZ48cczPZt7I2UGZ9EIw8PwBeKou6IWmbmc9SXdeXqiGR
	UQGZOQnTUO5cHwH6Dm9oUGviHkvkdaQEfN9hKTmP3UsCUk52pi4lTxMuM/zA7tQxDGKWgSoCvpg
	C64EZszCZLq2t9d/YdclV8vQ6tpIHHcGlxUjLIDxiRg==
X-Gm-Gg: AYBFou1oakvwbjnupnFa7+Hbrnr6Z7sd/BzBObcKiUxhYMBVomG7yxgOreLwGnQO4ux
	Yx2VoIdxC1jWqrq6zlBr2idKRbgAuZpwKITxpecjGnbrME4IRcgD8CFmAUbUI22hzkLr0ks8eAX
	J0sP3FZVuSOt3zBvBibDRUA3aEkwy1NKfl3stekRbcfI9msgcC6UJGmeGPo5UISD9n04heDtVAH
	0FXVO95Cf1DL2em+TvLxNn/Lh9IT3wyzoQLuiJ0ekb7TqWrHUADvDr3CxLeAgsnsErMeQGwaTU0
	3RgvyBKaSWrCUSpvLJXpqagUDRrHK49P9cOdgDqyNMbOAmdLfPyWBVXs4eSm/Pk2miwpaYhHHb6
	H5KTxm43eEdqsIR3f9IOf7kClHcFoo2U06gadS8TG1zTSYvA6HFYK9QbpTmko+nej+SGZSK9C
X-Received: by 2002:a05:6870:16ea:b0:491:7c1c:c24d with SMTP id
 586e51a60fabf-4a25950e29bmr1768930fac.30.1791371294988; Wed, 07 Oct 2026
 04:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104940.507820-1-phucduc.bui@gmail.com> <20261007104940.507820-4-phucduc.bui@gmail.com>
In-Reply-To: <20261007104940.507820-4-phucduc.bui@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 7 Oct 2026 12:07:58 +0100
X-Gm-Features: AclHuK8jNyu4J6aY8nFRvuolKmkC7r_xwYmvV_NX-kpPSA3dASsF-X4_A_0WY2g
Message-ID: <CAPY8ntDCR+Bgc+z3-ApNk-rU9gZwtmgSON=FnSO+6qAeyrQt7A@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5647: propagate pwdn GPIO errors
To: phucduc.bui@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Walter Werner Schneider <contact@schnwalter.eu>, 
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
	Hans Verkuil <hverkuil@kernel.org>, Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 11:50, <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
> but ov5647_probe() currently converts them to -EINVAL.
>
> Use dev_err_probe() to propagate the original error from the pwdn GPIO
> lookup.
>
> Fixes: b050791d287a ("media: ov5647: Add support for PWDN GPIO.")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for the patch.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov5647.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3facf92b3841..b3049761a5fb 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1186,10 +1186,9 @@ static int ov5647_probe(struct i2c_client *client)
>
>         /* Request the power down GPIO asserted. */
>         sensor->pwdn = devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH);
> -       if (IS_ERR(sensor->pwdn)) {
> -               dev_err(dev, "Failed to get 'pwdn' gpio\n");
> -               return -EINVAL;
> -       }
> +       if (IS_ERR(sensor->pwdn))
> +               return dev_err_probe(dev, PTR_ERR(sensor->pwdn),
> +                                    "Failed to get 'pwdn' gpio\n");
>
>         ret = ov5647_configure_regulators(dev, sensor);
>         if (ret)
> --
> 2.43.0
>
