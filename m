Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340002;
	b=xyYaBTQvtWyaUEOQOCLM6KujBDWrJZ4Ss7V1Pv5jv2MSMqQjdsI17iBQqD71pYxGIj4j
	 cUGhsnp/b64boRUUlN09Ifjw3Wl1YDWhszvYFfpB+3w6+olsmOqPnhyfdMmlDDy4oCyS8
	 o/KBvsLYWXBx8dez19BcLF+CdEjLeF+336zbXl0vX9G/kqgq4caUkpmwOA9L/rKDtRaE1
	 fNlnDv9XqubDKPTZZ0LpkRSNtrb4RG8NVBr5JdneLx40a6ezm3C4aZ/tj4u8OvaqMEAqa
	 cp9by80NXTvUCJl3H6CYoMhKPmU7p7bt0xIh90lqQsPCh0exMw1r+pCiYgkBC8LIY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340002;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=s78xVEGiTbd40PYo5ZCRciMpKWzAs00uAC9ZgFZwEl8=;
	b=t2s9zsGXq0K8YkrDS7ppw1h+jEIpQjeGiWm6HLopuexf7HRNlXxRZJnjiBsIDoOi8kRY
	 2XVeO4TKDaD5nHgzgN3JwnVdOYId7/Ad+rpb+iTAPm2z3IrL6kJmY4X1WWo6JpUutR+qv
	 xy/xFlVSJGvZwtBrsPArlFSw2SphQgDuUHegVzfP/Hm+ACVoY1TFiwPN+fGS4mKTXfyzt
	 7eosSjLqsFq9+vjGfJA3GlVefDE7Ji7+WiWar0cahsNY19lmWE8uONXlivSgPtN78oUtN
	 /IEt1o9L5DpUVKU1RQFznV25/jBq0fufIvx51Asal9ZSSxdTmbFLzCP/EIjzPUIZTxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=r00O5qmu;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E07606A321;
	Tue, 10 Nov 2026 19:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E07606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=r00O5qmu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794339999; x=1794599199;
	bh=s78xVEGiTbd40PYo5ZCRciMpKWzAs00uAC9ZgFZwEl8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r00O5qmuxYq8woAmduOcwzbPp//3pqWtRHU06KLx4nJEh1m491NSiuQNCJC+f24Md
	 wXvFwxvvc6CmHRnmO9gxlFiogtk6Y61qPHickO6HWXigvTlG4vaDzY5RNo6Eoor1CZ
	 CUUvuBFRIZmaAISphfzEpHRRLEfPPKORzUtreQGHp4gxWPHMw+DCJV2htNQQF5tUzi
	 GJpx8bUCObqF5CW0gj7WNlheYnlZ5MguQCW5rZYitmysK+Dhky4kAHAmigB4DPrMRY
	 1U8Kk3q8KMY9JXA86kOZ1tJFDNXHUlaI5PcNCnoPIuZ4bcr/7xrqMj1EpdYvUApdf/
	 BQCwN08GLntsw==
Date: Tue, 10 Nov 2026 19:46:29 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261110194620.46374-1-lsa.uz@pm.me>
In-Reply-To: <3750472c-5a49-48f6-a8bf-0bae45e4c01b@foss.st.com>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-3-lsa.uz@pm.me> <avGwRaKSqXdtXkII@kekkonen.localdomain> <20261109124610.85065-1-lsa.uz@pm.me> <avHDwGAe99WYaty9@kekkonen.localdomain> <20261109132746.22125-1-lsa.uz@pm.me> <3750472c-5a49-48f6-a8bf-0bae45e4c01b@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a6624b0f434eaf29d2bdf4eea112c843ac323dd3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Tue, Nov 10, 2026 at 10:46:57AM +0100, Benjamin Mugnier wrote:
> From a user perspective they are mostly interchangeable. vd55g1 uses
> AE_TARGET_PERCENTAGE while vd56g3 uses AE_COMPENSATION for instance.
>
> The downstream driver uses AE_TARGET_PERCENTAGE and that's why you have
> it here. It would make more sense to use AE_COMPENSATION semantic wise,
> but this is not a deal breaker.

I tried AE_COMPENSATION on the VD55G0 here, with the firmware patch the
driver loads. Positive values work as UM2829 says, but a negative one
drives the AE to its maximum.

A white sheet in front of the camera, the illuminator on, each value in
a stream of its own:
- AE_TARGET_PERCENTAGE 7, 14, 27: exposure 27, 49, 89 lines;
- target 7 with +1 EV (0x0100) and +2 EV (0x0200): 48 and 91 lines;
- target 14 with -1 EV (0xff00): 1796 lines, analogue gain 24, digital
  gain 2048.

On the Dgrey test pattern every negative value did the same: -0.5, -1
and -2 EV in two's complement, and -1 and -2 EV as sign and magnitude
(0x8100, 0x8200). AE_TARGET_PERCENTAGE works both ways, so v4 keeps it.

Is this known for the VD55G0 firmware?

Sergey

