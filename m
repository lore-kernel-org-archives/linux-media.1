Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E823921C1
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322792; cv=pass; b=mLY7HDy/sDzZ71Jr6lTSR1OgpA7Vau3bUD5WmLJQNze1T64vkfLNZtzEnO7Lhl0RthXZdtqP0r1zzVITimMHe/oKBhvPeQJ7Ws1bLgsGgSaH99XYY9iPBUdST3WbV5+1TBXc/sejE6bW03CqUujV7og6MaY7p0UhF+PXCobFHeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322792; c=relaxed/simple;
	bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5J2L6ptO0caHi1NlAgyhhmTHrVO+vBaAUVZgDNttJfGliXvlBJdnzR8B+7fU5vweqS8Iau0yiFq7V2kWdQZGOXAP5/jejN+T1CBwwd8+cnCSEGVXlLGl2Kr/G/GYhmAaWqLQ6/O6KhKQporXBQBi5gQRoLkhEMI8HG9hOaY1A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTYfMzGt; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTYfMzGt"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so4558879a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783322785; cv=none;
        d=google.com; s=arc-20260327;
        b=PJPC0G6uxeBclKk5hjn7FE9hNbfXGoqO+4ll6YiKfapI+WFkIyX5jSwz66gdqnjJ4S
         dBOT+/UqaNXcqOZQKE64nX3wF4XVoSt9LS0qg10M7df8WYNvRnyMPSwHuR2W7aWwLlWo
         mDyxmKlGIBKHEQjJdzhYAM7uYgmsXQpwiPfARc+5iOAd+bjfR4oo8ZcOIs9Dxyp+D2ci
         IPRjYPDYGtp87RMeV195AiRzhgmhovkyINtOozbGhz7IdDiQyRgsmjrM8irmA18wfpr6
         LPnceDV3FfvSNukqIii/OfAemBGJ4AvSR6UGs1Led6VyN/qrxw2A1pCN5MxuK/GNELJL
         rjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
        fh=IPo4KbW5TaBCgtwLoQasocQdJ/cXSyKeoBMHMUuprLs=;
        b=B/VRGTfbru3gRHV+ahT8oahSF5+KlVgFJgASHVbnmB90vB7CpF8qXnwUutu08aiBQJ
         kwtTZlQQCM5R86pQMLnzJvS96WuW5nh8Dk+jspogN8pSlmNi0bAlK0S91/YP1BRlZd5R
         ZaKT+AIITFuzUKWWMe49Rq+zZ639l8SHJD87NduwYQZTXGN+QlmB+JvNwPKHp5Niyz2B
         beaJUw547CRRTbbtzAJMqokaGsRbJCtxIsl6yqhSY3K1V/50QEyF/sHpAw+PEZiZVXvG
         J+nv5MvqyPPR57lb5Ji/kLr02RUFKPXFvANdMNiGHet1CxFFH1JRlj1eRED/Kx5Wru2w
         TniA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783322785; x=1783927585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
        b=LTYfMzGtS56W7LWXezW/IuemRY8EgrTC26F8dvX8NEwqXGrrhmc3DvEsQ7Y07Y8BtV
         4C8OGH5HltDGqY67IpWBRrm+8HyzU20HtuDIoV8+msf/eHuUiMMw2w+KVKkl5ekeqOO2
         tDZc9KrE2f5TRYIjwup1T4gsfhVjhUqNnrIYwYJAePG3XJ/jAeyT/fIVVwV+VHQLN6GP
         fdlmvrxu1UtBj0W33eNtDuVPfMICcGaB5YK8tXYxvLggHe6o3ro5GgvFno8TQqXX+05g
         bK2nKdALpaa4gjZYkNO0+/+fZfwWO3RIKusfec9jD/iIJlueUKkfS73vsXYx5G16biEa
         /57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322785; x=1783927585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
        b=dplfqvtwCzw2fYicpyut8RUvpTJjN9VDKi+ffzAVLtqCND5z4h7uFKkpYuwfy3OA7v
         chP0V6hOoz1VME1GobxgjV8NOa7nNnIAUupO6qCPA62wRHI3CAhdVpvnApTeERn4i7Is
         s8oK2yAVDM7SM5IQVb8cWgBWd7oLiIZeFNN4DU/S9mNxpA7ZAg86WbtycOXghuhfQwMZ
         2HA0Y8KPkXy1GhM8s2otjvc90iMk24xqSrMGq5dLpv9+9LOm6Tth9+t6b7vySWJnMIxN
         ZPFuds5fCeWVcEHm0z/CTW4yv4BY3Xf5uVdFCOH0bZ4mKoIzk0mgPU3BbC+W7tYtQaFA
         HhJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQB/4sJ3DV0jG90SUWGYpMTOQF23dp9YzBT0aoJbuPKb5lp+tbCX0gweKwoaOiKadFWLg+Pqd6AhhQ+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqLzGz1yka4wP4XEJmRkrnEf7noIZdL5YR6YfX1T2d9Jmu3Ro
	FKJlCxH8MJ34L+ClNEqCo7gn++35C9oz/CQKtekYXHw7mMx6DD7GjbgzpRSdlaI6cbO7LTC4V00
	BjnBRqiO99Mhj/q02kIyNFfO3LCFwgeQ=
X-Gm-Gg: AfdE7cmSWf8iNdVUlYaXbE0RW87n6RKN042/FwIT6ZHdwFhuP1D6qYT9SUfSAKMvdwg
	ndN5DRIpJzQj7Nbwmntvu3dNbT2ITif0XDhZJyE0F1Vw0x0RB2eN1wxnR8zv3g0iQ/83CofaCSy
	gZfnDZQ+4APpA5FxRTjTTjQkLEz3jowYREil76JQ7YHBUdIz5oh4ZQGHx3CX1EdjdEIeJOWAIOj
	LtgZfPNeeIdvECxxd3aTfGGXLk5wvbRkfjutk2vCdbn2C9N9X/MCbZemSqyTknIzBZH1nhCTFTm
	pc84ZB+UqwxrIVqOq8yuvcSoMG2ADhCZeTbzpbNBas9eEmbj80/uPI8+MHWJnw==
X-Received: by 2002:a05:6402:43c9:b0:698:3b7c:7e5a with SMTP id
 4fb4d7f45d1cf-69a1a4b82admr2848463a12.38.1783322784554; Mon, 06 Jul 2026
 00:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
In-Reply-To: <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 13:04:11 +0530
X-Gm-Features: AVVi8Cdm1RuMXPdrRdKOsGqpaEOLhwnxaIzT4a5wX3sh-usB8LZMdtuLndCreJ4
Message-ID: <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:58=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> This is a huge driver and doing half-baked work doesn't make sense.

I will try to send a patch addressing all the "else is not generally
useful after a break or return" warnings.

> Also if you want to continue working on this driver, get the hardware.
> Almost any cheap second-hand Bay Trail and Cherry Trail tablet should
> suffice (of course one needs to check the specifications beforehand to
> be sure it uses AtomISP camera).

Sorry I cannot get the hardware right now.

--
Best Regards,
Dileep Sankhla
