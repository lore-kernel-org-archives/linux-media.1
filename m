Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036075;
	b=AKREqu+zvCgCfcD8PS61FQnKAIbuXkIh30c2TSKLCEkF3XO8z5M3QB/XIWQLFzO5aLuH
	 n1dE/i2fETpJR/tO9WHlpeXFuAfBzmbEAUVMbTns49zejM1CqDShndesNNwpsEZRyFPMq
	 ObDm7a5RleDkE4rmmYZxDRQowDbDSSn1tH/qP8ccbbyFfPk3IzdeOfpOtpbImqBbMRhei
	 Uid3XoYdEQe0Z+995MVJBjhjdXzoIufsNnmnxLGT/ltZg/WZ/oHJ0qiNg1mAKWzyMhEIz
	 4/T/qIBJGA3rtfSO8uc//ZYpR3G6jZ203fktaV4R+NbSyzKod9bILk8fNNDQcDdH2dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dx/DuFDwajeljunningJPz7hr9DVGjiaRiOEtdUsdMI=;
	b=nxXvgYVgnJhBCXMpPFGaRYZlEgdV1rEKWnA0RfrYdXqSNebM7YrD0ORdI45mA16rQoYy
	 RO8TKCrddw87ijurYVaLe2XdR4//Hnt1QpOSBZhXZIPqURbqP0uW/Ry1ZDeXAxfb3bAyA
	 yHMJV+0LTsMPrtsNs3xmLH9nMmf/VPuxDT6AutlDI8Uxk/SzajlfjPbOq9O/rFd24/4X1
	 HW1nvVjI2iAmyupQD9Z8eBpg6SuiTlS/bBfyYZxuuUgZTus01LUuSYv8yprNWvL365v3d
	 ucN8cCLCAzjFaE8NFYH+JC87i8xdqnYXQTe4byrFmUONecn63LtD9gF9v7FbR08V/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="LL/4K6hG";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952C606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 17:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7952C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LL/4K6hG
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso381689766b.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793036073; x=1793640873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dx/DuFDwajeljunningJPz7hr9DVGjiaRiOEtdUsdMI=;
        b=LL/4K6hG2ppD/7onDR9EsIr/yRcHauGUllNjczgxmKUmxkZxA7xxVLkQNWj6Ax5Xjv
         yioD02ru1aOzpt6OGB6Jh1jfUZQBBt2CJ5/IM6UEd9HFrlnb675dSf2vmmbPzIkO2XiA
         1/jfsZVJwwFcdh6UBv2rBgKbShChF6Q1sh5K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036073; x=1793640873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dx/DuFDwajeljunningJPz7hr9DVGjiaRiOEtdUsdMI=;
        b=i47zg76xA30aXcYGKQaxr50Jlym1VGX5q6SuAOzQvaMWWEG106VA+ixgonz4/Hozn9
         lspkxq8+R5ifPsxNALn/dZ4wNeAa6kY+cH3Y878olcxUYECwrnqjqs/YweoWzTFADwaO
         sapMBq8eLhPvdnw2xiCZ8EjYf8Odtt488PjL5/q6/7VXw3SsBjPd737ArczF6MhGEsFg
         Pnp4OkX5A9lxr5aL9CrtBEZYLqiTZsjQGTBg69fuf57gqFcuzuuxjLLEON6FGKpM1A3K
         RLV2HEQVmS3rsFKf1bLNWUyy3bfU470PyXKxwQjKAG3fRX/fwQLR7XyMicN1kNa1R2+M
         aglg==
X-Forwarded-Encrypted: i=1; AKwUvByBLLOo/cBqpxFdWiygv5/YAwkKh2rFIZ5aXqfjs7b8bAy4/VqafiY0YEzqgpX2Fswx20yFIh1Rfl1apg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKt7++9cw7E/cDYSqekcaSoqVJ3XqOUcrUMfrbI3PHbL38qfU8A
	bTKg8TE/eDZCx0JqcLBYp82zFhAX7fp5Z8m8wOI4DtSvQyn39j8fAJd16DM3gUHlSE/h5cuuMeP
	DRONlo4E=
X-Gm-Gg: AYBFou3RUdi3fyCQ8a3AsALdAyiD0yU8wT5GpHKyHXoda9csDI6yClBytKdpuL36sUt
	tmzjPZafzVBTrLNj/kaNnSJh5z3MZVSFgRwECypqGBFGwBnw9ZR0JER74tcJKgZ7/Gk3ktPSfJb
	69ofenWFugk7UqKFiNWGBK36IzpbMiBNn8e1UloTb99fGcNSH4ZvZk1YSwRjP67bNDkJIgYWPRQ
	uMgJsnzoYynJFtKAuLAtjMD51mJ6uWniFkyvmQ+YiS/EKAczOLJHPbpRWeVHeZ15JyNiJkFdJBp
	Z9uBEROGPd1UdSVeiqF2vGEYmfrQI9AbqKgD9wZecH66KyPqiNcJyUza2c/LzTrtvFzCD0eTp+S
	DzCDkGRpsCuyphorHq0lZguq+3rhS/DO6QixIlYRisrm3prbsttK9Yv4f1FRKOF1DlyP+p3zHoE
	Fr9bQSVzCu6mpNiiANdIA5BK27aiOx4Vm5ho+RFtxzAcTNEGNXfZNPvIHqMyRXnzEccd1WnifqP
	JntinBZAc4/9CscXdBgklHcrvPZI5H0V7x5k/EYNjhe83km7ASmqid5AnWqfCcaJaCjo6okF8N/
	x+L24VUjGY3Hc8fdG1IEwEKJfRxcwg==
X-Received: by 2002:a17:907:9303:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c46bde2e25bmr871237366b.43.1793036072665;
        Mon, 26 Oct 2026 10:34:32 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea39fsm343703466b.29.2026.10.26.10.34.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:34:31 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso497531266b.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpWIeSWwXgt5Ocq21p8QxxpDm+cQ+7on7t8Tucl6/7/K83qwR1Oeo8oetDQEpKTVNS8w08CrD8wl3hsA==@vger.kernel.org
X-Received: by 2002:a17:907:1609:b0:c41:6de7:7dde with SMTP id
 a640c23a62f3a-c46bda5704bmr880973566b.4.1793036071209; Mon, 26 Oct 2026
 10:34:31 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan>
In-Reply-To: <20261024185058.20410953@foz.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 07:34:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
X-Gm-Features: AclHuK-9LtsQ8uoYEEPBmRs-daPP1qy-BHJiAjrb8wWeRnIp0Yu9EwVzE_I1k4M
Message-ID: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Oct 2026 at 06:51, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Sakari Ailus (60):
>       media: Don't hide I=C2=B2C or SPI drivers by default

This needs to be fixed some way.

The kernel config is asking about ridiculous things that no sane user
can know the answer to. And that change has made it worse.

Asking a user for random media drivers by chip ID is *NOT* ok. It
needs to be hidden some way. If the old way didn't work, some new way
needs to happen.

Guys, the kernel config phase is already *the* most annoying thing for
people trying to build their own kernel. Don't make it worse by asking
questions that make no sense to a normal user.

      Linus
