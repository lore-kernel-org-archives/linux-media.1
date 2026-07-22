Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE32D5C7A
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784696959; cv=pass; b=px+ta9abW00yqpAP5/7xvEZlmnF0KPol+fTSOyBUzpqQuNENUOengPYaPi+dbmCm2QmiRGJEXRnP3SHwFlYZVMQ3Cf5YsQTZ3aUZD5ohioJfiAjffzPEUOB1dC2EMF+82/Bb13CSeLP2Zq012LGr7HaWdo0OHWmBzdCbkSktVh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784696959; c=relaxed/simple;
	bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMZEXQdeV8YuxemfuoauMxbo3EIJ9deP2VB/RKtKK6gIeQnj8x0L6nbFXeQync59ShZ4Obir5mjmMAgHpNaUn/7a5sTh0l6yapxWo9Bi894/Wu14gWyqSLk1FgqsgpCNVTXX7xmDq2UGOT0gjQqNHK6BkAMgM/7mG8NQLSoWViI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpcn1b+B; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpcn1b+B"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6008675a12.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784696956; cv=none;
        d=google.com; s=arc-20260327;
        b=dA4zb4frh9/MzTF+guc8m4qyFvfXd/LKPBxYZP5KVbCJNZ+wK7JFpnzaJpVxuJIWZF
         pRPNL5dNJ/tb0CB5y1QKVhOr8LSs3wJLKBOStlmDsDfjQ90vMFrv3dJgWmLqn3ng8dN5
         hLg1Pu1u1GIiv99+GtR3kvnuP3OGCNYz5l/1PzyIsNOJQRMhR8BK471FIPxo4tF89BzB
         aqPK5Jq8Ot4N/qH30SRHy4/DWkCwJs4LjdvKvPt5aoHbHsW5yltnDpAniWsmciOC+7M7
         PpvGZbgN3TChFHghQcmL6eNZW3AQ3fkH7FKhCCuftWKuXSxIuFUSyc4pStcQAybMuaXx
         HcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
        fh=ga9x1+5L8bktmnMAmjeQY/QmNaNYGs2+e64eq4AYqwc=;
        b=aYpFDVcKnHAwOT69pqRR+ZfyF8SGlQSFfuO4phbCKpxoo2m3/aduqmwbOzGBopQp2/
         4wxEcVUoQxzSI3wVu/HiHAbcZcIfmKUsZiFiei90O1B5lu9X0OktuBrH/0TiOVGDYxWj
         wxik6cpqjLSmuKFf9kdTYonCXjLrztwQ0nJtrJzQUWyjK6t4GbLKO0s/57sUu9+qvhWp
         UJw8vInUOiQWktpQat5w+T7FF+JK/kCM10mOSr3V7ddUXXXm6hMCVSueZdykNJx5q+Od
         SYXvHOl0iYRgzSewE5Ey/gixuzuxh2sSGGQiNODZ8Hg2beEgWyEgu8yEJTlwCdz2eWZN
         O3cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784696956; x=1785301756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
        b=jpcn1b+B2zMZp1In0fHJPqqVAJdkXpWhGNI8hPdBoO3fzWu84ati5kVgn6XV/iiLxn
         68YCicRawSI71lLXRn9J+AdPNj++ciBP2DcnI8e4eTdXb9v5tJfj2SajAsGub4zgX+2p
         QxQkOXv6MZwxe1gVXYcHqMSSyFucLJRjGQe949ZoKuyqIwGHLU2LSkVthbNGT3ZIhUH2
         FztbgthG94LjA3SabYJeflHfmZLm2V3uk+N2N/Zeg4zg37z2L5SChYAvDVm8CPUgHchZ
         O+cHIetyAIelcJGGsfsEFt4no6tzM+pmuVk0kisrK0g8a8Ko+RVCs0gAGlH/YZO/F1QD
         9u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784696956; x=1785301756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZV1H7qFCjGMn/+apiefJo28+9UJ9Brfdx63iX8AgJE=;
        b=VQJium2exEWW+KWJ9pvjm1Dfk37Uw+MZF3sKEFGnIJC57trr9bTjPpthIY6j4KrTs1
         7mUuehrqSoN/3MMbrwx7Rwno5veh61APBZx83YDN2Ief2CuEXSPVjP7549AgAzQ2vd8b
         lmP42rQnDApWaE+heOgmYA9W5x0sRGwvnjqENoFUPsaCwrBP0BAOL3hUhyHaD+XCFgoC
         dmB2IHrcnULFPwmOtPjOML1juLS1s+0omU3WJKAkp/UgfkKn280+L/k5Q1cUc6DplwSC
         nplcKmol6dKeakwh6n+z/Hwx8hJdQb2GnBLloRxn3ijIMiAlnRNM9Y92/jJNQ54pd23Q
         lYNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3lzXxVqXq+KT3nU/K1maTuSX1IBjct9O/jDasd66NRDWfzWgaU4eioBH1+ILHIduj2/TPVnxxV+HTjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MgZeLyeKn43/KlMCHflqM/EQhRyYsyLY7IuM59iVnEx/x5cP
	kDwmNa33s0bcMZ8rCM7tWLdVAopzlSz3PLILcMbslU8scymztDdVv/qTx9yfcW9TlPfIOgaXWmk
	ASdkxiUHlKtJL3UmIGk/mB/QaTiUqjf8=
X-Gm-Gg: AR+sD11Uj2MPk74e8o0q1va70s4L7zQbr70IRdscv+Q6KC5LqpaSmD6J9OkAQ/i1E5Y
	fhv8dFtVou5Ii3WdgvqZehx3lOmshLc7KNyZN2RsNOP6f4TntniwGYEPuLMcN4DEyDtNWwYChYI
	w9b8QJEqAg+BpGs3GmtAcqjx05a1wY00gPHTIKgxaZqTAGdugH07GdEUsatp6r+xpTF+alZMOqJ
	gEmPh/Ohe8lpjDkZDYk6ArLMY2wldnCC94MfhhLKBVA9GLNhEQuJQh4C6pbRWzvzOZRGrrfBpJj
	EXA7O/n/6ngu7Sq5+OjW8/Rb/xfHnO/NLglUsO0yUPoKd798BaUdENi4EayXQyqN9UwDLzgMyfx
	hmnAasXxt+yYag4KMr7IkkuycDHGq81gijs9wuotpPhYzisGPLf7iuBI4Bsc=
X-Received: by 2002:a17:907:c00d:b0:c1c:1e4e:f924 with SMTP id
 a640c23a62f3a-c1c1e4efa62mr241487066b.34.1784696955838; Tue, 21 Jul 2026
 22:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721214238.840406-1-nikolayof23@gmail.com> <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
In-Reply-To: <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jul 2026 08:08:38 +0300
X-Gm-Features: AUfX_mwHptLmMSMI2WVQ_9PxVGk8MMb3YFOxZQGbq57RK7yf_6MnD51WAeLR1qc
Message-ID: <CAHp75Vc-TaNLkQnck=OFonuWMWgdaxP+cVh7Oo+RjUeOWLfZEA@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: atomisp: remove unused functions
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 7:58=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 22, 2026 at 12:42=E2=80=AFAM Nikolay Kulikov <nikolayof23@gma=
il.com> wrote:
> >
> > This series removes functions in pci/hmm/ that are declared and defined
> > but never called.
>
> Don't do it per file, squash these changes as it seems not so many of
> them (I assume you checked the entire driver, right?).

Note, if you want to make a useful contribution, try to clean up the
below header

include / hmm / hmm_common.h

It has some ugly macros, instead this code should go to the users and
then be propagated to each level and refactored.

--=20
With Best Regards,
Andy Shevchenko
