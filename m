Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A496A426405
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832084; cv=pass; b=aAwoeDKjjkMdwul2+jx0mkZIq7JWxyDkeiQmGEhYzMH4jNDhtW054amvObfISBsSOcPkmqQVneGn3AhJDS+UkzB8tmUyyHtjpWnInsu9OAuMVyDwsoDrRiFmZ6Hxamw6Nw3a4NpYs3GD+ARimiYqeSKjMcP1OH1ZhiiDg7sbQUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832084; c=relaxed/simple;
	bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gihhO6AHIxm0oPVPl/kjK8zwqoUmK9IEklmVok58+92EJazEHQUCELEpbFCYYhlTS8D2OJ89gzBEUXM9/fAf6g0bObo4Fjxu88XxIC0MJJL7lw1mn/Q2/oKkIBaiTR2GBVvFIdHjDCLNnG8+A2gBB6gm/dXTJIytqFFh4o8uRkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hutN58lT; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hutN58lT"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a98f260f85so15748141fa.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 12:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791832080; cv=none;
        d=google.com; s=arc-20260327;
        b=hkeyutib8y1YHIwCzNdfHaxC1LJTjD6GKCZbINUPPA0cUhd6iq2xCKpjkpS1fM4KYx
         MHqjPauiyQ6/meOAWQpCq1oR2JjIozNjX1jN4XdYzcKbJowUo+ztT80HwD8hdAAgnhvZ
         Y531xUWObvATd8nsFl7+vtLuv2t6oifaHTN/z2hhWIhBNd/gtH+4xiBEaS3ugawoTAIs
         vSgOF894jTqUasMUib/sX92NNRcmhaNYClRCHs3s4RsiomyHNp5/NZ5YEh/nJnruXTvk
         cq+5QrrgdlYvUGnTqNmRoKTvGBy1oSL1zWVEHdt9oGuDtrVcF9bYw4YsoMSYnrmu7YEz
         Dy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        fh=Sto65R4mrO3/6I7rbhaSpQTHp0mMdvhRSm4fghgibMk=;
        b=UVNhdsQSzVzhCwVOU38AtbZOXZMKAESm4PBxg6dmLkjuug6SwkgENgMzPZKcUHIMC1
         cbNFmZPnZtDlKpBD5OtClTOvczyzpM4YRDWQa7lU8SSybxGCySasEebH7kGnD+8IT3V/
         bNFPG7yxGlluFpjPNA1xoMyvcHTwg/49dIqTeZTVwaXeZZDtdDa5M6qFVwJNZx2msTYT
         ihIX9yAQEhri+hDkS1LyGvINoCdoj1pIc9auYub3KLkAPclL2vz6HBTZIkBUrCCIw+3w
         v1ub/htkY037RjdAnVu7fWb2+krYNAB//CKrFLABiIPkws4tR3es5RgT1BvmmSMu0PuO
         Xmgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832080; x=1792436880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        b=hutN58lT0m+SCrzxLEDY1yvGXQ6kGUvY5rSFRFj1EYIkxc30DbIS21BLOt9Ev/o1Zn
         ToHHllGXlK1uMb0seeYH9quN/a7JVYCgpFxMVYrEOfqHZqO4YOvpDB2lkuNvdTVcXLWB
         ibFFdl1hrcFiZxJIJleURYmmNTTRZFvRi+oAEmLJK4BHsF0gL7YmnMEHqry/9L+rxhjl
         iKdlU8qhPmvAFX5s9f1oedVYpMEa/zdRN0WgQJwS5pwHGB7j1b71uMu8R3Ju12nihVRR
         YglNh5khAIEA5b4E0mgCBRUmmrqZS+MbSJv32JmX/2hN2t1EzsG5QI/zwJcUjX1jD+PG
         OyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832080; x=1792436880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        b=xC52gtQqj6wGtk6cKA4PfIZYR6kJhAlALPnmA48BDuKgAkZYw/7iwE3ynlrGtz2AQ8
         tkjjCtOID0C9T3RD0XTEO8ylXTAzXgud1QXaJDHgV1ObgixHIUF4JduMFsqb4XSsvXuq
         5hqck+zkkGbdV0MQ8FgufJS0fxvM47tf8IndK7+VCW9g4lO2BcnLQfkp7Y7hSWzfppev
         DVaaS58DjvI8V4z3aXKfJBLL24Vcizq/HqLG6aSJuK0+eBUzyd0qhiJCLtwcp47N8a9V
         L0SHTIq6D1UMRUWBxsjACKzWt2rn+KHvKXYzDP4HMVzmwbwXymlVKwru87qx3d6g699u
         9cCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtnfEQXHKO+RomFRlA+siGnLw0cI8HUv0QpZ6lZA9BZ/NG7m+vxA0DFKxtbpDcdLbeSR4dRbzOL2F9Jw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIg1yU/pGvjGK7bYLAenUseN/5xHTVVwqgN/GYuMrJuIfwMI4zK
	cG42JwdMpNYE6msDwmaMjwN5fcqpKAfArKSYTpLTKQwF+F0SUmDzhQR1WiccjmdXbYNiEki7HQR
	Zgp7fvebAZIVMIVUTNmC8L1ZYDQPJ9RY=
X-Gm-Gg: AYBFou1quPyVOvsEHNjRxtRFogSsdtL3nWJZXISwsuWimyhsP5fSuarR8hfad4d+gbq
	DWENUCk2APqBC8sr/i24/SHXKYhu74OOXRc3g++l4bNLxEQtOxhz+8Wrbp9uC/iVohUFdRqCZb4
	UJEevKmT/adsnJcbIGE1/6K3GRywr5iufiiWD2sOHaKPwQ+RGdjizlWIap1g8TOZTfEj3VYiDvH
	yfO85SpaLsdTnyznuMmeNJoLn6hWYDjojA0/U4VjtBIIcykg2ImHY5LqswqM0lGw3dqB/UZKJCV
	VPT0oKInqocN0nklL3cL/lsQVXGxK456gonUhuPv8dH1yZUtd+Y2Ad39sUJ8O1DCOcP4vA6FzM7
	MJw3Jdme87YItI844xVSHJV0RgZGGtcTsPOMrFvWgNEj1aOuxf5z4NNcNBA1p3ylNcT1ZPlvtsG
	eHB+8VepAt84u3TVqLhQUlLQbw/7j9wT9jwEIJYVeTOgCD3/zbMzE=
X-Received: by 2002:a2e:be0d:0:b0:3a9:d756:bfed with SMTP id
 38308e7fff4ca-3a9d756c4a4mr13154101fa.10.1791832080463; Mon, 12 Oct 2026
 12:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-1-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:07:23 +0300
X-Gm-Features: AclHuK8iM1Olv3dEWQjQsTVTum34F4zSHmBcCl-HukPLYcMHj5uyNgbV89OICy4
Message-ID: <CAHp75VdvH7T9qLE1e5w2PL+mkNS+ArAC_1E6uQgAE_XvRToiaw@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: media: atomisp: Make pmic_name array const
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Add const to pmic_name[] as advised by checkpatch to ensure the
> pointer itself remains unmodified. The array is read and never
> modified, so this change safe.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
