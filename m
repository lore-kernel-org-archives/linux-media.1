Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013018;
	b=yM8Cl7cNwQvgIXEeoA6Ik3nMY1v4cXBJJt9knDGkbvVrbScZTREMvCo8kT70GRc3aS3H
	 pIs9CIr4dFXTkwTgVbD+g7ojWO1I7lKgnruBEME95eE5l5KgFUciQlZXXk0QabV+fu75G
	 9lF39mjXDX+1XeFr2fODz0fT/jOtIpwzk/JoLj2MLXeL8dPmgSQLedv7dPZ28dMwRGi4p
	 UXYPmdXkrPLJh5q1I0u7Wq4f5denHQpEnvfOhX0gfFcRVKFDlwqddBHxi7xELtUw09OVt
	 T+g0VyukXHtFb8fAzSH0LGV3J9Efg2A8gXTcr4qg0VuoWjIMfW9PBmtneOd8NTzvOOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
	b=i59PFNB23UjkRYxuHyavQKYpe85CigH2SicIqEqevfsaBOKGDtK/d1ZQlPNGGDdsECPJ
	 YJJEu9r6NRgVBJBctvANMKTiwtPQwvuO4MuJC/C5GLWSP05KLak6qKHSPIN+jJvZPgYPj
	 6WQTlCuZqyOPu/7U6xQscoCPl8lNwOS7x/p6p2LEK5stjhAByDTHPd+izcBiXOIklDKAv
	 lnCI2qUZEHzLw0kxNRY8yjpeD6XdWyjTYCN2VGdS6/SeCWRw/ddkPNZ5PMhjpwadE7ITj
	 Ol7T6KbVv/EAGl7Cyi4W6nLAYnALBgHrSH6WhoSeOzW7o+QRcVznqtGIl/xF7QqOMIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FF1MZ3tb;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F0606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FF1MZ3tb
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17994395e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013016; x=1793617816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
        b=FF1MZ3tbfMa+I3Hp68i+GoqS5xJQCOAdAEyU3AgVRrX2Vlf8WAQZW2Grn+avxiLLI3
         zdyFYKtS2WtCeGEOowSYBKYvnBZoK6tP4vh63lFMovCllUsG44h+mEz1IP6VvoGlkDXq
         YQuSCMIIKLJxsmdEVQiN8lNZVo4pv6I/vH4DE8Lz5sTIW+YC6TN0F79yue+AirnmCI1g
         hsyKgsxNOhuJSYTB2XYn2ufURC63XVMPEW+7g3mTqpw+6CTLsASK4oTH37/2KjxQhBi8
         ZPP9bS++j2T8OH77fGX80QI8Se2YofnpLSQvTal0KDEw2Pc7jKpHmlg/EtqEoG8Ga1WQ
         /V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013016; x=1793617816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
        b=A7rlu9PlsUU/qoRkbvYvqwHBjro/HNJ8vzWuVdirFAaBZrDCReavX2hVGvUwZYQAWb
         PU/2TB8Gag6sNQhpiFkDB8JTvyyc/0a2RIkYm2BHTqvP1gObDWtulSZwWCq1+vex8/Of
         ku94ZM/bdNbIUJPwcHjb+FXaSPKM9EsQZ8b0b7FlTpb1TreHwF1/LgtBx95NvPA9VX6F
         y0rDrHLuHX1wL4Cg4KBKGy3jzBvYhW1TR4rDeKS4+pTaT0FyAuRuUrucH89mn5nhGBj0
         YHzVbH4HGp/CDkMHg5q8F7UinpKZzRDNewfjgxGbpXU17OdKRfWprgOUR0CDBRdsCLAl
         GhdA==
X-Forwarded-Encrypted: i=1; AKwUvBzZZbZ0o86psUa+nKa/m9ilFS8sn69EPzcoEHSJ0Mpgm701EzboN4fdbymbpXp0MntdNAJte2TSotQGug==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhYDaoI5lg8OTN4KjwW34np5IWGuHFjDdpovU05uKhoQ42hdlD
	p8kdwXX1ZSvh1QN3tFJ3a7Hb7JwXyzaYbHn3GgQBQuFEfmurS2eCAAFi
X-Gm-Gg: AYBFou3ipHcvdSGq6XweyqmvEs/DtJY+raPdmfH6+zK43taY9fGdWOsdL1oFP3mT5GE
	FJD61WQaS0QhZrRq7Fib4UnE5OYFcWxHRitLvKm1P5+3l8tz2wxh5THc6bEl+ohTlsFefm8WY5Y
	FUlrSszbvHLU1R7rMAm0rGpf02LszC1DGTpq6tdBPiS7DaFpmPIsav0eDsjoMijryjCCI1A0PTX
	CbNm9PgtwrHUIYrPYc4hX2bqMdfML9NnmVk98Xnd4sg4mfeRhTPJiS9Mo5F8UmbFHCMEVF/g3fZ
	/dh0EKD8ugBiEcUqRqC7ZVEtCa/p24W0lSK3OOdUPpAxCvn1LICHoKkS+WOfepVgfphuGPrFHs5
	palLOPZMZKAPeeZn873OXp0/knr9aRPkYo7KciS00WHu7A1g4eUey/Gl8msYfu7U8jR7O5gfWH7
	clKG6h/vU5A6EsLNZw9kwRiPJseKqP0qIgTPDCfS9FxAD1Fl7NkbBM99q38HDCNLMACtvBar1HI
	9FzdZ1ZTb5IBloRtvDn2kTbgAaS94zc15Ozrf1vJ2lbMjE3KSNWhLalz8iOE8hkg964a8eSlKTO
	w04r+AiRhLO/pg==
X-Received: by 2002:a05:600c:b86:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a35acc1129mr115388295e9.33.1793013015679;
        Mon, 26 Oct 2026 04:10:15 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm499383945e9.1.2026.10.26.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:15 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Hao Yao <hao.yao@intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Mon, 26 Oct 2026 11:10:10 +0000
Message-ID: <20261026111012.33347-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025162614.95385-1-lsa.uz@pm.me>
References: <20251208035122.2147678-1-hao.yao@intel.com> <20261025155048.42957-1-fernandorimoli11@gmail.com> <20261025162614.95385-1-lsa.uz@pm.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey, Hao,

On 25/10/2026 16:26, Sergey Lebedev wrote:
> Fernando, a run with 0 in place of 3 would tell, and your own DSDT
> whether it still matches the dump.

It takes 0. The DSDT on this machine (BIOS 23.102.143, 11/25/2025) still
matches the dump: the clock _DSM on ICL0, ICL1 and ICL2 calls ICLK.CLKC
with Arg3[1] and then ICLK.CLKF with Arg3[2], and CLKF does

	CLKx = (CLKx & ~1) | Arg1

with nothing masking Arg1, so 3 also sets the enable bit again on the
way down, as you say.

I changed the int3472 discrete module to pass 0 when the SSDB asks for
24 MHz and 1 otherwise, so the two 19.2 MHz cameras get what they get
today, and swapped it in at runtime (the _DSM runs on every clock
prepare). With the previous driver at 600 MHz, the infrared sensor goes
from 57.60 fps to 72.00 fps, which is 57.60 times five fourths, and back
to 57.60 with the unmodified module loaded again. So 0 gives 24 MHz
here, and 1 and 3 both give 19.2 MHz.

So the value depends on the generation: 3 where CLKF takes two bits, as
on the Surface Pro 11, and 0 on Alder Lake, where coreboot's Tiger Lake
and Alder Lake camera_clock_ctl.asl document bit 0 as "0: 24MHz, 1:
19.2MHz". v3 would need to pick it per platform. I can test it on the
Surface Pro 9, and I will run your driver at 396 MHz with it then.

Fernando
