Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897828;
	b=Sxj2KEBvizjPi90Xgh54BiZxUBFz/pWZXTaEhkZ6c2IFRKL5+PoYbLvnLQSWYsewkrGl
	 t6Z2iNLzEOo4QKn0efNH3GMDMiy/03CXCcRsMdCh5qW4HPQFFa35HNRR07cchkf0UyVIB
	 pI4gMxZ4TR9kdu4OVi9gIGYK7r6YJ/uu0OC2PHzJ4pKBpdxudQ1Mmv/zD2HnE4GLrk8Z3
	 JPAXyN1uQLl8/FmRnWzGFT8ffF8cObU/RVjVBMlMJWT/h311evg5imUpZvsbaUbkPcfNp
	 KeVtqa5HQEVkx/K1kuEBa5pMKQbOCHSfaD1da/X4tKJV9xKsUzRvA6jGXdmZZCvdg3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897828;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ARnu8CvDK4WDhUwUQ57kBUYI+SNxQwEh1Qjp9yA90+s=;
	b=T/n5C4wF9ctZSzm3KZfYje6mb5Hvp7R4lHKbfy2ZgSU9Ui3Vw3zqxKvPunYe9e3yv5/L
	 5eF/7A68T3NERr6/qiAsQmGxTXaCi5/hECZ4BSJ+1kcrgajI/NacBf+pT72uHMTFhkNt+
	 nzrYLK0J0fmaQDfx7XOr4/tvub5SRgK+p5BIPOkMzZJO22aG7BQwjJVDo8jldmk4iidJP
	 XD88a7TsnkrIIbIqkIVR7QaRuHGNzpIRuzgC6Wk6mkPJ0GCzR063WFw1nX/5VVRSA4JLE
	 Tb9P/FdMutocQIzxcBa7sRKcoWHTD/XJBmroclxTaLwNrBHXOsUbUS2GgIp62ls3jeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ZkUBf9FU;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F50606A323
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F50606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ZkUBf9FU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794897825; x=1795157025;
	bh=ARnu8CvDK4WDhUwUQ57kBUYI+SNxQwEh1Qjp9yA90+s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZkUBf9FUmeoNJcx/SVZtPO5uYEGH1ChCe+B1f66hwfuwrWPxkV8DO2mMgPMJR0D5L
	 ArPHCUvNKQ8zUQh2OPL14R37rWt75MnYDZBxo/8md5yX0uDrd34SZ5ivbWRmZce1Se
	 ANoOQL6M8l4ZqRNUuyM8UVAws8uZhR1YBMpinvuSwLIb9aw6zA6zI0Hh9lcS+6USYE
	 3kweNopeASombvXEoot79oRSPwbDLDsdbHIpZ7saZGA6q9DIP+cB8wHd8YMMSm8rkQ
	 m4CPG6D3t8HwLmAFx9fevdp8CtNcIrxwOpKU2TueiF+uArKl7T4gzrBVlvqSrlUj2e
	 V4Xw+knTzaRUg==
Date: Tue, 17 Nov 2026 06:43:41 +0000
To: Antti Laakso <antti.laakso@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>
Subject: Re: [PATCH] media: ipu6: Enable snooping on ipu7 isys buffers
Message-ID: <20261117064321.98174-1-lsa.uz@pm.me>
In-Reply-To: <20261116085650.991445-1-antti.laakso@linux.intel.com>
References: <20261116085650.991445-1-antti.laakso@linux.intel.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 497b4e78d95180c2c091326df1387bcc22d88785
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

Hi Antti,

Thanks for picking this up. I tested it on a Surface Pro 11 (Lunar Lake,
IPU7 driven by intel-ipu6, v7.4-rc1). The sensor was the VD55G0 in raw R8
at 644x604, and the CPU read every buffer for 20 s per run. A row equal
to what the same buffer held one fill earlier is stale. The control
compares each frame with the previous capture, in another buffer, and
stays at 0 because the sensor is noisy.

  intel-ipu6-isys     captures with stale rows
  without the patch   344 of 1158
  with it             0 of 1157
  without, again      690 of 1156

There were no frame gaps, and the stream config dump showed is_snoop 0
and 1 as expected.

The staging ipu7 driver still sets is_snoop =3D 0 in ipu7-isys-video.c, and
my patch for that one is still open:
https://lore.kernel.org/linux-media/20261007183311.24637-1-lsa.uz@pm.me/

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11, IPU7

Sergey

