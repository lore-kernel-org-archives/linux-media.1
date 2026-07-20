Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBCE3A0B36
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784588614; cv=pass; b=BDrx4UmOS+BY/drwcr8C065I543ZFVgqqhhw76gJtYLFmH0xgSX+c+hYVYZW6sgjRQ/g+807FMBlKA4KaNDzo9i1hJq3VKJD2pBGOlViXZ7BaKYz/2zms9z93UeBc46KCJwkxqpQR5L+hNnsnIOQFicv5hYzelZmRjr20P7MUv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784588614; c=relaxed/simple;
	bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BixHApf0OfVa1gWuohMlS64HEUnpJQW0V7dZZlnvfYgGBiHxS6Q/7W5pRF44Gx1PPdpfgHfY/oFsgl3YXGI9s31lqAsUs0vTgw+C9L/2zwxtNSvk/hitumv5dBtzGkLjS2Ic8TVs6UId5YTc0ndG6Dg5XxxASEhHlIeuVu/roR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsC3NyNA; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsC3NyNA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cace91f112so109010995ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784588612; cv=none;
        d=google.com; s=arc-20260327;
        b=SANKIFNSevPAPjEFaZZvrh0iGb8aJUeQuJ0Aqq0KIwD+U/OFTxtMU22SEz+fQbmPKF
         pZtX7XJVC1ulAk+Wl5xVXf1mywMfyXdSe9OWSk0o9JuePkO8DfLUiO7OqsgZqxV3q+aj
         TnY9FCTELRwsUD7vQ44fXFh5sTlzDjJZLEtxiePs5m4fndZsDUNupyke+9O0DryAfb/E
         g58bG1gLGYULa7uSuy5ZHw9iqm6udo2onzeKoAfqdp0Eetbelbc/v8jm/KfdqR6cpD3G
         2j25/+OGkRGfHmS2C/2PKNs9dgUcZywgvIgPjiKoz3ENYNkJcmJrNM/yg7Cy8Ye5uhK/
         1DcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
        fh=JgYHGPTK89+hITOpFlbZ5HXj/TgOEXK4lbhwRGqpu/Y=;
        b=myrznukqQf6yxfB3i3Xy92aFNWwWECR5iUU9HC2C4e/Y43lzNcDFNWNWHNG6pBhpM1
         iMGaMk2pi3uEW/yFzQuJK3Dur+2AhT/vFIzF50ajANCkocrk9qxkLr3DEQlF3AnEAA1F
         8nJNsqisfneqCRhvEfHxdLcerU24Nwd61Y9VPjuIpm4FfFT5w5aG6t/oNUEn9659AMTc
         0ru6zInsp+GajZSnnQpjhbPKkCW09bUUQBWj0JAtaQQ3pTNusghWRbsWPAd86dwv9vG6
         go8uM4mSj48wnCbP37FOUdYQ85ZWLfmZqwduAI11ILcZ6UmHWGuCd8sTDQxahgxi3t/c
         YlTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784588612; x=1785193412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
        b=RsC3NyNAHrkenrVe05H8Uu5vAYPn3T1PeWL0ZmAMTDUxUtwnvYHQwF3bm+Q7GyC2X9
         iuUCbyOdujLdIs3/sAv8MwtaEUbkCiysW0tD+0GfrX8C376Ln1Pbf/tRnRc80qvhDZhp
         3CN+LHIVPJuKQOKtSBMy8Eim/9K9zSu8r+QNVjCTHBp6rhkeGdwK72MvMnFdR1izf1zy
         PgVwGPLgc8H2XuXcsV9zCZ2NhQWdSfsj+CKPXeeVHOOcTS5QO4hYZLLm16cPFz3g/hL1
         w54Ew8w2uKZEMe0lmaywWr8wwNY9Sn/unLzQRPMUL+6cf3efXB30n+8ozg3kKsiVjYbr
         55/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784588612; x=1785193412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/QoAzNpPqwsgChVn6HgPILBImCZOUX2loQhJ39piSI=;
        b=F2GUzrZa48zZdCWba4l+hzn7U29HXJzcdDd8p9/PB2lhJsM8PNIoDmswTCV82w+qYR
         tQIRqaUsgqx41CA3EKoa9LCKP3YzWRwqg/vi7dTaAMXdeqnSzn4JTO9PsBUHK9h14T5c
         +YeA1m5Q6Npsg1CiPYUihOvDOK1b2wKf3Ua4csibuJreqVdnQ6I8VhCeydoIe5+JEqZD
         OzNcke3dO4D9gOELoBT4ZGdm6Bb7EqXz5LL7mtiCHIpTapKMJcBDcIDj+ksexm6LVXQy
         7dYLkL40Jw6wY58GR7nzgRpc6MY+it/VEZyxSry5JSP3p/dnaru4Y1kICnwzHcSu2mAb
         778A==
X-Forwarded-Encrypted: i=1; AHgh+RorH+g/6FV3SwLaO7lxMpvdvVt1eQkiQYmrqQ92qfTw+WGXHAMBcllVGKt4BzkqyU08e6IrGo3RknPHWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/200qot06aKHLzaet1DLMOwm+aWoW+kdP9y5ZY8AJIeEKNoY7
	moX1kEA+nt0pLBuOEr+B9PgUWPi6sTP5/NAtUyk6oiX9WJZFDX5i2Oedh0JayCnvurTJU1sprh6
	htuflmn09+tkNPM7hWJmHkRvM7KaRklbMwerbbwg=
X-Gm-Gg: AfdE7cnnoAJ9PbG0tMsylyZ+JEJYPKTlO4O/D2kJbZoa2G25uIiqKZnZets87Culurf
	Em7pB9gMqvDtjAMq7CZVrUt4NU+YrzVpbrVJQ6HjuQsUmvZwGa19vc72IuzDFD6hQMXL8Bq48Vd
	ls2AmakL74BDJvzRYC6H6bcCMTOOKXwX607EHqApiWT1FXfQVxFWfX/sQOOkAHIbFllioqDDkIk
	lmD2FGhlW+LtLeEf0UZdXQ7NWiY3ycV/0oE8xRp1OwZrvUdNV9o+XkbS2VJxgQZY4P/EVrMRVCz
	SaZNoz2lpThNVXov
X-Received: by 2002:a05:6a20:ae2f:b0:3bf:b68f:4685 with SMTP id
 adf61e73a8af0-3c3ad7aa9efmr17821565637.23.1784588612247; Mon, 20 Jul 2026
 16:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org> <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org> <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org> <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com> <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
In-Reply-To: <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 03:03:19 +0400
X-Gm-Features: AUfX_myYObGduWyCHGIV6FVQ5MLiv0fXdxRQPEPq6L49a_kPbVxwLSt1w92yVic
Message-ID: <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, linux-media@vger.kernel.org, 
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That fits the data here well. Downstream yupik-vidc describes four
context banks for the video core:

non_secure_cb: iommus =3D <&apps_smmu 0x2180 0x0020>;
secure_bitstream_cb: iommus =3D <&apps_smmu 0x2181 0x0004>; (secure)
secure_pixel_cb: iommus =3D <&apps_smmu 0x2183 0x0000>; (secure)
secure_non_pixel_cb: iommus =3D <&apps_smmu 0x2184 0x0020>; (secure)

Mainline programs only the non-secure one (0x2180/0x20, which matches
what's in kodiak.dtsi). The three secure banks are TZ-managed downstream
and mainline never asks TZ to set them up =E2=80=94 there's simply no call =
for
it. If the encode engine emits transactions on those secure SIDs
regardless of session type (in line with the SID-selection-by-IOVA-window
behavior Vikash described for iris), an unconfigured secure SID on this
vendor TZ would explain the silent PSHOLD precisely =E2=80=94 and why decod=
e,
which stays on the non-secure SID, works fine.

For the record, the one TZ call mainline does make =E2=80=94
qcom_scm_mem_protect_video_var() =E2=80=94 returns 0 on this device (verifi=
ed
with instrumentation), so the CP ranges themselves are programmed
successfully; the secure CBs are just never requested.

Could you point me to the QCM2290 discussion/fix? I'm curious whether it
was worked around (and how, e.g. an additional scm call to configure the
secure banks), or whether it ended up as a hard limitation of that TZ.

---
Del'aRun

=D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 02:01, Dmi=
try Baryshkov
<dmitry.baryshkov@oss.qualcomm.com>:
>
> On Tue, Jul 21, 2026 at 01:48:17AM +0400, Kirill Ermolitskiy wrote:
> > Re-verified with iris (CONFIG_VIDEO_QCOM_IRIS, venus disabled; ffmpeg
> > confirms 'iris_driver' on card 'Iris Encoder'), this time with all
> > current fixes in place =E2=80=94 the IOVA reservations and video_cc_xo_=
clk apply
> > regardless of driver since they live in DT/videocc. Identical result:
> > silent PSHOLD reset at the first encode frame.
> >
> > So that's now confirmed twice across both drivers, with and without the
> > accumulated fixes. Decode works fine on both; only encode execution is
> > fatal. Ready to test whatever you'd like to try next once you've had a
> > go on 8250.
>
> This sounds like the issue which was hit on the QCM2290 because of the
> lack of secure context support...
>
> --
> With best wishes
> Dmitry
