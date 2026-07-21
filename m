Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD5326941
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640103; cv=pass; b=rKtdxXhc0C+yTX38zbKhmnJ4CC7DzOankhU8UwG6OPQIegu305YJQZUMjFAKFP4rWskKqsSQRTx1beThvjFNJ2BLViTcffdjEJT61NV0SsKI/TuAWKc27xUTI/lHWoxLbwlqSl6Qe80gsWakYfH+jd0Au25ubeWqUP9rKc462lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640103; c=relaxed/simple;
	bh=HtXkNs2IreYjxupxcBOchKQlos8G+P+6nmTiX/YCYMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbF+3wlpYGndx3Y0lcTdTNDXly9BVnL5i+uuFnZlmeYs6mawGklS3mcErU28nW0StHkVcDrYAbZWgDsUCdie77gEke7Bn9nmFDDY9mNELOUQByGUYLJ70sufBV8CY9eJJKw4CJcbPJGlo+9uDNLBuekYbllydmIE99WpkUo4DkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9kWf25q; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9kWf25q"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso6521241a12.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784640101; cv=none;
        d=google.com; s=arc-20260327;
        b=csth4ZBiNAGvTW6tfLyrmt4P5onnYWF2gOMMnJIpG8iFEo9mcgGi/ty7e+Xwy1SY+6
         BiTU54Fl0UoQJ+X/2KoXbNwWGEX+DSBi2m/2doxk7Ijdqffn60PQ/gw6uvLiNl1QaW23
         ookomBe7pwFT1LSZbc4283F6d3dPdSYPFZtljmFVLDo+iu0UWp8DuccahJqYeMB3a5Ku
         6bqr13aQVr/O4WD8rFbF4KlkgDqdJuVSL5GNp5NjCZDjOcX9foVXUWn2+BD0hopZTFm7
         2O+9Ql+MirOpDx83nrmRYcTZHZTqeByE4g/MgGyGaNc+8pkDGFwBnpX7xXUkMMu0Fspx
         tSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtXkNs2IreYjxupxcBOchKQlos8G+P+6nmTiX/YCYMM=;
        fh=4ut07GFOmehqTadZKPZVdhHWrka1TnjxTytK4628/YQ=;
        b=H87bjAM58++ekrsixo7SXzBK+ovluxu8iOzFCRR4cB/QqPaigRvSPrvZJrej/XLed5
         rM5BH177EezX0rhbjzrrOASUERNvgihk4mA2K8oNIvTzOoW8qZsoZNOhmVFx/zYcA+kW
         oOjBQBVzoZs3wfN6GyqvOz5Mhk1SLHit4Uzb4kYcAlvkmfC6egYYr9CBvOzrngMi+UmS
         O/27ydH0WbL18tvjKut4WuVzXHFm+zzWlsPhVS916VHEvm/C19f7bnQUEjsV2N7YH0Kd
         7bFnsH62IFDADQLuI7q+VgyfqOfBe4FjW7GZVsvUaAt5RFoquKQo8qcuNDGw0kfNxBRp
         DmRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640101; x=1785244901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtXkNs2IreYjxupxcBOchKQlos8G+P+6nmTiX/YCYMM=;
        b=W9kWf25qfFYkmZuNNfr9WT+SgjbkW7w6TkK7+WXr5g4kVhRkYfoRxzUan+F8Fo+hxr
         /7Cpp+B+ANg+s5W4BH9b5xm0dA6tKVlSbSNUIeUzlnHuWbrTgcPWRDzeY2wo8Yq3iph9
         JfCzSKtLL6oTwfetLxYr7TGHI8kENzA1tJ5lIiQMrEwY63w2OK8py4WeLNF2f1RGlCoT
         /C6BP5WJg9r6MKKZw3oXMN2+WowhE7i/BGbgusw029iWfHPYCR9dxQ/JuKny5EcPfGIL
         CpoldIh3Yr/EIcfRdEISWqqq9Be4tD8c0dUeDG/Y6ssoifan2/svgayg4gGQIHpkdtG3
         Xcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640101; x=1785244901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtXkNs2IreYjxupxcBOchKQlos8G+P+6nmTiX/YCYMM=;
        b=mYRN1hVVT8II1f9T3r8q6npL+4465FsRYLHZZiClk518PJN5exI8TVwf4vc93FDmyL
         mqCLYEx1ItgipUrap2eBoxCwmAS9WXB767V0j0JMqdLtyl2WAcHQo1dbY2rm+69YKNPo
         prE24wzc6k8duSBnmeqUkUF69bYzYtisaqSIsP5Max3KN++0hHRU1eBS5LTmFJQA/yIY
         ckdhechlgN0N8XTrUtvboyYfSqoxCmG58X8Y5AEcyk1NPfK3eL9YfVmH4F228QzWO52V
         k9Pr51PmVxwV2pH+x8QDXwY2eU+ixaM0Hm5wQo3ldweEWLQqnMmPPb2f6mROgzpqGhSd
         odbw==
X-Forwarded-Encrypted: i=1; AHgh+RpvJbSpsPF2WuUWmdU7MEzxhsWAVLi5gnj4SO//DyVHeo5L0iKgMv1grE8Vjfz+Vexo+yjk/XMyMhPVxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5UsgXPkeUhsRHzlj+GCnj+cmIuskgxo4JwrJ3Sgomnfyzoaqw
	T0x1XIPq0yRIY3Fu6lTIQsWwvWxlAq7phO5k9BWByLLAZSfb6z6FLbf0W/v7Vb+vwPoZG5otXC7
	wxlRi0H8w4Wxr/DfFMndkVc0PmAAQWa0=
X-Gm-Gg: AfdE7clCXoaBG4gCHKaWxNMA3qhVQbJf0K1RjIPd894h2c0qoPJscVDlXycBOoZhjII
	hT5i8z8RQ8naj+GsI2GM8BlNXiQL4Zg7Zxf59RSNVbOrq2PEvbp1CmAkIBfXgdxTbeZOakmC60L
	ly0jy7y+hSUQjABXZ57bVHpXYiAd7Y53YXyFujQMioEJo9IFL6mLYlOfcqeIh1OTPYx6wDeA1PF
	c9+2INAFHmU6sDLd62ZtifmjGys5Go+alXLgoqK+Zt0bE9m8aK2q2eYsRNf314Nd+fBJcETUonF
	QW6yRMz7mwoKTmxS
X-Received: by 2002:a05:6300:189:b0:3bf:baed:c797 with SMTP id
 adf61e73a8af0-3c3ad971f91mr19324899637.49.1784640101165; Tue, 21 Jul 2026
 06:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org> <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org> <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
 <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
 <KfMRWO9F2LRou7cILG4EpEiPGm6HffchpxVwhuytmRA7a1-nRz5t_ju9AHD9c7X154S9pZIcxpacRlyoQ3RYcQ==@protonmail.internalid>
 <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com>
 <db859606-22e0-4556-82d9-21c6a21b376e@kernel.org> <CADRRrN2C3TX9axrYs+eWyUYtDTZ-R-7ajqgwAatyUp0oevjMSA@mail.gmail.com>
 <b6c397ca-86f7-4fee-98cd-dafb5158c013@oss.qualcomm.com>
In-Reply-To: <b6c397ca-86f7-4fee-98cd-dafb5158c013@oss.qualcomm.com>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 17:21:26 +0400
X-Gm-Features: AUfX_mxgpoQ0M0U1NW7b4ysL7tsGa-ulQZKw8wq0FIENpdFtHETyQeps0bLZo_s
Message-ID: <CADRRrN3mGy8Ad9PObq7cA=PPqhNyWOHJDT4X9uGXJyd95gb+pg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed =E2=80=94 the unconditional CPU_CS_VCICMD_ARP_OFF write fixes enc=
ode
completely. 176x144 runs at 53x realtime; v4l2-ctl streams a valid
1280x720 (aligned to 736) H.264 bitstream through the encoder; decode
unaffected; sessions restart cleanly; dmesg clean throughout. No more
resets.
Separately, kodiak looks like it also
wants the hamoa-style IOVA reservation in dtsi =E2=80=94 I can send that on=
 its
own.

---
Del'aRun

=D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 15:14, Vik=
ash Garodia <vikash.garodia@oss.qualcomm.com>:
>
> Hello,
>
> On 7/21/2026 2:07 PM, Kirill Ermolitskiy wrote:
> > Both follow-up experiments done:
> >
> > (a) Pinned allocations into a narrow window right above 600MB
> > ([0x25800000, 0x30000000)) =E2=80=94 identical reset at first encode fr=
ame.
> > Together with the earlier runs that's three tested positions across the
> > legal window (bottom, just under 0xe0000000, just under 4GiB), all
> > fatal, so there's no address fulcrum to be found here.
> >
> > (b) Mapped the downstream "secure" SIDs (0x2181/0x4, 0x2183/0x0,
> > 0x2184/0x20) into the non-secure context via the iommus property. The
> > system boots fine and decode works with those SMRs in place =E2=80=94 e=
ncode
> > still resets identically.
> >
> > So the fatal access doesn't appear to be SMMU-translated DMA at all:
> > neither buffer placement nor stream mapping changes anything. That
> > leaves firmware-side access to a TZ-protected resource during encode
> > execution =E2=80=94 consistent with Dmitry's QCM2290 parallel. Vikash, =
Dikshita:
> > does the vpu20 firmware lineage require TZ-side secure context/CB setup
> > for encode on this family, and is there an interface HLOS is expected t=
o
> > call that mainline doesn't?
> >
>
> Could you please try one experiment to write this register
> unconditionally i.e remove the IF(..) condition ?
>
> https://github.com/torvalds/linux/blob/b95f03f04d475aa6719d15a636ddf32222=
d55657/drivers/media/platform/qcom/venus/firmware.c#L205
>
> Regards,
> Vikash
>
> > ---
> > Del'aRun
> >
> >
> > =D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 03:23,=
 Bryan O'Donoghue <bod@kernel.org>:
> >
> >>
> >> On 21/07/2026 00:03, Kirill Ermolitskiy wrote:
> >>> non_secure_cb: iommus =3D <&apps_smmu 0x2180 0x0020>;
> >>> secure_bitstream_cb: iommus =3D <&apps_smmu 0x2181 0x0004>; (secure)
> >>> secure_pixel_cb: iommus =3D <&apps_smmu 0x2183 0x0000>; (secure)
> >>> secure_non_pixel_cb: iommus =3D <&apps_smmu 0x2184 0x0020>; (secure)
> >>>
> >>> Mainline programs only the non-secure one (0x2180/0x20, which matches
> >>> what's in kodiak.dtsi). The three secure banks are TZ-managed downstr=
eam
> >>> and mainline never asks TZ to set them up =E2=80=94 there's simply no=
 call for
> >>> it. If the encode engine emits transactions on those secure SIDs
> >>> regardless of session type (in line with the SID-selection-by-IOVA-wi=
ndow
> >>> behavior Vikash described for iris), an unconfigured secure SID on th=
is
> >>> vendor TZ would explain the silent PSHOLD precisely =E2=80=94 and why=
 decode,
> >>> which stays on the non-secure SID, works fine.
> >>
> >> As I understand the defintion of the IOVA bug, when the IOVA is below =
a
> >> 600MB threshold the unexpected SID is generated by the firmware.
> >>
> >> It sounds like 600MB isn't the right address fulcrum on this platform.
> >>
> >> ---
> >> bod
>
