Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF6248F57
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054108; cv=pass; b=GZKBoCRIt82jFpcUStHPuDSrdtWNPB8UThEGf9QZXnbyBKZAPXHZlfy31UDP+qQ3E96YxdPK5VmD65v5jQ8AK6PXo69zv5FIiZy6k0D9IqPlU1osG3lEvNUknYR6pDbqw+rEMvHcKwt9WGy4zcY75n/UX4Vbhjd3bbW4WtmKLKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054108; c=relaxed/simple;
	bh=UeAssUqYMd9I/hNomjKDWuBothPBNmM7nGphuECKV1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1hCBdohnHPef55KEtTsfHIVsohKHI3er19vs1FeIU9ics7ocwFREip0Cxk3TQ0dSW1rD8Jk9LVZppGkV1YOvcsHfDWpAy4aapkeSUfSLWrQjC7RaJ68i6yLXuZVctQcPi7KgR/YIooSJdaG4z4HDmdUzsng87k80og71KEPEiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qMjegCCc; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qMjegCCc"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0b944f6edso63350125ad.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 18:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781054106; cv=none;
        d=google.com; s=arc-20240605;
        b=KD0matgu26H3raDhSW5/lo5OaPUhPCfaQkIyWf+PyEZYiMytq2yaIwjeg9qtfbzy9m
         V3/T0IqiOMva3tFC8Ct6yral4lZfCacuUYChsY+NaX6ufjsiOzNX1yFkBAVZA5N1WFtk
         8EpdnqoXIBEPJawgHMq/fqyk00PW0b17Hb+cvLtlvZ8/t7bffx3fCtoL/znB74NILBaV
         wZqZb5nAFVUR2iGabwUGUvISLQMF3zzu/LthvGCN+eE/Q9CiBJJQNbfUTirE+Ffs/BIt
         BxkCpMlTaGwY/0H9koUEpObfLYwRs2IKD39Do+GjbHAUkQF1qR37cHY/vzPV5Sff7ahS
         8voQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        fh=gOZ1ARDaOSBi7RoD0IFdpG6jSzKc99mPkqD+r1ND6mI=;
        b=WLxgJ2+YuUwbK01GJk7b199anwt4hSN2qaAnu3Ev1GQDruxEBaxFTcLHVGMqH/ILMv
         mnYt8qOiOeg6IbjAgpmBCYWcnCjSVSf8e/VKPpZ3wKFaqOs/UTzhWMDO5dKWPsiqDFim
         FKYZKBYtfRv7wXrXGWEPIX+Y5NzvPb+vGyi+Ar4ac2wN3zq7b8o44DK2/zBEgpmmICgE
         qgyPs5i9G+DURAPW7qw2hmfTjPIWMYexB6JT8xWWyRoKhjOPOiyW3JO9SOf25Oz6pYeK
         MLj/pAsAtKufCcto0ZDgCiXy7hAaDscwLAi9hA9MsRWxezV+GWtsy89d8fKMT1cfypQr
         7qZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781054106; x=1781658906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        b=qMjegCCcUBDxXDPpfJ9kUjrMc0PeKNq3qpNPV4QavlcRiZSK99bDy4G24FJO3temQ/
         f7Zv3uYHOTUIwARONd/StE6tPPjor/oI5kCeJZ7TFLqJn5c/8P0M0BEh1vLajwJaYBUD
         Myg4BfP5r5PX5ieSW2QJ6eVoar+LkRDgNl6GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054106; x=1781658906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        b=FLF8HyIlYaAKRuX2TX5hCeMnlPsCk++jBnQsZfeJKOkX0KBv3oU4QxVPQMMbwMa+L+
         PkNva1UAwmKT1aUJW089HDKlL0VRSEjoX4e6pvo/ikQqc1LN642y/KnqeDPYBEJ4eUHW
         2xIzOSJjpjme41wgxEWXvFg1Cn38L2H2RgfXlZy0Bs3za4tnNYjb57QtlEa9uo0CIYeY
         hR2Q/W7edvDDzgUandqbKQPp722hBFsepr+V36cz9joNaO72tQ8EzF55rSmOMWUDFpSk
         U0wWRLPBHZWw38pCmBkCg09VpEctfiknNgx8q5k7ZYxIQ4v0xVhkj5DNoF1Q1sbpkAlT
         jvjw==
X-Forwarded-Encrypted: i=1; AFNElJ91PnmjnY1FeK0/ujwxBD8Hr2frANVMDSZlo0SYBd969GJBWudfU7PiemDxj5HAU6zNjQT+ML8Cb0E4+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wn4O/Gnnjqw75U87waPBbDA/W+NVggLh5y38xq1XbQmUtTMx
	Cp7rOMvIrMaQ1PIEDSH6UBVLRXPIIKtiB1XPgt4plv45mZU8UWykoh1xe+zOKaBrSUsA6M0sUm+
	/a1+eaOV5cnNiT+4ayOvtyn/KqlG36ouqE6Zfx9Ehuw==
X-Gm-Gg: Acq92OHgWaDTM1GxKpQCYqOtRzZsWEdYtxFkG1tm/l7WFYN7GT9TFMEPDBz/h8iuryv
	ULLHdEMoy9RN3IPk8/EKPxbu0zkl8hB92+2OdnOlaocKQOCetylmb08HkyIei7wm8BPYmqQ1v6w
	nZfW7r8maVLSSY1dL3yezTpc8oawyFbbtLVHltDH5n6KVEVkHVef+wUeSDlP4c/JM7dm6fap1jx
	23wbrVt86mbf4If3h+2JnCOy+Z1pbUVG2PLRpcBdJHiV1PUZHTTdKvRg9Qo6xyDPCFf8/7Xia9r
	BYCe28vf8nzMNEKaylMsbmxU81MVwjSim33gAZ4+SCHDOY11CFeDQjb5cAoDh9QTiBJt0ifJ7wT
	dY1kjdBMMWDIEGsMYlDu765HCTyLUFvzJ2DbtHziu/pQzRtghoGz9jCeXYWudy0grta7TOB5fgY
	/L+7t/uDqSD6gc1xcGtfN/66sOvILXK9s9iVM+yRcJY+2dM5JTfrkl3KJjxYXh
X-Received: by 2002:a17:903:708:b0:2b7:abc0:3bd7 with SMTP id
 d9443c01a7336-2c1e7e3adb6mr148795125ad.9.1781054106527; Tue, 09 Jun 2026
 18:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601041336.9497-1-daniel@quora.org> <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org> <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com> <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
In-Reply-To: <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 10 Jun 2026 09:14:55 +0800
X-Gm-Features: AVVi8CdzfDox6mz_iOGKn72MQqEfSSNkYmI5x8N9Awxjs-n8z1eY5R0tOZeJjNw
Message-ID: <CAMVG2svgnGKix5vSe8kG694Vm1dU=0Z=MZqR4M5LFOxCXoXYXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 14:39, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
> On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> > On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
> >> On 01/06/2026 05:13, Daniel J Blueman wrote:
> >>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> >>> triggers unhandled SMMU page faults
> >>
> >> How do we know that is a correct address - does it come from qcom
> >> documentation or trial and error ?
> >
> > @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> > source for the different stream-ID <600MB behaviour, and share
> > specifics, eg if silicon, firmware, or driver and constraint, defect
> > or otherwise, so I can include a definitive description.
> >
> > Also good to know if my workaround is good for long-term, or on the
> > other hand handling streams <600MB is important/useful.
>
> Thanks Daniel for raising this patch. Did you also try the memory fix i
> mentioned in the bug [1] discussion ?

With this patch, my Lenovo Slim 7x spontaneously rebooted after
opening 3 tabs of https://ui.com rather than 1 without it. No
crash/reboot is reproducible with the patch I proposed.

> 0-600MB range, VPU hardware would reserve this to generate different
> stream-IDs primarily for internal (non-pixel) buffers.

Thanks for the clearer description; I'll respin my patch with this and
the DT fixes shortly to get the X1 user experience under control until
a real fix.

@all I appreciate the ideas and discussion already ensured!

Dan
-- 
Daniel J Blueman
