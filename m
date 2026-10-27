Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088790;
	b=5mLk9W0NnCkACwDCGzJ4INWfqfmfBpHCiQAL+gR09PLhban3BsSXr8lgEG+0XlOz2PQy
	 dYJQVgDvMdePQv8k7oD2fnyWdhgEpA7mRPoqq4n3SyMOW1L0Hy2F4/P+ujgyI8iPJg3Di
	 J5OjHjbB0i/v2cGxL33jk2HfDhQlAdwGHxCGtfYnBMmFUzZfwOuBkHO1cwFSp3K3CGp6C
	 snv9tjBbfgmMCaoL4brUlp7xSqhxCMVwBa9j8FVb/C3EVTf5d2u0On2dvXgmvGCZc6l/t
	 RNhNfdvyElJ5AwEEKGyMl+1sK6b9OjSVA918PP8iw0b/8mI1sraPfMSK+DILjrTvN2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088790;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=THQua4clYvPNdy6wHNBZuEjVBRJo1LGp3/AaVDxlCMU=;
	b=GXpy2WukgntL2Bqar2mdydHMxMoV8+FPB/OsZa+H7z+2okHplKiY4l3qkyhcEef9dA5y
	 aVMOlUfJYbcV29fE76CL9JrBLrFxhaxnnAKzcPRVkSDY2GRhV3ADlT916dbd8z2gKqNL3
	 06+ylJirbrxRilLMf/iFpXa6FpVQdz6D2n6+XoWxZczy0E3fdgE15U8Kxr8zH4fixGl3Y
	 xoP1BY61TxQU0WRchviTjtKeEvgyICK8K/ZrNT++auSuotVBl7LSEY0bU55PLgsI8AmgP
	 J9qwLgz4PKPDHpxix/1eIS/J7amETAsELBkSLNTrCCbe++IrjzIjyvuXXRET1qgnYIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB6606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 08:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793088781; x=1793347981;
	bh=THQua4clYvPNdy6wHNBZuEjVBRJo1LGp3/AaVDxlCMU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OPJbHUV7wYdJ+zGvFhv553AWN4aw99E5Za4NodjVC50omROwPXZh8lJob3nlz5bwD
	 05lsC16l/Ji6lm2dfFe37Ic3FW5rNMew+DI7kPEx+lmRWsY0m70TeEPOAgxlDNbwn2
	 8RYYi7kylWcEDbBlXH3/Z9AuFeamKTGKs41TLNJTfs/gmfQR5uSCfQC/hEVgMmqeEA
	 ZJ5iSlmauNOYZlFqQxSwBou0KwGlDlA96D5IPWN9Rq+JUOh87z3++PVBpk5CFqHyhS
	 P1KbAI0tziaXFXkGOBb0LXqPd6Ym6JNMqbjSbrXijHxAk31A2P5xO/WfwKjAf0Cdo5
	 78Ceyu4CGQTHg==
Date: Tue, 27 Oct 2026 08:12:57 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5693: Support control events
Message-ID: <20261027081219.27126-1-simon0x+git@proton.me>
In-Reply-To: <at88-MnXMFopRLl-@kekkonen.localdomain>
References: <20261010142042.23253-1-simon0x+git@proton.me> <at88-MnXMFopRLl-@kekkonen.localdomain>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: 133e29a63fe6e001844b8505fc18ad25a2807add
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

Hi Sakari,

On Mon, Oct 26, 2026 at 11:43:52AM +0000, Sakari Ailus wrote:
> Could you instead move the driver to use sub-device state? See an example
> in commit e8a5b1df000e1a23c04dadbe99621441e0889f88 . You'll get control
> events as a bonus. :-)

Thanks, done. The conversion is posted as a new patch that replaces this
one:

https://lore.kernel.org/all/20261027074933.21921-1-simon0x+git@proton.me/

Regards,
Simon

