Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092383E51D4
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789926965; cv=pass; b=Yjj2f1QUXFgWT0Lijv7myOFTgnqFzGN/10XPiznpgCBZPNR0EDGvJt54rSbfrSdG6mRZwhVS2ts1iJTyENcPxH2R9Y7GOqyiNmg1NmwQSEqU/zYrrJoBV2VlRoVu9wuDTCQ75x/yDm8k0eAwHgfNTMMfMEYG9v0ZTG7UML9jDsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789926965; c=relaxed/simple;
	bh=te2L0i5Qwv28wF5BUdZAuZILF/MChhmxu0LZb5TMUeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BYiDaWK2UobhhdZ8TgT64vRckyYv0U0DVEuo6T1uCkKD5Td5Q3nTC5MXUcJv5TbXYQTIX51szztgc1v3M1ESN1PcDOwo2oQ5lDYe8AO67Ie5EUZbbECE/GfEA4DIrQEQ0wkbJyr0uu5Y4O8fdmTIBhEpnqtJ7aQLqcDTF2xho1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edDYWnem; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edDYWnem"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so1888395e87.0
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 10:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789926962; cv=none;
        d=google.com; s=arc-20260327;
        b=BXXm7WdFoZ8hZ1trvTONBnpJQuNEC5qtL1UrtZ9gcD//IxwkXImijSLw0xQD9OECvq
         ebu5bpj1hChRUkqzOtecD7eN3ZS4m5azSspIYawrReDtMpMdF2N3X2hSe2dZ4JBL2SHv
         SCkdGv6bIH5U7tNv2BNQb2AVWBVRlxXN0UNFYULWFu2yKyg0K60dEZOHZ3PxGQGEUEoE
         7YTV5W9S4frgk/iujFKkSrmPL578tKAy8FJyO1CGlywTIb77UF4QKaEIqFOh4U62EYJL
         L7cUKPTXDgq2WyGsuC/ce6qtCcgUuWPUBbLSHwUyaGelA+wYU7bpEG6qBFJy7g0pw6XH
         PjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=te2L0i5Qwv28wF5BUdZAuZILF/MChhmxu0LZb5TMUeA=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=mR0pz91rNxJR2q3djbagRHdEoj9POn85roRDs0f6DlIXzTycrKv0RdReiN/ONfnZLH
         OMefihrcta4NkN1tN/Cck7/pAncBhik+hDUfOz3eefnzI24HnCOzMJ78ea8XAyrrCiUt
         s/6VG+D2kxusy6Q1m5eYBv0YqU1Ut/3wB+yNrP4ShvRyz9oQacEaCW7dEV/VNVZuYMJs
         5yzFGNHfbWnHKt293FtVHP7RZIbBtDrs9clGGUEZJAn2MT0Y+fLx4ZpRr+btGBNYnaNU
         RwTLkoofkcrPsczdkuqNyhypxCWEvt1sysmUufYgoVH4Ocqo1z3e8PoeHTHEhlCHeOcT
         EMZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789926962; x=1790531762; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=te2L0i5Qwv28wF5BUdZAuZILF/MChhmxu0LZb5TMUeA=;
        b=edDYWnemhH6hK0U125h/P8ifNPe2rYMntCc2vIC7Bq8N3FGaEqp26elWUoLQJ5fpiU
         7MjJGvUrnPLnJmS3kyJ4locP+D4awpH4SYybBc5rCv1ffvz3P+izhTetg+DJWmjxBEs0
         JSlSNWw2zf9aZ9E0JdrTM2+nY9ZECb6Gd+LEp7asK5KFSh/NscouSTmIftKPylkGsiGA
         81DvPv4Qkxw29B27giTgrlLaQX2wmGLhOHaNADuIu9FX8SSgpzh4DSjk/dPzcUQhCpiP
         Ev9/pGFHLBgaxLNxthh9IoMOqh/tIbo+n1UPS5a5tW1teG5D+HMekK4pkqxTrX+6lbsS
         TZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789926962; x=1790531762;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=te2L0i5Qwv28wF5BUdZAuZILF/MChhmxu0LZb5TMUeA=;
        b=oFr3wxu9fl4ZNeW4A7FWbYAcZOlVdpLX9Fd7cRfhlIuAzAmn4BiHkkkhuXjsKR/OHe
         0Kb0DafhCIU73Bm5KAciM5IBFZlFnw2OMlD4BLVZ1+0DOV+NPFoEUgnewP+5dizG/qOM
         JH51eqWrigiXzib0l+ngsKurmiW0ltH25vEsUDDTNXsNVoCKfAL7nOIkyIXMyZq5CruT
         PY9Aq18rDUZyVFCPtUYq2tnumIXDgPSArWy0AID3V7vL+T/tBzD3n4xnh4figwTYxD4W
         uT8u5kM2uJwlRz8NVfREomLeq6yal85H/7lUgmiahRv6mngh4yV+u5e0r47bAKehYlo8
         mEQQ==
X-Gm-Message-State: AFuF++kOqDDorlFvAsaA2NApIhiN4VxTMkzkjs2JatUulkF3PQu1iC+j
	XPnRDPm5zeAZ2wxC2wPwbEO87X5Bjf/sba+tI+axLWejh42LAiSSGzAUlOl3rBLCbU7DTqtu28Q
	hymZL3TsxnOJJ2bR17P1dG6mW/BmNJ39NRx5Z
X-Gm-Gg: AYBFou2rsYQ+yoUHfYczBlYhLkgy2qCxhIrALs6gGA3gdWvMeHlwMS7vo2WmcX8EQEs
	CqQWEhcWIxpbYEJXuiDwYyawb/BOnXln0KMilbWRyZa6JrC356/nDzYWpH3S/9059cW3K5wO5GS
	5wW40Mj7r5+SHjGR4uwudcoJitMQ/lRhU8KSZFiBzcDiI4K6h6T37I5VY5p5VuAw0CXQnbix5A3
	7IRw35b9s40+//CN6eOWF6cogz3eGmdeeoeZkFM9Mc+bDI1q0PC4U28/ocHHg/e+RQqhNkgFjnw
	UQd6hpgaf5egrHYyIlBEmTcUT9vzevZljBvaIz/tc2HF4ApfdOhs8j8PMA==
X-Received: by 2002:a05:6512:31c7:b0:5b6:183c:5c96 with SMTP id
 2adb3069b0e04-5b8c1859816mr2591649e87.52.1789926961570; Sun, 20 Sep 2026
 10:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD7dHvAH_G16EqApkkCDkj0uCX=tiqTmA=-OYFe+DoXybSJoPg@mail.gmail.com>
In-Reply-To: <CAD7dHvAH_G16EqApkkCDkj0uCX=tiqTmA=-OYFe+DoXybSJoPg@mail.gmail.com>
From: Nathaniel Stenzel <nathanielstenzel@gmail.com>
Date: Sun, 20 Sep 2026 12:55:50 -0500
X-Gm-Features: AcwNN1XW669q4Q5CKmL5t0Rji5JctakhU5kA6G1eKHyve6MXX785x5Hso--uIko
Message-ID: <CAD7dHvDjL3dx+08nyy2zQRscSrJV4NcCvpOaCNGdCjwetHJ9Dg@mail.gmail.com>
Subject: Re: Hauppauge WinTV-HVR-950 page update
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

https://www.linuxtv.org/wiki/index.php/Hauppauge_WinTV-HVR-950 has
some outdated information since the
http://www.steventoth.net/linux/xc5000/HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip
file and site no longer exist.

The firmware can be found at
https://github.com/OpenELEC/dvb-firmware/blob/master/firmware/xc3028-v27.fw

On a side note, if using Linux Mint, DO NOT use the amdgpu-install
video drivers. Use the Mesa drivers instead.
