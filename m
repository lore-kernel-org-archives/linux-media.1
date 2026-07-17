Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56532BDC26
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270226; cv=pass; b=TA2rEDbfCnOvu+uRqlI8fiNJ8ZURzOjVvyykP6YJ96P0lOSZIfaM4WK7hSLeVfYBhywzPXzQ0VSsr+jaovqrvwCDS1GW7qYUE2TRTa7H2DD9jL9IOem6qTHA2VZsRPvU3f1N/qL1qjb/65chYIKe240i8ZGo213UJFmooguUgNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270226; c=relaxed/simple;
	bh=FQcK5JUiP/gXgDsJI8Rp9EcrkBL1pDWQ/i2WTxSogpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lugB39+CpzgH8yly6eTYMUMcq5zJFGSviv1LUg1iWFmplK+1MhyGj7TUTjzSWDB7ZYFniN6XRUc6FC27tvWoWvTNHBoS8Sh1aO0zS4l+ydzv2rAkGgZ2CogwYrxPYRdwvqWU44Vdf6TjjI6pKqbksrnwuQyzodW0hlYmc1v2/Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRBcmkdp; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRBcmkdp"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e8c68c0cdso9815407b3.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 23:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784270223; cv=none;
        d=google.com; s=arc-20260327;
        b=iJH3tXPzSVVEeeHvJ12uWH6ussTGO80OvY3bm+gfruU+iY29m/Xhmtie4g/Vh9F8AT
         /NsRqUEpSz0fzhCsSuw9P4wjTIwLXdUatQ1IOBxVHVpnnKNdYQaosmee4gCvUGlY79C6
         rMM/T3BymeXi4MZckf97KZsdE/a8zK6KTNQkkwQeDDWmD0Eic63fNu+bvyGDkUBnoZqc
         lk+Z5Fk52mYeffA2Hnp/SbA0UP/TFpYZ3Z5actM8WNcB2uhTjTQrQ3KHXwb6KDnlUNU/
         oiBHU7HYFU9KD2/PN+e6GGd3R+LD7ohb4tUnUFizDK/5Kn6y4W+q+SL+Q3OYKSu/mNI6
         nU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lqzO3SUkfmfUH/INNl0EQx6vlwhEsJxA+B0h08XZOg=;
        fh=wfP2sejId+oOIX9TOVVBynpZzGMhzfBEnx9DmljWGzA=;
        b=Ox9m2l1X7Yg2DT6+WMSpIjIjO1701/rtRzy+au5CFgDEQ1cl5R6PN56919JkkYN4UJ
         IWziO6iTk8pVWK/5/iQUzE8Cxt0w9a6otmzIWQjuiGhqZSIgJC58RapNhgN0jIh4y5hS
         WadxkHUWYxcc9ZhzQGQv+UVqduNxlNf+TaWAeiU999mkR8YtRyUEhgF/SQYoyeaFfqNq
         EWBeulwSFTTINKEg/S37U4yzKWG2t5UHpmTBR1NJ5mXHfexYTAEylzwEdDhOr9vm80a7
         b5cak67kepz12yfHnGXE6YZXUt3Uk5HwyqHrH83HgrLFD1I108zx+sscfy+YE9wz/Zwe
         h9cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270223; x=1784875023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lqzO3SUkfmfUH/INNl0EQx6vlwhEsJxA+B0h08XZOg=;
        b=PRBcmkdp67sBv5/pEIvXidXyFL4xZF9kBIDVRK6tfDRx0LGOQ0W1xOH82kXbVwLuZU
         7elACLDKep4S6yiOa6LpH+Vh05Yq1tIGXLPWmulKFC3CRCRGsY2EfQS+8Dc21bLBq/IT
         7NLGWShl6bJTPx8rhKQjBrUnygNwogm+wzIMcRR3w19EoYxIN6OeRs91KFwpWuu0ySq3
         krd3Dad1iRbEUY9hbTWNdofBUJoRnn056vNOq6tzTFSXuKm5MNdmhoqBul7uhUoqd8Wy
         JeIueL5w+1aGR8YmrJkPC6hAB3HhhemI+BNUsiLau5fturTngvbYg8/gYWQt50WIvf3R
         bmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270223; x=1784875023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lqzO3SUkfmfUH/INNl0EQx6vlwhEsJxA+B0h08XZOg=;
        b=ZtMDYdzsB0dHtbXA1SID8f76K1U26dJwlabrRcmixz6Tt50PG3Lz63SvnxNBmjMtXS
         tsjeZdAgCkUNi3Yms9SfZLHuABPEMd+5uJ2D8Q7T6H4OMkdlqQrpZuXanVEjZ0nI1FI0
         a6b+mpllvNrwuzVtW/O2vNTtIDGfxWxHHLMcVWIvGdeIxZVSMGNKDMqXw1vf8kYEZDDo
         JsOx2dOJQMg3UXTGUAgfJu+G1bRrGp7eB7DqXwPMkT4/tOK5vDokh6PNM/EiYe6t3Ufi
         9ug36dne8hOimZkeMipWMjqFNIHsj+Ocgg5q6bV2KnuVEjbqnLC0zAFq/0iHj9MsMDW1
         r9Hw==
X-Forwarded-Encrypted: i=1; AHgh+RozT29WoOqF/dBQ9B7O9gjeUHdaajMrQgwxiluCjCajRgai2yOt69Mn3c/u3vtZlBhsALziG6y7l/4Csw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ApN02Iebqcc/ElxiMubobNph738flI4vdy8nT7BcWxcbWvJB
	SoMHvJLAZWIIaa9X/M1L9D5yh3bakA3azt26jsak6UqJFAAUKWVjqYTCgRn+i2SWYpeJhrkrFV5
	ajfWo6wZmqexcDsF057glUmrtPo52RHw=
X-Gm-Gg: AfdE7cmYlE7uighIx0XR6jHgHY5f28f8/TM9SZ6LXiOhr5Rhw+mNQpTXsWxzPCPQP2z
	39/lw0SkgAbW0uMYd575aCTsRCAUHRNYLmJZewh8r8ErwnLbAAg+UR/xWGWoeV+NYqddmlpd0p3
	JGSC7YGG6gWDYG3NOtl+5JtsNRwuHN8IIhFT5Y0VWp4o+P8rvAQXYChB8UfxRlUIsNWxrxGDuqq
	dEuMCWgUfY78gtjfAESeY8WJcFgvprNOLP4ma0nhq3D0G47kT3IHwHKWRsd6HNA5xyNYU2vPq4M
	XsOlAt/tJJ0Jv92xYT6nhQw2s0tXFw==
X-Received: by 2002:a05:690e:448a:b0:664:bb15:ca76 with SMTP id
 956f58d0204a3-6683bd56f54mr268674d50.5.1784270223565; Thu, 16 Jul 2026
 23:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715200834.8486-1-royalnet026@gmail.com> <20260715200834.8486-3-royalnet026@gmail.com>
 <3b5092d0-f132-4335-a3a2-b7f9de55d8e9@collabora.com>
In-Reply-To: <3b5092d0-f132-4335-a3a2-b7f9de55d8e9@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Fri, 17 Jul 2026 08:36:51 +0200
X-Gm-Features: AUfX_mybSprLSrIZJBIZmysGtwxzPOlgLX5e-x5hgjboIL5B6eY2-4dKT3CXgYI
Message-ID: <CAEWPSH7xi5tPT4DWZZchJ+bt9jNZ36VMkhoAvmeYMZfhRoen7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

> Audio capture should be stopped when the codec removed and
> hdmirx_audio_shutdown() stops the audio_work. The v1 was good here,
> Sashiko bot should be wrong.

You're right -- the worker is only armed while a capture stream is
active (from hw_params()), and hdmirx_audio_shutdown() already stops
it with cancel_delayed_work_sync() when the stream closes. The extra
flag clear and final cancel in remove() were redundant, so I'll
restore the v1 teardown in v3.

> I'd like to see rest of the patches (I2S and etc) to test this patch
> before giving ack.

The enablement I test with on the Orange Pi 5 Plus is small: enable
i2s7_8ch (the RX-only I2S interface dedicated to HDMI RX) and add a
simple-audio-card that links it to the HDMI RX codec DAI 0, with the
codec as bitclock/frame master. I originally planned to send the dts
part separately through the rockchip tree, but for testing it belongs
with the series -- I'll include it in v3.

If Rock 5B is more convenient for you to test on, the same two
additions apply there; I can add that variant as well, compile-tested
only since I don't have the board.
v3 will then contain: the remove() revert, the ACR local renames plus
a byte-packing comment and the get_dai_id stub removal (both from the
bot's v2 review, already discussed in that subthread), and the dts
enablement.

Thanks for taking the time to test!

Igor

On Fri, Jul 17, 2026 at 1:08=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> 15.07.2026 23:08, Igor Paunovic =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > @@ -2788,6 +3058,16 @@ static void hdmirx_remove(struct platform_device=
 *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> >
> > +     /*
> > +      * Clear the streaming flag first so a running worker cannot re-a=
rm
> > +      * itself, then tear down the codec (which stops any active strea=
m)
> > +      * before the final cancel.
> > +      */
> > +     WRITE_ONCE(hdmirx_dev->audio_streaming, false);
> > +     if (hdmirx_dev->audio_pdev)
> > +             platform_device_unregister(hdmirx_dev->audio_pdev);
> > +     cancel_delayed_work_sync(&hdmirx_dev->audio_work);
> > +
>
> Audio capture should be stopped when the codec removed and
> hdmirx_audio_shutdown() stops the audio_work. The v1 was good here,
> Sashiko bot should be wrong.
>
> I'd like to see rest of the patches (I2S and etc) to test this patch
> before giving ack.
>
> --
> Best regards,
> Dmitry
