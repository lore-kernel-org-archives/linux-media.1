Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74158218E91
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804063; cv=none; b=mcEo8ezR1OEGzF0qbBjKRleqWRWqq6QjXaFoOzFrKIyX5LT2mTbw0dXvpOGdPOnBdzXw+LETnYC3wnubxxYPSbSHZqjGA+mrYtlrrYvctqohqbzEBZYMbueXICqjhz8Q9qvTjMF3hSHgE21u5boYnQCu3s/ZOuVh00YsNuCQnyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804063; c=relaxed/simple;
	bh=gs/gqQmiuGJPRgDVoAOyk42QBoxdjFJEltFMo7Qk9qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVknPxSTdLyrPw9rvvfdZjBipG9tkyoZtgujVF7rjCsvl+HhP1179Rflpb/32ZUrmAfMQVLgLn+vIPBasoAyEJhUx5JIDuxYBhRelk4GP0vDmNw1DVv0hDH/Q8sGM43N+eg2ZUe9xlLP60haQWblGYN17Wz/Dr4nT6xIY5bxd40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L3AvtEs8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L3AvtEs8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso1459663f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791804061; x=1792408861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gsg8EifNScHEUVxvT3uqoxT1tHpvY4SS4mBwaSokXEI=;
        b=L3AvtEs8ByG8jBWJvKz5CHDlx+exxI7Fyx/+ad9ngOaUsYSIKqKp5JqcDVNureawZe
         wOEdzP/bFOVg0LbjdDDexYZ10TBPbHsUc9vlAj3IK3hXbuNBggVw77rZn1jM5zDGxTxr
         p+4uabNMH2DAR93bQ//1iH/YcoAwbxgxwbW6XUfF9NlRiOHnBjxw4KwPhdC6plXjSIY6
         MA4Ap/Lq6sew/sc65t8Xjw8SRDVunRI648zH4BDmOMEq/y5xivRh2LU5aeiGn9RPCq9V
         Yms2OMKy/el84tZzOdoDETLHq4ScihZyZYVZGbIIGiXNebN2je9vdes25Om7fKTTp8zv
         XYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804061; x=1792408861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gsg8EifNScHEUVxvT3uqoxT1tHpvY4SS4mBwaSokXEI=;
        b=BNFzhipYaGf9rAsbLDmBWXb5bC/pxySVr4c8Jr678SZxxlDQSlqdB8I1nkQoMfa6wd
         EDoYEZ92MMix1ZxFgrwM3F1EGKNg0SpbYUkjUSUEUjHfxRB7tnZMQiLWCC0nVuHcz+5L
         nHRK4R4Tc/90l5/jsOYqfCT7AESEUdIxaKgBV00TAGeDzOfDrbSRhmC+h4hV5m35Z+Y0
         6AhXNxNne5ppnL0NTvQePn4EagYpmGE/LPr8lx16si+qRqMQm1m6RvDbgtBeat5v2sBi
         Ot8Usy8PxwrJY/PGJB1gertW+Mo1v3YmR8Q0H8jQHYK9R8l/nhyKeNOyh/JS7dSYXz/e
         fmhA==
X-Gm-Message-State: AFq9FYIxHyrWGV08E4gzC6cWVWX5NOc3vO4LPMVHW6B7cXwYEHcnN0+7
	HJm6O+cVQRE9+9wo0tXcGGwFGGwW3khGoTCiDc9OfL3otbZ2GPGnmq5oCbWylWsr0Zc=
X-Gm-Gg: AYBFou1aisR2i4sJ8Mi7bIf2vp4nA3UEGF9I96jP2trWGLuriBLwX0lgcF8taVtYwn/
	WkjSviC6qm0aIo1FbfA3xfsHRfJU71Kj/HQOSH/llhuVinnFvLJVDP6P0WuBh1frVxWTTuFowya
	RRw6uw1oT+NQ5y599vk3a49kXCxTkf0YR3Aau8mjPQqlw6rpGiA92j59kwA+qpSU7VpBtYC35P/
	aKZwtDH2PQl48lmkMLrrekof9n25x95QIuf+ITs10dImLR1T13DEcphDUnL/A7mgW3EudNm2OL0
	2gPZow+zc/XwBMIvALIz2HraxUjsfL9ihnAJdmEkqL512GoMTuSnfDAtR3We8fVWyzk4iXl4qtT
	5wqBjJvjkKVPZrU2AVQapdJeDHOHS3nBgRb7qCaL+Gmib5rsbU6JrDTuRObjswCIG3wTZHIJgzW
	he+NYH/B/kwK/qbJL/Q9A77RYVTKcl57mHMdOQ5dNu0jShhu3BZ8XOQxt2WZKPTfB6OJ+9lnjx2
	dEaiEQYkTBh9EctZlhZkHGR/XzEDawB59sZoJkp4t4o49vmbwCbtYiWlj2A1A==
X-Received: by 2002:a5d:644a:0:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48dbaaefc28mr12200183f8f.56.1791804060587;
        Mon, 12 Oct 2026 04:21:00 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dba1be42esm21245073f8f.5.2026.10.12.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:20:59 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:20:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: Add GC5035 image sensor driver
Message-ID: <aszCC_ZVlsWxs8gB@monoceros>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261009072733.39877-2-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pguj65rce3a254rn"
Content-Disposition: inline
In-Reply-To: <20261009072733.39877-2-nicfio@gmail.com>


--pguj65rce3a254rn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/3] media: i2c: Add GC5035 image sensor driver
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 09:27:31AM +0200, Nicola Fiorillo wrote:
> +#include <linux/mod_devicetable.h>

Please don't use linux/mod_devicetable.h, the needed *_device_id
structures are already provided by the respective subsystem headers.

> +static const struct acpi_device_id gc5035_acpi_ids[] = {
> +	{ "GCTI5035" },

	{ .id = "GCTI5035" },

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, gc5035_acpi_ids);

Best regards
Uwe

--pguj65rce3a254rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMwpgACgkQj4D7WH0S
/k4Afwf/YIp3/ci4EQEvLxgN5obEhDn/GYOqSjCfyIBjnmk/T4CNHJKJUrauMWpI
NqlkItXPGb0wl/pybOf/8NIqFLUMvp6nnmNfy6DgqVOqSvUu6g2uOc3GQuPQOYVm
iHU2XMyYoH8k6tkJ2+r74jv/D3SdxJnwraWOP1oB4D7+aF6Zcnui31vTnYPpzJga
NKOix1Zfh7ouIyRS1o796416jo9ewjR63K9Rg3/FGYrJxCiYeWI5Wk+tH9npwHxe
+qrCrExgWdLY5nKb7PUnm7oWCj8dnYZ3L3wPSd36CwkosLArYMh4sQIEyjCrD2jR
554MVjU4V2EnykGc0mS4gfgtQaAC0w==
=xAGb
-----END PGP SIGNATURE-----

--pguj65rce3a254rn--
