Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00D3CF1F9
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063140; cv=pass; b=rQmoEWyWgoHStcGaBb+krtbxFO2KiF9oTUpDX7XLcqzbstt9Fs0A+CQGag4hpVlctyhp+C7Ice02U1Q198Tse4wx847vzmFktNWTsLawW8tR8yJWFA8FX4WmgbBzL7TGGzdqcF2UzO5uWylek9C33sn+kmONbuLKL1JXbAtkvaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063140; c=relaxed/simple;
	bh=vwk3YHzhVRubUb6LXpTknkCoqeslrv42vzJiu5ebNn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ts93ox+zx/klT7uvqTHqq2LMeET4yP9EjXQdIC3ecEqGSVNRNToV1feW5gZ0kd8RpRu/4qM4q5VK1q+Pv845h0hAlxgXRbCguaYiPfJ4h/LZfsfi5r1VA9oUAhiS+6s5ywtSu8oK3DMLzwLbop0JV+6cisFjCWAOsZhZbQbm0cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNg6zioy; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNg6zioy"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729c4030f0so2243324d50.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 00:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790063127; cv=none;
        d=google.com; s=arc-20260327;
        b=Oj6xwZx/fWBuoeqjcQjtLGmlOxRz16Kp1M+SAvGNGuSahxgBDgQ+Cz9BUEQRzEVOGo
         lRIQac7ogdBIL2PGG8ylMAROFnH+6NEMThaECc+0n9lac2mJ1QYHywCSHCCibyDluZMa
         hY5ceDNjvNk741zyEMGFdnDOQiv0yDqzZGDkL3H4LbTcPAMaY7OTwdNDc2ALIlPPcQIh
         dySbcfyNoHwPT3HS2kpiK9ZoLWtVngI27+oe4WLKsbkvtMi2K8NopkhSnvYOn4ZMS0mi
         90a/wlNewtGci4Ve9TwZBDvMdJeJVAanKoxa9B4q+14pfLvVmUfsNctWFL1NS88i48PP
         i9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H+UYLFM6FSgyZSccr2Im7M4AUKvCegECPqck3iL9VdA=;
        fh=xqnCHUchIA3uVZ71XkrWPE0XOK96MZdktI7/JqgxUo0=;
        b=ZH4oc9wkVGNWmNehZaW9IhqZkQ/WkdGU75f2Pf1LPfwaPJjc4qGjcIrw6xZ42uwBd5
         SAHCSshutYW5mTY1+zuP6dw4bkFyC+wGvs6tpUw4DW7/QcFN0HzoSEPwY+mB8jmbz0u/
         n0GxuP0mlAPIvjE7kWFInvJsdRO4ux6hbW6wnvPI/7/bxx+8z33hP61Wce/7bhs1D8gO
         AHb3bzWK1tAc8po+qqaZPd0YTw0DO8KCWXosNNcLhQxvXsP3qsAUYL/2pmIZoGG4+dTy
         Cq9f8w6aTTOcB8bH2ZZEG5t9xlNJCieCKDNotCIo/Zk4Krps44kMs12RDyBv5TrCqNZZ
         WlQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063127; x=1790667927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+UYLFM6FSgyZSccr2Im7M4AUKvCegECPqck3iL9VdA=;
        b=hNg6zioyPkj3Vxo6UL4pmtbNqUQn/ScNQyw72P3LgDdRR8KZwwVyW9UoRfULYdcO8K
         Hdxa7466v0D3DLvtELMdXcPbNOobkoYIarzfkp2zA6FdRpjfZm1nCYMbM8ZvHzeUbh+0
         9b0h/H4dDBIjSr6nrw9bnfkNbsJ9kkH2MxVfMW3hm+HC+X3WCRel6i2q6ReK2CHlNAYG
         DP3Dw1zD6p5rJBrKehWRwfGWJPDG79sojIvw1aez+dkkDzdfYWFzAiU6mjhGT3avWJ0P
         9VDEPOkzh1/HnqlSqMax9NIoxl5NSC8O7tejwQNZt4yYe4jW0zB/P6djsh0x/u4jmzUv
         lPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063127; x=1790667927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+UYLFM6FSgyZSccr2Im7M4AUKvCegECPqck3iL9VdA=;
        b=HcTmKYMbgJa+8DFg0XzX0bqbWUMUJyPzdf3LjPQUtCxz1+hstAC3XcO6sz5dZJW/Eb
         JhAY3laRu6X1acdp0QrQPNgqVqXT+99xtSfkvOYym8SlqniVwz7LKv7swv2Xr9i8RI3O
         7NdvoxUeyU3grZbnNurBoJwJp6U//uzpo7aBb3sVBSP8UEu4V/arXa7bITu9YBhN6PpE
         NxHONBAW9l5zLnZZpmOTsYrHsxz9/9V7ga1TPW8u6e7fEUetJS7RK7HlYvREU10WoeV+
         FlBXbBrFQUvf2CqV38ZsyMFjgUNDcROTHPy2vON5y0KltEJCNrkN2Si4ukX/sJrc1fL3
         Gqaw==
X-Forwarded-Encrypted: i=1; AKwUvBy6p0PwofGsIKo9jTGoM0hR3a+hZaM1Wdh2YgrDvqsa237hRHa7RPQ0+4PMq4HnXv52ZThfoEiIh2jyVA==@vger.kernel.org
X-Gm-Message-State: AFuF++l082eeBf/J3Xo6AkSTP3AlNWJ7uFV7U19xB3tm2hsgWjRPxddi
	ajzhNfooh4RgZjB7m6dmZI1joLKYhCDWfz/dUNqCFr0PcG+E6RocMEjPayUDMUSWMYRor4AaE6C
	6idXlt1ooIOFs0oeOqqymNYREQNxoawk=
X-Gm-Gg: AYBFou3U4eEkqqQYImQAB5u98gXBipJHNi04vqmUJsT63+JM+StYSDGNX0tsTAA9YfP
	BJS3lDo+HE/BD3JsCjFYRm3FR0V3qwCd+xoB7aj04B05OwLyVVV9ncG23U+HUh3xJj93ACKBWxw
	HjVpJX9hcgnPnPKf3x1Va8uS62I9FPM6AsQRqcCl28SLw4nVr+MjX0JbmfEsKFOXJdSSgfawn6+
	FEE8JNJfrggnjwihWFXixjmGbMOj85cpqgbvFjnJ+VsZWFuKmXGLd/WivyPNte6qCETSM+n6mPX
	L+hEFX2PuASfdhEpBVgWfD69NyHquoalTpzmrGeA2tCwseHsb5Vn048AMw==
X-Received: by 2002:a05:690e:4504:10b0:66b:14e5:d226 with SMTP id
 956f58d0204a3-6717fcca387mr2794016d50.34.1790063127085; Tue, 22 Sep 2026
 00:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915090457.2342778-1-lgs201920130244@gmail.com>
 <CAPY8ntA2h_ChCWJbAmCVygYiviTdsd9TA2LcVh5ffto__LgZAg@mail.gmail.com> <aqz4fLrtW3f7OoYk@kekkonen.localdomain>
In-Reply-To: <aqz4fLrtW3f7OoYk@kekkonen.localdomain>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:45:13 +0800
X-Gm-Features: AcwNN1WbgY-jD334r7w3_JXPxi1yr4UDfUsx_etRp47_SqH8gSMFaJ8SCAMR3JA
Message-ID: <CANUHTR9_XR7Q1CJQwKHd6dZRLaJdRNpHxYbUVXkJj_iM7ywoeA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5647: fix power cleanup on remove
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Sakari,

Thanks for the clarification.

On Fri, 18 Sept 2026 at 16:45, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Sep 17, 2026 at 02:27:30PM +0100, Dave Stevenson wrote:
> > Hi Guangshuo
> >
> > On Tue, 15 Sept 2026 at 10:05, Guangshuo Li <lgs201920130244@gmail.com> wrote:
> > >
> > > ov5647_remove() disables runtime PM without powering off the sensor if
> > > it is still runtime active or updating the runtime PM state to
> > > suspended.
> > >
> > > pm_runtime_disable() prevents further runtime PM callbacks and waits for
> > > pending operations, but it does not force the runtime suspend callback
> > > to run. If the sensor is active when the driver is removed, the external
> > > clock and regulators can remain enabled and the power-down GPIO can
> > > remain deasserted.
> > >
> > > After disabling runtime PM, call ov5647_power_off() if the device is not
> > > already runtime suspended, and then mark the runtime PM state as
> > > suspended. Checking the runtime status avoids disabling the hardware
> > > resources a second time when runtime PM has already powered off the
> > > sensor.
> > >
> > > This issue was found by manual code inspection.
> > >
> > > Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > ---
> > >  drivers/media/i2c/ov5647.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > index 3facf92b3841..d42d009772ac 100644
> > > --- a/drivers/media/i2c/ov5647.c
> > > +++ b/drivers/media/i2c/ov5647.c
> > > @@ -1271,6 +1271,9 @@ static void ov5647_remove(struct i2c_client *client)
> > >         v4l2_ctrl_handler_free(&sensor->ctrls);
> > >         v4l2_device_unregister_subdev(sd);
> > >         pm_runtime_disable(&client->dev);
> > > +       if (!pm_runtime_status_suspended(&client->dev))
> > > +               ov5647_power_off(&client->dev);
> > > +       pm_runtime_set_suspended(&client->dev);
> >
> > I was unsure whether pm_runtime_set_suspended can be unconditional or
> > should be in the if clause. There are numerous drivers doing each.
> >
> > As it happens, Sakari's just answered that in [1] that it should be
> > conditional, so I'd take that as gospel. It looks like he's given a
> > similar answer on your ov2740 patch.
>
> Runtime PM is a bit mystical in some places. pm_runtime_set_suspended()
> appears to be setting the device's Runtime PM state disabled as it name
> implies, but it may also e.g. increment dev->power.disable_depth. I'm not
> fully certain if this is by design or not.
>
> --
> Sakari Ailus

Would this be the right way to change it?

-       if (!pm_runtime_status_suspended(&client->dev))
+       if (!pm_runtime_status_suspended(&client->dev)) {
                ov5647_power_off(&client->dev);
-       pm_runtime_set_suspended(&client->dev);
+               pm_runtime_set_suspended(&client->dev);
+       }

If so, I can send a v2 with this change.

Thanks,
Guangshuo
