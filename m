Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321084;
	b=JtYog+ojthxJ95vIBM5eFMNeM+T16jgzsfFtZXPECGEVtQgGDhN6BDcvyV2CfVI8x9ex
	 RdRtRbo9VrCXOTzsCGzkXB+oR71GRwGuj4G3OQUBPHUNbagKIkqXtW48+EEF/UPsJfJv2
	 OTbqZMosGrldMBSFrgerWjRaOCa7zM24AMO6WMIPNghOpxMCUxnu8ApgaeHoT5fTDiasl
	 neVU9zuryOTvjegSgQtxuqo5/ByTmryAYG5xG6BX96z3MLSlU4ZebGPcRm95mE+un4+GZ
	 7QTMsuysbiI0bTU6iBH6N7Qe06QyAle8ap4z27HTGo1yJs6pSv9qGaA/Cio0VAd6BuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
	b=Grg+AtU9JgUehfJMOkptMvmlsuLKf1gZQLk9eoD9v7QUUBbG6Jez9lijOrNUQENt63y0
	 Cmtbv+8jIdtRk/OMvyAKbowG8SaalBYFRkKK1yf7vyS27UwtWQWC2iMCeXKdlCs7YwEqo
	 NjDhoWeZnzpTwlEkNk9oAvyrLrMNWtIgDOY0OaUBGDf2v6YxPnskwQfB9M2bmFP9Kb25u
	 3a11o3MblpD7n8isqFlVj8DJubIVxKcbdub0ZZdXtJGE9gbaQtMzwaHzLuNIHTnhFqsEb
	 Bq8Cqwd7egU/BLPOGrrJgqyCgs3kIo5YXH9UZXqrSvPz/0Isl6Z2y/XHcdhW0RWvm4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=s2u1ttrh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF00606A326
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=s2u1ttrh
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d290b10a35so813097eaf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794321082; cv=none;
        d=google.com; s=arc-20260327;
        b=XQX+Xt6mo1feFOssi9/b4fXrUE88UFukMZKo0iJH/WcLoC+zOYwm/bD7vmxur0RGAq
         XiJiOEJpm1RubIL4x52xAax5c+uwmPkpnfbokcVZ9t4xAGBvAYXBrq26MeA+JmR5I9al
         RKn/fQMdjQ3tVVuoEw2CdG7HDs79tAelDyrAS28lursUmRA+nCe2qE7XGuSk+lSCzf+W
         RwLabcdGwbrScTTymPEf4ZJoLfWox7NFGF67eUU90cludEmh+PunwtkJdGK0Du3Oe8aT
         G3XcnF98D1HZDH5McD/dhsXgsDjHqOHkfzUhGJq3tJrJuTKMcDkZLZDUmRId48LTij2O
         WOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
        fh=BJHsdRoqgRHQWeIetGCc3RfOozZExVmsMNgrMeNj5uk=;
        b=CYhBDpLtVWURCvgL5SP9wfJUjPBzgDzanF2UQyMyeRl6ltoxUTVFzhcjUG8jR1Je95
         spNOHJxi/0TXSoWribmX5B6At/uDj7DtYWLSit3cRiqsrjlitDGqNhjz+7mHkdH4jdol
         0aqv74I3KopeWgJQ3vfcczlo9ctHOPc/DvZ9+uzQ2SyaVlNqsJue5c04Uqf6b7l9RHw1
         i89rc19gdVezgPKH2c47yG/IRO0ALWfmV+1uAwKo5XctS+Mn5G6Tk39v3XOG61smIm0s
         HxGtBvn3P+AzDeYwS+5APY6zMX7RMX+iwNuOtJ4SR6TbfLz/Cdbki2XRAnzMC6g8jE8s
         GoEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1794321082; x=1794925882; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
        b=s2u1ttrhX5AmUNl3Tnp3e0Zwc1EpMtqqNoi4LRUWxJhDxfbtDFUeXNNHzlZtQEPekB
         z75iH7JkVY3Q3uHZIi++1c0TYzouyFDe+JkuGXKJ1e/UoXSq6KpsLMXrCOGXRfgqpfhf
         OaGBR3v5waPeNut++si8sV44FBRAt6+BO1ztQ9aqZsJoMSIXss9xKVFLh+wf2OxDRUGN
         0RIYGnjkNBPZn3huvoDzbRlnwbR6f2iSGgQZeJB0jH6Fu+Sjp6xrD88CcoVJ6npWrMb7
         7dFon6efKVH52iKvyxaSCCcVWD+OntRRAZWBPB3zB1RfkU9rgfRR/V62195xbJdhwBQs
         AeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321082; x=1794925882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
        b=DzdA8R03Wxeijo7rUDISfJGO+KihpM/BRBKxpjnnuBDAeIOWvo7NQSWP32bmdhj4MK
         eEnMAAf/8Sa3xytzLLLwhjBXIyhyVG21RV0WHWZmk9EsDuMFJ9JEdy43gay62TK2oiiZ
         xKwSpshj2kNzGtilf4v3/w8o6X3il7Ez5V6dFwW8fZSeXEaV5CF9+hIBxgFysWOR3Svk
         p4tp9NDWF1MQZtFOepqj6Yo40tXxZeHAv9vu1aVJU4Q03Ixsp6/p/BF603v0lFlUjisQ
         Op2FqmXzUPw4YY/OtlVtn9UZIWl1zFTL0C22CRLPpq7IBoKFJ/gMTPkckinv4klQbPCB
         +oIg==
X-Forwarded-Encrypted: i=1; AL+hErGm1XBYSvSzgbVRM20bBqhbUgZBvton1+cwhK7AtdS1s0mfRl0iQRVaKAeC7r4AMs0WNUBU+kvhS5vcxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ho57mfq430gTVIu/qY+1hO2OG99JHo7I4YUF6i7h0cLqZ2lYq
	76ZjX2n16pygJyX2kcTOvnccFeMjV94vlj49wVFEWDbB9jzvfGywtdXwdzGbk3Z98PgP+GNp709
	jD1b70z1/oTMztLGFKi1RZ4GjzW6a6VjT/+sjjSHtLA==
X-Gm-Gg: AYBFou1AI7mmOamnhtijNQc2N7b4E7OlDQh/3tfid6p94CgdPGyKB850JP//cPaSOP6
	NROcAauzkuJF5NHei9f9ZEIIFUE/jNzcKrMlhngD2i8z1drMBd28jhVgz5AeGr3TItyEA8UNosR
	IdG1Ozo6imeyNIrp7z6LTDZaPHPq0GcnEud3QqDAO8WDJbUejrFSVV+KUbR4sLvUV0+8a/pndP7
	JkV5yRZ1pWEeGuZCy233EToblojtu5DOy+kMUuVefxUY25f/WI1bQdqksKf0CnMxHWAIVH66JZX
	oD5PZrXSuJARgdlvdv5FblZtMfheoOlFpgGv5JD9a81xPfImu0DS+z0mgHaSAd5en39ccMuc05e
	uA+tn43eL8b8WnIgLkZhBotddrT28QnHRgL4pUsgRtuC51nMEwVstTDBPRRhPiazEA7Oqr1w9El
	I2LPv5L2aBPQGOmWVw6R5EOjeh48OIA2Xux5lpRUfg9Guk55ALDTl9ML5oBoAWpNuF6EdmW8s0m
	A==
X-Received: by 2002:a05:6820:3395:20b0:6f6:96f1:1bb with SMTP id
 006d021491bc7-718a4993108mr819221eaf.36.1794321081581; Tue, 10 Nov 2026
 06:31:21 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
 <20261110-media-remove-dont-use-autosuspend-v1-1-cc07e71b30f9@kernel.org>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-1-cc07e71b30f9@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 10 Nov 2026 14:31:03 +0000
X-Gm-Features: AclHuK84_ic0UdOeQ2rcg3KxPlmvl592YOsU0rOC64Ni2y4sJscVe72p5w5VszY
Message-ID: <CAPY8ntApNSnG-iAVpkez-qsWeEOW061c4ABBwaadWkXZ+KCQ5w@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: i2c: imx355: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, David Heidelberg <david@ixit.cz>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 14:03, Joshua Crofts <crofts@kernel.org> wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx355.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index c0dafabf5dc9ad6237c9c9380d6122edfedc96f3..89e42312265822428cbf0b909627c66415b3282f 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1298,7 +1298,6 @@ static int imx355_probe(struct i2c_client *client)
>  error_subdev_cleanup_runtime_pm:
>         pm_runtime_disable(imx355->dev);
>         pm_runtime_set_suspended(imx355->dev);
> -       pm_runtime_dont_use_autosuspend(imx355->dev);
>         v4l2_subdev_cleanup(&imx355->sd);
>  error_media_entity_free:
>         media_entity_cleanup(&imx355->sd.entity);
> @@ -1329,7 +1328,6 @@ static void imx355_remove(struct i2c_client *client)
>                 pm_runtime_set_suspended(imx355->dev);
>         }
>
> -       pm_runtime_dont_use_autosuspend(imx355->dev);
>  }
>
>  static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
>
> --
> 2.47.3
>
