Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317B36B900
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929394; cv=pass; b=mv80ZwoVIMhDcM5JYRf42HVR65CCwZOLUm9xjmSn/zh76aHEjfQayfEObFfEWou7X+44Lm2o0j/cFT/SdoP3cvuZUHh7z6Uwdh4q8vwvwzn2+ScBkku74/nrvRjB3/y4feznf6IpZFRu8rfK1mt2DEzgxAbDkgbauQIfrogGMnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929394; c=relaxed/simple;
	bh=m82XSMNTiLgC95D6B78sYDiC94k+qp/Rz1jZL0ad/lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsPe0zhw7nS7tGGbz4VX8pJwefH0sZHtw45CBHhBidepJ1je4TerLdsTquQmWHZv30nthitQ4K/bt+YTRzpbtGMrIjkuZNomSn8A9oSokDZbsMsmJYqxVKaPg6MH1mVZ2c6LpYpbC2EKa4BVpJGLUSpu8dCgEz9ydJFqJQYuODY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfReRHDv; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfReRHDv"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so1141100866b.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929391; cv=none;
        d=google.com; s=arc-20260327;
        b=C5W67ezjBG3y7hfLJAaQLuHtuEZ59TJCbpAfN/GVGvdawAiZg8OgWL7xVy3zPxzsGs
         s2y1mU+MUC6z2A8wTuuHf9lcRWhJXLJ2N/G4DUnv3BnlIYnwVYbX9IDQ7hybX64HVxLS
         8ByZQGnGumv1vnp0ycZZyvR64eh7GCDf0lgu/lChDj75fultD9WQ2o3jgFxePleYplO2
         7wWRp6TZXMuB9GlFBePCrY73bEZUvOiHJNdSm+ODBOR4Ss7zvcQu9pQrw1NAmS9L4bDW
         nO6qQXxa2Y51fbgD1S6bItZxvrmc/0O+P967kxCw7ccQvNR62NBOOTW0I8Bf4ZDwVT4w
         A7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        fh=u5ncjUULL8Ly10jNSHID1a3A6k3DLJvQqQUANoSiKjY=;
        b=Q8IvTZG/UwCkCuPTNEA/XeCgpzwhpj9HRnwo9Mjs4o1e4ML8rHcaMzP+LzwrzfWmAo
         bzagiiczbe1BjsUtkW7EFKaSTvW/gtTNf5Z6e90SQQZZXOTed2cFrDVR9R/CGJKekGcS
         tg4OESCt2lVrquR1un4cRPMmzGqyYGWlQlRdPvj8m23gn1VRbzpmYltg5nycByHHgIBF
         yKJs0+U0TzzqzpJ0ljZe3uk15Xcg6Tv6N9gdV/OZr2Ver+ezDjKoVKz5z5S259b4Yd3E
         mcR2GFIMnFPIFUyU4ztGJhmEYhAKYkN5CWLQV4us+OsJa9vwmxqosIZf4zkfUbushArC
         gRhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929391; x=1791534191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        b=AfReRHDvSrGBGoehdBJBSMqxKN3Z4JokX9hetvuT4rdHkjVV7QDPc9GwODb/hsNJam
         ONRt6GAx/1izJ8G/0xLw9sNv/rfEqLlnYflwEwAQTeYF0d4kwsnK20tWMmySxaAvR+Jw
         JCjpzKYUr0iq2NvbgPw2HpofnhEIi54oP5GKCwH4orfj88H847X8FAnxzBGUTF+MglPb
         4ZJduZhwDV+zDY/nF8GmT8XzW7ZSiTU/JWrJ1Fk75sOtwJJwCCDCEOtuORcLKNMVeB3E
         ZKejrTZYY/uhHf7lxCJepZ99AM61ji9jaOYyS6aejZxMkJvYqmIYT03W/o08GPC1Nkja
         ygCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929391; x=1791534191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        b=lHXzXwENc/Fc2QbO+ilkWJAOpE8FbKW+r51CkjJyv1RVef/Vx3RU6pqqapXigI2ehF
         RwpzxYoiTboaVbY36w19nRktYPqOqZNkqCi4gakchPNRw9PVdN3viGYGE4p93zkf8ool
         cAthRtKb/tbc5nrBFnPRKjrwx28EiRW6WhnQigLqWtpGmI1241XC1mC4mdcaXFw7hPzD
         yMWuMWuQX9HpLFayVE9HCWDUpgb4ISfEDJoguhcQcWazZVWJ4TVNohJuEds96mh56nfn
         eBOmrKO4pPQXpPpFLr7BmPYIkj91EIkMcJf5xxQAEEuDA7yrLQyJn8FwFhqWhyhZaEGB
         rnvw==
X-Forwarded-Encrypted: i=1; AKwUvBzwkGtXRB1WVvHmcutW6xnHw7nufgqB5z23g4R7w8O7m0XlI8F6/GoG1sW+BKNTGUnsjeOhnfmm+K6ilg==@vger.kernel.org
X-Gm-Message-State: AFuF++mYDqLWeRW7FfQNIcY9eX2MjnyPwpZecRF/EqW6I+dwmg5seWwT
	QpkQrbWepLLgqDbu/kTw2VUVDlSwsyBrSkgEMG5F4IoGV00+aiBULF+r4cRxce+7QxTe5ffkt6B
	11gVkgUMlsbQ61U5GrCSz3TZQNagPk5ZvLMs8NB0=
X-Gm-Gg: AYBFou0O9W6/jyolQi/JeymaeocmcjlSI/OjZFAmazmqKsXmyH8rsDr7Ra95sjGShiR
	uxj7aQ748XEF1JBPNd/2lSDQyATW0smpLtB2OmKEpTUwpvSywN4Apy4PX8Cxiza6nDK1vrfS7ps
	DABIWYXAg98j7QcjsqhEii766MqoDdtVQj7gSJR2g7KFelepik6KbzUnB20nWnnFjOVf396FcUT
	pdjT/ZJOEuLssLzJBiLzMshHkbbfjPsXorTKGAlr8S5aXDA+YvR3glwLJBUM19aZ5lv2fUA1IX5
	uXM6dXj5QDkwGVkM4KwBM0CHCcvLi0XIKiNDbkOLftTKAYZoSRSU2MMD9g+8BAr4YcPIn6OLtSH
	1qcCQiiP9LXCT16a7Y6FE2VBy+OS703tVZ74KBV8uSJlgmzq5oLywV/euz4goU33ohcsNQdtPib
	roKMGs/YM1ayFdp6tR05z+p+ORlA+enozkwyqNeU1Abssw4Md8/KIB
X-Received: by 2002:a17:907:5c7:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c2e4b241d7fmr137425766b.38.1790929391172; Fri, 02 Oct 2026
 01:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
 <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
In-Reply-To: <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Oct 2026 11:22:35 +0300
X-Gm-Features: AclHuK_S5b7kz2s_hkF12XOALWuj04SzAGhc0YKCIgdaLJIkJrUOPC2GCBhIOzI
Message-ID: <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
Subject: Re: [PATCH v8 02/15] media: ov8858: support 19.2 MHz clock and manual
 white balance
To: mauriziocasciano7@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:17=E2=80=AFAM <mauriziocasciano7@gmail.com> wrote=
:
>
> Support both 19.2 MHz and 24 MHz input clocks. Move the PLL and
> global-timing registers out of the common mode tables and select register
> settings for the detected revision, lane count, input clock and 360 MHz
> link frequency when starting the stream. Use the actual input-clock rate
> when calculating the reset delay.
>
> Add standard red and blue balance controls for the sensor's manual white
> balance registers. V4L2 defines red and blue balance relative to green bu=
t
> does not define a standard green-balance control, so keep green at unity.
> Accumulate errors while programming all three channels.
>
> The manual white-balance register definitions and programming follow
> Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright notice.

...

> -#define OV8858_LINK_FREQ               360000000U
> -#define OV8858_XVCLK_FREQ              24000000
> +#define OV8858_LINK_FREQ               (360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_24MHZ                (24 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_19_2MHZ      (19200 * HZ_PER_KHZ)


Sakari, you see, still inconsistent. If we really want to use
multipliers for XVCLK, I would prefer to see the same one, so 24000 *
HZ_PER_KHZ.

...

> +/* Keep input-clock programming separate from the common sensor setup. *=
/
> +static const struct regval ov8858_24mhz_360mhz_r1a_2lane[] =3D {
> +       {0x0302, 0x1e},
> +       {0x0303, 0x00},
> +       {0x0304, 0x03},
> +       {0x030e, 0x00},
> +       {0x030f, 0x09},
> +       {0x0312, 0x01},
> +       {0x031e, 0x0c},
> +       {0x4837, 0x16},

> +       {REG_NULL, 0x00},

Please, drop trailing commas in the terminator entries, like above.

> +};

--=20
With Best Regards,
Andy Shevchenko
