Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111431;
	b=qaj07lMymJgfh6AOyySmI4HXjJqlTw6DcnxVCHitsddEMd8FLhA3Yx9nt72qnbjzVFcC
	 e7vQweMdgg/VUFDGid1oakZ/j4gmsK21e3kDzTT6qcNTRhNgqjxsHe0sTzh0KaqkaJ/x2
	 CArdnf8X4ZD+abS5RN2OZvdwvOnUk3NGyltQwtUmXH8YWDYZirFm94Ohk+s1ntjxh2+La
	 oH5FrtLandIC49rCkp8FfiQPrdgEtxAFL9I3HYE9yycYRKTskIlOOiaIorpscERPZD3I6
	 e2xQrZjhY3KOVlmukMQqrXZgb7rbfZEW4JKLIIdn2k7LqgMoWffbvKmHjexz0z55Mwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8waO8GUTzF6TydoK4DHmqwFNAMiHf3mAsuAtK7UzY2s=;
	b=yacomv6dKq0mmHQ3lV2Pwz+06jcxftdT/Xyx5g1nzID3CgaVUn4zW6rKnoaVuWc5fcsf
	 34SDUX8ZJWM4z0omS3PxHk856KTMHSY4xf/yD4fctiSbRau3IT5e9sSpWYl/WIwKF8k6B
	 bGpRvhy8x94AoAvrpS4kk5i+nyRy+d5Je9dckBkZW1yYlIVoPQPF7aHLuEppOhiCJG2cU
	 P/UDH7b/P5CYdZDBxz+V4Wxrmsk6J3ikv9wa8MqHGKs6F4LrZdE3LVZ88zQ2A84dMdOcL
	 +MQL0MdsPVHqTZWUUIp5q8i7/UHDAv+O3XH6aluXrV2D2OTJulo+pr1fBVtcfPMHFmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIPN8KUU;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5776606A324
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 14:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5776606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIPN8KUU
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso35957741fa.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111429; x=1793716229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8waO8GUTzF6TydoK4DHmqwFNAMiHf3mAsuAtK7UzY2s=;
        b=cIPN8KUUrYVW0ITGjZyVcvoYxOpj839N3Gqe3mL+/J64fQdgVaZi3nRFi3ze9p17Ku
         qJx90KMeRSOnSYVfjRmcezVWYtJsRSxWBEWPBU1ASquGjuc2qxAVeCugWJy75NhIL2WN
         wI/aTqlCMkzzaQOCg84rXMm4o/WquPvDbNYjxvGoZ1XmI6FyfiLar46BmSd5CIWm5+0n
         x69pZQUB91zYZFObA4b2uIvICMRS61/e0EotQ0BwntQhzTlSxiSqvwJawH8c/3akUX5Z
         rNScLSrIu/BeZTNRp+evCQYwt3N2/D/FBKo2IR6upuLBdDvZvyqmLZMBYc5G0NfbEYF8
         Jr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111429; x=1793716229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8waO8GUTzF6TydoK4DHmqwFNAMiHf3mAsuAtK7UzY2s=;
        b=Ix7kWl1jfHcfvZrxSvNZr9gfnkaRogtBgoFQLXQKthmDOwb3VP8DHXoUZdH04ffKgY
         iTsMpzjjpEt2/lds9XECGbU4sqkfMMOAybGm5nvqYJd6TNBOhxmtTbB5FBRC8JV4ZluM
         lHEDMLHirj8B3gWVDpLz2balZoccGvH5qjdBrpDXCtDOxWrS0cbxrEYZRf3JzVpv5Dzb
         FZssJMoqK+orv3Q8RGBUyI8tYMm1fgXnL7u9iVdol34vVQaipCmljnDh0vvn9/90Y9z3
         EDasPLq5065LtkWAAhRibJzJxwcAZevd0JipCIZ4mOg4alnZVErd9I+loppuZL7gwtYl
         VyGw==
X-Forwarded-Encrypted: i=1; AKwUvByvmEbUjwdqbwI1KFKF2Ki6DosKcfHPyR8oxscbrfcQ59Jo7zyFdWz+/p1PM6H0G874wahP31asuv8vcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwuoCrVBaybMbKeIOeaN6+hEn0WoCXrPGnaG/0Fz0+7FVmbGPn
	rND1y+zzQl7Z5+s5XoAMbpveV4+rPleH7DxfK4R7He1xXthDT+xSYRbI
X-Gm-Gg: AYBFou1XRHLWZUnuMvB1liWPGiych6MVJO8rl3oGCf7Jssmukw+VPeeHhsS1fSg2UAz
	0+uGC0bYpPz7FGxZBfGbwN74xA2GjPT5lFo53LjO3GtkNhCWrWNnja1BrV7U8XBl1LjvHBKBlYX
	JjZmV1AU5bdC0R9ERMn+lzGD1rC29WB0rGXR04H3tikw1cujxu3jgaZoGbd5JmqPKmOnVofll/L
	eHzzI5Wt/b4dIrBn+XwYanyKSU67Wyj6Ljd/WmyxK8LwdJq3EKeLF4M0XV6Yz5bibuVawgr7PUz
	ILjwCLw4dpfFUawklBi7iXUPoxsNFEwsUKNm6SeUfDPEmtBa0OyjNH6Kbr6Pzr3F3TWd7AgdK+k
	mPoeOtHlF+kW/BjPZxI3HHMQnVgQvX+gKqG9NYvhBG0QvSeI3jBQ4ANd4pGcNvdAPyIHT1lny6h
	SjVBFw8+hUZbotkUT5eGxkhhUunCn4RD8bqA7mn7RAYn3V3SBhIx7BG9q+Oi+G7BcSOIdgXuUTj
	e6HNB9ofRD9ivf5OYUZ5861HSca/4B4kcZM7X5XmMugrN4ksWaYmmZEqQTOw9KG1UgLZJKfgwaO
	zzaE5S2RaA184MIuI7nEpVbuYrDPIg==
X-Received: by 2002:a2e:beab:0:b0:3aa:fd7d:6164 with SMTP id 38308e7fff4ca-3ac6fd7040bmr28497261fa.25.1793111428655;
        Tue, 27 Oct 2026 07:30:28 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net (ppp91-78-91-116.pppoe.mtu-net.ru. [91.78.91.116])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a11442sm25789171fa.28.2026.10.27.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:30:28 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>,
	"D. Manresa" <dmanresa@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rillian Grant <rillian.grant@gmail.com>,
	Sergey Lebedev <lsa.uz@pm.me>,
	linux-media@vger.kernel.org
Subject: Re: media: ipu-bridge: lifetime of retained software-node properties
Date: Tue, 27 Oct 2026 17:30:23 +0300
Message-ID: <20261027143023.3312353-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179303518584.774397.17279190841735842653@gmail.com>
References: <20261026091252.676350-1-koreev.r@gmail.com> <20261026111108.34186-1-fernandorimoli11@gmail.com> <179303518584.774397.17279190841735842653@gmail.com>
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

Hi Fernando, Dario,

I've incorporated v5 1/2 into the local flash integration.

With both v5 patches, QEMU tests passed 16 PCI remove/rescan cycles per
run, eight including bridge unload/reload, for both the original bridge
and our integration. Frequencies and lens references remained readable
while the bridge was unloaded. No KASAN or lockdep reports.

A synthetic X1 configuration also preserved the IR flash reference, LED
string property and limits through the same lifecycle tests.

Agreed on vcm_type: it is currently init-only, and I'd keep that cleanup
separate.

Could you confirm that capture works again on each previously working
sensor after module reload and repeated PCI remove/rescan with the full
v5 series? If you've already covered this, those results would be useful.

Regards,
Ruslan
