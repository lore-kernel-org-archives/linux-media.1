Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520443DEBA
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887069; cv=none; b=DooQN9NRqvo4ew8xqLya9q9Jbr9KKpG4F3FwtDEaFbfF2NbuyE2SQkTv9m9pZKOgQCF/CI4WJ075f3AnzetPu3o8dEPtL7tcV0GyxIdVeVv9F3XSJ8GG/5sixATecpzn7fvxyLRWn01o20GJwUmkmfa6ru3ejSuROtYHWc2S2ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887069; c=relaxed/simple;
	bh=km1G/HHhK4mc4byWSgOHYVTFBTlTfLPGrUqU5+gvS1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUpxm1oJ05eb2b60VmxsOj2+Wh4vR6XKenx3FpMKyZM8jQivRHwzfaJR4TPfsHsAW6++Zn4PDQTHGFdslxuPB2u8VrXt9qRZAVnmw/BRuXoXHRHASOKY9kdtYLG7rj4qHSzsGWqLIqXmgTzxRLB2irrlnC11aimR4lH93ZdLpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e9239c772cso2224487e0c.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 03:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887067; x=1792491867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=;
        b=DZMX/0b9q5Qj+7WGxrrnHPncVYmGPQw+vNBDr84flEy3ZWy0fV7Gx5aej7ELAEIJ2T
         10qRJmizQ8fCE8/HtHBn91o0MPJlM9BoFaTpprvJuxralYTm3OBqIXprvyH+N51ON1qO
         8ByP+YcIiF+uem3YCAZkXMrWU1tb6iV11zG37/oihuJSAIBS0A//6I7xxuH+cu54Xih/
         ZK+BD0LNp2f9p10DdqfNq2s5r4iE53smunHtHgyEFNll5wKIlrGjneiCfVhPK6CsKHwi
         uvCJAP73VXKYqAD7SmZ29QoSVmyhp0ohpkwGn7QAiJ7JyNrY/L6+8g3+IdKp4spIHyUZ
         ISqg==
X-Forwarded-Encrypted: i=1; AKwUvBwCaDTOylYkD1yw7HUzEtJdVMa5YpnGb+pKRec6A35HTW+yArvNREGY8lbrorcTmlwO4w6wRvGrL1lNww==@vger.kernel.org
X-Gm-Message-State: AFq9FYIts10vN3kTaE4v1uUlV5ts73RKnnGfdz5Ig7lRH9OG/NSJ32yR
	PzB/KDP2CAWZ3IBfhEb0Heb8sXmqz3jRinr4Wy/qONZQw4Cfy0rF5j28r/p/5L3k
X-Gm-Gg: AYBFou2nRbalf7CKwGcAMvGl7xlNeGPGA1UVslRJPHKMAUA6zt78t+yBbvL4WEmd6SA
	bPrMJHezAsrUtDToOoKm+zy4fEJItVYXjc6cQ7GsJB3IqEdAoI9jFdTKHeKEiDKLNg6swfvgdea
	7q8jjqPTHpMXK+ur7GrgQeTnQKnMKs0H4XEtmWtV7sJGd+4oTkZD8tbPfbWiJcTdJFhuwu2qsFq
	WsbbtoxeNPLLLrbcZzWU/nwtah0NNI+t66SleSVLPVvBBVYZt/W4QdwNvC6enz2zxBilEzWvYGz
	+zO1tbsoE81hpS474+WP+c4CvhXSy1fFxQ8q01BqyFTHYvQQ2B/bdNByvwcl+yUXfuZmBcBwZBP
	JaGJXN8YVmtlNwaTF3w8za91lr0TM5D8PDUBz7hEpKbTY2SWi832LNDRDETWGqT2crj0osG7Vsi
	/8U2FlqpC6rYjHok9HbRwZA/WuRGYZpRG8M/0r3hgmOZLoV7G+e3TRcdOxZQOfMi3Kfip1jecqL
	42KBayMj99hPa7CBpAKwnwV9vp0BOo/UwoM
X-Received: by 2002:a05:6122:179c:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5e91f43c7e3mr4366320e0c.7.1791887067599;
        Tue, 13 Oct 2026 03:24:27 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab499esm8647168e0c.4.2026.10.13.03.24.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:24:26 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-990148ce1f6so1104623241.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 03:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdRLyTaUHX3uzJLbyZ1wqWWzqXrea8WvBbFsD8RlDr4UbPLfEyVlFDf+WxUjhgVWXRyyiYTj/M+92c0g==@vger.kernel.org
X-Received: by 2002:a05:6102:149d:b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7cb36987a53mr4125862137.1.1791887065725; Tue, 13 Oct 2026
 03:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718152500.2656391-1-demonsingur@gmail.com> <20250718152500.2656391-22-demonsingur@gmail.com>
In-Reply-To: <20250718152500.2656391-22-demonsingur@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 12:24:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
X-Gm-Features: AclHuK9EzHrMNGZ9VqEt7mZlsF4wljWQ4a5mjitwSzx9DSYBvOK99D8Xhx8xmLo
Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 18 Jul 2025 at 17:33, Cosmin Tanislav <demonsingur@gmail.com> wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Thanks for your patch, which is now commit e8d5a57e6d0ce827 ("arm64:
defconfig: disable deprecated MAX96712 driver") in media/master.

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

As Niklas has already pointed out in a reply to v5, you forgot to enable
the replacement CONFIG_VIDEO_MAX96724, thus breaking operation.

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
