Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574975;
	b=OkLBT2/NLaVdreMAT/adRREOFYg+bLVbl3iwCMXIh6FYTyBAlEWLKEHUKPiIMntvorr3
	 S32e0C7sEO30/ui/ciWvsZQpKSu6aaab1FUBokYvfjVWVAxmRrd3e2kPjcEqxiAObhBWa
	 b1u/649EBIz8oDy0ABWQBRf+Xg0DElB1+1zho2YjaT1gWB5RGJ68b637Lx94CnCcOpqfJ
	 AjozBFmgvfHeVRs4f7G9KpcUTlcYtcWAEXZRnbZ4JG++MOgJnvQ5yCdFoCKoev1snDHkn
	 X2bUuhO3PI79pVuHPM48HnRQ5jZx6PTJTWiXiflZsULQ62+59r7hHDb4hTGLvarf1wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
	b=AK+AkMu4MK8eA5jLQiw7Bc5cU3MlPUCfryd63qJ6LEbNk2xCoMHZgM1OR7lALYI/6mCa
	 xCxO0SYsBCn2ZgDJh2nE05uYRRy6Qcm8DZxiolmqOUoxgIIHKB/vyI2hOFE0SSPvTE/XN
	 E85JD0/vHB2Vp8lMfsy1AIg51Kmk2zwOJlz/ipXOw9qMolVYuxIXbLY1iFBp2ZSGn66OS
	 MmMGXds3KjQ2Cj8/rfbKX3i7e9lEknPiIUqwCUv2JLiZrCStvtEWYvHHbn0GKgwL9hkDc
	 UzYR0SlTfC8PcD9t6p/LJhkMzm9+R5+DTGVrIjrbsOqTOoz0KFUs98UCca46KDrM47A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B6eD/wO5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802E1606A32C
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 23:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B6eD/wO5
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so9322a12.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 15:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574974; cv=none;
        d=google.com; s=arc-20260327;
        b=OEdINL62rl0bUUd1kEtMVCakmwnDq0dB8drlk97ciR1lwAPiSJeuakr+GY527Nuf2R
         TCSl8xUNg+IK9t8UA+11yAdCY4oUbmfQxdd/XXnPC5DaulrfYxNc/dQeXMWUm6VyZVyw
         r36QYfD9KjdZTEwgrlGSWkByhhS3iC6za9Oxbim/2lJrJcUPCChjYTEq4iwiXv8TcNjd
         7k/kjC5TQUAxI8rFfhm0EQcsuuokA4PXBI6UFMTALoCDZRjHpPhu6nwfpjRNv7WygbOB
         kw830ezBMrHFlql+wwLu8AsbEu8Tg3yF9EgmVYaFRfvUBq5OzY4RFz8ya4Gcmq2G2Cac
         hB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        fh=roUiUEW1vgKzKOCDYp2ebgJLGUmfYbxFyPQHZcoFMeI=;
        b=Jw/z5pAQgcO6yvDHyOlvHT0D/dkHNvoHrk6biWZVGkwvYyIVufNAiclQMkHoXf0EOG
         faHcU62PJhg5+rnpeAg5NybshA7U9rfPqW/ib0425S/gJBCeoApHU0gH4MNxuwUk4RDO
         Rg8x8JTpNKl17J6RaMrnNUDnJSLMeM7yJ5TzQGjAQHRzFB5Eq1E+5ou6SyMsmTnrCyip
         Bm3qjgK1YO+bJQzsl0gLU2iucNacY5Pk/17S3hIwPLzG/heWliZck1FaOtpsuen8DW2F
         qU5VP/oJ0YsUOEEzy7b3Zz7cLiy6Zy1RQL6vTE64yguKZ2ZTBePXvJ/iN9G2u9f4OXDV
         qXaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793574974; x=1794179774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        b=B6eD/wO5t7w9cr5msgMFDILth1F5IYv2yTF+M3oN3LY5yBUCf8LbsX8b/EG2x90vMc
         o1ifbd35SU/EjpMruPB9UPjK5pHCrRD2cuHlsD4MZZQaolUEBfaANH7GMS3ZcR0cBYfC
         Pn/HQAGHTRAxbdUurIHjZmgux4R8Hl73PetNQjifvN5ayQO7L1PgUm3ExnpeEepNgAzg
         UDBfzpgqcd5dTvc37HDnF2segKwhVXFd4tJrk1GoygafHDKHc4yY44rDa2sFoitlIrgJ
         WnOMy7XyDHGR7QjkAlpTH09T83L+F3uzmZZLwA7BBZZ4ZKX06XcjrBbyXWiLg2e0uuom
         V+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574974; x=1794179774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        b=R3aL4cc5+bvNSt97tQ/Hj0xwgUkMqp0OhYamDfVCTcIhPF7ravDEG5bGLREJ0Yp0Os
         iro2pwXKRtLcVvSWepuLYsSimyx0y5JCCCt7utPnL2JORC4L9/4yLpYAKaDM3/ZGboW+
         +plHMM9RgaSj23L79TUi8V1hmeTLVnpyhi5Sb60CjYie1tmaT9Q0tASOablvejTrAmJ3
         2XQsnOyOYnjboZ7GLPavNtUDJeeXIDCV4ERpMgTftMXw6oWjNbf+6Apfg+e0hbKrcgQH
         PBCI0BukEQQLB0xgurtDzyT//9B7YQ/39Qul7FfVe6GsvxUC6lam3GBDArW8LlIJbvXh
         Ju0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTEjOfbQW2NR1i46Yf0ezgtbqs+/bFgz45AS+RonxOqM/iqNkfUTi3w0y6ingKDOI/QGL5Zoh92qXooA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SSoVkkrqavMEBwJQ1S/qje/mZnzxe5bnH5vFL31CRUDfv+E6Y
	OgKgY+e+P7o7kbHNEhsoHs/fl1j5YN+3Ed9aQAGsrISKiqqCG63d8YrehviPvIreru8NKjQ+5NP
	44/U5LcSrbDVRJk2mdMneTUWicqh7DDyHpW9siuI0
X-Gm-Gg: AYBFou1p5CAX6gn48MUCdle+ja/yKuyGipjndia/IRP+ddM9b4VqistxHpC1h/WB+mY
	yXcZzi4+fIhyTdIfd/Kd5ghiUVrfPeVh5Td/OLlOMqcX8T5Ym5fEZ5Kp9JTvWG0+FwZcnHgYytQ
	IUzB2KLHN5P8v1Co7Au3ce8yL3+LMLl29J28/yCAjiTxLLprUNlo0EY5UnpN5dp0/042PBEOe5w
	w5KmeNCrMtAZLmmSNXw/f4TigDt1+vkZmT8rcmjFIE4W2mHn8N1v0CfYrT7OjjV45YM38IbD+JQ
	2iLC4X5dLex3u73yKlu84PGKxCwGD4EOa73FuAbZed6YetvCZIwavxFA/8ofKpI/+k26t2Q2A+R
	45CUufnbJ6xRky+oBKGbBp63rT170Qims4iwBwt4=
X-Received: by 2002:a05:6402:2154:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b4b42a63d3mr252843a12.14.1793574973443; Sun, 01 Nov 2026
 15:16:13 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com> <179357408146.3131.2882435952119280563@kernel.org>
In-Reply-To: <179357408146.3131.2882435952119280563@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Nov 2026 15:16:01 -0800
X-Gm-Features: AclHuK_Z0S06xrAeAq_HAO4Ko_jHw-2goCa0w2rOFRiQDckpwHJNSPwxMM9jz2A
Message-ID: <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:01=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The dma_dev use-after-free this patch says it fixes can still
>   happen for RX bindings made on a virtual device that leases queues,=E2=
=80=A6
>

I know about the issues with leased devices. That needs a bit of a
rework, which I have done locally, and would like to send out as a
follow up fix.

 --
Thanks,
Mina
