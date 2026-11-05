Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862855;
	b=euRDmlmosiAhPx++ZuINr8gCTr8IqFqsbdqRXg+VvL/pBtpfst03JMWQ4hR9ccurXfdy
	 +59LqlRsltucCSP7TIItHOMqMTFMkea/Wvo9+tlHGMTNag3CflDMyPllNV1TTaOFyEUac
	 rCTUvJhcTJIR0fQnWGxPfyY0FaPJdvuRK9drRNlfRFBMjo1xr34bLiUbUmbJyEv2LQADH
	 +UbBh+tst6fu4+d6fEIEdp/BzL/yKjw1yU+2n2KQ5ZVfcOpN7u+/pnNWgUO4zdo5cKr7M
	 RPCAcUmQRYjyXPfb0NlZ4HQQEmvLaGWU4CpCgPvaj86clPI5uWKISbduludukZ4OOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
	b=n1bTwTR1RoCqBPLO5HlHXRL/zPy2vo3lF0hHsasI5hUsw3GxM+DeNJXczlLF0/a80Wst
	 tC+xVENoPUKvbw2VhVMabLj856i/pJb0D4UsashVui2cCyTc58PR7ll3A87Z22luU1tPN
	 YmIOWPsVVkBuiEUL5jitpsuKLM8Nb3wKenqWwOD2Aw7+k0Ae6o8hfi8SKqLVJmQHvgNBc
	 FXsPKGjlfMba1nyDansft3s/mlGv/OiqjVwG/x+JdAp2zf2OEnB6tslX4aIsYlbhZHIVH
	 XN9rgFtFEG7eYOqCIvpcyBWXu7VAdo7BqJm7FNHaN+NcupmRjcA+9DCJ6dA4amcNoaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMbn8LkX;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D806E606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D806E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMbn8LkX
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4910b863b84so161595f8f.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 23:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862853; x=1794467653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
        b=UMbn8LkX48TkVV/CDTShDi7prBVUOSb728TYzmNyGUoCZqYQNYFu4D1ob7tL0CVIZ7
         jbwDx45YApvsu6u35QgOfYx2YAjnw6fy/LzfHanucf0mVD86VnQgHU0CeACTPUygoVT/
         vE0epIDdPpTzA6dL83WY3VVlcJpqe+tc+s0onuFazBLFa7ylBHIEIba7Fe5rLD8c+GMq
         Q1sHAzKJV7cNO4Il6kN/jXFh0/MohQ6gVMFlE1K9bQnCtXhsh1muRNM00Pky1pWyuwwB
         6UbNL9swVS4Ho+RGBRsNTpajc/GnqTAEJNLnQnG8JIB9qVicZFudARuin5NLZ+vxKW4M
         1g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862853; x=1794467653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
        b=hZ/F1oGTI8OjOMOhKG5vH6AP3uJUAv22P6UDjKP9J/KvaoWbfAw62DVZRUu+krBWf6
         5+R1GTC4fECoV0Ii5rukLdYSS7xHlL4Gfcg3gC1nXRSg1TlCDnrtMIXijTK2UVzznzFd
         USZlmGj3hEWGz9PQFXcVfEHiVdm27v37iy727KabxLnDVITWTqRiJyHoO88aWcU9V9NB
         7lPKpXgiqrC04OeaxbB1X8PZGa+Ef2UZ1kfQtzpW6dE73M2aZ+sq2sBth+oAlprw8rxN
         6R+MnV+9aU/hQDmYky03a6f6G/drWtk5iapRqd121o6Sh8a1MjSl99d/t4z6oA07Alyu
         KY7Q==
X-Forwarded-Encrypted: i=1; AKwUvBya+oSCDFVTQCo5eVyiQOmVuBjH8AKS1J7ClXPTZGPJPD6QvHgxZMKd09blWW88JKKtad9xmHVC3a2XJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4lXB2yOOP4YjKw8xAvzLUv2bI5WE9xgC3VdRjJw5D7foRxR6U
	C86sozCyyTylI507giWfjSdpCFOzDkVAoPv5M1Zt8XYv4HbhtNjKvJph8MctycJMgCb8WLiS
X-Gm-Gg: AYBFou0er9/7Ed6GsbVgiT8S4nZVIxn29OLHq0M4te3bZnMOf6B78U8ztqbiC9MGJPr
	WCmoodVSlV1zaDtv7RmIc6PQy2aqGoVRBGfOvxFgzbG82hCqr2zSIBjRrt4CxmVNHG3tkptMm+C
	02GOy3HXaB1uugwGu8lwtwTbJif7FxXYYBX4MFOSs/ynkkvN32N9vr6ZiTpWJALVSfyAR6CYQO+
	bedO3N1riiQ3Fj9mC1Ojl42KVmAuPA6Cag64EQiQHMC+OdCbOxuH+K3b2gE/UJCd17d3J7i0XT/
	MitB+293qvl3MY0Ry5/Q5B+2I2AlFVAMYslnd5ZgYNDM4i00kdW2XqkQaE0N9uIonXSOLo8nJV2
	+wK+L948YMBipfgeFvtKpTKG3CEa+858kwIbl5SyXBuk+OGxgPICp0gyTNu9IdB4aDHF07P9COL
	+LICI8Rr5gUuacpCSt7L4u/0JVzwDMHFsI2p2zc06ZaQ0pYdzEvubk+dBRBmjWxRyWb6dXICguS
	Z7krnWcVu0ZuDz0i/bipRf8lyPXCrZPxQZfrCLIUUJ6O6WDyg43nKwgIERNp15Qzw1W2qEX4SsV
	VPpaMxvrfUjqLs3INOSvXh98V7oXvyH7ppeJHCMssHp5rZwVpR2yZzrKkzQrrCfgrxXGRbMfVKq
	tKahvXThQJUmtGUiEWKd1crXqFyzeKOcdcB86ObElzWmqU4XLftUlwTmNODBhE7TVYAM=
X-Received: by 2002:a05:6000:2284:b0:48e:678d:396e with SMTP id ffacd0b85a97d-4911906d313mr2976092f8f.9.1793862852953;
        Wed, 04 Nov 2026 23:14:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm8347693f8f.46.2026.11.04.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:14:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:14:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurian Iacob <laurian.iacob@yahoo.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry
 loop in buttress
Message-ID: <auwswLdxTSjA5BTL@stanley.mountain>
References: <20261104222832.32471-1-laurian.iacob.ref@yahoo.com>
 <20261104222832.32471-1-laurian.iacob@yahoo.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104222832.32471-1-laurian.iacob@yahoo.com>

On Thu, Nov 05, 2026 at 12:28:32AM +0200, Laurian Iacob wrote:
> Use scope-based guard(mutex) from linux/cleanup.h in
> ipu_buttress_ipc_send_msg() and ipu_buttress_authenticate() to simplify
> error handling and remove redundant goto unlock paths.

Unfortunately, you didn't remove them all.

> 
> Additionally, replace the backward goto retry label in
> ipu_buttress_ipc_send_msg() with a standard for (;;) loop to improve
> control flow readability.

I don't like that you got rid of the try: label.  How is that related
to locking.

regards,
dan carpenter

