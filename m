Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386CF3515CD
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784963651; cv=none; b=NXSSGxLJ7WQxuNwNmCbNU5CvCa7i53SeGVw+8s1ROi4IVOaZiWD+d7Qg096aRY0oba4g3cKCKgBTJTEvYu4LX23sY4eD/1rRe+XPEu8OGkwKSOYnu0V8tPKXlea8Je+ZSS7Gc552dxxMl5nDr55Sw/tMTDFc7CpF3wqNOeOLPvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784963651; c=relaxed/simple;
	bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CijYoT2a60kSCbZ37iff70qTnmC55SAI/Xd2Q7KZLfcJ6Yu+sHllh+0gC4l7XeL5VOY7ams7VH1AeuRak4WRxjryg9aoyVVAHJdehydcg6PRPNEYZSx7KFYw6CAjOBjEx7d81zDyjA+EwHG4yR2ElEDDkonwXiOlK1j57pE/Ic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0fsCUCU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0fsCUCU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1663113a12.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784963647; x=1785568447; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
        b=k0fsCUCUrtm0oqtvdTfrPuknPONX4Cd+Y33LiHKz15gow13/teiu2cP1eGurXKX7FH
         cV0WKRdmk34oK/whcNayIQR7dN47XxAjB1fDioEWUM3g1jcUNdD3m4A/QTIB6VWc6chx
         VLdZddgUhsH/E9iCTh6AJTAbw5o4q+EZQkxUUWuCUbpdvUIr4C+LmRgTMPepYxOuezRm
         eOnK8lYFTfIz52R7W0qWQS+LBmOz+bToef7/wyNYu9JaZ4OGur5IOtqFx0gs7oqpk+Xm
         TnE9rRjhoFvJMtnvHxv4dHWWrg7hJvt9mj93AcZDAwrcxswPA/Q/OHHpJE9YPdfyEgRU
         fTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784963647; x=1785568447;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
        b=huatj5eiU82XgRfu0KF6CTev8YJZsF1MgJDwTH4fY+2Hamn657RKWVZlz4bCnC0zu9
         8O5wrT8a85d/Io88nefb00Dm5Uedv2HJk571ULUrhylBI3JrI+MKUlZ/2xi9GQCu5Nje
         0LdjKpFAIbtlHNmipf0Sep2naO4TYh9NhxocJzOGGbw6hdCExlfnGwxMWD9Qqq17P1rI
         jmBbaSDoIJXCvOg5AJFxYTVOUqMritC9UtlVWEM/eJTzvWqTLjlh5QHl1qleTZVSYoc7
         Z2t/3OYZ94D9ATurbRrFicJJIFWrhBdxQ08Vj/34VAg6ObK2eOA4up3qWw3R+q5Rxdcd
         ZBMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeODHukcKL/YactQ47I3z+2Lp3cdBhE5+lsXH6wBHwg9V6l5p16ITL96+Eh5lGaigfGz585o+dsmBmuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYjQWUiV67s1hU67GC0MBZFl1M2Wqtzg8gqa8yf06JiyHUsXG
	mvnv92GRH+rLpTgDSfp5jq5Hp295IKRgZbblsU7bmRYfFnK/eVgpT1jk
X-Gm-Gg: AR+sD11Ga0HTRrtxUM7bKradFQD1MMxLunnbfhRQHnDvl8Lg4wHiix9lfseEDvvVlBw
	WCg4kRoUK9UJ3zB1msYQpqbp1xj+y8NVfWwsPOG3rdbeXT+/dlMJKOzLdg90wVOD9Asg0eBaynP
	rcvbF7QGqAax1A5LPGpskAMUnvpmCYsxof+gx00E+qtvCCmf3wueg9ZgwxNDJvR3eRg/xzTilkD
	KWhBBNRyVoRMkoTl3b4PqjCg3/oDgWv5tj68L2pbKL2ZdNU6zzkOZq/7shWieoQLwXtWqTNliJN
	ajGm2YKRWN0hQf8zqRXaYpEUCrsv2ae6E+nXJhJN/5lfWXiUSmBeBa1MNnRREOo7HRG0OR3vovq
	MBWKY/lx0XNe66DUFhHK/+hyhjzUUfvymFulK8ULnXuG3gEFl7W0lNvuqw+RWeGF8qMmAn/Ayug
	70RajIJSDHrqHNbeyc3xAv0kQyG+e110eA+YFt9lCPqArY85W2jF2AAcJhgryHiwyCUeeTaUM=
X-Received: by 2002:a05:6402:2692:b0:698:f7d:4e11 with SMTP id 4fb4d7f45d1cf-69fc0fed1bfmr434261a12.1.1784963647447;
        Sat, 25 Jul 2026 00:14:07 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb4e11519sm658390a12.0.2026.07.25.00.14.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:14:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
Date: Sat, 25 Jul 2026 09:13:53 +0200
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <49F34481-918C-42ED-92E9-DFC336526BAD@gmail.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
To: zhentao.guo@amlogic.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> Wiadomo=C5=9B=C4=87 napisana przez Zhentao Guo via B4 Relay =
<devnull+zhentao.guo.amlogic.com@kernel.org> w dniu 24 lip 2026, o godz. =
09:04:
>=20
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
> drivers/firmware/meson/meson_sm.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/firmware/meson/meson_sm.c =
b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip =3D {
> CMD(SM_THERMAL_CALIB_READ, 0x82000047),
> CMD(SM_A1_PWRC_SET, 0x82000093),
> CMD(SM_A1_PWRC_GET, 0x82000095),
> + CMD(SM_LOAD_VIDEO_FW, 0xb200000f),
> { /* sentinel */ },
> },
> };
>=20
> --=20
> 2.42.0
>=20

Zhentao,

What is req. baseline for this patch?
(or what extra patches are needed to test it on 7.1 mainline)

Asking as applying on mainline 7.1.5 I=E2=80=99m getting:

patching file drivers/firmware/meson/meson_sm.c
Hunk #1 FAILED at 48.
1 out of 1 hunk FAILED -- saving rejects to file =
drivers/firmware/meson/meson_sm.c.rej =20


