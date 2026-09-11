Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A642AFA2
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114708; cv=none; b=ARIBavw+ab0NRgDfc3rLmhixQ45nHfQOQX3JC8OE02OxKZYrN7lxXi80m2K1SWlfWbMfczBtf2WKEOgEL8vnBMqVmx1ZdPMvBVrHoUBLoNUVs7/hjEFp7LZvdhEYo2Fqhc/HKIu5pPaH1tMKB0cABoNwLxI3YqFKxK/fQz1vlUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114708; c=relaxed/simple;
	bh=hqzXYjp8lLur0oodbIXkOmCZD/o6X3sZFihY7fo2H4Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kq2nfpN3MYQw4TEz6xKkSuHiRzulmF5hIWLnvvlZxOun7OdsdsMwDMp7U8Fs6hYFF6GRO+jNzAJ35utzz3ERIDIH9Ox5daF7d3XgRZqSwXGrt+M7XyFw/kx19cSU4jOdvH6EeCcdQh9u2GWUjzsQKySdjnkIJDnLC7l7bO+SHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=V1J7MVfa; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="V1J7MVfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789114704; x=1789373904;
	bh=wCxrYO5Ss6++4/mbmOaOMaKFxX5MhgaYyImLewYcUV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=V1J7MVfa7bAJUhgo0maOdf7+lDeH5SRdqdoPZBJwQyyaidNjQSJE4lQfvd8QMHNcl
	 rJEgCJ6KiEFQOS8vIl7kF8re/D4gD8qwADKKP4lxVsM1JZNYzfAOuwF0q6sH0Lbudd
	 la/fislqE08mjtDLJHIL5gy/1bLjFTPSUCII2QR+4OFRDIPae1IhBFmbhS+Ib80U/h
	 WVrlRWSMeVYrlOLEr3WuTzAwvmI5rFgEe/axa/ACwkL3D9tfjHmp4mGlNlwgUZYyrc
	 Lk1UWpDxgLlZameqhShxJsp8KNg3s1YwtefzOlH7U84nkOZRHgk5WYtBXcL/mNOgo5
	 laP1JCr0mf72Q==
Date: Fri, 11 Sep 2026 08:18:20 +0000
To: German <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andre Gilerson <andre.gilerson@gmail.com>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681
Message-ID: <20260911081810.66277-1-lsa.uz@pm.me>
In-Reply-To: <20260910115332.7171-1-germanpapulindez@gmail.com>
References: <20260910112210.44432-1-lsa.uz@pm.me> <20260910115332.7171-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 6230b5f9ffad1b0357d524ba42ce17fd449e6d60
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

German, one line from you and this is settled.

Krzysztof asks for a full name on the trailer. Yours reads

  Tested-by: German <germanpapulindez@gmail.com>

which is exactly how you wrote it - I carried it verbatim, as a trailer sho=
uld
be - and exactly how you sign your own patches. That is the right thing for=
 me
to have done and the wrong thing for me to fix, because the only person who=
 can
give a name is you.

So: reply here with

  Tested-by: <your full name> <germanpapulindez@gmail.com>

and it goes into v4 as you write it. Or say you would rather not be named i=
n
the kernel log, and I will drop the trailer and credit the test in the cove=
r
letter instead - you found what you found either way.

No patch has to be resent for this. A trailer lives in the thread.

Krzysztof, thank you - and noted that it does not belong on 1/3 at all.

Sergey

