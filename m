Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D53C9454
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092198; cv=pass; b=i5KslWuTt7hyx6FFLMgxW+8BrVxt6plBGRRUubsX1tigEzSFefmL+WHtNUp0drmi+9d4HUZZ6Cjsfk8qxnYQiqds1wRFEqQuGqdPEeXuskFSUiPjtrpbh7CI95VzIyQ1DEnV9d38nL/wQpFj8QH1se0MYjEzR1YHOcXRegiiBFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092198; c=relaxed/simple;
	bh=FwvYiaDcG7fL1f29jUItXT2GNsF0KQa+Oubzhul7ezg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeFmSaxgxjbM3Y+rz0PkHYBBujVUdiN9QhcIIOXXhUDavVlxwggBml4Xb2Eqn6dVucSLRg1+bhnSVzfxvqHaDNfQ7dorIk38AslGfxYv49sqlKRrOkius6o85NerGkUOaTgfXzgWaVa7YFJEODwYeApgXkRhlO8Nq4xezW04LN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=BgxwzVEb; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BgxwzVEb"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4923c9429so31650b6e.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790092195; cv=none;
        d=google.com; s=arc-20260327;
        b=RdbMSTpRUceizN+5zBTjojE8ZkUeNRwGxEQxWWsNlBpfRF4cOL+VV6NRj3f4nd5KxP
         wCfLQUbXm0WGSTTncXLckJn4od3MlWqFJCWu+5NYTeOKdGk5gfH2uO2y+itSrnhYxBt7
         93J+IRmSf80jte2rvVZm5ZdZBR5u9bFVP5PQlzqcIftFDsZKXdxki5Vrxn74IXdsNU6i
         6KFavXGr9vsPEqC9oCW5+LcnwY7HQdmRtumEB9ATLHqpPxDnaP4yRiOKGh6I4g4hzgbC
         L5D5Wagp9iBQWDzYKR6K7J9HOm+3qtxDDa6aHFETRDDuXVvyQg7lC6acZJYiahIoXBDe
         fKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+IB+UJijWjaTnFVpSDyUcRlyFG+GunEChS+weWwWm14=;
        fh=ORMWTRHDTcOS44wbqbHAb/qD9qqS2oSRHw+ccHe/pk4=;
        b=YyHk2Af0WxizO7rxevjv+yaf/klRYGN8sEvUmgiMPOCpDX5Vcl5Nnxpb8cm4TX8Xrp
         NJoh0O20GdmxJfPZrb3asPEx4qxASVyvDaxCS4336DC7lkuP2dRnrIcfnsyydHgVE29v
         ax/41kWuwVYCVmCsQhnu8tdmwSyUYntOqSsAacwtpQDWSNePTg6iMFLbcGHFqvA6G/u4
         cDhKPIPigmFm1jhigooXZZ7C6BFd9Ms9k+4ZCG3M7aUdknWHeGtU1qCfmkFYzS7npUct
         E9uGidxcSCGs9zKCCF71wNnjp2Woii8ddR+0KJwwuGKqrRi5q4deaVHD78dGigZ7Nj1B
         xsqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790092195; x=1790696995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IB+UJijWjaTnFVpSDyUcRlyFG+GunEChS+weWwWm14=;
        b=BgxwzVEblWiqw4mRVWVmI4pnlSxui5x0Bf2OsqGawV5jibxnZZTyjI4MjWPGo2rORP
         UT6n/LXhCEKVuxz8IonyoR1PKSb5yUCKUVvf4DGwH6ODiisG6cGvoZi/pu155G+mFP34
         oPSxUs//AqOi3kpCEhwsxxKi+gjRBPzCP6Ana/VnUzg7JLEY98J6+DsmqNCyE5As9b07
         zioKxS79+XJ1i1Jw2TTEd+bTdobHk1YebdEh1JY/ku0Y72fAbnSF+hT5hbgVAPei9omU
         3pjrJOaLYHmx8r/Q3Sv4TC6ewMkMQF9bysJadkgmINToJbiVvoLNJRONum13BQlWHFoF
         XaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092195; x=1790696995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+IB+UJijWjaTnFVpSDyUcRlyFG+GunEChS+weWwWm14=;
        b=fbdaRSJx+g6sldpRMokoFlq+TyXLzTsb1moPQ15Q1Kh2GHRIjXO9Uf+oo7lnulHD1A
         tBkdm2/25CV1oFctlr2xQm5/2S5fonlSKglHoYLfH1/33jXif2K3QdzQ19ykQRZcHdV7
         UeqS1aDhUrh3IQ7qdhXx9pFKc4cbC5saB8iO81meWoZCvaTTxwa9n6+eQn2H11aJxMzG
         tQcpJjplck1Y2nmS/mWy0jplm3SXGD+9Cj41nBWJ0wPEZoQ32Bhxo8r17RzAJWIxcZDO
         PBq3AiNhNiLtVqn//uwS+M4mIeyytQezlXxr2Br9j+TXTDbcl/hkiBdHjHWaytGqPE4j
         O0dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ8fyvccTVBHm/+UbhQ5hb94BHOfA4XDIxX+nIzkcUwYoPIrEqWhXDkq9PG5W3km2zD/PYNM4XP4PfYA==@vger.kernel.org
X-Gm-Message-State: AFuF++lHp4n3pxD6j1GtvJFd16xFtwe5AUAQAvlWOMCra0giEfpav3TR
	PM7TH1HQ80gYmh90JsZjbjlxyl/7aKNep8e7+a2l7dDaM2Ga4QT+7/lYitJXErO21uiesYQ2vhV
	8V3EMx+UcRXd1ngti1l3n+7+Kp0GaJ5QkyYto6S+XAw==
X-Gm-Gg: AYBFou2Kzm7kO3oIlHKt2ciD6btXiA+lj0CSPCp4PELRDRnyddcJXgCZhOomTy10Ltk
	NCTwXxHN08ehqBACUI97y4Uz9qlvgYE3ar3KCHGyFtYGcDgTdD4gYy+nQtAfTyV9mg4HT+4h+wK
	HosCrCK62wrYYcg8QGa8dZsPCeZ218cE/FYC7pfqBZLz4AZJ2eE7rxEY8ZME0T4WmXFFh1tbtYz
	FR7eLgVqgCq2720a2LvoeIDLz6fKwMQQJabm/9BhNKqGLkFl0gitxeJj9wG+S68tzXBm1ec0hnn
	x95DkdJ497wwEtyISrdse76GxS4oxtIFCkoeOl+DE+aYddj1j/mNOHh/baXTslVZJMRyqLoraAX
	uX4FjJyKHUlkMagf5Hsuzq/jOzDW/bXjTgrhcZB1xoPSbWyDCSeZxRwtGTSucivP1vEH82lA=
X-Received: by 2002:a05:6820:4b91:b0:6cd:3ffc:e32a with SMTP id
 006d021491bc7-6cd3ffcea03mr10302175eaf.72.1790092195059; Tue, 22 Sep 2026
 08:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922084009.506362-1-lgs201920130244@gmail.com>
In-Reply-To: <20260922084009.506362-1-lgs201920130244@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 22 Sep 2026 16:49:38 +0100
X-Gm-Features: AcwNN1UYho_M2TCkxcYs2QRUgoK-S9ENUK4v-9idaeTrzc5fL3QAaoHR4mTs8VA
Message-ID: <CAPY8ntD6kWi7Q57oL43SLe37szXpptdBXs6cs+vxVehA0eJPjg@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: ov5647: fix power cleanup on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Guangshuo

On Tue, 22 Sept 2026 at 09:40, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> ov5647_remove() disables runtime PM without powering off the sensor if
> it is still runtime active. pm_runtime_disable() does not invoke the
> runtime suspend callback, so the sensor can remain powered on.
>
> If the device is not already runtime suspended, call ov5647_power_off()
> and mark the runtime PM state as suspended.
>
> This issue was found by manual code inspection.
>
> Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> v2 :
>   - Move pm_runtime_set_suspended() into the conditional so it is only
>     called when the sensor is explicitly powered off.
>
>  drivers/media/i2c/ov5647.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3facf92b3841..3b3e5653a0c6 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1271,6 +1271,10 @@ static void ov5647_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&sensor->ctrls);
>         v4l2_device_unregister_subdev(sd);
>         pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev)) {
> +               ov5647_power_off(&client->dev);
> +               pm_runtime_set_suspended(&client->dev);
> +       }
>  }
>
>  static const struct dev_pm_ops ov5647_pm_ops = {
> --
> 2.43.0
>
