Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943267;
	b=eHM3QUpjbw8qgjxeIwxuihWy5Ky2FAkFEiNC+W3sLDwx8woseGA1q9adYhfwqZwDXsaY
	 8HcZA2jXiuO9RI48XsoK/OlPJ7/qMOYDu0D6slrIbd2YKrQCIrmy9DpsESczEJWHJEE4S
	 uxGiKFt9ubob/uhXQmZqpqW9l1EmhR32l3Pw4iv9c67no78g+VLEXVvL1aFZAbR/Zwe2m
	 MeanBcTBMSKELbl2fnHmeQclZzw1vp3E6Q5zwrcFA2LJH3WJ5cIhiXM8LSKjKQw88nJZR
	 zComfC1Fmt235lMMfpQZPuoDmYKNbuM/uMK97n3gwVerLEBALBA2RiRTxZScIKtJCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwdYhrgTBkN/NLFVZoVld7wV6jKtYbxDqrCph2g3kLk=;
	b=O1KnGeuc/FkeS1CYfE1E8pgxqJHMLHGQwg8prkK5LE4Oq5uVxn2VzhihHXIiHmcFLl5/
	 304iZqEwfgBuxvsGM1qgR6G7Ht14/TyC2zUJjEFN7mDGxQLQNY8p4RZ+2AZ/3veHF7CX4
	 TUegIpvCgfYvvaO5zs4fSukpRYDyyajcIKL3q8BGT9LCS4rV60DdZRoMZzjNvlC7VMbTk
	 W+z6Ocp0DrfolZci8AnjUZXZGSqeZbwfVnZWsuKFB8V8f37dmifWILtwO4cCKzkctIvB8
	 lGyaig1vkBoHcURt6MY7oMzcroXb53WN68NK4CWglsHRdWue9pJH9w/6iYFQMwKOnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUbFg6pC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F43606A31A
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUbFg6pC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17665505e9.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943266; x=1793548066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwdYhrgTBkN/NLFVZoVld7wV6jKtYbxDqrCph2g3kLk=;
        b=pUbFg6pCeaGLafevfQtN6qmdyX9arxUMhbN7MrMT+KmOUc0yqNaZaZqrTvdbhxltW1
         YiIWCnqICn/yESHm+yxv6zRXYRRJ4ZJ55Hl17ROCI4sGpbCvcUG8KkM/53j8EIQiNy34
         iekkYyULvPJDYy7oX7w88rqciU8vhqkEZksTHuRUM1G2s4PNFjBKC3fN0qJ2e71eUWB8
         MFzR9wDubGV6WMtFFmSTCw8PnUnrDrath782dSwDI97f6cSFXRCXmvG2rAZMf80UpcZQ
         J+gEUQRgK68tJh6y/Is3DJBb7UK3e46KIhBqLj9ftdFQI+J/UqDVhpRIpiPcmzNLzEpP
         F58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943266; x=1793548066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwdYhrgTBkN/NLFVZoVld7wV6jKtYbxDqrCph2g3kLk=;
        b=oHYXex+X23Inu0G49aNMBNSTY66uBuIHGBzv157prYlMTYEviS0+RktyWRY5PX8y10
         bCMKklILJ4S+tzoih5HzeNYNiEEDg4q8yaU5qpeq2UjQaNY4oVkcLEB7cP9ETdCETEGP
         2I/PSLRA+y8/ZlbSnkBhr00+yQOqHdp7TnDzfUPCvo99o4dkQFjTi9aU6coIR2R59Vmk
         RiIXtJU6R1AnsGnKXBO6s57+6rt9fQOHWNEwis4a2Y2sl9GrnABAED1DNJuhu4n+u0vk
         D5aSR3uG0EqFVVSJVnGYN5w212NVmATBcFp5asgQLJuywMwl4x7Beyse7sgEU/3QiPA0
         kDdQ==
X-Forwarded-Encrypted: i=1; AKwUvByVs0/mnC8XvU0mnh20DnprT6sBt/kZNNBgaxBMp956A2LG7DHDqM/pSJZPFYIc057SWs6jT08nDucHmg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1mJmmqkbiqEj+NCNN+tqpW84eve82W9CuGTKMYA2AoTZWx5eN
	FxePqY/DLyXHdhga0PuNxvk/HV70gwuUgPReFFHDOFJ+WKpEwnRMpgBV
X-Gm-Gg: AYBFou3hwL9FcLvlfg4Tm83DLnqy/QhcsVcJ4tGPmzfzfm1oRAgS0E731zIMPCQt7ru
	yHFGCrpQegqRKt2jThpXzL6BKX4/k6CEt4NlnNPzjoDR3/ONGPTO9zlbZFx/gBVEScVSd5OQb2p
	ohVKAWTHlXeLaCoCpk2Z90Pcxgq/ewXai1In4OseNYwz56bLjf04Dz8fFlw89XT9Z7Mh9t5eekB
	mfpeAnG3V7i/rT+kA006tADvKVJLXaunM4ACBTNW+L6qAQ3yx6RlRbqtvv0kTxKQAxyo6DS+wtf
	hhvFN2Ve37evOEEm1N5myOdRpxuBNaGKbiAqrrWeBZXLxn10ejPiujegsAd+tzsxaeKa7l6Yczk
	j0Tz7iTbuajXkZswjMEr30+y3uanLraQ/eDgRWO91Q9fPCKfKVCNbgL3beiCFy499sep8ngOmZV
	yvXrs1MkC1Lp1efIgDeU1NFW9ARJjOZpno7r2U8QzJqFHz3T2uDg4sbAtboZmGvtLQoboYekDYb
	evTACRMtjL+VRbzTst2UH0DRW2k19cgnFc8qWM0Siv52zXBfn1+I/knjlcKEp4elJkNG7gizZmn
	4yRpnmnXHVmlKA==
X-Received: by 2002:a05:600c:8183:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a35ac99b77mr69181225e9.9.1792943265629;
        Sun, 25 Oct 2026 08:47:45 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm161730455e9.13.2026.10.25.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:47:45 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>,
	"D. Manresa" <dmanresa@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: ipu-bridge: Add the Surface Pro 11 infrared illuminator
Date: Sun, 25 Oct 2026 15:47:41 +0000
Message-ID: <20261025154743.39801-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019162722.25587-5-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-5-lsa.uz@pm.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On Mon, Oct 19, 2026 at 04:28:11PM +0000, Sergey Lebedev wrote:
> +/* The infrared illuminator, strobed by the VD55G0's GPIO 1 */
> +static const u32 surface_pro_11_ir_gpios[] = { 1 };
> +
> +static const struct ipu_sensor_leds surface_pro_11_ir_leds = {
> +	.hid = "SMO55F0",
> +	.property = "st,leds",

[...]

> +	leds = ipu_bridge_get_leds(cfg);
> +	if (leds)
> +		sensor->dev_properties[d++] =
> +			PROPERTY_ENTRY_U32_ARRAY_LEN(leds->property, leds->gpios,
> +						     leds->nr_gpios);

The property entry keeps pointers to both its name and its values, and
here both point into the module image: the "st,leds" literal and the
static const surface_pro_11_ir_gpios[]. The bridge never unregisters its
software nodes, on purpose, so that a rebind can reuse them. After rmmod
ipu-bridge both pointers dangle, and a sensor driver probing again reads
freed memory for the property's name and value.

It is the same thing that a20c843c9bc4 ("media: ipu-bridge: Keep the
clock-noncontinuous property name out of rodata") fixed for
clock-noncontinuous, and that D. Manresa's v4 fixes for the
link-frequencies values and the lens-focus name:

https://lore.kernel.org/linux-media/20261010155626.2766298-1-dmanresa@gmail.com/

Following his v4, the name would go in struct ipu_property_names and the
GPIO numbers would be copied into struct ipu_sensor, so that nothing the
node points at lives in the module.

On the same hunk:

>  		sensor->vcm_ref[0] =
>  			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
> -		sensor->dev_properties[3] =
> +		sensor->dev_properties[d++] =
>  			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);

Manresa's v4 1/2 changes this same line to use names->lens_focus, so
whichever of the two lands second will need a rebase.

The Surface Pro 9 needs an entry too. Its VD55G0 drives the illuminator
from GPIO 1, as on your machine. Its DMI strings are:

  sys_vendor    "Microsoft Corporation"
  product_name  "Surface Pro 9"

I tested it with your driver by having it fall back to GPIO 1 when no
st,leds was found. In a dim room, 640x480 Y8 at exposure 600 and
analogue gain 8, the frame mean goes from 22.0 with led_mode off to 64.7
with it set to flash. There is more on how the series runs on the
Surface Pro 9 in my reply to the cover letter.

Fernando
