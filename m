Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D635E953
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354001; cv=none; b=QGSRSAyaGoKODV4yxcJBMeyOd8tNVqvwcRdmAuRvzrkUVi8MzK2B8YUUdjGKKEAHLWXVrcbneil+KQEkJdTVSjKeiv/pRBmTejHarOPgl/38GPTX3jzs/L5fhc4ojrhOmLsJYcxPunxw3ZnoW9ks4HjsnOxJPnwTlYQPNaMbB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354001; c=relaxed/simple;
	bh=r2PkE0oi/VSTJVzcc6zI56DSvvO0dsneNQrVL+aEAKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egGedJ8zVxXyfjIbXborNgEI6RspU8vz9lX1oOsB/lqP10XJJ4O6K8pkpg8TE1w0dEZxkErNDemywcF7gIzR9e89TSgN7XkMJhSzYGZlrB54rZAKyKuMflvWDq1BEGR/V33huySiZ7f5kVS/pnpV36ny3hlS+ou8C7xFK6l1zGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMn5XkMW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMn5XkMW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1607244a91.3
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786353999; x=1786958799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39MnD4WMHl99u8wHNngWbLPAoL4NahAVgxuRbaUB5js=;
        b=BMn5XkMW7NvwY4YO6ZX1BKTeJsgLgAu+IPNxHYbk+A9MYob0pYv9KCpjQlM+eFwWhg
         XzJgelLxVBKAmfdCPpSRGgJRMTJss+rjGz8eAmER5EZCx029HA+xEuvms50cX7Rpu8wG
         wu72TRbcVc6rCiv41bNWL6CeDTDm1nLJUR7Zoc3Ke+7UD48xU1anIwIppG+jDYTiMRS1
         QLE6oyMT9ZuoAyIQ3f3hry4CyZlqmq/YS0D5L8CYXLG77tDeaqx71bBFoAXBCxer0zx2
         iU1UCNg5nu467NCnAycclNG8SI8fIGHpMnEuiHaytdXp5r4pZfaRzKmgRPaZgJPfqfUb
         MWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786353999; x=1786958799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39MnD4WMHl99u8wHNngWbLPAoL4NahAVgxuRbaUB5js=;
        b=O9y6fKN9mA6QebOpRKnZIFbBFci1eaZowcr6fBSWL2vl+uvuZVEXufwzhlxEAqNwwA
         az04U+J+/CwynK4iaWhKmEb38smVCc5USDB4t/sJqB7Tlwq8r0S4DDfkLM3YBNEf3u2r
         B5f9R+8rJlEb/cORCRDR8tS1kiAiw202LvgCfI4rzxBAeNfDGC52/MnoBOTXTD8bVtdB
         2EQiZQ5W0zNgAuFxLyZj/dUNNJLdqGfA76ipC2om4xnwMIu7u1FwV9JKZ41BE4WWOABq
         4LqKfMBd9+12qVtKENZ4Qp8Hs/vdXaQCZvgyILCRpYL/70lRWlqnIB5Jyd6n9SnPtP6u
         BISQ==
X-Forwarded-Encrypted: i=1; AHgh+RpO9JGpQWlOcejfPUqufcfKCf8+zZnl8vr1ipDtrSkf/y0Q+dmBJGNyqYFTnjBctrUzwWwysT28pa651Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyE+Hs/jYywFJ6yoq5Rh7hr78Z6xOXqmkTc2nUpwsZ8WeffLZ2
	20geWNNSXgH0wUpsT8eTSmp5AIQnSXSyBKpm5VrrhRJt9WBHH43vYE2h
X-Gm-Gg: AR+sD11M1ltUYgJKVhNA/G/XxbOY71/8sFpvoUSrlZkRV0n+UVG1MJyI2Ib9xzjBQSd
	ItoQQL6rTJUHEYp1/LIT1dMX0FjssXRiyPHNudj3XqrXH3XNY9/jHRY19yENrhAkpc/R2vpi2cB
	TlPIStyZav6TsLtXApNIAFKZ+x8BSFAg8AZzhDYzYFRywtW9noO/iSiJbpcGItmsZmQ7+c3nX3z
	fHwHHBBmWTYTtBOApzFKrOOHWs/gEA1sHBziXlgTxqiJAUfq1pVx3sLMQn5kQDEqdn/yvTmIrES
	PttzgWHMOpiBp+xlsjDLnuBVBJSBlF7y2BFJmOHjfNIvxNDrbAMAK+j5gRffklh/BTAEb928OLR
	kQQfLHkloTzKHBjvrMvKY+w8QeDXZQSZVdsZyC6PQXoFey2CWJfJhR0bJq9hO1RdJm82aWT60b6
	m5pVMtHCBxbXAmgbiMoEY1vtIf37ZhdLhDJcg0Uny1cwMghve+hed8EkBZM5ujFa1axfqlIeow/
	TtcLSunJlcc7rFNc5Oi
X-Received: by 2002:a17:90b:580b:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3903c5c51cdmr43016068a91.17.1786353999298;
        Mon, 10 Aug 2026 02:26:39 -0700 (PDT)
Received: from sahan-i3-12100 (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88473sm38052384eec.17.2026.08.10.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:26:38 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sahan Nissanka <adee.sahan@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov5675: Add OVTI5678 ACPI id
Date: Mon, 10 Aug 2026 19:24:45 +1000
Message-ID: <20260810092457.12357-1-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <anmHRjxruBaYQRaC@kekkonen.localdomain>
References: <20260809042540.15849-1-adee.sahan@gmail.com> <20260809042540.15849-3-adee.sahan@gmail.com> <anmHRjxruBaYQRaC@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you for the review.

> Most non-Bayer colour raw sensors can be programmed to produce Bayer
> output. It'd be interesting to know what are the differences in register
> writes compared to the Windows driver -- it might use that feature.

I have not captured the Windows driver's register writes, so I cannot answer
that directly. What I do have is Intel's shipped configuration for this exact
module, and all of it points the other way: their stack appears to take RGB-IR
from the sensor and convert it downstream rather than ask the sensor for
Bayer.

  - iacamera64.sys documents an IPU6 hardware block named x2b_rgbir, 314
    registers, i.e. RGB-IR to Bayer conversion in the IPU6 itself.

  - graph_settings_OV5678_0BF501T3_TGL.xml, tied to this module by ACPI _DDN
    rather than to a near relative, declares sensor_type="RGB_IR" and
    bayer_order="GIGI_RGBG_GIGI_BGRG". The rear OV8856 on the same machine
    declares plain GRBG, which makes a useful control.

  - The module's tuning file carries a lens shading record whose 4x4 channel
    index map has five channels, two greens tracked separately plus IR,
    against four on the rear sensor.

  - Intel lists exactly one mode for this part, 2592x1944, where the Bayer
    OV8856 gets several.

If the part could be told to emit Bayer, that hardware block and that tuning
would not be needed for this module. But that is an argument about what Intel
chose to do, not proof about what the sensor can do. I have no register-level
documentation for this variant, and the OV5675 documentation I do have does
not describe an RGB-IR part at all.

Since posting, another person working on this hardware extracted and shared
Intel's Windows sensor driver for this part - ov5678.sys, an ACPI\OVTI5678
KMDF driver - so I went looking for the register writes directly. They are not
in it: the driver carries no sensor initialisation tables, and instead reads
external configuration through an ExtFilesPath value under its service key,
from a BSPDRIVERS store. So the Windows driver binary does not settle your
question either, and I would rather say so than imply I have checked something
I have not.

It does suggest a cleaner way to answer it than sniffing the bus. The driver
has a register-dump facility of its own, writing to C:\OV5678reg.txt, and a
matching NVM dump for the module EEPROM. If the replacement machine arrives
with the factory Windows image, letting Windows bring the camera up and then
dumping the sensor's register state gives a direct comparison against the
tables in ov5675.c, using Intel's own tooling rather than my inference. If
there is a mode bit that switches the output to Bayer, that is where it should
appear. I will report either way, including if it turns out I cannot get at
it.

> The metadata series I've been preparing adds common raw formats and moves
> the CFA pattern to a control. Then we can add the non-Bayer patters to the
> UAPI as well. This isn't in upstream yet though. See
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

That is good to know, and it changes my plans usefully. I had started drafting
an RFC proposing RGB-IR media bus codes; I will drop that rather than propose
a competing mechanism, and follow your branch instead. The CFA pattern as a
control looks like the better model for this - a 4x4 pattern does not reduce
to a Bayer order, so new bus codes would have multiplied awkwardly.

Two questions, then, on how you would like to proceed.

Would you prefer this patch waits for the metadata series to land, and returns
as part of describing the sensor honestly? I am content to hold it. The
practical cost is that the front camera stays dead on this machine in the
meantime, which is what prompted the patch, but that is not an argument for
merging something inaccurate.

And how should I read the precedent in ox05b1s? It declares SGRBG10 for an
RGB-IR sensor of this same class and resolution, which is what I was following
here. If that is regarded as a mistake not to repeat, I would rather know now
and wait than argue from it.

> Most of the commit message would seem to be better located in the cover
> letter.

Agreed - I will move it in v2.

One other thing you should know, since it affects the series rather than this
patch. I have asked that 1/3 not be applied: an owner of the same machine has
shown the GPIO mapping in it is wrong, and that the sensor probes with no pin
assignment at all, so my "it works" was never evidence that the mapping was
right. I will verify the corrected mapping on the replacement machine before
sending v2. Patch 3/3 is unaffected, and was independently arrived at by the
same person.

--
Sahan Nissanka
