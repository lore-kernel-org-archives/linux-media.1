Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2D50C2BD
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651675; cv=pass; b=VZoSYMegmReQZvmbrKn3MbEiTGA+Af5tcynjbQdhvJZevinlPuFb0PwjKL37212ubzkpw4YMNdjoLzpguesi2GUH5QfrT3BeR5m0Z7j0snb/eMvQq1h8ern1EnYegBnKQkeO4+fPiCIlP1pocUQuvbEtNcnLZMy0ozf3cso0mbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651675; c=relaxed/simple;
	bh=TXtU25lOH5dMtACZ7iziOB2oxE4cZXtJfR9DIYvkgR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhwHKo4GysaGXyf7RVBYnb40cqRSyalQ+zDJAgHNHWSZnGTaXcb5y5QwmtcN8MpD445EgHqJ7nDQSIIWsvIKHjN2jJ4RXTEQOU0FxxFH9OPY2mJ9zcRsBRBh3tXFKHXXLDIue4st/I2VlyXK2NnNX8at9mYZOdMCcmznUGiquQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Va8wfZDc; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Va8wfZDc"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910399d8b09so6545146d6.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789651667; cv=none;
        d=google.com; s=arc-20260327;
        b=XDgaZGT41f+RGSn1fOQrL1SQHQL6FE3+/KMZjxdxCVPLCEau29JkghxXFVcnKhfQd/
         H90sHvy7vA4A6BON5wNj5bh7cOvTfP4BnTDv+3+q1qGJYayai58VBNl1m9jkGgGx60Gh
         HZhjYsFxSUAGcxXQfMRilErHCa9+mUgukWqfqp9vG0tc56jq1WJLoF7WZQ3/etQNChoX
         8fw7tD813DNXckw8nCUk1jjwUHoYeBevRFjKRBM1+fDliLZaMVy9RZ6IYCV4zU7G4K9c
         FzAsVGdZ7ds/KQTJ0k7MXaBXiyv9FtfSIEL9m1Huji4odcStwgxj5yfAj+zFcNaUFMON
         mbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BAW6djXECzYrmSVVgeAoFqiFa+eST1RRqM7bt/yc2VY=;
        fh=RC1d3cQnJqpsIjwvsNG37+XCrjuYxLQjFxg/EEdzHN8=;
        b=mDFzPerz1pHaT5PyyQEv6fwgEsU+vxNibOZJwEe8Y31FCuhD22yYRLOG6iA4DLWsI0
         UhhJLnlk/43vFLtC0cpfdSQBRI86jjK4Fdglica9CfdAet2m8B5zP16SIeKNXiOMWr15
         +/9wTNVXF0fghFnC/zcXwjKNr0n1nK2XEmExw23UI7hRA3aDu3KrH1hRIqIsZdiCbEzL
         JynDd0n0JbXclcgVz4gcWyC2skBWtQePn9nhtwM9hPEcjtmox2p4PSNLvS0pWnm70u3w
         q313B2KFh0Dd2BpM2H52u4Sye1o+XXZeQqylOw+ULpNExlsE2nHG/o2rnFN9qiVHAu5Q
         oNfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789651667; x=1790256467; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAW6djXECzYrmSVVgeAoFqiFa+eST1RRqM7bt/yc2VY=;
        b=Va8wfZDcFdgq5TMDukKEUtut82zznutnHHSqL/nTai4Lixf+OoKnnVWT9hpz8X5ZGm
         pXwI/qhCWChNc8Zm0wqBDkRGtZbzgQqyF1fIWUu3t4dxdJ+wky2d+bFpPc1BnbmtDRGW
         txgCfX2fQpdg9iVF3vU2SNWG90uXd4iIf49QdlkYnIH4cw+f27QvY8MV2XoQdPTX2E1B
         ESj+jKWN3h37kaN1INYNXC+aGUKmD7BdB+GBkLjPaxTv8aCAH1yfZZ3hty+dVpEYHZsl
         xmKTz7BOMO9P7fTs4lPeEhjznS3yXKc+/CcOsO2/KdYApjWPfqFIkGmAnVeiFyTeYzRa
         6Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651667; x=1790256467;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAW6djXECzYrmSVVgeAoFqiFa+eST1RRqM7bt/yc2VY=;
        b=liWfAY7G4P5CA5t03m2V1EO9EKYzKzPa0lfUG4e3pEuHQWMCvw+BDDyK/laHev4DTc
         /mOEN7o/Ru0JNgWsmEVfY1caSrPDkM1NYxSuAnQzywhiSS/5MvWV58b7gYzvnuckv5ir
         1kjpdVieiisjHu4Vq20AYT0Qu0pITgLwFbNjs75pPd/9DhtpawH08m5E0htd4yGBIWgN
         rA5/Sl2rgN2odFm6tcS1XJjACEJUSMbOzhvYyA5NmNy2Po8f2YKDtz/Yl371WW5mecEj
         +qT8bj440WTm9N3ALFSXkP88dTY9m/5J1Qq7W3hR9STyq+4KT+OkOGPITRPVkQLcCaza
         KcKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt/6QyKghfYirtFyHg12C3rVHzW8powKpK4+MzHW+TvGBOehVU6AjStyTOtIDRYTpCf0MbXlrBDqWcww==@vger.kernel.org
X-Gm-Message-State: AFuF++nknay3DOQwLaW2I5Idpm9K1igaPM1EtV+J0EUk7rJFjF94lq4V
	Nw+1ANGlyAG7oR/OtTjvZO5W+6apsVKfOA4aiQlrVl3r7OLj3Ej7XFjAM8qh/udASMbdm7kFu+d
	+Izj2juXufkvofWA++P2frl1rsjbalQKE35zt4hecEdVbctk6o4xY/+U=
X-Gm-Gg: AYBFou1lhIUMNNCn2QR6XVKINygCfBsWuP6X/uEn4wOpY/eHG2R+39NwHHKtz1PVl5Y
	DsjEyV4dzr1QZ1h5NZNVkg7QxS2eI9b7FU/01KttD0EIqrC1YTuUF0TFS3VrVC82enY5WNxjQ1v
	APCHuOCKyVVeGOv0bYvjijm+VEzOBpZk70zAhAyDa4H4tREvubOXLJ+U2zjjolNHgyhgxNXcPZ0
	kCVn1s7bcJoxb0fRPc/ETRuQRXVJKOJR3xk8qQSKt6E2ImZZ93OW4FK95QIR9zJV5y/jOY4DWNX
	Ao1txUrG/amVU6zQwnJW0qC+W5irskHUHevYTkAH9kkxIsnahl3pg6HHsqQnqReZZaKOMa1ruoy
	tt1ivRCY+NYjOYpt9d6yiTOeCDM68Ttz7E7NRiCqdZsFy7wbhROHMqZEI8Vdr/NmxArSj+/w=
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id
 af79cd13be357-93bb796a4c8mr1114936285a.50.1789651666676; Thu, 17 Sep 2026
 06:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915090457.2342778-1-lgs201920130244@gmail.com>
In-Reply-To: <20260915090457.2342778-1-lgs201920130244@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Sep 2026 14:27:30 +0100
X-Gm-Features: AcwNN1VtPNHGDzm-Brpio99oWvACBn2y0PZApgP4nD88EIW-t5kvm83lCSZc0OI
Message-ID: <CAPY8ntA2h_ChCWJbAmCVygYiviTdsd9TA2LcVh5ffto__LgZAg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5647: fix power cleanup on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guangshuo

On Tue, 15 Sept 2026 at 10:05, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> ov5647_remove() disables runtime PM without powering off the sensor if
> it is still runtime active or updating the runtime PM state to
> suspended.
>
> pm_runtime_disable() prevents further runtime PM callbacks and waits for
> pending operations, but it does not force the runtime suspend callback
> to run. If the sensor is active when the driver is removed, the external
> clock and regulators can remain enabled and the power-down GPIO can
> remain deasserted.
>
> After disabling runtime PM, call ov5647_power_off() if the device is not
> already runtime suspended, and then mark the runtime PM state as
> suspended. Checking the runtime status avoids disabling the hardware
> resources a second time when runtime PM has already powered off the
> sensor.
>
> This issue was found by manual code inspection.
>
> Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/i2c/ov5647.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3facf92b3841..d42d009772ac 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1271,6 +1271,9 @@ static void ov5647_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&sensor->ctrls);
>         v4l2_device_unregister_subdev(sd);
>         pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               ov5647_power_off(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);

I was unsure whether pm_runtime_set_suspended can be unconditional or
should be in the if clause. There are numerous drivers doing each.

As it happens, Sakari's just answered that in [1] that it should be
conditional, so I'd take that as gospel. It looks like he's given a
similar answer on your ov2740 patch.

  Dave

[1] https://lore.kernel.org/linux-media/aqvb_n-aPcXLnEa7@kekkonen.localdomain/T/#u

>  }
>
>  static const struct dev_pm_ops ov5647_pm_ops = {
> --
> 2.43.0
>
