Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905590;
	b=zy2uKrrFayuVJ96eximeKze36oQ3DD42FIKbxk0+uTPERMVB/aS9aTPQwxybUfbme9EY
	 bgkcPEO1g2qHswBKS9r34o7ktG85/kYtzogDFJs0KxM+7YNl/Yzs3M0I7vewCIouHNmSL
	 uH7BM98RU3dVSAVuzIFwc1vOIM1R4L6KoIwh9WGYZhVOkxN3GFqGSXLrHf4IpS+eAOWKW
	 VeOEe2oOORisP1+sej79DkUM8x12qpLEda1RCez0pncX/xl+6Q4o30h8sU8KzbQnWtBPg
	 kZD2K1wxSA7BJx/rUsB7D2W6AfCAGV5VTge1mItIS3WwilP6tG1mdXaR6/A1wQUDmOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905590;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7s8O1PgAP+b8IZIA0/RBQkSPXt9t+NWHKJ4hOPavqXQ=;
	b=ld7uTcbsD27aC2XHDaRJTCBFWlLaVPxw1TZS7wfIt/vATZUHwmyHG03d41TE7MMPdOnn
	 fEYj1R7s06i/Pf0Y3eSAcRkEpIiArquTp5sulzk4P0npFgvqeOb3WgwuFVZXTZBik582g
	 gmNEwYtOjAUuzJdowvehEb8IogL1sMwvOR741PKSjhezBLiMCkZdeeJxoT4xOdC0i19x4
	 7JrrA8OYDOM71g8K9XD89lEcHTtaTVPzIIg+c2E6j+v45XUYmi2/hwPv/jx+cXoerk3/t
	 AzADt3dWiPEHPhPVEu0T4EkmbJhHP+fm+xYzwpLY9WR5qFR8a1fBXkccZY6dyY/1qGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QYIvphZX;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD337606A32A
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 08:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD337606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QYIvphZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794905587; x=1795164787;
	bh=7s8O1PgAP+b8IZIA0/RBQkSPXt9t+NWHKJ4hOPavqXQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QYIvphZXdkt/j89IPTrsW6VQHru/pE02FrkfKEKqDcl95oAe8QoTY6wGezgu7uZH+
	 z4Z27TxQiGRJ5Teo7LuWnS26HSugSJ95eMYoTAkKHkVS7ilvEcvqMF4elEKMRvaFPv
	 rTWdJpD5BA83j6uOby3uo8/8GLuhRJZevbiEp4wv8dTV731uHR8c7glHlq/ZxZufL9
	 IfXQStzzGVBDBuz7AnaeqCgrMvfSOPKoJGDl7Qodh1vP2xDIlj/uwv8+42cuyvproK
	 pmmxW9/S+KlTDvkROooYX2qS9fqnh0C5HCjSQgDMAeT6sESYKBprc8epdug7CTx9qq
	 3oqE9BfJJtpjA==
Date: Tue, 17 Nov 2026 08:53:00 +0000
To: DelaySystem <DelaySystem@tubot.lat>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: ipu6: declare firmware files with MODULE_FIRMWARE
Message-ID: <20261117085254.61925-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: f42b6c0e18de01e4462161f00b836a991c2cde99
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

Hi,

This fixes a boot failure I hit on a Surface Pro 11 (Lunar Lake, IPU7
driven by intel-ipu6, v7.4-rc1). dracut put intel-ipu6 into the initramfs
without any firmware, and the probe failed there:

  intel-ipu6 0000:00:05.0: error -ENOENT: Requesting signed firmware intel/=
ipu/ipu7_fw.bin failed
  intel-ipu6 0000:00:05.0: probe with driver intel-ipu6 failed with error -=
2

With this patch modinfo lists the eight files, dracut packs the seven
present here (there is no ipu8_fw.bin), and the probe in the initramfs
succeeds: CSE authentication done, three sensors found.

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11, IPU7

Sergey

