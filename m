Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B85142900A
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831938; cv=pass; b=dWgjaCOIu9q7bEpwClq823mBNvvJn3BaGC6nFfYmozkfTJkAnNhukjAHMrf6wE+grTMCtOCY+Rbe1VRD5Vizo6n2HFtDkxazOKPXiTnlr7uMWOtLoUAMSJNRXB56nZA1MSWAkY3Et4TloEZZX1wapfbrUW6wOyDOF6kJwfYihxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831938; c=relaxed/simple;
	bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cu8cKOuFTACWSG/H5t21752p5l3MWrEdZq4Fj5oceJYoVdm6bMg4/JUFmZMKtBP9y50tB1SbJyAqG4IOwM3bdT+tjAvSF9VdABPF/OCfc20DwqtG+klCa7Lg9Gqu5M84VozKZTpijf1wmCTVb5coxOBULn4M6kCaEP2SIL1LD54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAqr3BUU; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAqr3BUU"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9761758adso18362291fa.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 12:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831935; cv=none;
        d=google.com; s=arc-20260327;
        b=L/YrGgdoowaCavmLFCAD8KpP3r49FQQNg7MXJfS0X7nilKU2K9p3eAKQTWAc1yNfYx
         6WDz2eISmS8AUAo6agcqCsyA4+bIqqEA4O4BiWv1/28YmSulnxG35tOlObki0MjwP7gL
         iK6YNL6AmgcdW8PsTof2MJrNYAkoUoYtDJkVB6jJuLb4H6BhGzZDurkSnMZ0T2RgPlMF
         y8TU3M0l9VDMSMLnrYaVsQRBpGoIzm2W5nlWOJRTZnJMUVZvwEyYAm4EWEHuwU7kthI1
         1q14FLq2/riuYjbOwBFGZOInMJiGOjm7GRnKrQXZ+GaqVKLgJxnRFmjCVZSNyTy+zMth
         s7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        fh=Jhcs1mmULRtlap7W60li0n4lkOHUNxrUPl4WkiLZjbw=;
        b=k19iHuX12jTBSOFKjyz7agg39QONgbzGwlNTYSWAB1tdb71gaPgcuypSmpQ+hqWzms
         IbDrF7zQD4AkVAe/1SUyaV86qfdjC253TBnAvSjPIqBiVcEgeNMd51+kVAiYBuOyk4ev
         hRJSpawOBp7JiLTLSynCY+p4tQwC5rk4NfKdNtqhxKwjGHGcpa83WCgMhhJLOiF9R4wW
         EzvAgxz5fuk9yx/5uBUuKNNs/LI/A1mHMhrkToG1SgDkNHgQwEgoZEhX9R99Di4li5pe
         MpoK/qdZNx4DJMI8Qz1CB3Aoei2rgnuBHnbo751rcdqH5jCTrr+O7iO2KlmoUj9xn3dR
         YqXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831935; x=1792436735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        b=FAqr3BUUMWJwgzdnWGvrciVz3t/J6zYXWtgtyYCUqqXpfRWh7EmMTWsJmvl2cEktON
         9+Hb0yjeXZZPHbGO2ruBWCOC4CGgyCHNXG1tXx2g+rUy4EgczB7Di5j9TUKRd2+CDOM9
         /2Q1AVDQqjIcanDav8/OWdYgn3/nxJyE+jzQQ4a+qQxjYY8hchTEm3W9L6goA++QH58E
         yCrBiHZa/1agtlIrPD7UJZSf9F/6WUpTh476BC54kTVVSvKtqDQZ+TEc1x9GrohCcm/G
         HvwgzqWyRZm+i9gg2vM+kwCaAkt9+uNgsXOkYN8D11wMfe7XSePAsqIYostMpScuNh8d
         yrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831935; x=1792436735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        b=FaH2r1yBJR47T7NLhSyQAS0v131EOkm+lxpqPaQgJev3DS2QvZ5wTOqwaZ5tWKfXrr
         7PLvJlfJdtt61CBuOTIALFVwEWgnO9BIA3UGj69ytS/urQZriFx7m5hu/AJ5nhkMRB9b
         q+xpzYZbQHN8eaL2tLI+bt1b3IPeTR4Hl32RAEtyD4FptHesQ9dbncg5xly6zHVquX57
         ix2Z7yavChLQ7iSzA8PpWz+lNNENvVTI66GzkNMY3VQWnwMu1Q1XRp+OwbTDpCkh0wmY
         i4d35lO6bMaDEpI3Lv+L085SxOP1J4iUcqgCRbhgWcrR8mFin4DvNGQuEtdYLC2xN5wD
         m0Bg==
X-Forwarded-Encrypted: i=1; AKwUvByJoW7SlVETVE/kpK9H5crnkQN3TPQRjyt7Oao05PNRxJvEPMgEJHPqR/QS1TsfviIzcemLpilZK3cQlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsVJym6UamXpRnEgwSvdtVrthS2LUv4tHdOMb/RhOgJXl613+i
	esBdF5j/bJxCDe1A3Asp7eqFm7zfCL3S45LMnT1bURcB2/BMATk7qltXX+A2y/Wt+kI+HhdcE0y
	6GjENWTNXVrIymdHmi3MTXorrRDrtiCc=
X-Gm-Gg: AYBFou0h2oRAaT8vioTve5xXu2N/PhgyDQsRfDQYm9R08fMQgl7TUh0Qjb0n8JdblGE
	tTbK7vQAP41gXeUKuOTGL9JqGH5H2WBDi1Edkb43jH9prTh2b/ndRQ1GC+opyqy2iLikhfcobJn
	9Mi9DYPN/50ct7FF8lbvdYLGTxHQCo9MG8I09KNDcgeHTKxnliD+nB4Y5rjCGb7l7vbqW28BAH6
	c0fDkSHXCEDXVuBPYPoiZH8wBNXvhQ/zGjvertav8u//fBmJ4MSjO11YfImEMkbOvKRjm3psgi1
	4RlWcVuiC8PQnSP37GBeHAeeB1Xc6ImUuPStJw5zmM0rDuHCh6F2HcKmCe3S1vDZrF6xqXrSQ6S
	akF5Qq1KoKHibY70h4gODzcUDXdy4wArh6ZAVq9Pr9JWyoQu8eDGyQEdQe4WvEEguRMuwelXRLx
	G8JZ0Bg0gkBDdq0Z3iaEUaa+jYJfa6ZyKZOXOplaFe
X-Received: by 2002:a2e:a7cf:0:b0:3a9:d937:7533 with SMTP id
 38308e7fff4ca-3a9d9377a0emr13474991fa.8.1791831934709; Mon, 12 Oct 2026
 12:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com> <20261012161322.930099-3-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-3-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:04:56 +0300
X-Gm-Features: AclHuK9f5aLsO6tRB8JPOO5i8tyqnBzEGNnnFSk4_j7LARmv2pkfbPldrYw1a8I
Message-ID: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation
 and block comments
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
> Replace leading spaces with tabs in function parameter lists and
> format multi-line comments according to kernel coding style.

Please, read the mail archive to understand why this patch is no-go.

--=20
With Best Regards,
Andy Shevchenko
