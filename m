Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64B363C59
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257979; cv=pass; b=aVMN0EqwE9jHHJU5ibR5EoUyFySfnM4F7l58qd9739njojY4aY/c16qsFXUmizIQo6wnWfA8xKpOegU8IMiJH/VrsHEhcwZyYgUBebArGrtaqH4dJTEmvRPupTqEZaBcIVP79iBaHzUZmyYD11RE2X8+9C36CkClfsYvI2/Weeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257979; c=relaxed/simple;
	bh=QoUAEYmTjcom/GYw9KMesKKHysm5dGsVufGYG8k4VHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7uD7ygHlLbPul7KspqaQKpFZ+ct0SgLMTFUufC/dlQi5mNX2HLDW19qyLcoJ7YQWbEC6BVW8VzhOZrEkws2gtTb/CLiPUFDrj0+8k2pVowLI+/vy4dQ2yZ/fP8akxOeRJpsNzk254xf7BI/R5Rf3qXE60ZJtThhK8LG1oHHLcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okzYmvPA; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okzYmvPA"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6737f134de1so262605d50.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257977; cv=none;
        d=google.com; s=arc-20260327;
        b=oAFp0ekOh0E5AH0y+qyb9T4CDI05qzqDuOtJ02ZQIqdNDkyGCjd1HH2PR9wrREfu0T
         XhI4qoToEOnym024kOMqAa72rQ7Oz5CsXxRZ84ZghU5XOqdgv3Z/0tSsmZdue4VfGJQf
         8nKIx4ilX2nyb1SQYdVrGJAB0VJS1yuiOLEH6r4bbhczfLXj5AqQxyUM49rlKAq2p+6Y
         U67oxjBd8OlCUEaLWohYFipnBREEJexxJqb9FAs9HQxcv7/9yYJAkPGzyt1cuQ5MD2MS
         +nWetjTEAmHA0VJNNjBzgKdpqdYKZU/tP3CvrDrim0xPMi1cqxRfqMzcAgvRkH7DcPf7
         5KoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nWToiZ/0mvm/+JbzSK7npOR4gXzr5F7+OnypdaZRifc=;
        fh=gXNOSfBwJTCT0d++igKEFUqq5O2WrXL06Wxt7xnY3F4=;
        b=cGKOeaSEHYHd/WV0aPWNB1Rbb47ORToovqPBHIHrJ63IGklg2wM1LSvlkRPP7nS9P4
         6psbf4GsduZR4EVf2ysSxgN+73UCNWUk2FkWfguFrMvJUV+l7xQHQWTil6sLyqc9WXG9
         6D8jhxKoq6bBpX2K5JnMt6cx+bMnJQ7toDdrRse33cX4hxX/eSB7HcqUsN+WVMUIRcvy
         YNxG2bWjtopTF2fPzAu5q4+HshQ7BdPuFOYrV2gXMg5WT0mudL4UE5h6FHZ8KbC/VCkg
         DJK0S3hxuQTu4fuxmIZjyjtnBQpf86zSIeL8hhJdZN7boJNGFo/NbbR09ZsIgvh7XcBJ
         QEWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257977; x=1790862777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWToiZ/0mvm/+JbzSK7npOR4gXzr5F7+OnypdaZRifc=;
        b=okzYmvPAdFwte5RiXCjZPKI3wRK7XZ1K/axg1eTutifrX6fBR3oMBUqDvU8Die3E2C
         uc/dZv9pYWcz4Qcw1kDs1koxSQHhU5YCCMailImMaciVKjn1vGYh1ebbEcuFfrUfwEt+
         GLDwsOnMQWugbQqOk5B/o6wcRNflh4xaSlC86VzLycBdUEcixERGE4NW0+u4zODoebsg
         s/wAsoDSzLXvbbI/B48tsKZAnXFuhu4QLu1ubcAImBHL2XaS+ElbcyGPLaHsoTj8sENh
         bRjrF+ymlIIhACBSUBAUoaX7OHqy7ud03MGTrOQkJpy/g+lAqMT1+7VpgV3j0i+gDwZI
         dbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257977; x=1790862777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWToiZ/0mvm/+JbzSK7npOR4gXzr5F7+OnypdaZRifc=;
        b=qrlNb3Glf2Fm5E/nLvvENNJnJqlH8bKOXUg+imq1Niq5CT/LQFbocgLUfbD1+L9jyq
         ZYt0NWB70JEpxeVMYELtWqa+V5kt0em881yEL59Xfh901yYc1GUinwuLoEIg7OzGFfJi
         go4U0+BMo+RAJmdPLuxvWMBmG11mwZDLnIP1/x27TJgPcFoKp86MdjVaqy/oD67IzzDJ
         P7loiI1NMNItek6hmwfbsOKRxsyN3h40mVf03NxZJPRvOQJoeMrpn7E8Css7pQNGsons
         /pS3VMMdLCeTpIYQNdDxwlOOTyFpWjNP0bdXiOZIGJDOWjw5krm95/jitsmPEQVuJ8JW
         wlng==
X-Forwarded-Encrypted: i=1; AKwUvBwWIqD/ei4+eggSK9BdFahy0NE5gTv++Bw/bUinwA9tlCx1LADHQnutILRTDEdhv+IoMeO4lkqX/3vYaA==@vger.kernel.org
X-Gm-Message-State: AFuF++k9g9Wi9y+Skl+DXMFElqUvPX6akViMB1sRTpLIawmtptfHpB74
	FCX54pKtARkxvnKl57NLf8CWCp7op1vrop2WpON5w9feyFGvpPPDnhw0MbZALTUYM/koBNtDIM0
	1Cbr+/oTAiVNkZAizj/zvfVG9INm9frM=
X-Gm-Gg: AYBFou37WqDxMB2Ebz+XeIqA0S/ip674xfQGrAsffkrv7Q9aUGXVILDm0ahtM5VrUGl
	nudf6xm866YOigpJpN+MGB4lTnK7zJNXaNcn9zZHIvqRLbLVl/h+YTIMzBuid/dYTAQNqYmHVlw
	90ivEr2vd7j1QFRgs4x3iLyWFqm/UFHFjz/RZRwdETJWrTSlx0FManuhxlESwz2nqaoz980BPAm
	2+71MBjyqKGWjX6FC3P0/Aa9+bPSLuY1xWmQXyhMVyHtzJuGFoubeCD/KHTb9U9LXb7d9o14b4a
	BHXMWBCTAdlvrj2Y4b9ruk0gk2aM7uC+2Wz9lKN5D4DDPYxmJK17/vFTOQ+++torC2fR
X-Received: by 2002:a05:690e:1186:b0:672:9f72:7c04 with SMTP id
 956f58d0204a3-672ed4db57cmr1036006d50.102.1790257977028; Thu, 24 Sep 2026
 06:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921081542.210151-1-lgs201920130244@gmail.com> <c03262f2-419d-45c8-9b29-f3bfe6680744@kernel.org>
In-Reply-To: <c03262f2-419d-45c8-9b29-f3bfe6680744@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 21:52:47 +0800
X-Gm-Features: AclHuK_HbB37PieMjxtn1FtalUB9H4Cp6DfldwgllWBkEcccv9StBhgni5Up5C4
Message-ID: <CANUHTR8xJ9DGMyadCuhGo1Hw30+VSn0Ko4O3uyR=ofC4OfW2+g@mail.gmail.com>
Subject: Re: [PATCH] media: rtl28xxu: fix SDR platform device leak
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

On Wed, 23 Sept 2026 at 16:49, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> On 21/09/2026 10:15, Guangshuo Li wrote:
> > rtl2832u_tuner_attach() registers an rtl2832_sdr platform device, but
> > if registration succeeds without a bound driver, it breaks out without
> > unregistering the device.
> >
> > dev->platform_device_sdr is assigned only after a driver is bound, so
> > rtl28xxu_tuner_detach() cannot unregister the unbound device later.
> > This leaves the registered platform device and its associated resources
> > allocated.
> >
> > Split the registration failure and driver binding checks. Unregister
> > the successfully registered platform device when no driver is bound
> > before leaving the switch.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: a2f7f220df5e ("[media] rtl28xxu: switch SDR module to platform driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > index 487c6ab784ab..3603d0cf638b 100644
> > --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > @@ -1391,8 +1391,12 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
> >                                                    "rtl2832_sdr",
> >                                                    PLATFORM_DEVID_AUTO,
> >                                                    &pdata, sizeof(pdata));
> > -             if (IS_ERR(pdev) || pdev->dev.driver == NULL)
> > +             if (IS_ERR(pdev))
> >                       break;
> > +             if (!pdev->dev.driver) {
> > +                     platform_device_unregister(pdev);
> > +                     break;
> > +             }
>
> Looking at other drivers, I think this is incomplete.
>
> drivers/media/usb/dvb-usb-v2/zd1301.c, line 142, does it correct. Note the
> try_module_get() call that is missing in rtl28xxu.c.
>
> Regards,
>
>         Hans
>
> >               dev->platform_device_sdr = pdev;
> >               break;
> >       default:
>

Thanks for pointing that out. I'll follow the zd1301.c pattern, add the
missing try_module_get()/module_put() pair, and include it in v2.

Thanks,
Guangshuo
