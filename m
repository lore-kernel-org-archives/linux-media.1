Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED236C9C1
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641206; cv=pass; b=dBeNJew4T6zCLYSVdTFf2O2ZR+BYtqOEWg55fP9pYPlc5i7FXDy/yEDkpGf7+kMcQyaNqq4eYmuTG2QMNLQrrph5/jvKQy56blPc/pN8RBjZZw5m74f4suCFmoNwXcSUK8mCSYoeB898O2dYKXEW7cnP49dwAuVyt2vfCprj9r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641206; c=relaxed/simple;
	bh=wWXm2+0RBFt0nyH6v10F5A4NgVlT9JLETtegduZU6qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjjt/eLIwaR0bETNqCKG9m76+eStWdGcbSCamg1VhkC3HrrWZSIYclNt7URxxE/MnsMk9YuppZAYzbA8Wp5P6Lkyz3MUymrZTv2lWuwfiIg+T1UUVccgdnzubflsKd707Dn+tb8oR0JI/yEcRiiDDI81IkQlg7mPOdbcB7qLA/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fFoZSp+t; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fFoZSp+t"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-455ca262ccbso6110779fac.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784641203; cv=none;
        d=google.com; s=arc-20260327;
        b=aJKXWpaF2qJNIMItq/ujxNjh/lmp8dc+bz7q3ecmBKIBhbhItXEo9EpEXJ85Uc/1nl
         cUsH/39LQmSl08anvBuDdwo/Y3FQVDo2mjEeB+2z0XjfF8ZNcPyBPph/lFG7zbpzBb7N
         TjCuvCp4A+ngkFVnzB6KEgKgjd643UzSVDwqI8YTzsp65pvSJI3uwwDzU4IHqgSDzPpa
         XFIZzWltkM9Et8j3vCGrF+qBJeni6FW3KcxMBpZyNZ+yva3PXeko8mFRb/RDiBXL8mfW
         fHhrlgxi/pnyD5q2wNZuyAuMGxMYpeFtTQ8+R8idIUHX/jX692JKn0k25Osy0Uoc2GgS
         b0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9HYiqtLXgsdyAJq0m5/OuD6lcEfSre1c/VzcXGw+L6w=;
        fh=r3OyxrM4TGgr2l3W3E54mOzgkLuFThPt8NBVf9LVjTY=;
        b=NpmE3yMgU8IuE2X11oyCibFH2gq58Pgwa5DsqZUUQW6CzElp3sdkhXDriK5pj2O6uA
         nfZowv7jmMU+UMc5prabZg2GiOpQI/M1Bw/H7eb92M53orMATtSWniZrCGGHMwdTPfMN
         JjSRmmVEz2d728If8uXl4ALaW5nbJ4OKNXhOeh+u6uZo5VNw2lfXDXX7qIlY5L8IJGC1
         ud9tdzFIIPw3ggw84+cLTpRV3xIGRwCoUZ8NDGOuHmmk+rk7vJ/NJ080W6YuY7l6fQcb
         rirt/sA+A/lfFL53co+yYaNbYtxjCcAQD6krHIHpTRg2vVyaf978cM98l/BA8RXpvY61
         Z1nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784641203; x=1785246003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HYiqtLXgsdyAJq0m5/OuD6lcEfSre1c/VzcXGw+L6w=;
        b=fFoZSp+t0cnSS42e9a/685vlrxKu07Jv03lzOsz4EqZJChPDH7fRq0++wwwQmRKNIj
         +UJQwSvlHv6rh827fTS0jVNAUbX/ahHTMlSdmz7psUjKl7/Y8GN+MR17e0MnF91Qi29x
         Ba/lF8fUXH3MrSWv0vhWTYVDksdSyl+NqzmHguLnee6oXs6mGcoH3vjB6AUvQKO8NLXi
         WbGSKgUDZ5VodAZLWmuEnJXeOP5Dl7IAhm8qIFfTdg1TjefgRiZpNfSiLFZj4C4a9s72
         5dWFThCeUrS/6V7exI7XNmYm7W66sMIbvMhf8D/jmOx2fYfNVVn3FKCcq+AJVf0xxI2O
         K/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641203; x=1785246003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9HYiqtLXgsdyAJq0m5/OuD6lcEfSre1c/VzcXGw+L6w=;
        b=DcX0ttDqCUtINSWEHS32WggbquR/sM/Aj5RT5Q5wWiLb8Q2rl0WBcd/77WatDCk9cA
         qoxViI+TLaZQ5C1tAvnhAxFotGBt6FZVHSaYBSjXm+3WOPOQuKXdX1k5bOubx9IYt8/E
         /HROk7GrePFnAsvlQxYjjhhb574SWvEyNzIcZZxJ+XsKZ4GPL+1PknIixl+Te/kMs8zD
         hIP36NiIgk+4nSUgqjdwiaK1ldMGBxmv1/3M4MC7XGmM2WLj04I0gs2GR2RT1Vj4YyvC
         X8oxf7Cu10YgMfMFUut7uIu5K98L+tsLTAax5O83skursqNcVywPqZI2VWfk6K8vTF+a
         8SUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfVmB7hy2yN3ZKYI3EFvANe1zcdYl/TfHlXIC/MY3hapqt5ws34aW9tfpf7ejct2zdoqmVKZm9+OU98A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu18+bsi9WKQpp5vufj9pNVGShVS2fq8nNRci7bLUl/PwJxcYO
	q8pglo8SgC17nN8Wx9tLgrCKpkR3zWL2Kp362SBAdcjATdO9KOlVB1c5mu4io/Tbl5ba0leC0qG
	9KzXN3YUdVHw9DI1fHZXLTd+w6SvG3rUvz29/1HhDPA==
X-Gm-Gg: AR+sD108zfPeYZUtxNZIIzhHY5l84Pe3/ttmYaAzbj9aKpDsMKYLY+x49ywBqyxqs9K
	mCbo8muqGKlX1Em3wCh3J7iEnH5t1Y3apvNDSmw3FmnDPFwMgjdU6O4eUrcBN7WdrqckitQQ9dv
	AxYBSqYWm4IMpSa1YFm5z+PlTDZVvgXYY031MYhRbeqVPgml39J0RUQoPx3ociUqcGI8xPl2dzr
	IP999p+AUGOGWdL1ZMYrn0SvlKFRGswcq5Y7ysKGVgFNGmdTm/zgFWwO4t7ahKbxw9/BOtsWwDg
	JL3kL4xTw50o8WpbN1MKB9SaX4L9g4LwqyGK/D8UBPa28zwwfzKRkUE5ukE90NMMVniH8XPNuz1
	awF//yfoAeVGHfA==
X-Received: by 2002:a05:6870:270:b0:456:5d8b:5681 with SMTP id
 586e51a60fabf-4569013a65dmr8645087fac.1.1784641202556; Tue, 21 Jul 2026
 06:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-cci-single-v1-0-8485171e1393@linux.dev> <20260721-cci-single-v1-2-8485171e1393@linux.dev>
In-Reply-To: <20260721-cci-single-v1-2-8485171e1393@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 21 Jul 2026 14:39:46 +0100
X-Gm-Features: AUfX_mzd8rc263fLRvHLGxAGoqDqLvIm6oB7vlGb0QE_5L4g9MRdIK3TjhLIAO8
Message-ID: <CAPY8ntBUntw3DDRMfoCnr69yKfCMPcrPyqL2k8_-rGfr5tY8gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Tue, 21 Jul 2026 at 14:25, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> Some OV9282 camera modules, such as those from Vision Components, fail
> multi-byte register reads with the default CCI I2C regmap access pattern
> and only work when single-register read transactions are used. This
> results in the driver being unable to probe due to a chip id mismatch.

Those damn stupid Vision Components modules with the MCU that prevents
you reading registers.

I seem to recall Laurent had a plan for how to handle those without
having to patch all the drivers, however I can't find that thread
quickly.

> As the driver has no reliable way to identify affected modules enable
> use_single_read for OV9282 unconditionally when creating the CCI regmap.
>
> Tested on an i.M8MP system with OV9282 modules from Vision Components.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

As regmap does provide a simple way to request this behaviour, and the
only read is the ID register from ov9282_detect, I'll give it an

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

but it's not an ideal situation. Others can debate the alternative
approaches for handling VC modules.

  Dave

> ---
>  drivers/media/i2c/ov9282.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5b6f897a74fcd..8267a0a9c6f2d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1283,6 +1283,11 @@ static int ov9282_probe(struct i2c_client *client)
>         struct ov9282 *ov9282;
>         int ret;
>
> +       const struct cci_regmap_config config = {
> +               .reg_addr_bits = 16,
> +               .use_single_read = true,
> +       };
> +
>         ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
>         if (!ov9282)
>                 return -ENOMEM;
> @@ -1301,7 +1306,7 @@ static int ov9282_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> -       ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       ov9282->regmap = devm_cci_regmap_init_i2c_cfg(client, &config);
>         if (IS_ERR(ov9282->regmap))
>                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
>                                      "Failed to init CCI\n");
>
> --
> 2.53.0
>
>
