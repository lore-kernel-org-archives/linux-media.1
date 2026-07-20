Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4EB4314A3
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584113; cv=pass; b=iAbjjx5aX21yg7bOm1pyi18rKqNH95Rj3ONsZoV7g4L1Xcxbdk7HYn38+bRAt5LVWXEoVN4IAAMSE8xVlFJaJ2cUX/CCtWIlz0gaWcCy+iMlWYkcqE9qX+aYbruoPAuR1j8Dtx+umtTGOXW2PWmbzgnLudqwe/LnGVbnhAnYhEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584113; c=relaxed/simple;
	bh=IuyC+RBdxjQutCteBHbmnDWmH1b9acslBBlJICc0Uk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nn79IWbs8YlKKZEFgrb+HdGNhWkB9P7uNxR5EE6xMLqec5143s0W0M4BsyHoGSiPnmXwDVteCCPzq8SGFyziGu+EMuRl9m1AMuDu6xpVUxAP1M/FqG0D0xa20sq1aLcv+g1XHOLb2JOlm2T+9uqbxidjMQU6D38h3S0c2vYXgv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTxm0Ax9; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTxm0Ax9"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso6963146a12.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584109; cv=none;
        d=google.com; s=arc-20260327;
        b=Oq4adgquMOboBaSjaDM1812YCEhDtY4Ph3eQx+t+igeSx32+TVKiHhUwD/UMrDCYp+
         5tK6w9U1v2HAkY1fJqzY+Lv4mJQ0Nrb4FIXyLUpVONeGiECXwGYzCKmu1tm9CHb1prFX
         8yFC9XEOTE2jSrkycRMviE23izeW5anem5vaEFPg6l9hPXtU9suUHrbSvd3Em+aJFfLe
         UhmMFMGCxnoIX1gxK1UWvid6UPjrXxCX39leT2PFL9y1dLXF8r/MLi7qPMQasjXL72gD
         XXQc0HL3r5DGvzJi0liBzWdxubk2KX72sK/7WdIUXmKKxQMl5K81KbSNOzBm6ot9kfpW
         h12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IuyC+RBdxjQutCteBHbmnDWmH1b9acslBBlJICc0Uk8=;
        fh=HurTwBHtPIEYuqFqEc5CoVCwfzWqTsgIqB4GbI1Syzo=;
        b=iL177vnICnI4jJnA3dum6xvAhCm1gc8SyPGJJ22eMe3m12qbE4hm/HRxudioAEXnOz
         uVoPemZpNcWcDeSMtYoMicfDnmm2gYFb9WwdNZkItpizDtOj9LM/2QVy8wWQVXYGdpZo
         p+mqXQafhk/Gl2EeC6fGFGNkEeRKLgeXC0RcNv8kv0T1MByLaXs6fdLaPKDGIX1gKCo7
         cazDuaG83PnG8iofsSezgSwvW/iYn77kWkEcOE3XFh9VTRhot1rQD1l27crD1H63Yc6I
         RmdhIIdp+Gat4aVioy+FQXhE/2UUIM1lY9oRf4MdzDLIonifUe+e1p8HL55mjQMr1CD0
         dF5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784584109; x=1785188909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IuyC+RBdxjQutCteBHbmnDWmH1b9acslBBlJICc0Uk8=;
        b=JTxm0Ax9gd++T9zta1apSQa3TF2C5iVWo36gNI7cbTjI3uTYnvpctI5t2bGc7kFbqj
         I2fULYheXUwVcYy7NG7OJKZIBt/7MpR/UqW8YPUhyqMWmN1b4z6AvgjmTzvswi9yHSZy
         lJVxdUpoeDJ/Kewq8ulOb0E/3Nkczpsc33QrBW4x96BPAIW+BYotWlDDmfRMohaTmMUr
         rB8dAvspix+HUSn7+Un54H+1RmQp14jUrtpiDm7Uz+M5vbrJplzOrB9KQRq8YjUb2cgN
         xDmrh4m254Szd2L36OOxNIFiIaRocWsyJhM/I76s7DT9RlLMvR3mO2WdCzhLzWAx6LSe
         x10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584109; x=1785188909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuyC+RBdxjQutCteBHbmnDWmH1b9acslBBlJICc0Uk8=;
        b=m4SRpMuz01EDRZqoNDNouqMiTOXfq2s13OtR1Od/aDawbrNfEPn/r3NKXe9UUXSfcp
         8knZConyUV4XBShwZekyeKIFg5LE4oG/vGgnXuwOui5DXbyHzLQyB3I5Jxtwdq00vZWN
         RiwLpjmpdlwVXFht7q2vQ/rlDhkNjruaMnzO9+qpmlIIQUIcrKmoBNwp9XwB2QRowscj
         trTpFW6lzRIDGlMJQBo1rseCz260TVlM5vDyy2rFizj/EQs4R3d0uuaCAAk3xf+ZDk4h
         z+wc4bv6K1qh27lE4O/wiV70aux2ap3N1h61OORpXxaFwcmBMtHYNppXjgsISrkIQQo+
         D93A==
X-Gm-Message-State: AOJu0YxYihOxm7Q6NRCCG60EariKZue/OeWw9j3VUknYEwfCc4RU8dEt
	dDg5H5bwEoMUVkBuWjJjOUqnLjZmFqvDneUC5W1/gI6bMZxeBQgyjQFSgei/K5yRbNs2djhkdM8
	FIqRvmXoD7l5R/iYRw7S8aY+uI+66i7U=
X-Gm-Gg: AfdE7cmW+7oRyxBGS05gMAq+ECbYXo8UeBHV8hU0lavD0ZLSZUgrUb78S7yAW3CF5Cb
	ohDs+xPxoQ8l07Xfy+F77OAcMURbk3YR44QF/YGfn+Q9iVL57Qri7YwdsJSbdZF00RLdf2Bkw1v
	2RyVC5V2DANyl68fBR8CpmBr5vJTmSEpGxyFFvimz2QUoAycMvhtQstq4qw40v9B+vlz+hCQUwf
	TjQlLCIkoQ0jjeY9pLafGjUzNwzyinI23syN0MFOkLNVBBR7q8s99t0lvAmYJanqLFqWTCbHGxk
	ctTYekThw1SDnSF9Mymj5dn+aGw=
X-Received: by 2002:a05:6a20:7487:b0:3bf:6c05:ab with SMTP id
 adf61e73a8af0-3c3ad9d632bmr16959486637.58.1784584108970; Mon, 20 Jul 2026
 14:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MOR1FYP_9xkM8GfpziB5D4Q3H5XLHq6MowZkeFMhI_49wkvgOVxXHbtJYMHHnToR_DOz2HU3N102cMMRPNWfLA==@protonmail.internalid>
 <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org> <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org> <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org> <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
In-Reply-To: <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 01:48:17 +0400
X-Gm-Features: AUfX_my75XCe1q14f7Agj6T56DY2iKCfkWy8D1s3N1aJjUn6DfedU23YZwDWTY4
Message-ID: <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Re-verified with iris (CONFIG_VIDEO_QCOM_IRIS, venus disabled; ffmpeg
confirms 'iris_driver' on card 'Iris Encoder'), this time with all
current fixes in place =E2=80=94 the IOVA reservations and video_cc_xo_clk =
apply
regardless of driver since they live in DT/videocc. Identical result:
silent PSHOLD reset at the first encode frame.

So that's now confirmed twice across both drivers, with and without the
accumulated fixes. Decode works fine on both; only encode execution is
fatal. Ready to test whatever you'd like to try next once you've had a
go on 8250.

---
Del'aRun

=D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 01:38, Kir=
ill Ermolitskiy <00vopoj00@gmail.com>:
>
> Primary testing was on venus (CONFIG_VIDEO_QCOM_VENUS, confirmed via the
> device's driver symlink). I did test iris once earlier =E2=80=94 identica=
l
> silent reset at first encode frame =E2=80=94 but that predates the IOVA
> reservations and the video_cc_xo_clk port, so I'm rebuilding with
> CONFIG_VIDEO_QCOM_IRIS right now to re-verify iris with all current
> fixes in place. Will report back shortly.
>
> ---
> Del'aRun
>
> =D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 01:31, B=
ryan O'Donoghue <bod@kernel.org>:
> >
> > On 20/07/2026 21:41, Kirill Ermolitskiy wrote:
> > > Adapted Daniel's patch to kodiak: added the reserved-memory node with
> > > iommu-addresses covering [0, 0x25800000) for &venus plus a second
> > > memory-region entry. Since downstream yupik's non-secure pool is exac=
tly
> > > 0x25800000-0xe0000000 and venus runs with a 32-bit DMA mask (top-down
> > > allocations land above 0xe0000000), I additionally reserved
> > > [0xe0000000, 4GiB). Both reservations confirmed via the iommu group's
> > > reserved_regions:
> > >
> > > 0x0000000000000000 0x00000000257fffff reserved
> > > 0x00000000e0000000 0x00000000ffffffff reserved
> > >
> > > Encoder still hard-resets identically at the first FTB. So on kodiak =
it
> > > doesn't look like an IOVA-window/SID issue =E2=80=94 or at least not =
only that.
> > >
> > > One more finding from diffing against downstream: mainline's
> > > sm7280_reg_preset zeroes the whole of 0xb0088 (AON region), while
> > > downstream applies it with mask 0x11, preserving the remaining bits. =
On
> > > this device the register holds 0x3 at core boot, so mainline does
> > > clobber a live bit. Preserving it (read-modify-write with downstream'=
s
> > > mask) doesn't change the encoder outcome, but it's probably worth fix=
ing
> > > regardless =E2=80=94 same for video_cc_xo_clk, which downstream marks
> > > CLK_IS_CRITICAL and mainline videocc-sc7280 doesn't register at all
> > > (ported it, confirmed running at 19.2 MHz; no behavioral change eithe=
r).
> > >
> > > That exhausts what I can usefully test blind: DT constants (fw region=
,
> > > SMMU SID, CP ranges, clocks, GDSC offsets =E2=80=94 all match downstr=
eam), power
> > > sequencing (hwmode / forced SW / GDSC always-on / legacy MMCC handsha=
ke /
> > > GDSC wait values), XO clock, max CX votes via required-opps, IOVA
> > > windows, two firmware stacks (old and coherent OS2.0.8.0 TZ+vpu pair)=
,
> > > and both venus and iris =E2=80=94 every variant that actually execute=
s the
> > > encode engine resets the SoC at the first frame, silently, below the
> > > kernel (PSHOLD warm reset). Full two-sided HFI traces of healthy deco=
de
> > > and dying encode sessions available; happy to test patches on hardwar=
e.
> >
> > Eh it's not clear to me if you are running the venus or iris driver.
> > Both are supported - can you flip the switch in your defconfig ?
> >
> > Perhaps you are testing both already - if not please try the other driv=
er.
> >
> > ---
> > bod
