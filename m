Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE43909B8
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691740; cv=pass; b=kgQcyMEyn2HV8dQX3xDGyQwHvaPePrWVPMqqeyqS75pJKOPEgPnyQQJAcE/P7CB09gGckk4j0w868QFY/Ggsl9KQvKxFqZzvwQl2S+J62+sbZIHchFSU5veVoYg3PGXHdgIsnCfv98l+AqFGjeAUi3r1kZNiOTIfkGxE9R9eywE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691740; c=relaxed/simple;
	bh=8Z55nOfNecibBt1FEq+yGBsNqq8Hmyzrvp9hgj4mrb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAtnNxhG6elTTkCOhyR5GJNIxqW5wATJ6gv/aSRDcQX/oJpF1F8fFIrLjOE2ShUv8SDQ1m9O7mo8+0jfPP93xMi+z5Cbf2rENVSAAz0q2E7eDr3kPtmLRns65CzMoxb3SDgqIHbrlXzrEGlxhXNd7280+O/fDftGDDOtNnJwJFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjJHZerG; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjJHZerG"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so281712a34.2
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 14:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787691737; cv=none;
        d=google.com; s=arc-20260327;
        b=XQ8tzYzJhw3JSOqv/mAW8lUBdQSsJB05pxw8GF33wfZ/HheYwJdQI5R/d1sRp9HQz3
         0b5Bbe72/ac5iZ0H0QzQ67Gi4OVtWkJIaFlqbFZe1P6xYJ2Rh0avU7rpeG4LcUSc83/K
         ZyoEhMOfUsNJ8sN2LfxQd1XMGqzLPIiZOkf+IxwMBGGWSZ4sZHMLUtliol9c+NmqCHdG
         5/9X5NnYCrf5LaUDvqnKLj7w7EiFawwOvlOB/MRZnuHrXTHXoUG89wi91uV+e6bEZArJ
         1tR29loaKWz65lmfBLbGsKUT7JPrGD3qOpykXXKA3swWjz5MA17WuzFMaeQtlhcM2BPn
         v44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5e1R7iDOVBGqKm4i7gvnb2yeuebWqXJlNe86yECIkaQ=;
        fh=xjk/1bfO1+d6P1w5rFSoDozYorwQgBXpA/HxdA81jCI=;
        b=mXEMFNEHPTlYWBqSJC79ypAPoIViKa+mQb7y16Wz8xTAhGlTUA9zBQvibokFTD0kAn
         hZY/P0G5TcNgHXx/ImU9g1tlYPs9VUzBavBO9KTTtfiGmoDmlKeiz/hER9eh1Iyh1LKt
         jIwXQWG93Mp+SOTxv5PFks8GeKkYW5meMoM1544KkwvCahKM8fl7hvslsc7Aa7BzIpYM
         4W65fycosLSI0THCsfoPKTpePWTz2rUsagJ3xqBrMhbjpFYQedLu83EyWyvmLkgO6pZj
         2LyN50qbRzjBuaU/firf4vm6AX8vrdoPg21D0kfG+oP8teB+Emk/RF75GXJZYcn+AbCw
         kqpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691737; x=1788296537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5e1R7iDOVBGqKm4i7gvnb2yeuebWqXJlNe86yECIkaQ=;
        b=FjJHZerGwdz1KbdMN1v7UFWRNLc09OOaK62LEnHhDLBlhPA/3w0L0B8R8zPCHluvoO
         XSCIVOQfcozsCPlO26pjylh630XvmB67uasVxTqoU8AVPwWBbp6MnRyQeCFADzpDArtC
         V0WPyz1LfWY1msGfChcFK9jRTzz6o3Xv4A/X75EEjAMmrju5d0QPF1QponqLrlmbqR0w
         jNmLkNkq5I5aVGrGeoOgmGjzbsTR0oxxR5OfntVXwUnPpycthGUQfBdQpvDZahvXqFKR
         A9OAHfPdK7ilBzRIswyDgHMVwV8QQogR4xIR8qG7/KCXu/ENLMX6hz1Q8vhxdBHUMjnX
         HQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691737; x=1788296537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5e1R7iDOVBGqKm4i7gvnb2yeuebWqXJlNe86yECIkaQ=;
        b=ma+0Qe5lySf0jTAhNfztpBd7AGdYnByX+PkDeL7O0B6ind1HcbFMv4PvA/nucD7DQ9
         ds0rJJ81F/s0IeRO40Z4VnHPl+X+NXgPVYtAtihhYcNtlBgACwc45cBaNGEr4DE+f74B
         ITO1/eb4CZpKkZHsLGIRcRXxfU0dbmdXORhPmIVmE7Hs5kGNmjPVKI+UcgBB1CwxgpMk
         oVpe5unBaQoj4GauTm38r6NbBQ2meV9lx5x6NZau5w4RFiZyqS7Lpt0k5WXBJck13OTQ
         iizoxl2OI0rXwhaVpDk7ZhK+YaDBZM7fkMBG8uCNgzBtE8+cojckW3oxrpNdzoTUZoKK
         /7Bw==
X-Gm-Message-State: AFuF++nekgvY+/T1L/BWB38IGpx5nHZm8KVOfU2ptvxJEaMF8lgjM8zi
	PB+9wnxxPtDFHzzTs4SAcIsRoLkLmHOyasJU9gmTMPbRVSET7TYAJ8jULvHWntnESsjqMyoqwd1
	RrcglnMtnoGY66lmEkVGSuN3wxhoge5Kp1LcE
X-Gm-Gg: AR+sD1373oXCLGSPmnNgcBpiYnOTWqh/1di2gLhbkMbqMTKwsCXKUXusBRQP7iorqU5
	s6shPDn+w983v7KJR0cA6sTKVZbkcDibbHku3cEXRyykgNVd6z+WTFVzcs5PaBBaiKFP2NZ6SNA
	oSzWhKmY0dtz6bt5c7rA3QT3cF9F86vCCqrprg7SwcX2y0bsmq3qUUhHVPHLqpJrRiNF6u84b0B
	QeCyOi3dRggiLU+N8YmBPfDC+/GvejoV6FxXzevn6VMPudZqn5lmiUjN2ArTSp5IUAlo0CGliWn
	B3nCFJL5X2Zar3pi6TBCCWAvehvF+jMZeoNiawWiKlfZTwOugMFIgUR/Er6Vt939TLGORXp0o4E
	=
X-Received: by 2002:a05:6830:6017:b0:7ee:38af:b195 with SMTP id
 46e09a7af769-7f4c4dc57e0mr1972094a34.2.1787691737171; Tue, 25 Aug 2026
 14:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825203553.3725132-1-sakari.ailus@linux.intel.com> <20260825203553.3725132-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20260825203553.3725132-2-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Aug 2026 23:01:59 +0200
X-Gm-Features: AcwNN1VtAJclNRsrkPgeHaIrL9qzOn516dlDtkbrCWTLTGf5OgwIn6sak7oDRMw
Message-ID: <CAPybu_3JSL5qAUTpL27GotvQfSzMtcJGGC68eRsCiZ0YwNBNaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] platform/x86: int3472: Address Coccinelle warning
 on an error print
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:36=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Fix the following Coccinelle warning:
>
> ./tps68470.c:164:58-65: WARNING: Consider using %pe to print PTR_ERR()
>
> by using %pe specifier for printing an error code.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/plat=
form/x86/intel/int3472/tps68470.c
> index a77ed32abe55..dc777dbac61f 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -161,7 +161,7 @@ static int skl_int3472_tps68470_probe(struct i2c_clie=
nt *client)
>
>         regmap =3D devm_regmap_init_i2c(client, &tps68470_regmap_config);
>         if (IS_ERR(regmap)) {
> -               dev_err(&client->dev, "Failed to create regmap: %ld\n", P=
TR_ERR(regmap));
> +               dev_err(&client->dev, "Failed to create regmap: %pe\n", r=
egmap);
>                 return PTR_ERR(regmap);
>         }
>
> --
> 2.47.3
>
>


--=20
Ricardo Ribalda
