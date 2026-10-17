Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FAB3914FA
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221677; cv=pass; b=RB7yLSLCc/RVN2nJi6wk+JG6b+L0cjOUrBLgghy0i0tFTHwZY0RGtUHCP8qItXVkn2OdFKjX+pEYPH7qsoEvOqhpiQOm/K3V5Ct7T4W/niFOiMddITzUVQnMXuds64+Itp3ukUaeTyAEFJVzqpTk2Uz3eEn7fnA9t8LmoiUyxc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221677; c=relaxed/simple;
	bh=gZr4gESrp26hvAbiwwT3Hx7yawtW/6+UzIaqsudFpCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/hl+SW0ydDvXWb8LFL6msyoqQ7HZDmjESWgEAjVjml8nfLHvaC8j/4sgThgwXbvBHTjfW17veoFkNoOYiRkDBI9HYm81pQvFKrAsfmYMc8RFJe+jNTb+vz8aaGBeMzOYeah4VVkW7oXwg9Oz76ezoX//Dl26yLbYjIN4W16UBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoJqU3W/; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoJqU3W/"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a49a022221so3783731fa.3
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 00:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792221673; cv=none;
        d=google.com; s=arc-20260327;
        b=Va7IFNnKEl3gU2Lts4rlJXj3p1H25IU8DvN6FobCjKXBis0zR6rZTedkkABdgj9zGj
         Rt9UTFBAAxZ6EgKzBRGjctiL+kqV+dsL3WmQm+ZBZSqdMZWlO2ooysmsh0Yo6fR71GO/
         LdAtFlN0xh2jcCWn8I0iO2ZFKVtd/ZSU/0lWnu6WTOPzRZNmnBgw05wbYCoqzftwJL1B
         +TuDcD91z0iP+z4st8pV0o4wcQNjqsivsx8YkJ4CA/JhcinztE0XKsZ93bAj6KWYOfA4
         5RXYMCVuIg1WY54DfoKF2qrXj+u2yeiTCh8cv0y4EGmPzHOvVyOUyu2xdff1CjGBkHKO
         ngaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jBeT/jDjP2xiVG5zgH5DBC3f+h4JQqHYz3J4+ny0zZs=;
        fh=cufbbcXeqU15dlavMtIa53FAxFHvcWiM3eKwFjfbzoQ=;
        b=GGXXnEP3TQQ+b6EYYjbq76qWOsmyjXjvNrtR2QYaOJC3/kxA8JgHPaDDmrrIiC676b
         QguR/3vTC7nKBzgSY8kz1J8qQzunKmZNBt7TfqbKODjpg65sJbyLB4JqLw4rh+AObMPj
         RZpDI5yfIne1yXwxB6M/AVZvMi9lDsZaxqEFIznFZW7btwNnnoso64V25Q7/tksYD0gE
         y2oS+SZYohlP/75TWT1sqE/HBlJApt4JNLKRgWgtyHMuraUf/UqFBVRcNVRxpfVCZdlj
         Vf4YnmoHYHWDDRnlL/CcmZxGKflvr3CaY2MM6P/tHNYe3A1C3l+Hhmh/H+veperTnZqA
         aQJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792221673; x=1792826473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBeT/jDjP2xiVG5zgH5DBC3f+h4JQqHYz3J4+ny0zZs=;
        b=CoJqU3W/h1+HIkzQ735xtrOhSjPAzRIBLVbBt/KRBNMbj4emSsxVB27QfrJsfaAotB
         mcvNxeQHDXNesftVqopbF0zsNp5hcPguIxJjEHXYT3lDXCEOQTVMnjD6ET20AI260wbj
         nTLdrdnsCOjuScL+uUCr6HPt0J32fv9/QsJ/G0khrlw+JonkEbxgPk0asjzFGNqlsqDO
         Tz3vXrLJ04Dy1QHkE57nYboqOqHloT490TIT3zGX7nxESq0/gPixXGJeFpeFuY4bXRua
         jHE9DyVmWugJtQ0E6Uwc2rVdsh5wIFrS2ew/vKM9KmSX2YuV1vwAoWZDudHI6ba08vuf
         QXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792221673; x=1792826473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBeT/jDjP2xiVG5zgH5DBC3f+h4JQqHYz3J4+ny0zZs=;
        b=PoWXaxWQsBZoG6XyT6rDRWZA1CUgVBonsp2HKiLCUJLlPyaiLZzj1xKl6lLRU0VZBt
         GmF8xV62Uq0nf6EG5uMXHB1SlFfsCCcIIFVSTmQY8P2gWd/0UyxPzGfAMWGHWnn5A8Tk
         Mm1RHkdpf9tN0WG+kuHopWFQ75pMajiCx7KOutFSHx4iOceoLP3vqfE+12RwLNqe0lv+
         SbgNR4YStDn6sGb7oHYBuL7aMGrzfwGjKSXaU3b9ebc/bB756ZR/ikNlQwhtHUR2JFxc
         Nz1yuZpsmRMgL6bB4xlk+i0ffyq+6RPJKGhhXh1gKu2AcjvB5Dww164ElHAlbTGEtoug
         gpXw==
X-Forwarded-Encrypted: i=1; AKwUvBwZAfn4qRaVp3tFwgMUXx7gY8NKBVURoEB9cz99x1y4v37Hug5kUtMo/DZs5kGPU/dqPy/MkMo0vL5Axg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpCLx/cO7ZIeGrvfTWL4p/l8exLDUJdt2Xzystw1d5L5LSpWiK
	V7KdeETMhrzCa8xpDxSnY66hCHTxw+lz0eO4fNCAhBzW9vr1TmAH+Pawir8gfrgyHVMOlAL4ji4
	VUvhPRPeknFCKQds4gc6UwmXE06mda8Y=
X-Gm-Gg: AYBFou1bzt2Tcz8FHpvu/zWqTXEPb3/D9pgwoAM5k2scroBnb1zQVR9JVG4knPVyTeg
	ZIfNmRGvktlAMa+aaYZPqXMzVnwni0V+7RMiZ16HhnHiUTqwxessFd3057OFABC0wV3BkWPDNQa
	OTsGm5h0ESy1/Z51+MJZnDrtTd8w6EbGUoxIXN2w/CNXljiYxFXrMJKv4h+uPvIYWTv0bkD0W3d
	DY2EK7Zc4IiMVpJx6XRXlElv+bHukJq7d0zsQq3o+okOl1tKHU/cLJ9yN+gOFvwToO0whU7gnpV
	j3F/sGramp5Tan84qiPWT9fF+PLbW99PNv684v34ERnac/fyD3mimrbKgE+bRfOg2XJaWXl1Lu6
	0YVALtvFYCkoTDIQjgvdT8B5t22+oce13Mngd6Hx6gHCgxbOD2yzQShNnjRMoiBoBnX5cpRmrsv
	kaUy21Vmxs3nP2m2h9/vZh6Xst+P2h7lfKVmzj3uhb
X-Received: by 2002:a05:651c:b09:b0:3ab:2a19:862b with SMTP id
 38308e7fff4ca-3ab2a198757mr3867211fa.4.1792221673027; Sat, 17 Oct 2026
 00:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com> <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Oct 2026 10:20:36 +0300
X-Gm-Features: AclHuK9QqFyHHYo1Ic5DPqLD6JKANTlcGq-Ec6EaEDFXVDarK1C7PbqQUwFsB9Y
Message-ID: <CAHp75Ven826F0U_=2QzZVx-6TJTV6-LLjqDOqN9mxVC-CNmkTg@mail.gmail.com>
Subject: Re: [PATCH 1/5] media: ov05c10: Support full range of power rails
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, 
	Alexander Patrakov <patrakov@gmail.com>, Leif Skunberg <diamondback@cohunt.app>, 
	Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:17=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Add support for the full standard set of power rails for Omnivision
> sensors: "dovdd", "avdd" and "dvdd", using the regulator_bulk_* APIs to
> manage to regulators.
>
> Previously the driver only supported avdd, but depending on the design
> some of the other power rails may need to be controlled by the sensor
> driver too.
>
> This is a prep patch for some INT3472 GPIO -> regulator mapping changes,
> which require sensor drivers to support all 3 rails to avoid regressions.

Seems quite straightforward.
Reviewed-by: Andy Shevchenko <andy@kernel.org>
One nit-pick below.

...

>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>

Perhaps keep it sorted?

>  #include <linux/regmap.h>

--=20
With Best Regards,
Andy Shevchenko
