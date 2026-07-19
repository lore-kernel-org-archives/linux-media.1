Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825039EF2C
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480749; cv=pass; b=a9XxMrvZSBOy6+C2L+FQnOszdeUZyMjNuTGIb17zqOPbf7qS4NNa9zLSGCauRyLWJOenwpL1NQLkdY1HFfawAqkefPCRYZ6RGwho1HAnn7eIPIuxjAKTPqfB3iH+vfq1875ds9D+ZujXlIpkKik0NwPInJV2WG/FJmK1HOOG8/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480749; c=relaxed/simple;
	bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXvwa2NymiwvMCe6ebLRdOn8QjNRAQBLkZQWRRxqPfqPARvkawrlBycArVRLZAPMVWgq6AAkm6MqoF3m4XAHeExYO/Xdv7avPeA7gFlbmzAXZaQp/e0u92+pjJiYc8vETvmBum4QSzD1YiE5o0m3M+MvQ5rJn5cbkijPXUDeg10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/ibARXB; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/ibARXB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69e54d9c8c6so1000935a12.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 10:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784480746; cv=none;
        d=google.com; s=arc-20260327;
        b=Sv/IMcvpTO4SShSrcnB2bHdbjEPeiMrazmPU8fO3+AsRjah73tv3veMks+aft2EYtP
         SCysDaJF/E+d6kd8Th7t3Nc4HbUXuMk53Vd8UBjlMJbEe/HyuSeYNIC0ITz6qMP0L54L
         q/2ayMlD/PB4n2PJr3cLUo1l+0oyei4U7NY9dqya6Ile5G5YL3H0eI7VNHO5uobIUIcB
         x+Vl2Ze2nW+BCmmGezNK+Wbm30uGTqIxWyLrXFiFw2bMfhr1MWsUdT2li6MpbzeYF5GJ
         6WK5MLa/FqKu1n9OXq73vmdMbVqeeI/m9FwIOeDMCUnESycMg7FJoI1IFK6yFLOPEKeV
         EUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
        fh=PstU6xfFaHrXCGoSMDZp75lHXD+TSRLCQZ6lueMm4OM=;
        b=cOezHnx+BpJ12mQqpYaz90GStzMrrmcjNQSDpnP+Wv76teNXX9AgrlKmAA3lCcV5+j
         epAxRQUW/dmlthyNBHQx1Z0OJg8/IRIVOo6la9c4021W4gcr8aCIXOwzCdWZ0QxpzGgQ
         aq2YGATWrMa35PH+L/P6imG+Wa5jzR/MFQOhhL6a12TGimaEv+PpxOlTNS+P/7INerGN
         04+hmYakEq0TUq7PiWSRmUsZwXUEkMPifNBivWdLF6wqxo0C3SGCH54LfWSq/OFFGHqI
         OV0HG/4befTdL1LMtkSk/fIl6cfeadmeEC6YHW3t01Agq5TeIpZLC84g47zBdtnDmO9x
         949g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784480746; x=1785085546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
        b=G/ibARXBgU1xCv6ffVC8qST5hDNjP6fQ23CCKAERh4oCpCojGCZJUmuj8CYMYLcgxp
         fTYPAEZUwRBXEYdkm5JluOrcXTS0LgLdS0ivNEo0ogsVKlfnn9QhxGQWr1t7ic2pNyrb
         Ip1iDr0rKYFCv2QypgSGbB2cjsJ4nAri7RjU3JWHe99D6vz5qOy8u0V5TIwff3YmOB7s
         OrZtZwua6v/i+c6OU/tZ2LzL76TSZC2nyH0rODfIkgxwUhrwpA0oGzgyPIrAk9kXUNH3
         ytSay5+7heZunyimk9Xd8BoM5vujvG/6yYc1KPekmdcMq43keqzrInSqymtLM5GZ7Xav
         kb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784480746; x=1785085546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
        b=AVUO6x4/GMmwDOW67Z3ktmosF7VdGj2IHOs3mHwBLxprn4Il+ppdBQYihaOy/YnwlJ
         SZmo2eXr9CdUEpVPnLh8dNEN2IpKvVsH+EZRHT3s8UnvWHVMp9Bp/Mx2hGKSvl595did
         94ZhRIozdrpKfSrJFPsTsbExZim3zYb0G3dCu9JRRU0cNh8p1yvlwGSDphTrk0ue1ZLz
         ZNuiWVEbsG/+lp5DT50K+cnPrtKSnLEmS3x2kTWau24/A1SqRb6i2N8fgO2m+nEudCVd
         lWTcZT5VQzMl2VKBnkzJjoOMCw16tVsJ64teF+7sEjrOXtOFWBddMTpPG1ahAObfGZqQ
         kO5g==
X-Forwarded-Encrypted: i=1; AHgh+RrkqwKCgZkJdGvfGzjv7nFphl0viPYNy1ofYfK92gOBRplClh/SJHgovaZO6rkyQtKPTE81saDW7TgXrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8qJ5X3L7GRECYc1461QTCOXQB5YYMW7gLwa036DcB9oamkZkW
	weq1xuaemM84OJ3sAwsMY7xGSGAp1FwH+YBv9DzjSR0cSYoyNJx2zvhxeEMoYA+J3zwI14JfvHQ
	gzZAJ8JFsa1ctubgUfKhl2zCrfmaxjj0=
X-Gm-Gg: AfdE7cmbufInLtclcavdNp5m8Fh30aunYIYZ0QmlCM6g6VVuFHbUq+DjdsSEXh8uvbN
	Y+khcEwcTyloJdd+8Spj7qjExWDRXfs7ndPmzlR6tvZFq993mfzFlD/8LBulo+iq5mqE36Loim4
	ngJb0FPn61pbHuHrogl1RaNDig7etxGFqxlWWR6nZwkDsopCtPeoO/Xm0GApKFJOufoz2I7g8jk
	bBLj7eACCvBPVVHOT8GL17uSMujf72R4EQhHPJVDMXMEuXm+cTbTD/LLN7NRtr9s32D8lK4H9WU
	BLX9ryMiDjp9D4BlHalvxNn7Q3w9W3X8kzne8XXHpKTShqOyUBF2LnfYfWUg3PtlUNIOA6C08AS
	qsSN6EWkuJLZXpZ3606qXbPnRu9tEkPiHl8qviCYFa6S+uGU=
X-Received: by 2002:a17:907:7243:b0:c19:6659:fdb2 with SMTP id
 a640c23a62f3a-c196659ff83mr139234766b.36.1784480745603; Sun, 19 Jul 2026
 10:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com> <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
In-Reply-To: <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 20:05:07 +0300
X-Gm-Features: AUfX_myfCDdH32sKULvBh5dqFWF3CZXZytomCB3ZW5Ks8nranh2hvxutWLy6QoM
Message-ID: <CAHp75Ve87ZgaYLaSAX-ev=BSwLwVE9TFfDhXtObOqyMWRivexg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted
 debug module parameters
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 5:09=E2=80=AFPM Prajval Chaudhary
<prajvalchaudhari733@gmail.com> wrote:
>
> Remove the unused module parameters 'dbg_level' and 'dbg_func'.
> Additionally, remove the 'pad_w' and 'pad_h' module parameters
> to prevent userspace from overriding internal ISP hardware padding
> boundaries, leaving them as internal driver constants.
>
> This addresses the 'Remove unnecessary/unwanted module parameters'
> task in the driver's TODO file.

So, this patch does the blind removal of the debug parameters. This
driver is in the staging and it is for a reason. Taking this into
account the debug facilities are very useful to have. If you really
would like to help in this area, research how to convert the current
debug facilities to use so-called "trace events" and "trace points".
This is how it should have been done in the Linux kernel.

--=20
With Best Regards,
Andy Shevchenko
