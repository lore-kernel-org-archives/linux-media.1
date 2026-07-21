Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7C3BAD91
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623093; cv=pass; b=g/DYT06SVf3/iBskJVHtb2PLATeAiL9SSnMH5vcqDi4nGTX4K16Cg7hLq4ZYYPf2AJOY/1OFtc/JMUPzv+VPdZgnM4qA0IBBNDBTk6urR4yZOnlONoAFKzmvl9puMDVxDU2Pj3Pcvqjqlj1um5qiIHfUg/zRdHng+t+AwgLOtp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623093; c=relaxed/simple;
	bh=MMybzp2c0K49ZvW0DHjoxV2CbeyNCQKBnPmK6XXWWJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbzw5pIqxNeWwyMmf34A2nP6AthoNeHzjGUPMl4lEiZCMoZJktCGRyts35dXJWVKsD1ZsHpE50mVW24OxeWldMjv2UieUJheadjnK5ppD4WkpJMOYzfWCe4E6BXNt/g67OXlVKfPkv5UgQz/qCVghI1zr8ShinJO/1R/ta6V4qU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgwxERdd; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgwxERdd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cae1a3a744so83288685ad.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784623091; cv=none;
        d=google.com; s=arc-20260327;
        b=XtpUwhalxweuUFonb3ZdzIFp469BFf1y9tSP4Ngl3CGKkB6P9vLK1YoE5wjSKbMDLC
         Kj46beHnCYi0XDlK4JDo4LwNFFDa2+qCb5nsSv7H8TYonSq9DW2m9+FgQAovas7e8APV
         Qy0URJpvCXZLMr5TWHQ2ZwrnDQlu6O5sdAdB1JNXuVmQRJjmca1fwMd6ySNT5uKv/y8B
         9VF511+0nR4iH7/OD4XCN9WU765gQPYWZhRovrpo5O9zTBZDxFeXK8dbcs7wKOISFD0b
         LUzudishRmiW88l0Dgt9dxJlpPW7VSBd+7kOTYb4N3VVZ1qeqNKAJbtBlqEyAOd4Jwvv
         H3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MMybzp2c0K49ZvW0DHjoxV2CbeyNCQKBnPmK6XXWWJ8=;
        fh=VyFizr5tKBUP99jQgOzxQP2KGDsI6ZCAFTzkqip230w=;
        b=fTk9rV+i2es6bkauMgb+3UPEEZ5bgdKUeVO35gLep/0mRko31FFBhiurUyWRATXA1o
         eZNAjO3xYv9CTAKUimdJHpJplsFOv3xjZLobnjUhrDOI9S71sR9OoSs6fln81P754jgg
         l8ylsRIOVkCUD9A4zewcI2MtAxakMLPi8n+f//SsT6g+AB7QfIspOQxE8oXZEr63aji4
         RnFBedsjdo44aHurPZ7Hf82Tq2SSUmYBj8Vszhpk8CRw6r1+mCe+iFaN34f7crmd13JP
         KtBywIglImEsoRkGhAVVaQ5PfRvLdSIDClCPM2c5QP7oQshZbtG8RU5DFMS4Y8QHfrUt
         /21w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784623091; x=1785227891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMybzp2c0K49ZvW0DHjoxV2CbeyNCQKBnPmK6XXWWJ8=;
        b=lgwxERddAY/sytk6Tl84EXuYwkZtg3rCXoG0UCDZx8gGRJFRTQpYz3MlxRXVD8qjsC
         HRtb2EiTDiOT27yTz5FZ5MmP+0CggxsNxITaWA1bA1TnTOj7i9lGKKeIahCLQjAMytfo
         MoLCWb28r7lR2A4MXIsD1qvJ1GqIEY2Jssx06VSscCWZpUAY607rtDxu0iYtrG45BZhI
         ezqPdcRljr1jYT2V6mzGqHMo3Waf/BjBJyRZ9jEYbyJ6azzWnv2t2DiiZk9/UiGKtYXA
         SXG+Bu+AlS/4ABi/CQxEM8eT3FP1fsO2evM6Zzo8ATj3SMDZZ5JHuEKc8O5nLy3tM830
         kDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623091; x=1785227891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMybzp2c0K49ZvW0DHjoxV2CbeyNCQKBnPmK6XXWWJ8=;
        b=QgZIhFJGNaTzmNqr+QP7ReBBLhxUurq0OF52urRLo0qHya7YyxlBP3BfYqpssd5fv+
         50hFnpvVoQ9dJPukrPqoLIlfNMr+fkNtohhzqfbLpkz3dh1IvP++YPNIFL3Z8SruF2Wr
         9fpbEDB3jz7gPhhWS32MLTNTK10k9FjV/mJB9X7xuwK69aBpbdmjilmAbx9jL2i43L78
         n2pXDyfqCdv0i6HEoW8+gbE5/pRWFmiXr7TBrdb/EEwIO75kp3Z9qfyVD7UNs8tvWt1A
         Ae7/zBln3KTc49NIhhmXfmJLq9vWvUf5ciPzXTPyyfaXvn7/EBnRGgBTrYeRNTfpBt8M
         9B8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrrga3uPmBoVEsHFcMT0nxbxHff0v+1nZ6CPJJa6DkFGpNZEeJsR6mziWY8VyLR6/hVfR3J1p4Iqg0Mng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kqnRgImahbylYrzEHVjuaZ6/HLSua7cEwL1R5hbID6LAVwmh
	hd7XYH7g3T3fEJjva9C+n21KKR6Blgs3FG9wqnkhY45c2QyT2UEgX7CzYKfUTe0/QGNpEzjYUhW
	dOQmLTOryUzsdTWOecaCIwBW8aGPB8To=
X-Gm-Gg: AfdE7clCC1PtglcmOonTwVVfNDRtlNSW9JJXxR1rSKbSdBtMzFmNhLSPH3TJqV7jGzL
	ZfQh+yYrTE6gX9qkkhJbucMEKxtIqbimGbNxYbaqCZ8VRsB0Ze2FXBm+4H5ryIOZSWz1v/XGIPl
	2g6C2McsKBAi6PGpijJPuvvMU9t6cPU90ktkD8SwLr+qmD9EEagaCmyWAlEtGtegOdBESDLufzs
	aHE9h5xad5ufIhcGHNyGilGcPAKQfdw95AbH21eKcTCqMxvHWl//dk9S0I/GAgYgLcBCL1OyroP
	DhwmzhvTWDXKuBDx
X-Received: by 2002:a05:6a21:4c0e:b0:3c3:89cf:f43 with SMTP id
 adf61e73a8af0-3c3ad7aa401mr18569946637.30.1784623091277; Tue, 21 Jul 2026
 01:38:11 -0700 (PDT)
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
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
 <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
 <KfMRWO9F2LRou7cILG4EpEiPGm6HffchpxVwhuytmRA7a1-nRz5t_ju9AHD9c7X154S9pZIcxpacRlyoQ3RYcQ==@protonmail.internalid>
 <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com> <db859606-22e0-4556-82d9-21c6a21b376e@kernel.org>
In-Reply-To: <db859606-22e0-4556-82d9-21c6a21b376e@kernel.org>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 12:37:56 +0400
X-Gm-Features: AUfX_mzvxdmLDiWP65LhAHzicQMM9OxO0C9vqUJ6fGNjAcLGEU5kQBTNzcEQUhE
Message-ID: <CADRRrN2C3TX9axrYs+eWyUYtDTZ-R-7ajqgwAatyUp0oevjMSA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-media@vger.kernel.org, 
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Both follow-up experiments done:

(a) Pinned allocations into a narrow window right above 600MB
([0x25800000, 0x30000000)) =E2=80=94 identical reset at first encode frame.
Together with the earlier runs that's three tested positions across the
legal window (bottom, just under 0xe0000000, just under 4GiB), all
fatal, so there's no address fulcrum to be found here.

(b) Mapped the downstream "secure" SIDs (0x2181/0x4, 0x2183/0x0,
0x2184/0x20) into the non-secure context via the iommus property. The
system boots fine and decode works with those SMRs in place =E2=80=94 encod=
e
still resets identically.

So the fatal access doesn't appear to be SMMU-translated DMA at all:
neither buffer placement nor stream mapping changes anything. That
leaves firmware-side access to a TZ-protected resource during encode
execution =E2=80=94 consistent with Dmitry's QCM2290 parallel. Vikash, Diks=
hita:
does the vpu20 firmware lineage require TZ-side secure context/CB setup
for encode on this family, and is there an interface HLOS is expected to
call that mainline doesn't?

---
Del'aRun


=D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 03:23, Bry=
an O'Donoghue <bod@kernel.org>:

>
> On 21/07/2026 00:03, Kirill Ermolitskiy wrote:
> > non_secure_cb: iommus =3D <&apps_smmu 0x2180 0x0020>;
> > secure_bitstream_cb: iommus =3D <&apps_smmu 0x2181 0x0004>; (secure)
> > secure_pixel_cb: iommus =3D <&apps_smmu 0x2183 0x0000>; (secure)
> > secure_non_pixel_cb: iommus =3D <&apps_smmu 0x2184 0x0020>; (secure)
> >
> > Mainline programs only the non-secure one (0x2180/0x20, which matches
> > what's in kodiak.dtsi). The three secure banks are TZ-managed downstrea=
m
> > and mainline never asks TZ to set them up =E2=80=94 there's simply no c=
all for
> > it. If the encode engine emits transactions on those secure SIDs
> > regardless of session type (in line with the SID-selection-by-IOVA-wind=
ow
> > behavior Vikash described for iris), an unconfigured secure SID on this
> > vendor TZ would explain the silent PSHOLD precisely =E2=80=94 and why d=
ecode,
> > which stays on the non-secure SID, works fine.
>
> As I understand the defintion of the IOVA bug, when the IOVA is below a
> 600MB threshold the unexpected SID is generated by the firmware.
>
> It sounds like 600MB isn't the right address fulcrum on this platform.
>
> ---
> bod
